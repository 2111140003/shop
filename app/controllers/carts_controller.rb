# app/controllers/carts_controller.rb
class CartsController < ApplicationController
  def show
    @cart = current_cart
  end

  def checkout
    # ここでチェックアウトの処理を実装する（例: 注文を生成、支払い処理など）
    # チェックアウトが成功した場合、カートをクリアするなどの処理を追加する

    # 例: チェックアウト成功時の処理
    current_cart.clear_cart
    redirect_to root_path, notice: 'Thank you for your purchase!'
  end
end
