class HashMessageStore
  def initialize(emails_hash)
    @emails_hash = emails_hash
  end

  def get_email_template(message_name)
    unless @emails_hash.has_key? message_name
      raise "No such message known (#{message_name})"
    end

    @emails_hash[message_name]
  end
end
