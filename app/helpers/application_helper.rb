module ApplicationHelper
  def cart_count
    if current_user
      @shopping_cart = current_user.shopping_cart
      return cart_num = @shopping_cart.books.size
    else
      @shopping_cart = session[:shopping_cart]
      @cart = ShoppingCart.find(@shopping_cart)
      return cart_num = @cart.books.size || 0
    end
  end
end
