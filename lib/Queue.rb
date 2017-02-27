class Queue
  def initialize
    @store = Array.new
  end

  def enqueue(element)
    @store << element
  end

  def dequeue
    if @store.length == 0
      raise ArgumentError.new "Nothing in your queue!"
    else
      @first_element = @store[0]
      @store.delete(@store[0])
      return @first_element
    end
  end

  def front
    if @store.length == 0
      raise ArgumentError.new "Nothing in your queue!"
    else
      return @store[0]
    end
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
