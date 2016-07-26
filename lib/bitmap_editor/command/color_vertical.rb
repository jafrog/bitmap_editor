require_relative "../errors/no_image_error"
require_relative "../errors/command_argument_error"

class BitmapEditor
  class Command
    class ColorVertical
      def initialize(*args)
        raise(CommandArgumentError) unless args.count == 4

        @column = args[0].to_i
        @start_row = args[1].to_i
        @end_row = args[2].to_i
        @color = args[3]
      end

      def run(current_image)
        raise(NoImageError) unless current_image
        current_image.color_vertical(@column, @start_row, @end_row, @color)
        current_image
      end

      def terminate?
        false
      end
    end
  end
end
