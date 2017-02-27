class Stack
  def initialize
    @store = Array.new #stores the data
  end

  def push(element) # add to the top of stack
    @store << element
  end

  def pop
    @last_element = @store.last
    @store.delete(@store.last)
    return @last_elements
  end

  def top
    return @store[-1]
  end

  def size
    return @store.length
  end

  def empty?
    return @store.empty?
  end

  def to_s
    return @store.to_s
  end
end
