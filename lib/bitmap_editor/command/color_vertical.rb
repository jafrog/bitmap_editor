class BitmapEditor
  class Command
    class ColorVertical
      def initialize(column, start_row, end_row, color)
        @column = column.to_i
        @start_row = start_row.to_i
        @end_row = end_row.to_i
        @color = color
      end

      def run(current_image)
        current_image.color_vertical(@column, @start_row, @end_row, @color)
        current_image
      end

      def terminate?
        false
      end
    end
  end
end
