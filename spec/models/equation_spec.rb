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

  describe 'love_times' do
    before(:all) do
      @equation = Equation.new
    end

    it '今まで16回の恋愛をした34歳の残りの期待恋愛回数 is 1回' do
      expect(@equation.love_times(34, 16)).to eq(1)
    end

    it '今まで1回の恋愛をした20歳の残りの期待恋愛回数 is 7回' do
      expect(@equation.love_times(20, 1)).to eq(7)
    end
  end

  describe 'get_love_equation_1st_score' do
    before(:all) do
      @equation = Equation.new
    end

    it '今まで16回の恋愛をした34歳の期待スコア is 51' do
      expect(@equation.get_love_equation_1st_score(34, 16)).to eq(51)
    end

    it '今まで1回の恋愛をした20歳の期待スコア is 83' do
      expect(@equation.get_love_equation_1st_score(20, 1)).to eq(83)
    end
  end
end
