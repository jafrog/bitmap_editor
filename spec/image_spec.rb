require "spec_helper"
require "bitmap_editor/image"

describe BitmapEditor::Image do
  subject(:image) { described_class.new(2,2) }

  it "displays an image" do
    expect(image.display).to eq "00\n00"
  end

  it "colors a pixel with A" do
    image.color_pixel(1, 2, "A")
    expect(image.display).to eq "00\nA0"
  end

  it "clears image" do
    image.color_pixel(1, 2, "A")
    image.clear
    expect(image.display).to eq "00\n00"
  end
end
