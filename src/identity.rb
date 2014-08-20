class Identity
  def initialize(username)
    unless username.match "^[aA-zZ0-9_]+$"
      raise "Username contains invalid characters. It may only contain a-z, A-Z, 0-9, and _."
    end

    @username = username
  end

  def to_s
    @username
  end
end
