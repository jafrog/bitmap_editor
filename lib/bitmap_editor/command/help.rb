class BitmapEditor
  class Command
    class Help
      MESSAGE = "? - Help
I M N - Create a new M x N image with all pixels coloured white (O).
C - Clears the table, setting all pixels to white (O).
L X Y C - Colours the pixel (X,Y) with colour C.
V X Y1 Y2 C - Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).
H X1 X2 Y C - Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).
S - Show the contents of the current image
X - Terminate the session"

      def run(current_image = nil)
        Kernel.puts MESSAGE
        current_image
      end

      def terminate?
        false
      end
    end
  end
end
