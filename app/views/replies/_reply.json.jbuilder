json.extract! reply, :id, :ticket_id, :from, :subject, :body, :created_at, :updated_at
json.url reply_url(reply, format: :json)
