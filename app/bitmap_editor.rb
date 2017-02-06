require './app/image.rb'

class BitmapEditor

  def run
    @running = true
    puts 'type ? for help'
    while @running
      print '> '
      input = gets.chomp
      case input
      when /^I (\d{1,3}) (\d{1,3})$/
        height = input.scan(/\d{1,3}/)[0].to_i
        width = input.scan(/\d{1,3}/)[1].to_i
        @image = Image.new(height, width)

      when 'C'
        @image.clear

      when /^L (\d{1,3}) (\d{1,3}) [A-Z]$/
        x_coord = input.scan(/\d{1,3}/)[0].to_i - 1
        y_coord = input.scan(/\d{1,3}/)[1].to_i - 1
        colour = input[-1]
        @image.colour_pixel(x_coord, y_coord, colour)

      when /^V (\d{1,3}) (\d{1,3}) (\d{1,3}) [A-Z]$/
        x_coord = input.scan(/\d{1,3}/)[0].to_i - 1
        y_start = input.scan(/\d{1,3}/)[1].to_i - 1
        y_end = input.scan(/\d{1,3}/)[2].to_i - 1
        colour = input[-1]
        @image.colour_vertical(x_coord, y_start, y_end, colour)

      when /^H (\d{1,3}) (\d{1,3}) (\d{1,3}) [A-Z]$/
        x_start = input.scan(/\d{1,3}/)[0].to_i - 1
        x_end = input.scan(/\d{1,3}/)[1].to_i - 1
        y_coord = input.scan(/\d{1,3}/)[2].to_i - 1
        colour = input[-1]
        @image.colour_horizontal(y_coord, x_start, x_end, colour)

      when 'S'
        puts @image.to_s

      when 'X'
        exit_console

      when '?'
        show_help

      else
        puts 'unrecognised command :('
      end
    end
  end

  private
    def exit_console
      puts 'goodbye!'
      @running = false
    end

    def show_help
      puts "? - Help
I M N - Create a new M x N image with all pixels coloured white (O).
C - Clears the table, setting all pixels to white (O).
L X Y C - Colours the pixel (X,Y) with colour C.
V X Y1 Y2 C - Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).
H X1 X2 Y C - Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).
S - Show the contents of the current image
X - Terminate the session"
    end
end

BitmapEditor.new.run
