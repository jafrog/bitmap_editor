require_relative "../errors/no_image_error"

class BitmapEditor
  class Command
    class Show
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
