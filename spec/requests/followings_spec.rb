require 'rails_helper'

RSpec.describe "Followings", type: :request do
  let(:user_1) { create(:user) }
  let(:user_2) { create(:user) }
  
  before { sign_in user_1 }

  describe "POST create" do
    it "creates a new following" do
      expect do
        post user_followings_path(user_1), params: {
          following_user_id: user_2.id
        }
      end.to change { Following.count }.by(1)
      expect(response).to redirect_to user_path(:user_2)
    end
  end

  describe "DELETE destroy" do
    it "deletes and existing following" do
      following = create(:following, user: user_1, following_user: user_2)
      expect do
        delete user_following_path(user_1, following)
      end.to change { Following.count }.by(-1)
      expect(response).to redirect_to user_path(:user_2)
    end
  end
end