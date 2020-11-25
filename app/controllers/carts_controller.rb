class CartsController < ApplicationController

  def addtocart
    @book = Book.find(params[:id])
    if !current_shopping_cart.books.where(id: params[:id]).present?
      current_shopping_cart.books << @book
    end
    respond_to do |format|
      format.html { redirect_to books_shop_path, notice: 'Add book to card successfully.' }
    end
    
  end

  def removefromcart
    @book = Book.find(params[:id])
    if current_shopping_cart.books.where(id: params[:id]).present?
      current_shopping_cart.books.delete(@book)
    end
    respond_to do |format|
      format.html { redirect_to carts_path, notice: 'Remove book from card successfully.' }
    end
  end

  def index
    @books = current_shopping_cart.books
  end
end
