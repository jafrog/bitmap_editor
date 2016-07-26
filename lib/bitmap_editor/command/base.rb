class BitmapEditor
  class Command
    class Base
      def run(current_image)
        run_command(current_image)
      rescue NoImageError
        Kernel.puts "No current image"
      rescue ArgumentError
        Kernel.puts "Invalid arguments"
      end

      def terminate?
        false
      end

      private

      def color_invalid(color)
        color.chars.count > 1
      end
    end

    class NoImageError < RuntimeError; end
  end
end
