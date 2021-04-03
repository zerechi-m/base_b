require 'rails_helper'

RSpec.describe Message, type: :model do
  describe "メッセージとフォームの送信テスト" do
    before do
      @message = FactoryBot.build(:message)
    end
    
    context "メッセージの送信ができること" do
      it "メッセージがあれば送信ができる" do
        expect(@message).to be_valid
      end
      
      it "メッセージのみがあれば送信できること" do
        @message.game_day = ""
        @message.game_time = ""
        @message.stadium = ""
        @message.address = ""
        expect(@message).to be_valid
      end

      it "フォームのみがあれば送信できること" do
        @message.content = ""
        expect(@message).to be_valid
      end
    end

    context "メッセージの送信ができないとき" do
      it "メッセージ・フォームの両方が空白である" do
        @message.content = ""
        @message.game_day = ""
        @message.game_time = ""
        @message.stadium = ""
        @message.address = ""
        @message.valid?
        expect(@message.errors.full_messages).to include("メッセージを入力してください", "試合予定日を入力してください", "試合開始時間を入力してください", "球場名を入力してください", "球場住所を入力してください")
      end

      it "フォームの試合予定日が空白だと送信できない" do
        @message.content = ""
        @message.game_day = ""
        @message.valid?
        expect(@message.errors.full_messages).to include("試合予定日を入力してください")
      end

      it "フォームの試合時間が空白だと送信できない" do
        @message.content = ""
        @message.game_time = ""
        @message.valid?
        expect(@message.errors.full_messages).to include("試合開始時間を入力してください")
      end

      it "フォームの球場名が空白だと送信できない" do
        @message.content = ""
        @message.stadium = ""
        @message.valid?
        expect(@message.errors.full_messages).to include("球場名を入力してください")
      end

      it "フォームの球場住所が空白だと送信できない" do
        @message.content = ""
        @message.address = ""
        @message.valid?
        expect(@message.errors.full_messages).to include("球場住所を入力してください")
      end
    end
  end
end
