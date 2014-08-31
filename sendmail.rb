require "json"
require_relative "src/mailgun_mail_sender.rb"

test_config_exists = File.exist?("test_config.json")
unless test_config_exists
  unless File.exists?("example_config.json")
    raise "No config file found (looking for test_config.json or example_config.json)"
  end
  puts "Using example_config.json"
else
  puts "Using test_config.json"
end

config_file = test_config_exists ? File.read("test_config.json") : File.read("example_config.json")
config = JSON.parse(config_file)
mailgun_config = config["mailgun"]

puts "Api-key: #{mailgun_config["api_key"]}"
puts "Domain: #{mailgun_config["domain"]}"

mailer = MailgunMailSender.new mailgun_config["api_key"], mailgun_config["domain"], "test <test@deranged.dk>"
success = mailer.send "niels.abildgaard@gmail.com", "test", "test email"

puts success ? "mail sent" : "mail not sent"