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
      store.add identity
      expect(store.include? identity).to be_truthy
    end
  end
end
