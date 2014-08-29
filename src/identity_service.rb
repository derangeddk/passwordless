class IdentityService
  def initialize(store)
    @store = store
  end

  def create_identity(id_name, id_email)
    identity = Identity.new id_name
    identity.add_pending_action(CreationAction.new "")
    @store.save(identity)
  end
end
