require_relative "../errors/no_image_error"
require_relative "../errors/command_argument_error"

class BitmapEditor
  class Command
    class ColorHorizontal
      def initialize(*args)
        raise(CommandArgumentError) unless args.count == 4

        @start_column = args[0].to_i
        @end_column = args[1].to_i
        @row = args[2].to_i
        @color = args[3]
      end

      def run(current_image)
        raise(NoImageError) unless current_image
        current_image.color_horizontal(@start_column, @end_column, @row, @color)
        current_image
      end

      def terminate?
        false
      end
    end
  end
end
