require 'rails_helper'

RSpec.describe Equation, type: :model do
  describe 'love_equation_1st' do
    before(:all) do
      @equation = Equation.new
    end

    it 'f(0) is 0.5' do
      expect(@equation.love_equation_1st(0)).to eq(0.5)
    end

    it 'f(1) is 0.625' do
      expect(@equation.love_equation_1st(1)).to eq(0.625)
    end
  end

  describe 'love_sequence_1st' do
    before(:all) do
      @equation = Equation.new
    end

    it 'f(0) is [0.5]' do
      expect(@equation.love_sequence_1st(0)).to eq([0.5])
    end

    it 'f(1) is [0.5, 0.625]' do
      expect(@equation.love_sequence_1st(1)).to eq([0.5, 0.625])
    end
  end
end
