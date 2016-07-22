class BitmapEditor
  class Command
    class ColorPixel
      def initialize(column, row, color)
        @column = column.to_i
        @row = row.to_i
        @color = color
      end

      def run(current_image)
        current_image.color_pixel(@column, @row, @color)
        current_image
      end

      def terminate?
        false
      end
    end
  end
end
