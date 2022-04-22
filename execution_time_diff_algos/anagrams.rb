def first_anagram(str1, str2)
    anas = str1.split('')
    anas = anas.permutation.to_a
    res = anas.map { |subarr| subarr.join('') }
    res.include?(str2)
end

def second_anagram(str1, str2)
    str1_char = str1.split('')
    str2_char = str2.split('')

    str1_char.each do |char|
        return false if !str2_char.include?(char)
        str2_char.delete_at(str2_char.index(char))
    end
    return false if !str2_char.empty?
    return true
end

def third_anagram(str1, str2)
    alpha = ('a'..'z').to_a
    str1.split('').sort_by { |char| alpha.index(char) }.join('') == str2.split('').sort_by { |char| alpha.index(char) }.join('')
end

def fourth_anagram(str1, str2)
    hash = Hash.new(0)
    str1.each_char { |char| hash[char] += 1 }
    str2.each_char { |char| hash[char] -= 1 }
    return hash.values.all? { |v| v == 0 }
end

p fourth_anagram("gizmo", "sally")    #=> false
p fourth_anagram("elvis", "lives")    #=> true
