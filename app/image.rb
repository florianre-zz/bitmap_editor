class Image

  attr_reader :image_bitmap

  def initialize(heigth, width)
    @image_bitmap = Array.new(heigth) { Array.new(width,'O') }
  end

  def to_s
    output = ""
    for row in @image_bitmap
      for char in row
        output += char
      end
      output += "\n"
    end
    return output
  end

end
