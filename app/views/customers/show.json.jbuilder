json.(@customer, :id, :first_name, :last_name, :email, :phone, :created_at, :updated_at)
json.cards @customer.cards, :id
