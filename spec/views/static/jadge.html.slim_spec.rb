require 'rails_helper'

RSpec.describe 'static/_jadge.html.slim', type: :view do
  it 'displays jadge page' do
    judgment_result = 'ぴよぴよ'
    assign(:judgment_result, judgment_result)
    render 'jadge'
    expect(rendered).to render_template('static/_jadge')
    expect(rendered).to include(judgment_result)
  end
end
