require_relative "../errors/no_image_error"
require_relative "../errors/command_argument_error"

class BitmapEditor
  class Command
    class ColorPixel
      def initialize(*args)
        raise(CommandArgumentError) unless args.count == 3

        @column = args[0].to_i
        @row = args[1].to_i
        @color = args[2]
      end

      def run(current_image)
        raise(NoImageError) unless current_image
        current_image.color_pixel(@column, @row, @color)
        current_image
      end


      def terminate?
        false
      end
    end
  end
end
