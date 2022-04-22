require 'pry'


def windowed_max_range(arr, n)
    max = 0
    (0...arr.length-(n-1)).each do |i|
        subarr = arr[i..i+n-1]
        diff = subarr.max - subarr.min
        max = diff if diff > max
    end
    max
end

# p windowed_max_range([1, 0, 2, 5, 4, 8], 2) #== 4 # 4, 8
# p windowed_max_range([1, 0, 2, 5, 4, 8], 3) #== 5 # 0, 2, 5
# p windowed_max_range([1, 0, 2, 5, 4, 8], 4) #== 6 # 2, 5, 4, 8
# p windowed_max_range([1, 3, 2, 5, 4, 8], 5) #== 6 # 3, 2, 5, 4, 8

class MyQueue
  def initialize
    @store = []
  end

  def enqueue(val)
    @store.push(val)
  end

  def dequeue
    @store.shift
  end

  def empty?
    @store.empty?
  end

  def size
    @store.length
  end

  def peek
    @store.first
  end
end

class MyStack
  def initialize
    @store = []
  end

  def push(val)
    @store.push(val)
  end

  def pop
    @store.pop
  end

  def empty?
    @store.empty?
  end

  def size
    @store.length
  end

  def peek
    @store.last
  end

  private
end

class StackQueue

    def initialize
        @stack = MyStack.new
        @stack_2 = MyStack.new
    end 

    def enqueue(val)
         while !@stack.empty?
            @stack_2.push(@stack.pop)
         end
         @stack.push(val)
         while !@stack_2.empty?
            @stack.push(@stack_2.pop)
         end
    end

    def dequeue
      @stack.pop
    end

    def empty?
      @stack.empty?
    end

    def size
      @stack.length
    end

    def peek
      @stack.first
    end
end




class MinMaxStack

  def initialize
    @stack = MyStack.new
  end

  def push(val)
    @stack.push({ maximum: check_max(val), minimum: check_min(val), value: val })
  end

  def pop
    @stack.pop[:value]
  end
  
  def peek
    @stack.peek[:value] 
  end

  def size
    @stack.size
  end

  def empty?
    @stack.empty?
  end

  def max
    @stack.peek[:maximum] 
  end

  def min
    @stack.peek[:minimum] 
  end
  private 
  def check_max(val)
    empty? ? val : [max, val].max
  end

  def check_min(val)
    empty? ? val : [min, val].min
  end
end

class MinMaxStackQueue
  def initialize
    @stack = MinMaxStack.new
    @stack_2 = MinMaxStack.new
  end

  def enqueue(val)
    while !@stack.empty?
       @stack_2.push(@stack.pop)
    end
    @stack.push(val)
    while !@stack_2.empty?
       @stack.push(@stack_2.pop)
    end
  end

  def dequeue
  @stack.pop
  end

  def empty?
    @stack.empty?
  end

  def size
    @stack.size
  end

  def peek
  @stack.first
  end

  def max 
    @stack.max
  end
  
  def min
    @stack.min
  end

  def diff
    max - min
  end
end

def windowed_max_range_with_insane_stackqueue_bullshit(arr, n)

  i = 0
  check = MinMaxStackQueue.new
  diff = 0

  while (i < arr.length)
    if check.size == n
      check.dequeue
      check.enqueue(arr[i])
      i += 1
    else 
      check.enqueue(arr[i])
      i += 1
    end
    diff = check.diff if check.diff > diff if check.size == n
  end
  return diff
end


p windowed_max_range_with_insane_stackqueue_bullshit([1, 0, 2, 5, 4, 8], 2) #== 4 # 4, 8
p windowed_max_range_with_insane_stackqueue_bullshit([1, 0, 2, 5, 4, 8], 3) #== 5 # 0, 2, 5
p windowed_max_range_with_insane_stackqueue_bullshit([1, 0, 2, 5, 4, 8], 4) #== 6 # 2, 5, 4, 8
p windowed_max_range_with_insane_stackqueue_bullshit([1, 3, 2, 5, 4, 8], 5) #== 6 # 3, 2, 5, 4, 8