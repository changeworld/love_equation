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

    it '今まで1回の恋愛をした35歳の残りの期待恋愛回数 is 0回' do
      expect(@equation.love_times(35, 1)).to eq(0)
    end

    it '今まで1回の恋愛をした24歳の残りの期待恋愛回数 is 1回' do
      expect(@equation.love_times(24, 1)).to eq(1)
    end

    it '今まで1回の恋愛をした20歳の残りの期待恋愛回数 is 2回' do
      expect(@equation.love_times(20, 1)).to eq(2)
    end
  end

  describe 'love_equation_1st_score' do
    before(:all) do
      @equation = Equation.new
    end

    it '後1回恋愛できる人の期待スコア is 51' do
      expect(@equation.love_equation_1st_score(1)).to eq(51)
    end

    it '後7回恋愛できる人の期待スコア is 83' do
      expect(@equation.love_equation_1st_score(7)).to eq(83)
    end
  end

  describe 'get_judgment_result' do
    before(:all) do
      @equation = Equation.new
    end

    it '残り恋愛回数が0, 期待スコアが0 is 最後の恋' do
      expect(@equation.judgment_result(0, 0)).to eq('これが『最後の恋』です。結婚したいのであれば、何がなんでもその人と結婚しましょう。')
    end

    it '残り恋愛回数が1, 期待スコアが51 is 次が最後の恋' do
      expect(@equation.judgment_result(1, 51)).to eq('たとえ今付き合っている人と別れたとしても、次の恋愛が“最後の恋”になる見込みです。今付き合っている人が51点以上なら結婚を、そうでなければ別れるのが結婚するパートナーの期待値を最大にする選択です。')
    end

    it '残り恋愛回数が2, 期待スコアが63 is 最後の恋' do
      expect(@equation.judgment_result(2, 63)).to eq('たとえ今付き合っている人と別れたとしても、あと2回ぐらい恋愛する余裕（心技体）があります。今付き合っている人が63点以上なら結婚を、そうでなければ別れるのが結婚するパートナーの期待値を最大にする選択です。')
    end
  end

  describe 'achievements_judgment_result' do
    before(:all) do
      @equation = Equation.new
    end

    it '今まで1回の恋愛をした35歳の判定結果 is 最後の恋' do
      expect(@equation.achievements_judgment_result(35, 1)).to eq('これが『最後の恋』です。結婚したいのであれば、何がなんでもその人と結婚しましょう。')
    end

    it '今まで1回の恋愛をした22歳の判定結果 is 次が最後の恋' do
      expect(@equation.achievements_judgment_result(22, 1)).to eq('たとえ今付き合っている人と別れたとしても、次の恋愛が“最後の恋”になる見込みです。今付き合っている人が51点以上なら結婚を、そうでなければ別れるのが結婚するパートナーの期待値を最大にする選択です。')
    end

    it '今まで1回の恋愛をした20歳の判定結果 is 後2回の恋' do
      expect(@equation.achievements_judgment_result(20, 1)).to eq('たとえ今付き合っている人と別れたとしても、あと2回ぐらい恋愛する余裕（心技体）があります。今付き合っている人が63点以上なら結婚を、そうでなければ別れるのが結婚するパートナーの期待値を最大にする選択です。')
    end
  end

  describe 'prospects_judgment_result' do
    before(:all) do
      @equation = Equation.new
    end

    it '残り恋愛回数が0 is 最後の恋' do
      expect(@equation.prospects_judgment_result(0)).to eq('これが『最後の恋』です。結婚したいのであれば、何がなんでもその人と結婚しましょう。')
    end

    it '残り恋愛回数が1 is 期待スコア51点' do
      expect(@equation.prospects_judgment_result(1)).to eq('たとえ今付き合っている人と別れたとしても、次の恋愛が“最後の恋”になる見込みです。今付き合っている人が51点以上なら結婚を、そうでなければ別れるのが結婚するパートナーの期待値を最大にする選択です。')
    end

    it '残り恋愛回数が2 is 期待スコア63点' do
      expect(@equation.prospects_judgment_result(2)).to eq('たとえ今付き合っている人と別れたとしても、あと2回ぐらい恋愛する余裕（心技体）があります。今付き合っている人が63点以上なら結婚を、そうでなければ別れるのが結婚するパートナーの期待値を最大にする選択です。')
    end
  end
end
