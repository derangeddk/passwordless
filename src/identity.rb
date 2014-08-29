class Identity
  def initialize(username)
    unless username.match "^[aA-zZ0-9_]+$"
      raise "Username contains invalid characters. It may only contain a-z, A-Z, 0-9, and _."
    end

    @username = username
    @pending_actions = []
  end

  def to_s
    @username
  end

  def verified?
    false
  end

  def add_pending_action(action)
    @pending_actions.push(action)
  end

  def pending_actions
    @pending_actions
  end
end
