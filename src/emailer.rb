class Emailer
  def initialize(sender, message_store)
    @sender = sender
    @message_store = message_store
  end

  def send_creation_message(to, auth_code)
    template = @message_store.get_email_template(:creation)
    message = template[:message].gsub '%auth_code%', auth_code
    @sender.send(to, template[:subject], message)
  end
end
