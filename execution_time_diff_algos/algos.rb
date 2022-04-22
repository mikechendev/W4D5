require 'byebug'
def my_min_dumb(list)
    list.each do |num|
        return num if list.all? { |n| n >= num }
    end
end

def my_min_smart(list)
    list.inject { |acc, el| acc < el ? acc : el }
end

def largest_contiguous_subsum_dumb(list)
    arr = []
    (0...list.length).each do |i|
        (i...list.length).each do |k|
            arr << list[i..k].sum
        end
    end
    arr.max
end

def largest_contiguous_subsum_smart(list)
    #debugger
    arr = []
    largest_sum = -1.0/0
    list.each_with_index do |n, i|
        if arr[i-1]
            arr[i] = [n, arr[i-1] + n].max
        else
            arr[i] = n
        end
    end
    largest_sum = [largest_sum, arr.max].max
end


#    list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p   my_min_smart(list)  # =>  -5
#
#    list = [2, 3, -6, 7, -6, 7]
# p   largest_contiguous_subsum_smart(list) # => 8 (from [7, -6, 7])
#
#     list = [-5, -1, -3]
# p   largest_contiguous_subsum_smart(list) # => -1 (from [-1])