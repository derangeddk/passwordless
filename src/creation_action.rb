class CreationAction
  def initialize(auth_code)
    @auth_code = auth_code
  end

  def execute(identity, auth_code)
    unless @auth_code == auth_code
      raise "Wrong authorization code"
    end

    identity.verify
  end
end
