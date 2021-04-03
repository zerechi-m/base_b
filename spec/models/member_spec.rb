require 'rails_helper'

RSpec.describe Member, type: :model do
  describe "選手の新規登録のテスト" do
    before do
      @member = FactoryBot.build(:member)
    end
  
    context "選手の登録ができるとき" do
      it '全ての値があれば登録ができる' do
        expect(@member).to be_valid
      end
  
      it '選手写真がなくても登録ができる' do
        @member.mem_image = nil
        expect(@member).to be_valid
      end
  
      it '選手名がアルファベット・記号以外であれば登録できる' do
        @member.name = '田中ボウルです'
        expect(@member).to be_valid
      end
  
      it '選手名に全角・半角スペースがあっても削除して登録できる' do
        @member.name = '田中　ボウル す'
        expect(@member).to be_valid
      end
  
      it '野球部歴に空白があっても登録できる' do
        @member.base_hist_id = ""
        expect(@member).to be_valid
      end
    end
  
    context "選手の登録ができないとき" do
  
      it '選手名が空であれば登録ができない' do
        @member.name = ''
        @member.valid?
        expect(@member.errors.full_messages).to include('選手名を入力してください')
      end
  
      it '選手名にアルファベットが入っていれば登録ができない' do
        @member.name = 'aa田中'
        @member.valid?
        expect(@member.errors.full_messages).to include("選手名にアルファベット・記号は使用できません")
      end
  
      it '選手名が2文字未満だと登録ができない' do
        @member.name = 'あ'
        @member.valid?
        expect(@member.errors.full_messages).to include("選手名は2文字以上で入力してください")
      end
  
      it '選手名が9文字以上だと登録ができない' do
        @member.name = '田中あああああああ'
        @member.valid?
        expect(@member.errors.full_messages).to include("選手名は8文字以内で入力してください")
      end
  
      it '選手名に記号があれば登録ができない' do
        @member.name = '＠@%$#'
        @member.valid?
        expect(@member.errors.full_messages).to include("選手名にアルファベット・記号は使用できません")
      end
  
      it '背番号が空白だと登録ができない' do
        @member.uni_no = ""
        @member.valid?
        expect(@member.errors.full_messages).to include("背番号を入力してください")
      end
      it '背番号が101以上だと登録できない' do
        @member.uni_no = 101
        @member.valid?
        expect(@member.errors.full_messages).to include("背番号は100以下の値にしてください")
      end
  
      it '背番号が101以上だと登録できない' do
        @member.uni_no = 0
        @member.valid?
        expect(@member.errors.full_messages).to include("背番号は1以上の値にしてください")
      end
      it '利投/利打は空白では登録できない' do
        @member.dominant_hand_id = ""
        @member.valid?
        expect(@member.errors.full_messages).to include("利投/利打を入力してください")
      end
  
      it 'ポジションは空白では当路できない' do
        @member.position_id = ""
        @member.valid?
        expect(@member.errors.full_messages).to include("ポジションを入力してください")
      end
    end
  end
end
