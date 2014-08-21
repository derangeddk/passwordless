require_relative "../src/email.rb"

RSpec.describe Email do
  describe "#new" do
    it "can be created with a valid email address" do
      email = Email.new "test@deranged.dk"
      expect(email).to be
    end
    
    it "can not be created with a string without a @" do
      expect { Email.new "test_not_email" }.to raise_error
    end

    it "can not be created without something before and after the @" do
      expect { Email.new "@test" }.to raise_error
      expect { Email.new "hello@" }.to raise_error
    end

    it "can not contain blank spaces" do
      expect { Email.new "hello test@deranged.dk" }.to raise_error
    end
  end

  describe "#verified?" do
    it "is not verified to begin with" do
      email = Email.new "test@deranged.dk"
      expect(email.verified?).to be_falsey
    end

    it "can be verified" do
      email = Email.new "test@deranged.dk"
      email.verify
      expect(email.verified?).to be_truthy
    end
  end

  describe "#to_s" do
    it "should return the email string" do
      email = Email.new "test@deranged.dk"
      expect(email.to_s).to eq("test@deranged.dk")
    end

    it "should be printed as the email string" do
      email = Email.new "test@deranged.dk"
      expect("Send #{email} an email").to eq("Send test@deranged.dk an email")
    end
  end
end
