class BitmapEditor
  class Command
    class Exit
      MESSAGE = "goodbye!"

      def initialize(arguments = nil)
      end

      def run
        Kernel.puts MESSAGE
      end

      def terminate?
        true
      end
    end
  end
end
