require "csv"

class ClassCreator

  def initialize(file_path)
    @file_path = file_path
    @rows = read_csv_data
    @headers = @rows.headers
    @objects = []
    @count = 0
  end
  
  def create_class_methods_and_objects
    @class = create_class
    create_methods
    create_objects
    display_objects
  end

  def read_csv_data
    CSV.read(@file_path, headers: true, header_converters: :symbol)
    rescue => e
      puts "#{e.message}: File name incorrect or file not in the lib folder."
      exit
  end

  def create_class
    file_name = get_file_name
    class_name = file_name.capitalize
    if class_name.end_with?("s")
      class_name = class_name[0..-2]
    end
    Object.const_set class_name, Class.new
  end

  def get_file_name
    File.basename(@file_path, ".*")
  end

  def create_methods
    @class.class_eval %{
      def to_s
        #@headers.map do |header|
          "   " + header.to_s + ": " + send(header)
        end.join("\n")
      end
    }
    
    @headers.each do |method_name|
      @class.class_eval do
        # Getter methods
        define_method "#{method_name}" do
          instance_variable_get("@#{method_name}")
        end

        # Setter methods
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
  end

  def display_objects
    @objects.each_with_index do |obj, index|
      puts "> #{obj.class} #{index + 1}"
      puts obj
    end
  end

end
