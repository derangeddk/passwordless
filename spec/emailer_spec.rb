require_relative "../src/emailer.rb"

class MockEmailSender
  def send(to, subject, message)
    @last_sent_email = { :to => to, :subject => subject, :message => message }
  end

  def last_sent_email
    @last_sent_email
  end
end

class MockMessageStore
  def initialize
    @email_templates = {
      :creation => {
        :subject => "Creation",
	:message => "Here's your auth code: %auth_code%"
      }
    }
  end

  def get_email_template(template_name)
    @email_templates[template_name]
  end
end

RSpec.describe Emailer do
  describe "#send_creation_message" do
    it "sends an email to the specified address" do
      email_sender = MockEmailSender.new
      message_store = MockMessageStore.new
      emailer = Emailer.new email_sender, message_store
      emailer.send_creation_message "user1@deranged.dk", "hax"
      expect(email_sender.last_sent_email[:to]).to eq("user1@deranged.dk")
    end

    it "includes the authorization code that it is given" do
      email_sender = MockEmailSender.new
      message_store = MockMessageStore.new
      emailer = Emailer.new email_sender, message_store
      emailer.send_creation_message "user@deranged.dk", "hax"
      expect(email_sender.last_sent_email[:message]).to include("hax")
    end

    it "gets the email content and subject line from a message store" do
      email_sender = MockEmailSender.new
      message_store = MockMessageStore.new
      emailer = Emailer.new email_sender, message_store
      emailer.send_creation_message "user@deranged.dk", "hax"
      expect(email_sender.last_sent_email[:message]).to eq("Here's your auth code: hax")
      expect(email_sender.last_sent_email[:subject]).to eq("Creation")
    end
  end
end
