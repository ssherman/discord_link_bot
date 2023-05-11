# frozen_string_literal: true

require_relative "discord_link_bot/version"
require 'discordrb'

module DiscordLinkBot
  class Error < StandardError; end
  def self.run(token)
    bot = Discordrb::Bot.new token: token

    bot.message do |event|
      # Check if the message contains a twitter.com link with "/status/" in it
      if event.message.content =~ /https?:\/\/(?:www\.)?twitter\.com\/\w+\/status\/\d+/
        # Replace the twitter.com link with vxtwitter.com
        new_content = event.message.content.gsub(/https?:\/\/(?:www\.)?twitter\.com/, 'https://vxtwitter.com')
        # Get the username of the user who sent the original message
        username = event.message.author.nick || event.message.author.username
        # Format the message to display the original user and the updated link
        message = "*The idiot user #{username} originally posted this non vxtwitter link*\n\n#{new_content}"

        puts "rewriting #{event.message.content} from user: #{username}"
        # Delete the original message
        event.message.delete
        # Post a new message with the updated link and the original user's name
        event.channel.send_message(message)
      end
    end

    bot.run
  end
end
# https://discord.com/api/oauth2/authorize?client_id=1105990189555392513&permissions=8&scope=bot%20applications.commands
