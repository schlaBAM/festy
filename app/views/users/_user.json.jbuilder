json.extract! user, :id, :first_name, :last_name, :username, :email, :date_of_birth, :role, :created_at, :updated_at
json.url user_url(user, format: :json)
