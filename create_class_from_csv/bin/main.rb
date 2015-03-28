require "csv"

file_path = "../lib/persons.csv"
filename = File.basename(file_path)
# data = CSV.read(file_path, headers: true, header_converters: :symbol)

CSV.foreach(file_path) do |variable|
  p variable
end

# p data.headers.each { |e| p e  }
# p data[0].fields
# data.each { |e| p e.fields }
# data.fields.each { |e| p e }
# data.each { |e| e.fields.each { |a| p a } }
# p data[0].fields
# p data[0][0]

# data.each { |a| p a[:name] }

# p data.headers

# data.headers.each { |header| data.each { |a| p a[header] } }

