require "spec_helper"
require "bitmap_editor"

describe BitmapEditor do
  subject(:bitmap_editor) { described_class.new }

  it "Creates an MxN image with all pixels colored white" do
    command = "I 2 2\n"

    allow(Kernel).to receive(:gets).and_return(command, BitmapEditor::Command::SHOW, BitmapEditor::Command::EXIT)
    expect(Kernel).to receive(:puts).with("00\n00")
    expect(Kernel).to receive(:puts).with(BitmapEditor::Command::Exit::MESSAGE)

    bitmap_editor.run
  end

  it "Clears the table, setting all pixels to white (O)" do
    create_image = "I 2 2\n"
    color_pixel = "L 1 1 A\n"
    command = "C"

    allow(Kernel).to receive(:gets).and_return(create_image, color_pixel, command, BitmapEditor::Command::SHOW, BitmapEditor::Command::EXIT)
    expect(Kernel).to receive(:puts).with("00\n00")
    expect(Kernel).to receive(:puts).with(BitmapEditor::Command::Exit::MESSAGE)

    bitmap_editor.run
  end

  it "Colours the pixel (1,1) with colour A" do
    create_image = "I 2 2\n"
    command = "L 1 1 A\n"

    allow(Kernel).to receive(:gets).and_return(create_image, command, BitmapEditor::Command::SHOW, BitmapEditor::Command::EXIT)
    expect(Kernel).to receive(:puts).with("A0\n00")
    expect(Kernel).to receive(:puts).with(BitmapEditor::Command::Exit::MESSAGE)

    bitmap_editor.run
  end

  it "Draws a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive)" do
    create_image = "I 3 3\n"
    command = "V 1 1 2 A\n"

    allow(Kernel).to receive(:gets).and_return(create_image, command, BitmapEditor::Command::SHOW, BitmapEditor::Command::EXIT)
    expect(Kernel).to receive(:puts).with("A00\nA00\n000")
    expect(Kernel).to receive(:puts).with(BitmapEditor::Command::Exit::MESSAGE)

    bitmap_editor.run
  end


  it "Draws a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive)" do
    create_image = "I 3 3\n"
    command = "H 2 3 1 A\n"

    allow(Kernel).to receive(:gets).and_return(create_image, command, BitmapEditor::Command::SHOW, BitmapEditor::Command::EXIT)
    expect(Kernel).to receive(:puts).with("0AA\n000\n000")
    expect(Kernel).to receive(:puts).with(BitmapEditor::Command::Exit::MESSAGE)

    bitmap_editor.run
  end

  it "Shows the contents of the current image" do
    create_image = "I 3 3\n"
    command = "S"

    allow(Kernel).to receive(:gets).and_return(create_image, command, BitmapEditor::Command::EXIT)
    expect(Kernel).to receive(:puts).with("000\n000\n000")
    expect(Kernel).to receive(:puts).with(BitmapEditor::Command::Exit::MESSAGE)

    bitmap_editor.run
  end

  it "Displays help text" do
    command = "?\n"

    allow(Kernel).to receive(:gets).and_return(command, BitmapEditor::Command::EXIT)
    expect(Kernel).to receive(:puts).with(BitmapEditor::Command::Help::MESSAGE)
    expect(Kernel).to receive(:puts).with(BitmapEditor::Command::Exit::MESSAGE)

    bitmap_editor.run
  end

  it "Terminates the session" do
    command = "X\n"

    allow(Kernel).to receive(:gets).and_return(command)
    expect(Kernel).to receive(:puts).with(BitmapEditor::Command::Exit::MESSAGE)

    bitmap_editor.run
  end

  it "Doesn't react to unrecognised commands" do
    command = "foo\n"

    allow(Kernel).to receive(:gets).and_return(command, BitmapEditor::Command::EXIT)
    expect(Kernel).to receive(:puts).with(BitmapEditor::Command::Unknown::MESSAGE)
    expect(Kernel).to receive(:puts).with(BitmapEditor::Command::Exit::MESSAGE)

    bitmap_editor.run
  end
end
