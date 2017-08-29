#!/usr/bin/env ruby

require 'rubygems'
require 'bundler/setup'
require 'mailman'

Mailman.config.logger = Logger.new("log/mailman.log")

Mailman.config.pop3 = {
	server: 'pop.gmail.com', port: 995, ssl: true,
	username: 'calvinseidle.webdev',
	password: 'seidlc06'
}

# Mailman::Application.run  do
# 	default do
# 		begin
# 			Ticket.receive_mail(message)
# 		rescue Exception => e
# 			Mailman.logger.error "Exception error occurred while receiving message:\n#{message}"
# 			Mailman.logger.error [e, *e.backtrace].join("\n")
# 		end
# 	end
# end

Mailman::Application.run do
  default do
    begin
      Ticket.receive_mail(message)
      Ticket.find(params[:id]).add_reply(message)
    rescue Exception => e
      Mailman.logger.error "Exception occurred while receiving message:\n#{message}"
      Mailman.logger.error [e, *e.backtrace].join("\n")
    end
  end
end