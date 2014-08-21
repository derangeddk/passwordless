class MemoryIdentityStore
  def initialize
    @data = []
  end

  def add(identity)
    @data.push(identity)
  end

  def include?(identity)
    @data.include? identity
  end
end
