require "spec_helper"
require "bitmap_editor"

describe BitmapEditor do
  subject(:bitmap_editor) { described_class.new }

  xit "Creates an MxN image with all pixels colored white" do
    command = "I 2 2\n"

    allow(Kernel).to receive(:gets).and_return(command, BitmapEditor::Command::SHOW, BitmapEditor::Command::EXIT)
    expect(Kernel).to receive(:puts).with(BitmapEditor::INITIAL_MESSAGE)
    expect(Kernel).to receive(:puts).with("00\n00\n")
    expect(Kernel).to receive(:puts).with(BitmapEditor::GOODBYE_MESSAGE)

    bitmap_editor.run
  end

  xit "Clears the table, setting all pixels to white (O)"
  xit "Colours the pixel (X,Y) with colour C"
  xit "Draws a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive)"
  xit "Draws a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive)"
  xit "Shows the contents of the current image"

  it "Displays help text" do
    command = "?\n"

    allow(Kernel).to receive(:gets).and_return(command, BitmapEditor::Command::EXIT)
    expect(Kernel).to receive(:puts).with(BitmapEditor::INITIAL_MESSAGE)
    expect(Kernel).to receive(:puts).with(BitmapEditor::Command::Help::MESSAGE)
    expect(Kernel).to receive(:puts).with(BitmapEditor::Command::Exit::MESSAGE)

    bitmap_editor.run
  end

  it "Terminates the session" do
    command = "X\n"

    allow(Kernel).to receive(:gets).and_return(command)
    expect(Kernel).to receive(:puts).with(BitmapEditor::INITIAL_MESSAGE)
    expect(Kernel).to receive(:puts).with(BitmapEditor::Command::Exit::MESSAGE)

    bitmap_editor.run
  end

  it "Doesn't react to unrecognised commands" do
    command = "foo\n"

    allow(Kernel).to receive(:gets).and_return(command, BitmapEditor::Command::EXIT)
    expect(Kernel).to receive(:puts).with(BitmapEditor::INITIAL_MESSAGE)
    expect(Kernel).to receive(:puts).with(BitmapEditor::Command::Unknown::MESSAGE)
    expect(Kernel).to receive(:puts).with(BitmapEditor::Command::Exit::MESSAGE)

    bitmap_editor.run
  end
end
