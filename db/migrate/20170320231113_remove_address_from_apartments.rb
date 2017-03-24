class RemoveAddressFromApartments < ActiveRecord::Migration[5.0]
  def change
    remove_column :apartments, :address, :string
  end
end
