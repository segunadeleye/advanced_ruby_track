string = "I am an instance of the class String"

def string.capitalize_consonant
  gsub(/[^aeiou]/) { |match| match.upcase }
end

string.remove_consonant

string2 = "I am another instance of the class String."

string2.remove_consonant
