class Ticket < ApplicationRecord
  has_many :replies, inverse_of: :ticket
  accepts_nested_attributes_for :replies, reject_if: :all_blank, allow_destroy: true

  def self.receive_mail(message)
  	ticket_id = message.subject[/^Update (\d+)$/, 1]
  	if ticket_id.present? && Ticket.exists?(ticket_id)
  		Ticket.update(ticket_id, body: message.body.decoded)
  	else
  		Ticket.create subject: message.subject, body: message.body.decoded, from: message.from.first
  	end	
  end
end

# subject(/Update (\d+)/) do |ticket_id|
	# 	Ticket.update(ticket_id, body: message.body.decoded)
	# end 

	# default do
	# 	Ticket.create! subject: message.subject, body: message.body.decoded, from: message.from.first
	# end