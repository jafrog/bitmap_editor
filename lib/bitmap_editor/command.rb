require "bitmap_editor/command/create"
require "bitmap_editor/command/show"
require "bitmap_editor/command/color_pixel"
require "bitmap_editor/command/clear"
require "bitmap_editor/command/help"
require "bitmap_editor/command/exit"
require "bitmap_editor/command/unknown"

class BitmapEditor
  class Command
    CREATE = "I"
    SHOW = "S"
    COLOR_PIXEL = "L"
    CLEAR = "C"
    HELP = "?"
    EXIT = "X"

    COMMANDS = {CREATE => Create,
                SHOW => Show,
                COLOR_PIXEL => ColorPixel,
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
