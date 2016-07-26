class BitmapEditor
  class CommandArgumentError < ArgumentError
    def message
      "Invalid arguments"
    end
  end
end
