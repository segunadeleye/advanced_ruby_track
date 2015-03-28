require "csv"

class ClassCreator

  def initialize(file_path)
    @file_path = file_path
    @rows = read_csv_data
    @headers = @rows.headers
    @class = nil
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
    @class = Object.const_set class_name, Class.new
  end

  def create_class_methods_and_objects
    create_class
    create_methods
    create_objects
    display_objects
  end

  def create_methods
    @headers.each do |method_name|
      @class.class_eval do
        define_method method_name do
          instance_variable_get("@#{method_name}")
        end
      end
    end
    
    @headers.each do |method_name|
        @class.class_eval do
          define_method "#{method_name}=" do |arg|
            instance_variable_set("@#{method_name}", arg)
          end
        end
    end
  end


  def create_objects
    @rows.each do |row|
      obj = @class.new
      @headers.each do |method_name|
        obj.send("#{method_name}=", row[method_name])
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
      @headers.each do |header|
        puts "  #{header}: #{obj.send(header)}"
      end
    end
  end

end
