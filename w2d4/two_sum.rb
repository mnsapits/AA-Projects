require "byebug"
def bad_two_sum?(arr, target)
  idx1 = 0
  while idx1 < arr.length
    idx2 = idx1 + 1
    while idx2 < arr.length
      return true if  arr[idx1] + arr[idx2] == target
      idx2 += 1
    end
    idx1 += 1
  end

  false
end


def okay_two_sum?(arr, target)
  sorted_arr = arr.sort

  (0...arr.length).each do |idx|
    return true unless sorted_arr[idx..-1].bsearch { |x| x == (target - sorted_arr[idx]) }.nil?
  end
  false
end


def pair_sum?(arr, target)
  hash = Hash.new()
  arr.each do |ele|
    hash[ele] = true
  end

  hash.dup.each do |key,value|
    # debugger
    hash[key] = false
    return true if hash[target - key]
    hash[key] = true
  end
  false
end



arr = [0, 1, 5, 7]
p pair_sum?(arr, 6)
