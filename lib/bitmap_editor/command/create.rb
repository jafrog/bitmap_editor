require_relative "../image"
require_relative "../errors/command_argument_error"

class BitmapEditor
  class Command
    class Create
      def initialize(*args)
        raise(CommandArgumentError) unless args.count == 2
        @columns = args[0].to_i
        @rows = args[1].to_i
      end

      def run(current_image)
        Image.new(@columns, @rows)
      end

      def terminate?
        false
      end
    end
  end
end
