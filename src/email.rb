class Email
  def initialize(address)
    @verified = false

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
end
