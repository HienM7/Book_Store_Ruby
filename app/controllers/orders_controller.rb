class OrdersController < ApplicationController

  before_action :ensure_login
  before_action :set_order, only: [:destroy]

  def create 
    @book_id = params[:book_id]
    @amount = params[:amount]
    @order = Order.new(user_id: current_user.id, book_id: @book_id, amount: @amount)
    if @order.save  
      if current_shopping_cart.books.where(id: @book_id).present?
        @book = Book.find(@book_id)
        current_shopping_cart.books.delete(@book)
      end
      redirect_to '/carts', :flash => { :success => 'Order was successfully created.' }
    else
      redirect_to '/carts'
    end
  end

  def index 
    @orders = Order.where(user_id: current_user.id)
  end

  def destroy
    @order.destroy
    redirect_to '/orders', :flash => { :success => 'Order was successfully deleted.' }
  end
  
  private 
  def set_order
    @order = Order.find(params[:id])
  end
end
