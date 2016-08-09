require_relative "../errors/no_image_error"
require_relative "../errors/command_argument_error"

class BitmapEditor
  class Command
    class FillBucket
      def initialize(*args)
        raise(CommandArgumentError) unless args.count == 3

        @row = args[0].to_i
        @column = args[1].to_i
        @color = args[2]
      end

      def run(current_image)
        raise(NoImageError) unless current_image
        current_image.fill_bucket(@row, @column, @color)
        current_image
      end

      def terminate?
        false
      end
    end
  end
end
