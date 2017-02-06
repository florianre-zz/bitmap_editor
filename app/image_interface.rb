class ImageInterface

   def clear
     raise "clear method is not implemented!"
   end

   def colour_vertical(column, row_start, row_end, c)
     raise "colour_vertical method is not implemented!"
   end

   def colour_horizontal(row, column_start, column_end, c)
     raise "colour_horizontal method is not implemented!"
   end

   def colour_pixel(x, y, c)
     raise "colour_pixel method is not implemented!"
   end

   def to_s
     raise "to_s method is not implemented!"
   end

end
