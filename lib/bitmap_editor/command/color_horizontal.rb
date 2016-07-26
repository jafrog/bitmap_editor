require "bitmap_editor/command/base"

class BitmapEditor
  class Command
    class ColorHorizontal < Base
      def initialize(start_column, end_column, row, color)
        @start_column = start_column.to_i
        @end_column = end_column.to_i
        @row = row.to_i
        @color = color
      end

      def run_command(current_image)
        raise(NoImageError) unless current_image
        raise(ArgumentError) unless arguments_valid?(current_image)
        current_image.color_horizontal(@start_column, @end_column, @row, @color)
        current_image
      end

      private

      def arguments_valid?(current_image)
        column_out_of_range = [@start_column, @end_column].any? { |index| current_image.column_out_of_range?(index)}
        row_out_of_range = current_image.row_out_of_range?(@row)
        !(column_out_of_range || row_out_of_range || color_invalid(@color))
      end
    end
  end
end
