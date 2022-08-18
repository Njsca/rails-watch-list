class BookmarksController < ApplicationController
  before_action :set_list, only: [ :new, :create ]

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    # get the movie from the database with the ID from he params
    movie_id = params['bookmark']['movie_id']
    # movie = something
    # @bookmark.movie = movie
    movie = Movie.find(movie_id)
    @bookmark.movie = movie
    # binding.pry

    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end

  def set_list
    @list = List.find(params[:list_id])
  end
end
