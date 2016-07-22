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

    def clear
      @image = create_image(@columns, @rows)
    end

    private

    def create_image(columns, rows)
      Array.new(rows) { Array.new(columns) { "0" } }
    end
  end
end
