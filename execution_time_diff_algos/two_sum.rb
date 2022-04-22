require 'byebug'

def bad_two_sum?(arr, target)
    (0...arr.length - 1).each do |i|
        (i+1...arr.length).each do |k|
            return true if arr[i] + arr[k] == target
        end
    end
    return false
end
# O(n^2)


def okay_two_sum?(arr, target)
    arr.sort
    l = 0
    r = arr.length - 1
    while (arr[l] < arr[r])
        if arr[l] + arr[r] == target
              return true
        elsif arr[l] + arr[r] < target
              l += 1
        else 
              r -= 1
        end
    end
    return false
end

def two_sum?(arr, target)
    hash = {}
    arr.each do |num|
        return true if hash[target - num]
        hash[num] = true
    end
    return false
end

# O(logn)
arr2 = [1, 100, 5, 32, 47, 6, 21, 74, 11]
arr = [0, 1, 1, 5, 7]
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false
p two_sum?(arr, 2) # => should be true

