require_relative "../src/email_handler.rb"
require_relative "../src/email_builder.rb"


class MockEmailService
end

RSpec.describe EmailHandler do
  describe "#new" do
    it "can be created with an email builder and an email service" do
      builder = EmailBuilder.new []
      service = MockEmailService.new
      EmailHandler.new(builder,service)
    end
  end
end
