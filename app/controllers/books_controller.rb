class BooksController < ApplicationController
    include AuthorsHelper

    def index
        if params[:search]
            @books = Book.search("{ params[:search] }").uniq { |book| book.title}
        end
    end
    
    def high_rating
        @books = Book.highest_rated_sorted[0..9]
        render :index
    end

    def show
        @shelves = current_user.shelves if user_sign_in?
        isbn = params[:id]
        
        @display_book = Book.search("isbn:#{ isbn }").first
        @authors = find_create(@display_book)

        @book = Book.new     
    end

    def create
        @new_book = Book.find_initial(initial_params)

        params[:book][:authors].split(",").map 
        do |author_name|
            @new_book.authors << Author.find_create(name: author_name)
        end
        
        @bookmark = Bookmark.find_by(id: params[:book][:bookmark_id])
        if @bookmark.books.find_by(title: @new_book.title)
            redirect_to book_path(@new_book.isbn),
            notice: `This book is already included.`
        else
            @new_book.update(book_params)
            @new_book.bookmarks << @bookmark
            @new_book.save
            redirect_to book_path(@new_book.isbn),
            notice: `Book successfully added.`
        end
    end

    def destroy
        @book = Book.find_by(isbn: params[:id])
        @bookmark = Bookmark.find_by(id: params[:bookmark_id])

    if @bookmark.user == current_user
        @bookmark.books.delete(@book)
        @bookmark.save
        redirect_to user_path(current_user)
    end
end

private
    def initial_params
        params.require(:book).permit(:isbn)
    end

    def book_params
        params.require(:book).permit(
            :title,
            :description,
            :average_rating,
            :author_id,
            :rating_score,
            :isbn,
            :image_source
        )
    end
end
