class BooksController < ApplicationController
  def index
      @books = Book.order params[:order_by]

  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = 'Successfully created ' + @book.name
      redirect_to @book
    else
      render :new
    end
  end

  def new
     @book = Book.new

  end

  def show
      @book = Book.find params[:id] 

  end

  def destroy
    @book = Book.find(params[:id])  
    if @book.destroy
        flash[:notice] = 'Successfully deleted ' + @book.name
    else
        flash[:notice] = 'Unable to delete ' + @book.name
    end
    redirect_to books_url 
  end

  def remove_spell_from_
  end

  def book
  end

  def add_spell_to_book
  end
    
      private
    # Only allow a trusted parameter "white list" through.
    def book_params
      # params is a hashtable.  It should have in it a key of :book.
      # The value for the :book key is another hash.
      # If params does not contain the key :book, an exception is raised.  
      # Only the "book" hash is returned and only with the permitted key(s).
      # So returns a hash with only having at most keys of :title, :year, :author_id
      params.require(:book).permit(:name)
    end
end
