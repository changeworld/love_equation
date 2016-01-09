require 'rails_helper'

RSpec.describe 'static/jadge.html.slim', type: :view do
  it 'displays jadge page' do
    judgment_result = 'ぴよぴよ'
    assign(:judgment_result, judgment_result)
    render
    expect(rendered).to render_template(:jadge)
    expect(rendered).to include(judgment_result)
  end
end
