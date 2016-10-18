def my_min1(array)
  array.each do |ele|
    count = 0
    array.each do |ele2|
      count += 1 if ele2 >= ele
    end
    return ele if count == array.length
  end
end
# n**2


def my_min2(array)
  result = array.first
  ind = 1
  while ind < array.length
    if result > array[ind]
      result = array[ind]
    end

    ind += 1
  end
  result
end
# n

 def subsum1(list)
   sub_arrays = []

   idx1 = 0
   while idx1 < list.length
      idx2 = idx1
      while idx2 < list.length
        sub_arrays << list[idx1..idx2]
        idx2 += 1
      end
      idx1 += 1
    end
  sub_arrays.max_by { |array| array.reduce(&:+) }.reduce(&:+)
 end

 # n ^ 3

 def subsum2(list)
  max = list.first
  current = list.first
  list[1..-1].each do |el|
    current = 0 if current < 0
    current += el
    max = current if current > max
  end

  max
 end

# n

 list = [-5, -1, -3]
 p subsum2(list)
