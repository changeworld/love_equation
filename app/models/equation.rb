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
end
