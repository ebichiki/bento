require 'rails_helper'

RSpec.describe MonthlyOrdersController, type: :controller do
  describe "#index" do
    # 権限を有するUserの場合
    context "as an authorized user" do
      before do
        @user = FactoryBot.create(:user)
      end
      # 302レスポンスが返ってきているか？
      it "returns a 302 response" do
        sign_in @user
        get :index
        expect(response).to have_http_status "302"
      end
      # 注文画面にリダイレクトされているか？
      it "redirects the page to /monthly_orders/yyyymm" do
        sign_in @user
        now = Date.today.strftime('%Y%m')
        get :index
        expect(response).to redirect_to "/monthly_orders/" + now
      end
    end

    # 権限を有しないゲストユーザーの場合
    context "as a guest user" do
      before do
        @user = FactoryBot.create(:user)
      end
      # 302レスポンスが返ってきているか？
      it "returns a 302 response" do
        get :index
        expect(response).to have_http_status "302"
      end
      # ログイン画面にリダイレクトされているか？
      it "redirects the page to /users/sign_in" do
        get :index
        expect(response).to redirect_to "/users/sign_in"
      end
    end
  end
end
