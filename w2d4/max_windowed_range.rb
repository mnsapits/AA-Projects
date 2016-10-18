def windowed_max_range(arr, size)
  current_max_range = nil
  (0..arr.length - size).each do |idx|
    sub_arr = arr[idx...(idx + size)]
    sub_arr_range = sub_arr.max - sub_arr.min
    if current_max_range.nil? || sub_arr_range  > current_max_range
      current_max_range = sub_arr_range
    end
  end

  current_max_range
end

def
