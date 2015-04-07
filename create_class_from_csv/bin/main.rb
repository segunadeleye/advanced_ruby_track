require_relative "../lib/class_creator"

file_path = "../lib/persons.csv"
cc = ClassCreator.new(file_path)
cc.create_class_methods_and_objects
