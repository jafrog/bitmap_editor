require_relative "../errors/command_argument_error"

class BitmapEditor
  class Command
    class Exit
      MESSAGE = "goodbye!"

      def initialize(*args)
        raise(CommandArgumentError) unless args.empty?
      end

      def run(current_image = nil)
        Kernel.puts MESSAGE
      end

      def terminate?
        true
      end
    end
  end
end
