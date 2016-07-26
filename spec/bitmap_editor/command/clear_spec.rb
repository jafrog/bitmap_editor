require "spec_helper"
require "bitmap_editor/command/clear"

class BitmapEditor
  class Command
    describe Clear do
      subject(:clear_command) { described_class.new }

      it "clears the image" do
        image = double("Image", clear: nil)
        clear_command.run(image)

        expect(image).to have_received :clear
      end

      it "displays an error message if there's no image" do
        allow(Kernel).to receive(:puts).with("No current image")

        clear_command.run(nil)
      end
    end
  end
end
