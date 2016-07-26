class BitmapEditor
  class NoImageError < ArgumentError
    def message
      "No image"
    end
  end
end
