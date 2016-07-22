class BitmapEditor
  class Command
    class Unknown
      MESSAGE = "unrecognised command :("

      def initialize(arguments = nil)
      end

      def run
        Kernel.puts MESSAGE
      end

      def terminate?
        false
      end
    end
  end
end
