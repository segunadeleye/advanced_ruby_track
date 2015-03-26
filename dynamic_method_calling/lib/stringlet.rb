class Stringlet < String

  def exclude?(string)
    !include?(string)
  end

end
