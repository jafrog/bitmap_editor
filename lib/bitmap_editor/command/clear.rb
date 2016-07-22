require "bitmap_editor/image"

class BitmapEditor
  class Command
    class Clear
      def run(current_image)
        current_image.clear
        current_image
      end

      def terminate?
        false
      end
    end
  end
end
