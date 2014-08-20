require_relative "../src/identity.rb"

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
end
