require_relative "bitmap_editor/errors/no_image_error"
require_relative "bitmap_editor/errors/command_argument_error"
require_relative "bitmap_editor/command"

class BitmapEditor
  INITIAL_MESSAGE = "type ? for help"

  def start
    Kernel.puts INITIAL_MESSAGE
    run
  end

  def run(current_image = nil, interactive = true)
    print '> ' if interactive
    input = Kernel.gets.chomp
    command = Command.select(input)
    result = command.run(current_image)
  rescue CommandArgumentError, NoImageError => e
    Kernel.puts e.message
  ensure
    result ||= current_image
    run(result, interactive) unless command && command.terminate?
  end
end
