class StaticController < ApplicationController
  def home
    @age_items = (18..100).map { |n| [n, n] }
    @track_record_items = (1..100).map { |n| [n, n] }
  end

  def jadge
    age = params[:age].to_i
    track_record = params[:track_record].to_i
    equation = Equation.new
    @judgment_result = equation.get_judgment_result(age, track_record)
  end

  def help
  end
end
