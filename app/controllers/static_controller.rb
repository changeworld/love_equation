class StaticController < ApplicationController
  def home
    @age_items = (18..35).map { |n| [n, n] }
    @track_record_items = (1..100).map { |n| [n, n] }
  end

  def help
  end
end
