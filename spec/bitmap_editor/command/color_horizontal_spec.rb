require "spec_helper"
require "bitmap_editor/command/color_horizontal"

class BitmapEditor
  class Command
    describe ColorHorizontal do
      subject(:color_horizontal_command) { described_class.new(1,1,1,"C") }

      it " the image" do
        image = double("Image", color_horizontal: nil, row_out_of_range?: false, column_out_of_range?: false)
        color_horizontal_command.run(image)

        expect(image).to have_received :color_horizontal
      end

      it "displays an error message if there's no image" do
        allow(Kernel).to receive(:puts).with("No current image")

        color_horizontal_command.run(nil)
      end

      it "displays an error message if start_column is out of range" do
        allow(Kernel).to receive(:puts).with("Invalid arguments")
        image = double("Image", row_out_of_range?: true, column_out_of_range?: true)

        color_horizontal_command.run(image)
      end
    end
  end
end
