require 'rails_helper'

RSpec.describe 'static/home.html.slim', type: :view do
  it 'displays home page' do
    age_items = (18..100).map { |n| [n, n] }
    times = (1..100).map { |n| [n, n] }
    assign(:age_items, age_items)
    assign(:times, times)
    render
    expect(rendered).to render_template(:home)
  end
end
