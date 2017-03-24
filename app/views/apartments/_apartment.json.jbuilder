json.extract! apartment, :id, :name, :phone_number, :hours_to_contact, :street1, :street2, :city, :postalcode, :state, :country, :created_at, :updated_at
json.url apartment_url(apartment, format: :json)
