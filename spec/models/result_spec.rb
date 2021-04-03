require 'rails_helper'

RSpec.describe Result, type: :model do
  describe "試合結果を作成する" do
    before do
      @result = FactoryBot.build(:result)
    end

    context "試合結果を登録できること" do
      it "全ての値があれば登録できる" do
        expect(@result).to be_valid
      end
    end
    
    context "試合結果を保存できないこと" do
      it "後攻が空白だと登録できないこと" do
        @result.fielding_first = ""
        @result.valid?
        expect(@result.errors.full_messages).to include("Fielding firstを入力してください")
      end
      it "先攻が空白だと登録できないこと" do
        @result.batting_first = ""
        @result.valid?
        expect(@result.errors.full_messages).to include("Batting firstを入力してください")
      end
    end
    
  end
  
end
