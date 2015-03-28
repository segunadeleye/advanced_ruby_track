require "csv"

class ClassCreator

  def initialize(file_path)
    @file_path = file_path
    @csv_data = read_csv_data
    @new_class = ""
    @objects = []
  end
  
  def read_csv_data
    CSV.read(@file_path, headers: true, header_converters: :symbol)
  end

  def get_file_name
    File.basename(@file_path, ".*")
  end

  def create_class
    file_name = get_file_name
    class_name = file_name.capitalize
    if class_name.end_with?("s")
      class_name = class_name[0..-2]
    end
    klass = Class.new
    @new_class = Object.const_set class_name, klass
    create_methods
    create_objects
    display_objects
  end

  def create_methods
    @csv_data.headers.each do |header|
      @new_class.class_eval do
        define_method header do
          instance_variable_get("@#{header}")
        end
      end
    end
    
    @csv_data.headers.each do |header|
        @new_class.class_eval do
          define_method "#{header}=" do |arg|
            instance_variable_set("@#{header}", arg)
          end
        end
    end
  end


  def create_objects
    @csv_data.each do |row|
      obj = @new_class.new
      @csv_data.headers.each do |header|
        obj.send("#{header}=", row[header])
      end
      @objects << obj
    end

    @objects
  end

  def display_objects
    count = 0
    @objects.each do |obj|
      count += 1
      puts "#{obj.class} #{count}"
      @csv_data.headers.each do |header|
        puts "  #{header}: #{obj.send(header)}"
      end
    end
  end
end

cc = ClassCreator.new("persons.csv")
p cc.create_class
