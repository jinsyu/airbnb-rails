class CreateProperties < ActiveRecord::Migration[8.0]
  def change
    create_table :properties do |t|
      t.string :name
      t.string :headline
      t.text :description
      t.string :address
      t.string :address_detail
      t.string :city
      t.string :state
      t.string :country

      t.timestamps
    end
  end
end
