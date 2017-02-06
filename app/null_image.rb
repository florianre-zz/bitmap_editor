require './app/image_interface.rb'

class NullImage < ImageInterface

  def clear
    puts "Image not initialized!"
  end

  def colour_vertical(column, row_start, row_end, c)
    puts "Image not initialized!"
  end

  def colour_horizontal(row, column_start, column_end, c)
    puts "Image not initialized!"
  end

  def colour_pixel(x, y, c)
    puts "Image not initialized!"
  end

  def to_s
    "Image not initialized!"
  end

end
