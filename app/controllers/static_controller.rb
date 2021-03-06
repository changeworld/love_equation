class StaticController < ApplicationController
  def index
    @age_items = (18..100).map { |n| [n, n] }
    @achievement_times = (1..100).map { |n| [n, n] }
    @prospect_times = (0..100).map { |n| [n, n] }
  end

  def achievement
    equation = Equation.new
    @judgment_result = equation.achievements_judgment(
      params[:age].to_i,
      params[:love_achievements].to_i
    )
    render action: :jadge
  end

  def prospect
    equation = Equation.new
    @judgment_result = equation.prospects_judgment(params[:love_prospects].to_i)
    render action: :jadge
  end
end
