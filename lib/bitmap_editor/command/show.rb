class BitmapEditor
  class Command
    class Show
      def run(current_image = nil)
        return unless current_image
        Kernel.puts current_image.display
        current_image
      end

      def terminate?
        false
      end
    end
  end
end
