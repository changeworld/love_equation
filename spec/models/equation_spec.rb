require 'rails_helper'

ZERO = I18n.t('static.jadge.zero')
ONE  = I18n.t('static.jadge.one', score: 51)
MORE = I18n.t('static.jadge.more', loves_remaining: 2, score: 63)

RSpec.describe Equation, type: :model do
  before(:all) do
    @equation = Equation.new
  end

  describe 'love_equation_1st' do
    it 'f(0) is 0.5' do
      expect(@equation.love_equation_1st(0)).to eq(0.5)
    end

    it 'f(1) is 0.625' do
      expect(@equation.love_equation_1st(1)).to eq(0.625)
    end
  end

  describe 'love_sequence_1st' do
    it 'f(0) is [0.5]' do
      expect(@equation.love_sequence_1st(0)).to eq([0.5])
    end

    it 'f(1) is [0.5, 0.625]' do
      expect(@equation.love_sequence_1st(1)).to eq([0.5, 0.625])
    end
  end

  describe 'love_times' do
    it '今まで 1 回の恋愛をした 35 歳の残りの期待恋愛回数 is 0 回' do
      expect(@equation.love_times(35, 1)).to eq(0)
    end

    it '今まで 1 回の恋愛をした 24 歳の残りの期待恋愛回数 is 1 回' do
      expect(@equation.love_times(24, 1)).to eq(1)
    end

    it '今まで 1 回の恋愛をした 20 歳の残りの期待恋愛回数 is 2 回' do
      expect(@equation.love_times(20, 1)).to eq(2)
    end
  end

  describe 'love_equation_1st_score' do
    it '後 1 回恋愛できる人の期待スコア is 51' do
      expect(@equation.love_equation_1st_score(1)).to eq(51)
    end

    it '後 7 回恋愛できる人の期待スコア is 83' do
      expect(@equation.love_equation_1st_score(7)).to eq(83)
    end
  end

  describe 'get_judgment_result' do
    it '残り恋愛回数が 0, 期待スコアが 0 is 最後の恋' do
      expect(@equation.judgment_result(0, 0)).to eq(ZERO)
    end

    it '残り恋愛回数が 1, 期待スコアが 51 is 次が最後の恋' do
      expect(@equation.judgment_result(1, 51)).to eq(ONE)
    end

    it '残り恋愛回数が 2, 期待スコアが 63 is 後 2 回以上の恋' do
      expect(@equation.judgment_result(2, 63)).to eq(MORE)
    end
  end

  describe 'achievements_judgment' do
    it '今まで 1 回の恋愛をした 35 歳の判定結果 is 最後の恋' do
      expect(@equation.achievements_judgment(35, 1)).to eq(ZERO)
    end

    it '今まで 1 回の恋愛をした 22 歳の判定結果 is 次が最後の恋' do
      expect(@equation.achievements_judgment(22, 1)).to eq(ONE)
    end

    it '今まで 1 回の恋愛をした 20 歳の判定結果 is 後 2 回以上の恋' do
      expect(@equation.achievements_judgment(20, 1)).to eq(MORE)
    end
  end

  describe 'prospects_judgment' do
    it '残り恋愛回数が 0 is 最後の恋' do
      expect(@equation.prospects_judgment(0)).to eq(ZERO)
    end

    it '残り恋愛回数が 1 is 次が最後の恋' do
      expect(@equation.prospects_judgment(1)).to eq(ONE)
    end

    it '残り恋愛回数が 2 is 後 2 回以上の恋' do
      expect(@equation.prospects_judgment(2)).to eq(MORE)
    end
  end
end
