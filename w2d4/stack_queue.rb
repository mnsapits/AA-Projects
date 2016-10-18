class MyQueue
  def initialize
    @store = []
  end

  def enqueue(element)
    @store.push(element)
  end

  def dequeue
    @store.shift
  end

  def peek
    @store.first
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end
end

class MaxStack
  def initialize
    @store = []
  end

  def pop
    @store.pop
  end

  def push(element)
    @store.push(element)
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end
end

def StackQueue
  def initialize
    @in_box = MyStack.new
    @out_box = MyStack.new
  end

  def enqueue(element)
    @in_box.push(element)
  end

  def dequeue
    return nil if @in_box.empty? && @out_box.empty?
    if @out_box.empty?
      transfer
    end
    @out_box.pop
  end

  def transfer
    until @in_box.empty?
      ele = @in_box.pop
      @out_box.push(ele)
    end
  end

  def size
    @in_box.size + @out_box.size
  end

  def empty?
    @in_box.empty? && @out_box.empty?
  end
end
