require "bitmap_editor/command"

class BitmapEditor
  INITIAL_MESSAGE = "type ? for help"

  def run
    @running = true
    Kernel.puts INITIAL_MESSAGE
    while @running
      print '> '
      input = Kernel.gets.chomp
      command = Command.select(input)
      result = command.run
      Kernel.puts result if result
      terminate if command.terminate?
    end
  end

  private

  def terminate
    @running = false
  end
end
