require "bitmap_editor/command/create"
require "bitmap_editor/command/show"
require "bitmap_editor/command/help"
require "bitmap_editor/command/exit"
require "bitmap_editor/command/unknown"

class BitmapEditor
  class Command
    CREATE = "I"
    SHOW = "S"
    HELP = "?"
    EXIT = "X"

    COMMANDS = {CREATE => Create,
                SHOW => Show,
                HELP => Help,
                EXIT => Exit}

    def self.select(input)
      command, arguments = input.split(" ")
      command_class = COMMANDS[command] || Unknown
      command_class.new(arguments)
    end
  end
end
