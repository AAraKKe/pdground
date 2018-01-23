# frozen_string_literal: true

RSpec.describe PDGRound do
  it 'has a version number' do
    expect(PDGRound::VERSION).not_to be nil
  end

  context 'when given numbers' do
    it 'convert them to strings before rounding' do
      expect(PDGRound.round(meas: 1.321, unc: 0.25)).to eq(%w[1.32 0.25])
    end
  end

  context 'when given strings' do
    it 'works as usual' do
      expect(PDGRound.round(meas: '1.321', unc: '0.25')).to eq(%w[1.32 0.25])
    end
  end

  context 'with decimal uncertainties' do
    it 'ignores the trailing zeros' do
      expect(PDGRound.round(meas: 1.3215, unc: 0.0081)).to eq(%w[1.322 0.008])
    end

    it 'add zeros in the tail if needed' do
      expect(PDGRound.round(meas: 1.327, unc: 0.02)).to eq(%w[1.327 0.020])
    end

    it 'round properly numbers bigger than 0' do
      expect(PDGRound.round(meas: 50.214, unc: 2.1235)).to eq(%w[50.2 2.1])
    end
  end

  context 'with integer uncertainties' do
    it 'add decimal zeros if needed' do
      expect(PDGRound.round(meas: 12345, unc: 2)).to eq(%w[12345.0 2.0])
    end

    it 'round to sigfig' do
      expect(PDGRound.round(meas: 132, unc: 41)).to eq(%w[130 40])
    end
  end
end
