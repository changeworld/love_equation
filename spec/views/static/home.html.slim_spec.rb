require 'rails_helper'

RSpec.describe 'static/home.html.slim', type: :view do
  it 'displays home page' do
    age_items = (18..100).map { |n| [n, n] }
    achievement_times = (1..100).map { |n| [n, n] }
    prospect_times = (0..100).map { |n| [n, n] }
    assign(:age_items, age_items)
    assign(:achievement_times, achievement_times)
    assign(:prospect_times, prospect_times)
    render
    expect(rendered).to render_template(:home)
  end
end
