class AddPriceToProperties < ActiveRecord::Migration[8.0]
  def change
    add_monetize :properties, :price, amount: { null: true, default: nil }, currency: { null: true, default: nil }
  end
end
