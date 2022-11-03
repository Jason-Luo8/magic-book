module ApplicationHelper
    def star_sign(num)
        "⭐"*(num.to_i)
    end

    def check_bookmarks
        if current_user.bookmarks.length > 0
            render partial: "form", locals: { book: @book, display_book: @display_book, bookmarks: @bookmarks}
        elsif current_user.bookmarks.length <= 0
                link_to 'Create new Bookmark', new_user_bookmark_path(current_user)    
        end
    end
    
end
