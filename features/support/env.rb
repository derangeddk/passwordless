require_relative "../../src/memory_identity_store.rb"
require_relative "../../src/mailgun_mail_sender.rb"
require_relative "../../src/emailer.rb"
require_relative "../../src/hash_message_store.rb"
require_relative "../../src/identity_service.rb"

class PasswordlessLocalWorld
  def initialize
    config = get_config
    identity_store = MemoryIdentityStore.new
    message_store = HashMessageStore.new({
      :creation => {
        :subject => "Verify your email to create an identity",
	:message => "Hello!\n\nYou, or someone using this email, is trying to create a passwordless identity. If this is not you, feel free to ignore this message. If you *are* trying to create an identity, enter the code below into passwordless:\n\n%auth_code%\n\nAll the best,\npasswordless"
      }
    })

    mail_sender = MailgunMailSender.new config["mailgun"]["api_key"], config["mailgun"]["domain"], "integration test <integration-test@deranged.dk>"
    emailer = Emailer.new mail_sender, message_store

    @identity_service = IdentityService.new identity_store, emailer 
  end

  def get_config
    test_config_exists = File.exist?("test_config.json")
    unless test_config_exists
      unless File.exists?("example_config.json")
        raise "No config file found"
      end
    end
    config_file = test_config_exists ? File.read("test_config.json") : File.read("example_config.json")
    JSON.parse(config_file)
  end

  def identity_service
    @identity_service
  end
end

World do
  PasswordlessLocalWorld.new
end
