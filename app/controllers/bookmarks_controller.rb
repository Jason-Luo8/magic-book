class BookmarksController < ApplicationController
    before_action :check_for_login

    def index
    end

    def show
        @bookmark = Bookmark.find(params[:id])
    end

    def new
        user = User.find_by(id: params[:user_id])
        if user == current_user
            @bookmark = Bookmark.new(user_id: params[:user_id])
        else
            redirect_to user_path(current_user)
        end
    end

    def create
        @bookmark = Bookmark.new(bookmark_params)
        if @bookmark.valid?
            @bookmark.user = current_user
            @bookmark.save
            redirect_to user_path(current_user)
        else
            render :new
        end
    end

    def edit
        @bookmark = Bookmark.find_by(id: params[:id])
        if @bookmark.user != current_user
            redirect_to user_path(current_user)
        end
    end

    def update
        @bookmark = Bookmark.find_by(id: params[:id])
        if @bookmark.user == current_user
            @bookmark.update(bookmark_params)
            @bookmark.save
            redirect_to bookmark_path(@bookmark)
        else
            redirect_to user_path(current_user)
        end
    end

    def destroy
        @bookmark = Bookmark.find_by(id: params[:id])
        user = User.find_by(id: params[:user_id])
        if user == current_user
            @bookmark.delete
            redirect_to user_path(user)
        else
            redirect_to user_path(current_user)
        end
    end

private
    def bookmark_params
        params.require(:bookmark).permit(:name, :user_id)
    end
end