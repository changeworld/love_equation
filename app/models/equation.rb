class Equation
  include ActiveModel::Model

  def love_equation_1st(n)
    # Love equation 1st
    # F(0) = 0.5
    # F(n+1) = F(n) * F(n) + (1+F(n))/2 * (1-F(n))
    #        = F(n) * F(n) + (F(n) * F(n) + 1)/2
    #        = (F(n) * F(n) + 1)/2
    @love_equation_1st ||= []
    @love_equation_1st[n] ||= (n < 1) ? 0.5 : (love_equation_1st(n - 1)**2 + 1) / 2
  end

  def love_sequence_1st(n)
    # return Love sequence 1st
    love_equation_1st(n)
    sequences = []
    @love_equation_1st.each_with_index do |love_equation, counter|
      sequences << love_equation if counter <= n
    end
    sequences
  end

  def love_times(age, track_record)
    # 最大期間 結婚上限年齢(35) - 恋愛下限年齢(13) = 22
    # 経過期間 = age - 13
    # 恋愛できる回数 x
    # x/22 = track_record/(age - 13)
    # x = track_record/(age - 13) * 22
    # 残りの恋愛できる回数 y
    # y = x - track_record
    #   = track_record/(age - 13) * 22 - track_record
    #   = track_record(1/(age - 13) * 22 - 1)
    ((track_record * 22) / (age - 13) - track_record).to_i
  end

  def love_equation_1st_score(loves_remaining)
    # Return Love equation 1st score
    count = loves_remaining < 1 ? 1 : loves_remaining
    ((love_equation_1st(count - 1) + 0.01) * 100).to_d.floor.to_i
  end

  def judgment_result(loves_remaining, score)
    # Return Love equation judgment result
    if loves_remaining <= 0
      judgment_result = I18n.t('static.jadge.zero')
    elsif loves_remaining == 1
      judgment_result = I18n.t('static.jadge.one', score: score)
    else
      judgment_result = I18n.t('static.jadge.more', loves_remaining: loves_remaining, score: score)
    end
    judgment_result
  end

  def achievements_judgment_result(age, love_achievements)
    # Return Love equation judgment result
    loves_remaining = love_times(age, love_achievements)
    score = love_equation_1st_score(loves_remaining)
    judgment_result(loves_remaining, score)
  end

  def prospects_judgment_result(love_prospects)
    # Return Love equation judgment result
    score = love_equation_1st_score(love_prospects)
    judgment_result(love_prospects, score)
  end
end
