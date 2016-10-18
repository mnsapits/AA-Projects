require "byebug"
def first_anagram(string1, string2)
  letter_arr = string1.chars
  permutation_arr = letter_arr.permutation.to_a.map(&:join)
  permutation_arr.include?(string2)
end


def second_anagram(string1,string2)
  string1.chars.each do |letter|
    if string1.include?(letter) && string2.include?(letter)
      string2 = string2.sub(letter,"")
      string1 = string1.sub(letter,"")
    end
  end
  string1.empty? && string2.empty?
end

def third_anagram?(str1, str2)
  str1.chars.sort == str2.chars.sort
end

def fourth_angrams(str1,str2)
  str_hash = Hash.new(0)
  
  str1.chars.each do |letter|
    str_hash[letter] += 1
  end
  str2.chars.each do |letter|
    str_hash[letter] -= 1
  end

  str_hash.values.all?{ |value| value == 0}
end

p fourth_angrams("sallys", "allasy")
