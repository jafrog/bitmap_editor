class BitmapEditor
  class Image
    def initialize(columns, rows)
      @image = Array.new(rows) { Array.new(columns) { "0" } }
    end

    def display
      @image.map(&:join).join("\n")
    end

    def color_pixel(column, row, color)
      @image[row-1][column-1] = color
    end
  end
end
