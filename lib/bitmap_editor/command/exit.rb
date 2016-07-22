class BitmapEditor
  class Command
    class Exit
      MESSAGE = "goodbye!"

      def run(current_image = nil)
        Kernel.puts MESSAGE
      end

      def terminate?
        true
      end
    end
  end
end
