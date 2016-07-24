require "spec_helper"
require "bitmap_editor"

describe BitmapEditor do
  subject(:bitmap_editor) { described_class.new }

  it "Creates an MxN image with all pixels colored white" do
    run_commands_and_show_image

    expect(Kernel).to receive(:puts).with("000\n000\n000")

    run_and_exit
  end

  it "Clears the table, setting all pixels to white (O)" do
    color_pixel = "L 1 1 A\n"
    clear = "C"

    run_commands_and_show_image(color_pixel, clear)
    expect(Kernel).to receive(:puts).with("000\n000\n000")

    run_and_exit
  end

  it "Colours the pixel (1,1) with colour A" do
    color_pixel = "L 1 1 A\n"

    run_commands_and_show_image(color_pixel)
    expect(Kernel).to receive(:puts).with("A00\n000\n000")

    run_and_exit
  end

  it "Draws a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive)" do
    draw_vertical = "V 1 1 2 A\n"

    run_commands_and_show_image(draw_vertical)
    expect(Kernel).to receive(:puts).with("A00\nA00\n000")

    run_and_exit
  end


  it "Draws a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive)" do
    draw_horizontal = "H 2 3 1 A\n"

    run_commands_and_show_image(draw_horizontal)
    expect(Kernel).to receive(:puts).with("0AA\n000\n000")

    run_and_exit
  end

  it "Shows the contents of the current image" do
    run_commands_and_show_image
    expect(Kernel).to receive(:puts).with("000\n000\n000")

    run_and_exit
  end

  it "Displays help text" do
    command = "?\n"

    allow(Kernel).to receive(:gets).and_return(command, BitmapEditor::Command::EXIT.command)
    expect(Kernel).to receive(:puts).with(BitmapEditor::Command::HELP_MESSAGE)

    run_and_exit
  end

  it "Terminates the session" do
    command = "X\n"

    allow(Kernel).to receive(:gets).and_return(command)

    run_and_exit
  end

  it "Doesn't react to unrecognised commands" do
    command = "foo\n"

    allow(Kernel).to receive(:gets).and_return(command, BitmapEditor::Command::EXIT.command)
    expect(Kernel).to receive(:puts).with(BitmapEditor::Command::UNRECOGNISED_COMMAND_MESSAGE)

    run_and_exit
  end

  private

  def run_commands_and_show_image(*commands)
    create = "I 3 3\n"
    allow(Kernel).to receive(:gets).and_return(create, *commands, BitmapEditor::Command::SHOW.command, BitmapEditor::Command::EXIT.command)
  end

  def run_and_exit
    expect(Kernel).to receive(:puts).with(BitmapEditor::Command::EXIT_MESSAGE)
    bitmap_editor.run(nil, false)
  end
end
