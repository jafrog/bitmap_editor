require_relative "../errors/no_image_error"
require_relative "../errors/command_argument_error"

class BitmapEditor
  class Command
    class Clear
      def initialize(*args)
        raise(CommandArgumentError) unless args.empty?
      end

      def run(current_image)
        raise(NoImageError) unless current_image
        current_image.clear
        current_image
      end

      def terminate?
        false
      end
    end
  end
end
