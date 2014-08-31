require_relative "identity.rb"
require_relative "creation_action.rb"

class IdentityService
  def initialize(store, mailer)
    @store = store
    @mailer = mailer
  end

  def create_identity(id_name, id_email)
    identity = Identity.new id_name
    identity.add_pending_action(CreationAction.new "")
    @mailer.send_creation_message(id_email, "")
    @store.save(identity)
  end
end
