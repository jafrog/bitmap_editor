require_relative "../errors/no_image_error"
require_relative "../errors/command_argument_error"

class BitmapEditor
  class Command
    class Show
      def initialize(*args)
        raise(CommandArgumentError) unless args.empty?
      end

      def run(current_image = nil)
        raise(NoImageError) unless current_image
        Kernel.puts current_image.display
        current_image
      end

      def terminate?
        false
      end
    end
  end
end
