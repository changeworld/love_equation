require 'rails_helper'

RSpec.describe 'static/_index.html.slim', type: :view do
  it 'displays index page' do
    age_items = (18..100).map { |n| [n, n] }
    achievement_times = (1..100).map { |n| [n, n] }
    prospect_times = (0..100).map { |n| [n, n] }
    assign(:age_items, age_items)
    assign(:achievement_times, achievement_times)
    assign(:prospect_times, prospect_times)
    render 'index'
    expect(rendered).to render_template('static/_index')
  end
end
