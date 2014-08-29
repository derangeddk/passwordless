require_relative "../src/identity_service.rb"

RSpec.describe IdentityService do
  describe "#create_identity" do
    it "creates a new identity and places it in the identity store" do
      identity_store = MemoryIdentityStore.new
      identity_service = IdentityService.new identity_store

      identity_service.create_identity "hypesystem", "hypesystem@deranged.dk"
      expect(identity_store.include? "hypesystem").to be_truthy
    end

    it "creates a new identity which has not yet been verified" do
      identity_store = MemoryIdentityStore.new
      identity_service = IdentityService.new identity_store
      
      identity_service.create_identity "hypesystem", "hypesystem@deranged.dk"
      identity = identity_store.get "hypesystem"
      expect(identity.verified?).to be_falsy
    end

    it "places a pending action, 'creation', on the identity" do
      identity_store = MemoryIdentityStore.new
      identity_service = IdentityService.new identity_store

      identity_service.create_identity "hypesystem", "hypesystem@deranged.dk"
      identity = identity_store.get "hypesystem"

      expect(identity.pending_actions.last).to be_a(CreationAction)
    end

    it "sends an email with an authentication code" do

    end
  end
end
