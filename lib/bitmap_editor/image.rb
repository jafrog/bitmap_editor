class BitmapEditor
  class Image
    def initialize(columns, rows)
      @columns = columns
      @rows = rows
      @image = create_image(columns, rows)
    end

    def display
      @image.map(&:join).join("\n")
    end

    def color_pixel(column, row, color)
      @image[row-1][column-1] = color
    end

    def color_vertical(column, start_row, end_row, color)
      @image[start_row-1..end_row-1].each { |row| row[column-1] = color }
    end

    def color_horizontal(start_column, end_column, row, color)
      @image[row-1][start_column-1..end_column-1] = Array.new(end_column-start_column+1) { color }
    end

    def clear
      @image = create_image(@columns, @rows)
    end

    def row_out_of_range?(row_index)
      row_index > @rows || row_index < 1
    end

    def column_out_of_range?(column_index)
      column_index > @columns || column_index < 1
    end

    private

    def create_image(columns, rows)
      Array.new(rows) { Array.new(columns) { "0" } }
    end
  end
end
