require_relative "command/create"
require_relative "command/show"
require_relative "command/color_pixel"
require_relative "command/clear"
require_relative "command/color_vertical"
require_relative "command/color_horizontal"
require_relative "command/fill_bucket"
require_relative "command/help"
require_relative "command/exit"
require_relative "command/unknown"

class BitmapEditor
  class Command
    CREATE = "I"
    SHOW = "S"
    COLOR_PIXEL = "L"
    COLOR_VERTICAL = "V"
    COLOR_HORIZONTAL = "H"
    FILL_BUCKET = "F"
    CLEAR = "C"
    HELP = "?"
    EXIT = "X"

    COMMANDS = {CREATE => Create,
                SHOW => Show,
                COLOR_PIXEL => ColorPixel,
                COLOR_VERTICAL => ColorVertical,
                COLOR_HORIZONTAL => ColorHorizontal,
                FILL_BUCKET => FillBucket,
                CLEAR => Clear,
                HELP => Help,
                EXIT => Exit}

    def self.select(input)
      command, *arguments = input.split(" ")
      command_class = COMMANDS[command] || Unknown
      command_class.new(*arguments)
    end
  end
end
