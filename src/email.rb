class Email
  def initialize(address)
    @verified = false
    @email_address = address

    unless address.match "^([^\s]+)@([^\s]+)$"
      raise "Invalid email address"
    end
  end

  def verify
    @verified = true
  end

  def verified?
    @verified
  end

  def to_s
    @email_address
  end
end
