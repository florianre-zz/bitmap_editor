require "./app/null_image.rb"

RSpec.describe NullImage do

  before(:context) do
    @image = NullImage.new(250, 250)
    @warning_message = "Image not initialized!"
  end

	describe "clear" do
    it "warns that an image has not been initialised" do
      expect do
        @image.clear
      end.to output("#{@warning_message}\n").to_stdout
    end
	end

  describe "colour_vertical" do
    it "warns that an image has not been initialised" do
      expect do
        @image.colour_vertical(1, 3, 5, "C")
      end.to output("#{@warning_message}\n").to_stdout
    end
  end

  describe "colour_horizontal" do
    it "warns that an image has not been initialised" do
      expect do
        @image.colour_horizontal(1, 3, 5, "C")
      end.to output("#{@warning_message}\n").to_stdout
    end
  end

  describe "colour_pixel" do
    it "warns that an image has not been initialised" do
      expect do
        @image.colour_pixel(3, 5, "C")
      end.to output("#{@warning_message}\n").to_stdout
    end
  end

  describe "to_s" do
    it "warns that an image has not been initialised" do
      expect(@image.to_s).to eq(@warning_message)
    end
  end

end
