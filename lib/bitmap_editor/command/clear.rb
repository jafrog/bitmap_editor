require_relative "../errors/no_image_error"

class BitmapEditor
  class Command
    class Clear
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
