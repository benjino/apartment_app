class CreateApartments < ActiveRecord::Migration[5.0]
  def change
    create_table :apartments do |t|
      t.string :name
      t.string :phone_number
      t.string :hours_to_contact
      t.string :street1
      t.string :street2
      t.string :city
      t.integer :postalcode
      t.string :state
      t.string :country

      t.timestamps
    end
  end
end
