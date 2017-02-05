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
    # for i in 0..@height
    #   for j in 0..@width
    #     @image_bitmap[i][j] = @@white
    #   end
    # end
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
