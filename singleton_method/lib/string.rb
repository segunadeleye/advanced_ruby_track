class String

  class << self
    def underscorify
      gsub(/\s/, "_")
    end
  end

end
