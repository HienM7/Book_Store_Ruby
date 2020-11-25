class CreateJoinTableShoppingCartsBooks < ActiveRecord::Migration[6.0]
  def change
    create_join_table :shopping_carts, :books do |t|
      # t.index [:shopping_cart_id, :book_id]
      # t.index [:book_id, :shopping_cart_id]
    end
  end
end
