class CreateShoppingCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :shopping_carts do |t|
      # t.references :book     
      t.references :user
      t.timestamps
    end
  end
end
