json.extract! user, :id, :email, :firstname, :lastname, :permission, :created_at, :updated_at
json.url user_url(user, format: :json)
