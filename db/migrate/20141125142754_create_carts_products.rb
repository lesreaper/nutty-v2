class CreateCartsProducts < ActiveRecord::Migration
  def change
    create_table :carts_products do |t|
      t.references :cart, index: true
      t.references :product, index: true
    end
  end
end
