class Image

  attr_reader :image_bitmap
  attr_reader :height
  attr_reader :width

  @@white = "O"

  def initialize(height, width)
    @height = height
    @width = width
    @image_bitmap = Array.new(height) { Array.new(width, @@white) }
  end

  def clear
    @image_bitmap.map! do |row|
      row.map! {@@white}
    end
  end

  def colour_pixel(x, y, c)
    @image_bitmap[y][x] = c
  end

  def to_s
    output = ""
    for row in @image_bitmap
      for char in row
        output += char
      end
      output += "\n"
    end
    output
  end

end
