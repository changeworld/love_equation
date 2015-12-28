class Equation
  include ActiveModel::Model

  def equation_1st(i)
    # Love equation first
    # F(0) = 0.5
    # F(n) = F(n-1) * F(n-1) + (1+F(n-1))/2 * (1-F(n-1))
    f0 = 0.5
    i.times do
      f0 = f0 * f0 + (1 + f0) / 2 * (1 - f0)
    end
    f0
  end
end
