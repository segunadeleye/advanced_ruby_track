string = "I am an instance of the class String"

def string.capitalize_consonant
  gsub(/[^aeiou]/) { |match| match.upcase }
end

class << string
  def capitalize_vowel
    gsub(/[aeiou]/) { |match| match.upcase }
  end
end

puts string.capitalize_consonant
puts string.capitalize_vowel

string2 = "I am another instance of the class String."

puts string2.capitalize_consonant
puts string2.capitalize_vowel
