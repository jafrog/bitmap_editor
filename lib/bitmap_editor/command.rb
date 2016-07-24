class BitmapEditor
  class Command
    HELP_MESSAGE = "? - Help
I M N - Create a new M x N image with all pixels coloured white (O).
C - Clears the table, setting all pixels to white (O).
L X Y C - Colours the pixel (X,Y) with colour C.
V X Y1 Y2 C - Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).
H X1 X2 Y C - Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).
S - Show the contents of the current image
X - Terminate the session"
    EXIT_MESSAGE = "goodbye!"
    UNRECOGNISED_COMMAND_MESSAGE = "unrecognised command :("

    def self.select(input)
      command_string, *arguments = input.split(" ")
      command = COMMANDS.find { |command| command.matches?(command_string) } || UNKNOWN
      command.arguments = arguments
      command
    end

    attr_accessor :arguments
    attr_reader :command

    def initialize(command, run:, terminate: false)
      @command = command
      @run = run
      @terminate = terminate
    end

    def run(current_image)
      result = @run.call(current_image, *@arguments)
      current_image || result
    end

    def matches?(command_string)
      @command == command_string
    end

    def terminate?
      @terminate
    end

    CREATE           = new("I", run: ->(image, columns, rows)                        { Image.new(columns.to_i, rows.to_i) })
    SHOW             = new("S", run: ->(image)                                       { Kernel.puts image.display })
    COLOR_PIXEL      = new("L", run: ->(image, column, row, color)                   { image.color_pixel(column.to_i, row.to_i, color) })
    COLOR_VERTICAL   = new("V", run: ->(image, column, start_row, end_row, color)    { image.color_vertical(column.to_i, start_row.to_i, end_row.to_i, color) })
    COLOR_HORIZONTAL = new("H", run: ->(image, start_column, end_column, row, color) { image.color_horizontal(start_column.to_i, end_column.to_i, row.to_i, color) })
    CLEAR            = new("C", run: ->(image)                                       { image.clear })
    HELP             = new("?", run: ->(image)                                       { Kernel.puts HELP_MESSAGE })
    EXIT             = new("X", run: ->(image)                                       { Kernel.puts EXIT_MESSAGE }, terminate: true)
    UNKNOWN          = new(nil, run: ->(image)                                       { Kernel.puts UNRECOGNISED_COMMAND_MESSAGE})

    COMMANDS = [CREATE, SHOW, COLOR_PIXEL, COLOR_VERTICAL, COLOR_HORIZONTAL, CLEAR, HELP, EXIT]
  end
end
