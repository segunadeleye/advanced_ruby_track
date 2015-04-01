string = "I am an instance of the class String"

def string.capitalize_consonant
  gsub(/[^aeiou]/) { |match| match.upcase }
end

puts string.capitalize_consonant

string2 = "I am another instance of the class String."

puts string2.capitalize_consonant
