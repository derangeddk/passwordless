require_relative "../src/memory_identity_store.rb"
require_relative "../src/identity.rb"

RSpec.describe MemoryIdentityStore do
  describe "#include?" do
    it "returns false for any identity if none exist" do
      store = MemoryIdentityStore.new
      expect(store.include? (Identity.new "hypesystem")).to be_falsey
    end

    it "returns true if the identity has been added" do
      store = MemoryIdentityStore.new
      identity = Identity.new "hypesystem"
      store.save identity
      expect(store.include? identity).to be_truthy
    end

    it "returns true if the given string matches the name of an identity" do
      store = MemoryIdentityStore.new
      identity = Identity.new "hypesystem"
      store.save identity
      expect(store.include? "hypesystem").to be_truthy
    end
  end

  describe "#get" do
    it "returns the identity with the specified name" do
      store = MemoryIdentityStore.new
      identity = Identity.new "hypesystem"
      store.save identity
      expect(store.get "hypesystem").to eq(identity)
    end
  end
end
