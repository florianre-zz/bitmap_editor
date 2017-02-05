class Image

  attr_reader :image_bitmap

  def initialize(heigth, width)
    @image_bitmap = Array.new(heigth) { Array.new(width,'O') }
  end

end
