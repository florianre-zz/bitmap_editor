require './app/image_interface.rb'

class Image < ImageInterface

  attr_reader :image_bitmap, :height, :width

  @@white = "O"

  def initialize(height, width)
    @height = height
    @width = width 
    @image_bitmap = Array.new(width) { Array.new(height, @@white) }
  end

  def clear
    @image_bitmap.map! do |row|
      row.map! {@@white}
    end
  end

  def colour_vertical(column, row_start, row_end, c)
    for r in row_start..row_end
      colour_pixel(column, r, c)
    end
  end

  def colour_horizontal(row, column_start, column_end, c)
    for col in column_start..column_end
      colour_pixel(col, row, c)
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
