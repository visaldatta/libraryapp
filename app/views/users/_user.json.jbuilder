json.extract! user, :id, :name, :email, :password, :admin, :super, :messages, :unread, :created_at, :updated_at
json.url user_url(user, format: :json)