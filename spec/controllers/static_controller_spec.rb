require 'rails_helper'

RSpec.describe StaticController, type: :controller do
  describe 'GET' do
    describe 'home' do
      it 'returns http success' do
        get :home
        expect(response).to be_success
        expect(response).to render_template(:home)
        expect(assigns(:age_items)).not_to be_nil
        expect(assigns(:achievement_times)).not_to be_nil
        expect(assigns(:prospect_times)).not_to be_nil
      end
    end
  end

  describe 'POST' do
    describe 'achievement' do
      it 'returns http success' do
        post :achievement, age: 34, love_achievements: 16
        expect(response).to be_success
        expect(response).to render_template(:jadge)
        expect(assigns(:judgment_result)).not_to be_nil
      end
    end

    describe 'prospects' do
      it 'returns http success' do
        post :prospect, love_prospects: 16
        expect(response).to be_success
        expect(response).to render_template(:jadge)
        expect(assigns(:judgment_result)).not_to be_nil
      end
    end
  end
end
