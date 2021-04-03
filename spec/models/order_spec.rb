require 'rails_helper'

RSpec.describe Order, type: :model do
  describe "オーダーの保存処理テスト" do
    before do
      @order = FactoryBot.build(:order)
    end

    context "オーダーの保存ができること" do
      it "全ての値があればオーダーの保存ができること" do
        expect(@order).to be_valid
      end
    end

    context "オーダーの保存ができないこと" do
      it "ポジションが空白だと保存ができない" do
        @order.position_id = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Positionを入力してください")
      end

      it "ポジションが指定の数字以外だと保存ができない" do
        @order.position_id = "11"
        @order.valid?
        expect(@order.errors.full_messages).to include("Positionは10以下の値にしてください")
      end

      it "打順が空白だと保存ができない" do
        @order.batting_order = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Batting orderを入力してください")
      end

      it "打順が文字だと保存ができない" do
        @order.batting_order = "a"
        @order.valid?
        expect(@order.errors.full_messages).to include("Batting orderは数値で入力してください")
      end

      it "打順が10以上だと保存ができない" do
        @order.batting_order = "10"
        @order.valid?
        expect(@order.errors.full_messages).to include("Batting orderは9以下の値にしてください")
      end

      it "打順が1未満だと保存ができない" do
        @order.batting_order = "0"
        @order.valid?
        expect(@order.errors.full_messages).to include("Batting orderは1以上の値にしてください")
      end
    end
    
    
  end
  
end
