require_relative "../src/creation_action.rb"

RSpec.describe CreationAction do
  describe "#execute" do
    it "fails if the authorization code is wrong" do
      action = CreationAction.new "test-code"
      expect { action.execute "wrong-code" }.to raise_error
    end

    it "makes the identity verified if the authorization code is correct" do
      identity = Identity.new "hypesystem"
      action = CreationAction.new "test-code"

      expect(identity.verified?).to be_falsy
      action.execute identity, "test-code"
      expect(identity.verified?).to be_truthy
    end
  end
end
