require "bitmap_editor/command"

class BitmapEditor
  INITIAL_MESSAGE = "type ? for help"

  def start
    Kernel.puts INITIAL_MESSAGE
    run
  end

  def run(current_image = nil)
    print_prompt
    input = Kernel.gets.chomp
    command = Command.select(input)
    result = command.run(current_image)
    run(result) unless command.terminate?
  end

  private

  def print_prompt
    print '> ' if __FILE__ == $0
  end
end
