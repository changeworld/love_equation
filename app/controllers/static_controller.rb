class StaticController < ApplicationController
  def home
    @age_items = (18..100).map { |n| [n, n] }
    @times = (1..100).map { |n| [n, n] }
  end

  def achievement
    equation = Equation.new
    @judgment_result = equation.achievements_judgment_result(params[:age].to_i, params[:love_track_record].to_i)
    render action: :jadge
  end

  def prospect
    equation = Equation.new
    @judgment_result = equation.prospects_judgment_result(params[:love_prospects].to_i)
    render action: :jadge
  end

  def help
  end
end
