require 'rails_helper'

RSpec.describe AtBatBattingResult, type: :model do
  describe "打撃成績の登録" do
    before do
      game = FactoryBot.create(:game)
      team = FactoryBot.create(:team)
      order = FactoryBot.create(:order, team_id: team.id, game_id: game.id)
      member = FactoryBot.create(:member, team_id: team.id)
      @at_bat_batting_result = FactoryBot.build(:at_bat_batting_result, game_id: game.id, team_id: team.id, member_id: member.id, order_id: order.id)
      sleep 0.1
    end

    context "打撃成績が登録できること" do
      it "全ての値があれば登録できる" do
        expect(@at_bat_batting_result).to be_valid
      end

      it "ヒットの値があれば登録できる" do
        @at_bat_batting_result.out_id = ""
        @at_bat_batting_result.time_base_id = ""
        @at_bat_batting_result.four_deadball_id = ""
        @at_bat_batting_result.point_id = ""
        @at_bat_batting_result.valid?
        expect(@at_bat_batting_result).to be_valid
      end

      it "アウトの値があれば登録できる" do
        @at_bat_batting_result.hit_id = ""
        @at_bat_batting_result.time_base_id = ""
        @at_bat_batting_result.four_deadball_id = ""
        @at_bat_batting_result.point_id = ""
        @at_bat_batting_result.valid?
        expect(@at_bat_batting_result).to be_valid
      end

      it "四死球の値があれば登録できる" do
        @at_bat_batting_result.hit_id = ""
        @at_bat_batting_result.out_id = ""
        @at_bat_batting_result.time_base_id = ""
        @at_bat_batting_result.point_id = ""
        @at_bat_batting_result.valid?
        expect(@at_bat_batting_result).to be_valid
      end

      it "エラーの値があれば登録できる" do
        @at_bat_batting_result.hit_id = ""
        @at_bat_batting_result.out_id = ""
        @at_bat_batting_result.four_deadball_id = ""
        @at_bat_batting_result.point_id = ""
        @at_bat_batting_result.valid?
        expect(@at_bat_batting_result).to be_valid
      end
    end
    
    context "打撃成績が登録できないこと" do
      it "全ての値が空白だと登録できない" do
        @at_bat_batting_result.hit_id = ""
        @at_bat_batting_result.out_id = ""
        @at_bat_batting_result.time_base_id = ""
        @at_bat_batting_result.four_deadball_id = ""
        @at_bat_batting_result.point_id = ""
        @at_bat_batting_result.valid?
        expect(@at_bat_batting_result.errors.full_messages).to include("Hitを入力してください", "Outを入力してください", "Time baseを入力してください", "Four deadballを入力してください")
      end

      it "全ての値が空白だと登録できない" do
        @at_bat_batting_result.hit_id = ""
        @at_bat_batting_result.out_id = ""
        @at_bat_batting_result.time_base_id = ""
        @at_bat_batting_result.four_deadball_id = ""
        @at_bat_batting_result.point_id = ""
        @at_bat_batting_result.valid?
        expect(@at_bat_batting_result.errors.full_messages).to include("Hitを入力してください", "Outを入力してください", "Time baseを入力してください", "Four deadballを入力してください")
      end

      it "得点以外が空白だと登録できない" do
        @at_bat_batting_result.hit_id = ""
        @at_bat_batting_result.out_id = ""
        @at_bat_batting_result.time_base_id = ""
        @at_bat_batting_result.four_deadball_id = ""
        @at_bat_batting_result.valid?
        expect(@at_bat_batting_result.errors.full_messages).to include("Hitを入力してください", "Outを入力してください", "Time baseを入力してください", "Four deadballを入力してください")
      end
    end
  end
end
