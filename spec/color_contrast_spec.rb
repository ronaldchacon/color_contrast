require 'spec_helper'

describe ColorContrast do
  it 'has a version number' do
    expect(ColorContrast::VERSION).not_to be nil
  end

  describe "RGB value" do
    context "when value is valid" do
      it { expect(ColorContrast.get_contrast("255,255,255")).to eq "dark" }
      it { expect(ColorContrast.get_contrast("0, 0, 0")).to eq "light" }
    end

    context "when value is invalid" do
      it { expect { ColorContrast.get_contrast("-255,2555,256") }.to raise_error(ColorContrast::InvalidColorError) }
    end
  end

  describe "HEX value" do
    context "when value is valid" do
      it { expect(ColorContrast.get_contrast("ffffff")).to eq "dark" }
      it { expect(ColorContrast.get_contrast("fff")).to eq "dark" }
      it { expect(ColorContrast.get_contrast("000000")).to eq "light" }
      it { expect(ColorContrast.get_contrast("000")).to eq "light" }
    end

    context "when value is invalid" do
      it { expect { ColorContrast.get_contrast("f") }.to raise_error(ColorContrast::InvalidColorError) }

      it { expect { ColorContrast.get_contrast("ffaa") }.to raise_error(ColorContrast::InvalidColorError) }

      it { expect { ColorContrast.get_contrast("0000000") }.to raise_error(ColorContrast::InvalidColorError) }
    end
  end
end
