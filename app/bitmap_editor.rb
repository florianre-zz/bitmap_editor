require './app/image.rb'
require './app/null_image.rb'

class BitmapEditor

  def run
    @max_width = 250
    @max_height = 250
    @running = true
    @image = NullImage.new(@max_height, @max_width)

    puts 'type ? for help'
    while @running
      print '> '
      input = gets.chomp

      case input
      when /^I (\d{1,3}) (\d{1,3})$/
        height = input.scan(/\d{1,3}/)[0].to_i
        width = input.scan(/\d{1,3}/)[1].to_i

        if height.between?(1, @max_height) && width.between?(1, @max_width)
          @image = Image.new(height, width)
        else
          puts "Height and width need to be between 1 and 250"
        end

      when 'C'
        @image.clear

      when /^L (\d{1,3}) (\d{1,3}) [A-Z]$/
        x_coord = input.scan(/\d{1,3}/)[0].to_i
        y_coord = input.scan(/\d{1,3}/)[1].to_i

        if x_coord.between?(1, @image.width) &&
           y_coord.between?(1, @image.height)
          colour = input[-1]
          @image.colour_pixel(x_coord - 1, y_coord - 1, colour)
        else
          puts "Height(width) need to be between 1 and #{@image.height}(#{@image.width})"
        end

      when /^V (\d{1,3}) (\d{1,3}) (\d{1,3}) [A-Z]$/
        x_coord = input.scan(/\d{1,3}/)[0].to_i
        y_start = input.scan(/\d{1,3}/)[1].to_i
        y_end = input.scan(/\d{1,3}/)[2].to_i

        if !(x_coord.between?(1, @image.width) &&
             y_start.between?(1, @image.height) &&
             y_end.between?(1, @image.height))
          puts "Height(width) need to be between 1 and #{@image.height}(#{@image.width})"
        elsif y_start > y_end
          puts "Make sure the start of interval is less than your end of interval"
        else
          colour = input[-1]
          @image.colour_vertical(x_coord - 1, y_start - 1, y_end - 1, colour)
        end

        y_end.between?(y_start, @image.height)

      when /^H (\d{1,3}) (\d{1,3}) (\d{1,3}) [A-Z]$/
        x_start = input.scan(/\d{1,3}/)[0].to_i
        x_end = input.scan(/\d{1,3}/)[1].to_i
        y_coord = input.scan(/\d{1,3}/)[2].to_i

        if !(x_start.between?(1, @image.width) &&
             x_end.between?(1, @image.width) &&
             y_coord.between?(1, @image.height))
          puts "Height(width) need to be between 1 and #{@image.height}(#{@image.width})"
        elsif x_start > x_end
          puts "Make sure the start of interval is less than your end of interval"
        else
          colour = input[-1]
          @image.colour_horizontal(y_coord - 1, x_start - 1, x_end - 1, colour)
        end

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
