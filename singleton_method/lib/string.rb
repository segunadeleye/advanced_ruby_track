class String

  class << self
    def underscorify
      gsub(/\s/, "_")
    end
  end

  def self.underscorify
    gsub(/\s/, "_")
  end

end

def String.underscorify
  gsub(/\s/, "_")
end

class << String
  def underscorify
    gsub(/\s/, "_")
  end
end
