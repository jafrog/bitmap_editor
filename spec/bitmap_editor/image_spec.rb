require "spec_helper"
require "bitmap_editor/image"

describe BitmapEditor::Image do
  subject(:image) { described_class.new(3,3) }

  it "displays an image" do
    expect(image.display).to eq "000\n000\n000"
  end

  it "colors a pixel with A" do
    image.color_pixel(1, 2, "A")
    expect(image.display).to eq "000\nA00\n000"
  end

  it "colors a vertical segment with A" do
    image.color_vertical(1, 1, 2, "A")
    expect(image.display).to eq "A00\nA00\n000"
  end

  it "colors a horizontal segment with A" do
    image.color_horizontal(2, 3, 1, "A")
    expect(image.display).to eq "0AA\n000\n000"
  end

  it "clears image" do
    image.color_pixel(1, 2, "A")
    image.clear
    expect(image.display).to eq "000\n000\n000"
  end

  it "tells if a row is outside of an image" do
    expect(image.row_out_of_range?(4)).to be true
  end

  it "tells if a column is outside of an image" do
    expect(image.column_out_of_range?(0)).to be true
  end
end
