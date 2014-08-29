class MemoryIdentityStore
  def initialize
    @data = {}
  end

  def save(identity)
    @data[identity.to_s] = identity
  end

  def include?(identity)
    if identity.is_a? Identity
      @data.has_key? identity.to_s
    elsif identity.is_a? String
      @data.has_key? identity
    else
      raise "Checked for identity must be either a string or an identity"
    end
  end
end
