require 'rails_helper'

RSpec.describe Game, type: :model do
  describe "試合の承諾について" do
    before do
      @game = FactoryBot.build(:game)
    end

    context "ゲームの登録できること" do
      it '全ての値があれば登録ができる' do
        expect(@game).to be_valid
      end
    end

    context "ゲームの登録ができない" do
      it '試合日がなければ登録ができない' do
        @game.game_day = ""
        @game.valid?
        expect(@game.errors.full_messages).to include("Game dayを入力してください")
      end
      it '試合時間がなければ登録ができない' do
        @game.game_time = ""
        @game.valid?
        expect(@game.errors.full_messages).to include("Game timeを入力してください")
      end
      it '試合球場がなければ登録ができない' do
        @game.stadium = ""
        @game.valid?
        expect(@game.errors.full_messages).to include("Stadiumを入力してください")
      end
      it '球場住所がなければ登録ができない' do
        @game.address = ""
        @game.valid?
        expect(@game.errors.full_messages).to include("Addressを入力してください")
      end
    end
    
  end
end
