class BitmapEditor
  class Command
    class ColorHorizontal
      def initialize(start_column, end_column, row, color)
        @start_column = start_column.to_i
        @end_column = end_column.to_i
        @row = row.to_i
        @color = color
      end

      def run(current_image)
        current_image.color_horizontal(@start_column, @end_column, @row, @color)
        current_image
      end

      def terminate?
        false
      end
    end
  end
end
