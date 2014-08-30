require_relative "../../src/memory_identity_store.rb"
require_relative "../../src/mailgun_mail_sender.rb"
require_relative "../../src/emailer.rb"

class PasswordlessLocalWorld
  def initialize
    identity_store = MemoryIdentityStore.new

    mail_sender = MailgunMailSender.new "key-3ax6xnjp29jd6fds4gc373sgvjxteol0", "samples.mailgun.org", "integration test <integration-test@deranged.dk>"
    emailer = Emailer.new mail_sender message_store

    @identity_service = IdentityService.new identity_store, emailer 
  end

  def identity_service
    @identity_service
  end
end

World do
  PasswordlessLocalWorld.new
end
