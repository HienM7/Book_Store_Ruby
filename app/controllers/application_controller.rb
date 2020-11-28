class ApplicationController < ActionController::Base
  
  before_action :current_shopping_cart
  before_action :shove_cards_from_guest_to_user_account
  
  def current_shopping_cart
    if current_user
      @shopping_cart = current_user.shopping_cart
      if !@shopping_cart
      @shopping_cart = ShoppingCart.create(user_id: current_user.id)
      end
      return @shopping_cart
    else
      if session[:shopping_cart]
        return @shopping_cart = ShoppingCart.find(session[:shopping_cart])
      else
        @shopping_cart = ShoppingCart.create
        session[:shopping_cart] = @shopping_cart.id
        return @shopping_cart
      end
    end
  end

  def shove_cards_from_guest_to_user_account
    if current_user && session[:shopping_cart]
      guest_cart = ShoppingCart.find(session[:shopping_cart])
      guest_cart.books.each do |book|
        if !current_user.shopping_cart.books.where(id: book.id).present?
          current_user.shopping_cart.books << book
        end
      end 
      guest_cart.books.clear
      guest_cart.destroy
      session[:shopping_cart] = nil
    end   
  end
  
  private
  def ensure_admin_user!
    redirect_to root_path unless current_user && current_user.admin?
  end

  def ensure_login
    if !current_user
      redirect_to new_user_session_path
      return
    end
  end
end
