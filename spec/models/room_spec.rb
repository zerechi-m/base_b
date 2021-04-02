require 'rails_helper'

RSpec.describe Room, type: :model do
  describe "Create" do
    before do
      @room = FactoryBot.build(:room)
    end
    
    context "ルームの登録できるとき" do
      it "ルーム名があれば登録ができる" do
        expect(@room).to be_valid
      end
    end
  
    context "ルームの登録ができないとき" do
      it "ルーム名が空白だと登録ができない" do
        @room.name = ""
        @room.valid?
        expect(@room.errors.full_messages).to include("Nameを入力してください")
      end
    end
  end
end
