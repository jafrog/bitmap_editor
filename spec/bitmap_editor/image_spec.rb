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

  it "throws an exception if dimensions are invalid" do
    expect { described_class.new(0, 10) }.to raise_error BitmapEditor::Image::InvalidDimensionsError
  end

  it "throws an exception if index is out of range" do
    expect { image.color_pixel(0, 4, "C") }.to raise_error BitmapEditor::CommandArgumentError
    expect { image.color_pixel(1, 1, "Foo") }.to raise_error BitmapEditor::CommandArgumentError
    expect { image.color_vertical(1, 1, 4, "C") }.to raise_error BitmapEditor::CommandArgumentError
    expect { image.color_horizontal(0, 2, 1, "C") }.to raise_error BitmapEditor::CommandArgumentError
  end
end
