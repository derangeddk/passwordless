require_relative "../../src/memory_identity_store.rb"
require_relative "../../src/mailgun_mail_sender.rb"

class PasswordlessLocalWorld
  def initialize
    store = MemoryIdentityStore.new

    mail_sender = MailgunMailSender.new "key-3ax6xnjp29jd6fds4gc373sgvjxteol0", "samples.mailgun.org", "integration test <integration-test@deranged.dk>"
    emailer = Emailer.new mail_sender

    @identity_service = IdentityService.new store, emailer 
  end

  def identity_service
    @identity_service
  end
end

World do
  PasswordlessLocalWorld.new
end
