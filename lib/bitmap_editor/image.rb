require_relative "errors/command_argument_error"

class BitmapEditor
  class Image
    class InvalidDimensionsError < CommandArgumentError
      def message
        "Invalid dimensions"
      end
    end

    MAX_ROWS = 250
    MAX_COLUMNS = 250

    def initialize(columns, rows)
      raise(InvalidDimensionsError) unless columns.between?(1, MAX_COLUMNS) && rows.between?(1, MAX_ROWS)

      @columns = columns
      @rows = rows
      @image = create_image(columns, rows)
    end

    def display
      @image.map(&:join).join("\n")
    end

    def color_pixel(column, row, color)
      raise(CommandArgumentError) if row_out_of_range?(row) || column_out_of_range?(column) || color_invalid?(color)

      @image[row-1][column-1] = color
    end

    def color_vertical(column, start_row, end_row, color)
      raise(CommandArgumentError) if row_out_of_range?(start_row) || row_out_of_range?(end_row) || column_out_of_range?(column) || color_invalid?(color)

      @image[start_row-1..end_row-1].each { |row| row[column-1] = color }
    end

    def color_horizontal(start_column, end_column, row, color)
      raise(CommandArgumentError) if row_out_of_range?(row) || column_out_of_range?(start_column) || column_out_of_range?(end_column) || color_invalid?(color)

      @image[row-1][start_column-1..end_column-1] = Array.new(end_column-start_column+1) { color }
    end

    def clear
      @image = create_image(@columns, @rows)
    end

    private

    def row_out_of_range?(row_index)
      row_index > @rows || row_index < 1
    end

    def column_out_of_range?(column_index)
      column_index > @columns || column_index < 1
    end

    def color_invalid?(color)
      color.chars.count > 1
    end

    def create_image(columns, rows)
      Array.new(rows) { Array.new(columns) { "0" } }
    end
  end
end
