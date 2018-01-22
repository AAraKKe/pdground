# frozen_string_literal: true

RSpec.describe Float do
  describe '#hisigfig' do
    it "should be a string" do
      expect(1.2.hisigfig(2)).to be_a String
    end

    context 'in floats smaller than one' do
      it 'should give the numbers which are non 0 in the decimal part ' do
        expect(0.00123.hisigfig(3)).to eq '123'
      end
    end

    context 'in floats bigger than one' do
      context 'with non 0 decimal places' do
        it 'should take the significant digits wherever they are' do
          expect(12.34.hisigfig(2)).to eq '12'
        end
      end

      context 'with 0s in between' do
        it 'should take the 0s as significant digits' do
          expect(103.01.hisigfig(2)).to eq '10'
        end
      end
    end

    context 'in integers' do
      it  "should give highest sugnificant digits" do
        expect(13525.hisigfig(3)).to eq '135'
      end
    end
  end

  describe "#sigfig" do

    context  'in floats smaller than 1' do
    it "should round the decimal part" do
      expect(0.03215.sigfig(2)).to eq '0.032'
    end

    it 'should round properly' do
      expect(0.03285.sigfig(2)).to eq '0.033'
    end

    end

    context 'in floats bigger than 1' do
      it 'should take into acocunt decimal part' do
        expect(1.321.sigfig(3)).to eq '1.32'
      end

      it 'should round properly' do
        expect(1.329.sigfig(3)).to eq '1.33'
      end
    end

    context 'in integers' do
      it 'should round properly' do
        expect(13248.sigfig(4)).to eq '13250'
        expect(13242.sigfig(4)).to eq '13240'
      end
    end
  end
end
