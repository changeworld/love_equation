class Equation
  include ActiveModel::Model

  def equation_1st(i)
    # Love equation first
    # F(0) = 0.5
    # F(n) = F(n-1) * F(n-1) + (1+F(n-1))/2 * (1-F(n-1))
    #      = F(n-1) * F(n-1) + (F(n-1) * F(n-1) + 1)/2
    #      = (F(n-1) * F(n-1) + 1)/2
    @arr_equation_1st ||= []
    @arr_equation_1st[i] ||= (i < 1) ? 0.5 : (equation_1st(i - 1)**2 + 1) / 2
  end

  def get_equation_1st(i)
    equation_1st(i)
    @arr_equation_1st
  end
end
