require_relative "../src/identity.rb"
require_relative "../src/creation_action.rb"

RSpec.describe Identity do
  describe "#new" do
    it "can be created with a string without spaces" do
      identity = Identity.new "hypesystem"
      expect(identity).to be
    end

    it "can not contain spaces" do
      expect { Identity.new "hello world" }.to raise_error
    end

    it "can not contain commas, periods, semicolons, colons, slashes, or hyphens" do
      expect { Identity.new "hello,world" }.to raise_error
      expect { Identity.new "hello.world" }.to raise_error
      expect { Identity.new "hello:world" }.to raise_error
      expect { Identity.new "hello;world" }.to raise_error
      expect { Identity.new "hello/world" }.to raise_error
      expect { Identity.new "hello-world" }.to raise_error
    end

    it "can not be empty" do
      expect { Identity.new "" }.to raise_error
    end

    it "is created as unverified" do
      identity = Identity.new "hypesystem"
      expect(identity.verified?).to be_falsy
    end
  end

  describe "#to_s" do
    it "returns the username" do
      identity = Identity.new "hypesystem"
      expect(identity.to_s).to eq("hypesystem")
    end

    it "is printed like the username if used inline" do
      identity = Identity.new "hypesystem"
      expect("Look out! #{identity} waved.").to eq("Look out! hypesystem waved.")
    end
  end

  describe "#add_pending_action" do
    it "adds a pending action to the identity" do
      identity = Identity.new "hypesystem"
      action = CreationAction.new ""

      identity.add_pending_action action
      expect(identity.pending_actions.last).to be_a(CreationAction)
    end
  end

  describe "#verify" do
    it "marks the identity as verified" do
      identity = Identity.new "hypesystem"
      identity.verify
      expect(identity.verified?).to be_truthy
    end
  end
end
