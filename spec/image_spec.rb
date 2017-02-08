require "./app/image.rb"

RSpec.describe Image do

  before(:context) do
    @width = 10
    @height = 10
    @white = "O"
  end

  before(:example) do
    @image = Image.new(@height, @width)
  end

  describe "#initialize" do
    it "initialises an Image object" do
      expect(@image.width).to eq(@width)
      expect(@image.height).to eq(@height)
      expect(@image.image_bitmap.length).to eq(@height)
      expect(@image.image_bitmap[0].length).to eq(@width)

      arr = Array.new(@width, @white)
      for r in @image.image_bitmap.each
        expect(r).to match_array arr
      end
    end
  end

	describe "#clear" do
    it "sets all bits to white colour" do
      @image.colour_pixel(4, 4, 'C')
      @image.clear

      arr = Array.new(@width, @white)
      for r in @image.image_bitmap.each
        expect(r).to match_array arr
      end
    end
	end

  describe "#colour_vertical" do
    it "colours a part of a line vertically" do
      c_colour = "C"
      row = 1
      start_col = 3
      end_col = 5
      @image.colour_vertical(row, start_col, end_col, "C")

      arr = Array.new(@width, @white)
      for i in start_col..end_col
        arr[i] = c_colour
      end
      expect(@image.image_bitmap[row]).to match_array arr
    end
  end

  describe "#colour_horizontal" do
    it "colours a part of a line horizontally" do
      c_colour = "C"
      row = 1
      start_col = 3
      end_col = 5
      @image.colour_horizontal(row, start_col, end_col, c_colour)

      arr = Array.new(@width, @white)
      for i in start_col..end_col
        arr[i] = c_colour
      end
      expect(@image.image_bitmap[row]).to match_array arr
      for c in start_col..end_col
        expect(@image.image_bitmap[row][c]).to eq(c_colour)
      end
    end
  end

  describe "#colour_pixel" do
    it "changes the specified bit to the specified colour" do
      c_colour = "C"
      c_x = 4
      c_y = 4
      g_colour = "G"
      g_x = 2
      g_y = 1
      u_colour = "U"
      u_x = g_x
      u_y = g_y

      @image.colour_pixel(c_x, c_y, c_colour)
      @image.colour_pixel(g_x, g_y, g_colour)

      arr = Array.new(@width, @white)
      arr[0] = c_colour
      expect(@image.image_bitmap[c_y]).to match_array arr
      expect(@image.image_bitmap[c_y][c_x]).to eq(c_colour)
      arr[0] = g_colour
      expect(@image.image_bitmap[g_y]).to match_array arr
      expect(@image.image_bitmap[g_y][g_x]).to eq(g_colour)

      @image.colour_pixel(u_x, u_y, u_colour)

      arr[0] = u_colour
      expect(@image.image_bitmap[u_y]).to match_array arr
      expect(@image.image_bitmap[u_y][u_x]).to eq(u_colour)
    end
  end

  describe "#to_s" do
    it "converts image bitmap to printable string" do
      @image.to_s

      output = ""
      for row in @image.image_bitmap
        for char in row
          output += char
        end
        output += "\n"
      end
      expect(@image.to_s).to eq(output)
    end
  end

end
