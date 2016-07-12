class ChangePriceFormatInProducts < ActiveRecord::Migration
  def up
    change_column :products, :price, :float, :precision => 10, :scale => 2
  end

  def down
    change_column :products, :price, :integer
  end
end
