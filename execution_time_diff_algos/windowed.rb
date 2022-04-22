def windowed_max_range(arr, n)
    max = 0
    (0...arr.length-(n-1)).each do |i|
        subarr = arr[i..i+n-1]
        diff = subarr.max - subarr.min
        max = diff if diff > max
    end
    max
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) #== 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) #== 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) #== 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) #== 6 # 3, 2, 5, 4, 8

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
    @max_val = 0
    @min_val = 0
  end

  def push(val)
    @store.push(val)
    if val >= @max_val
        @max_val = val
    end
    if val <= @min_val
        @min_val = val
    end
  end

  def pop
    @store.pop
    if @store.empty?
        @max_val = 0
        @min_val = 0
    end
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