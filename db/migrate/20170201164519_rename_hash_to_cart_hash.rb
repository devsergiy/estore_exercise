class RenameHashToCartHash < ActiveRecord::Migration[5.0]
  def change
    rename_column :carts, :hash, :cart_hash
  end
end
