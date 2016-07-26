require_relative "../errors/no_image_error"

class BitmapEditor
  class Command
    class ColorPixel
      def initialize(column, row, color)
        @column = column.to_i
        @row = row.to_i
        @color = color
      end

      def run(current_image)
        raise(NoImageError) unless current_image
        current_image.color_pixel(@column, @row, @color)
        current_image
      end


      def terminate?
        false
      end
    end
  end
end
