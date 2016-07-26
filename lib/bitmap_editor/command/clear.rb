require "bitmap_editor/command/base"

class BitmapEditor
  class Command
    class Clear < Base
      def run_command(current_image)
        raise(NoImageError) unless current_image
        current_image.clear
        current_image
      end
    end
  end
end
