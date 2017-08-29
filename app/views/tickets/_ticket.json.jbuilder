json.extract! ticket, :id, :subject, :from, :body, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
