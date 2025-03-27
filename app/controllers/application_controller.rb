class ApplicationController < ActionController::Base
  before_action :check_browser

  private

  def check_browser
    # ブラウザ情報を取得
    browser = Browser.new(request.user_agent)
    if browser.device.mobile?
      # モバイルブラウザの場合
      # 例えばモバイル用の設定を行うなど
    end
  end
end
