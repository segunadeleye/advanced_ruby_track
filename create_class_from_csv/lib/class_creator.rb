require "csv"

class ClassCreator

  def initialize(file_path)
    @file_path = file_path
    @code = []
  end
  
  def read_csv_data
    CSV.read(@file_path, headers: true, header_converters: :symbol)
  end

  def get_file_name
    File.basename(@file_path, ".*")
  end

  def create
    file_name = get_file_name
    class_name = file_name.capitalize
    csv_data = read_csv_data
    if class_name.end_with?("s")
      class_name = class_name[0..-2]
    end

    klass = Class.new do
      attr_accessor *csv_data.headers
      csv_data.headers.each do |header|
        define_method header do
          instance_variable_get("@#{header}")
        end
      end

      csv_data.each do |row|
        row.fields.each do |field|
          csv_data.headers.each do |header|
            define_method header do
              instance_variable_set("@#{header}", field)
            end
          end
        end
      end


    end

    new_class = Object.const_set class_name, klass
    @code << new_class.new
    p @code
    p @code[0].name
    p @code[0].age
    p @code[0].city
  end
end

cc = ClassCreator.new("persons.csv")
cc.create

# class Person
#   def initialize
    
#   end
# end

# obj = [{name: "quava", age: "23", city: "karnal"}, {name: "vilok", age: "23", city: "hissar"}]
