json.extract! post, :id, :title, :body, :user_id, :caption, :created_at, :updated_at
json.url post_url(post, format: :json)
