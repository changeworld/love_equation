class Equation
  include ActiveModel::Model

  def love_equation_1st(n)
    # Love equation first
    # F(0) = 0.5
    # F(n+1) = F(n) * F(n) + (1+F(n))/2 * (1-F(n))
    #        = F(n) * F(n) + (F(n) * F(n) + 1)/2
    #        = (F(n) * F(n) + 1)/2
    @love_equation_1st ||= []
    @love_equation_1st[n] ||= (n < 1) ? 0.5 : (love_equation_1st(n - 1)**2 + 1) / 2
  end

  def love_sequence_1st(n)
    # return Love sequence first
    love_equation_1st(n)
    @love_equation_1st
  end

  def love_times(age, track_record)
    # 最大期間 結婚上限年齢(35) - 結婚下限年齢(18) = 17
    # 経過期間 = (age - 18)
    # 恋愛できる回数 x
    # x/17 = track_record/(age - 18)
    # x = track_record/(age - 18) * 17
    # 残りの恋愛できる回数 y
    # y = x - track_record - 1
    #   = track_record/(age - 18) * 17 - track_record
    #   = track_record(1/(age - 18) * 17 - 1)
    (track_record.to_f / (age - 18) * 17 - track_record).to_i
  end
end
