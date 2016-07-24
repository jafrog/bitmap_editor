class BitmapEditor
  class Command
    class Unknown
      MESSAGE = "unrecognised command :("

      def initialize(*args)
      end

      def run(current_image = nil)
        Kernel.puts MESSAGE
        current_image
      end

      def terminate?
        false
      end
    end
  end
end
