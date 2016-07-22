require "bitmap_editor/image"

class BitmapEditor
  class Command
    class Create
      def initialize(columns, rows)
        @columns = columns.to_i
        @rows = rows.to_i
      end

      def run(current_image = nil)
        Image.new(@columns, @rows)
      end

      def terminate?
        false
      end
    end
  end
end
