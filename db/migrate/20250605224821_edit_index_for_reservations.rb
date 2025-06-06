class EditIndexForReservations < ActiveRecord::Migration[8.0]
  def change
    remove_index :reservations, [:user_id, :property_id]
    add_index :reservations, [:user_id, :property_id, :checkin_date, :checkout_date], unique: true, name: "index_reservations_user_property_checkin_checkout"
  end
end
