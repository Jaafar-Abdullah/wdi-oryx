class BooksController < ApplicationController
  # GET /books
  def index
    @books = Book.all
    # Create a ul filled with all book titles in index.html.erb (using an each loop)
  end

  def show
    @book = Book.find_by(id: params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    # details = {
    #   title: params[:book][:title],
    #   image: params[:book][:image],
    #   blurb: params[:book][:blurb],
    #   author_id: params[:book][:author_id],
    #   genre_ids: params[:book][:genre_ids],
    # }
    # book = Book.create(details)
    book = Book.create book_params
    redirect_to book_path(book)
  end

  def edit
  end

  private

  def book_params
    params.require(:book).permit(:title, :image, :blurb, :author_id, genre_ids: [])
  end
end
