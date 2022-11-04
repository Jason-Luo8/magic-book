class PagesController < ApplicationController
  def home
  end

  def index
    @books = Book.highest_rated_sorted[0..9].uniq
  end
end
