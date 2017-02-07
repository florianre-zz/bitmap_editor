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
        width = input.scan(/\d{1,3}/)[0].to_i
        height = input.scan(/\d{1,3}/)[1].to_i
        i_command(width, height)

      when 'C'
        @image.clear

      when /^L (\d{1,3}) (\d{1,3}) [A-Z]$/
        x_coord = input.scan(/\d{1,3}/)[0].to_i
        y_coord = input.scan(/\d{1,3}/)[1].to_i
        colour = input[-1]
        l_command(x_coord, y_coord, colour)

      when /^V (\d{1,3}) (\d{1,3}) (\d{1,3}) [A-Z]$/
        x_coord = input.scan(/\d{1,3}/)[0].to_i
        y_start = input.scan(/\d{1,3}/)[1].to_i
        y_end = input.scan(/\d{1,3}/)[2].to_i
        colour = input[-1]
        v_command(x_coord, y_start, y_end, colour)

      when /^H (\d{1,3}) (\d{1,3}) (\d{1,3}) [A-Z]$/
        x_start = input.scan(/\d{1,3}/)[0].to_i
        x_end = input.scan(/\d{1,3}/)[1].to_i
        y_coord = input.scan(/\d{1,3}/)[2].to_i
        colour = input[-1]
        h_command(y_coord, x_start, x_end, colour)

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

    def i_command(width, height)
      if height.between?(1, @max_height) && width.between?(1, @max_width)
        @image = Image.new(height, width)
      else
        puts "Height and width need to be between 1 and 250"
      end
    end

    def l_command(x, y, colour)
      if !(x.between?(1, @image.width) && y.between?(1, @image.height))
        puts "Height(width) need to be between 1 and #{@image.height}(#{@image.width})"
      else
        @image.colour_pixel(x - 1, y-1, colour)
      end
    end

    def v_command(x, y_start, y_end, colour)
      if !(line_in_bound(x, @image.width, y_start, y_end, @image.height))
        puts "Height(width) need to be between 1 and #{@image.height}(#{@image.width})"
      elsif y_start > y_end
        puts "Make sure the start of interval is less than your end of interval"
      else
        @image.colour_vertical(x - 1, y_start - 1, y_end - 1, colour)
      end

    end

    def h_command(y, x_start, x_end, colour)
      if !(line_in_bound(y, @image.height, x_start, x_end, @image.width))
        puts "Height(width) need to be between 1 and #{@image.height}(#{@image.width})"
      elsif x_start > x_end
        puts "Make sure the start of interval is less than your end of interval"
      else
        @image.colour_horizontal(y - 1, x_start - 1, x_end - 1, colour)
      end
    end

    def line_in_bound(origin, max_origin, start_interval, end_interval, max_interval)
      origin.between?(1, max_origin) &&
      start_interval.between?(1, max_interval) &&
      end_interval.between?(1, max_interval)
    end

end
