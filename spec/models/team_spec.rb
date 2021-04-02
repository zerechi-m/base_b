require 'rails_helper'

RSpec.describe Team, type: :model do
  describe "チームの新規登録時のテスト" do
    before do
      @team = FactoryBot.build(:team)
    end
    
    context 'チームの新規登録ができる' do
      it '全ての値が正しければ登録できる' do 
        expect(@team).to be_valid
      end

      it 'チーム名に英語が入っていても登録できる' do 
        @team.name = "Fukuokaソフト野球"
        expect(@team).to be_valid
      end

      it 'チーム名に数字が入っていても登録できる' do 
        @team.name = "22ソフト野球"
        expect(@team).to be_valid
      end

      it 'チーム名に半角・全角のスペースが入っていても削除して登録できる' do 
        @team.name = "22　ソフト 野球"
        expect(@team).to be_valid
      end

      it '代表者名にカタカナが入っていても登録ができる' do
        @team.rep_name = "タナカ"
        expect(@team).to be_valid
      end
    end
    
    context 'チームの新規登録ができない' do
      it 'チーム名が空では登録できない' do
        @team.name = ""
        @team.valid?
        expect(@team.errors.full_messages).to include("チーム名を入力してください")
      end

      it 'チーム名に重複があると登録できない' do
        another_team = FactoryBot.create(:team)
        @team.valid?
        expect(@team.errors.full_messages).to include("チーム名はすでに存在します")
      end

      it 'チーム名に大文字と小文字の違いでも重複があると登録できない' do
        another_team = FactoryBot.create(:team, name: "AA野球チーム")
        @team.name = "aa野球チーム"
        @team.valid?
        expect(@team.errors.full_messages).to include("チーム名はすでに存在します")
      end

      it 'チーム名が4文字未満だと登録できない' do
        @team.name = "adt"
        @team.valid?
        expect(@team.errors.full_messages).to include("チーム名は4文字以上で入力してください")
      end

      it 'チーム名が16字以上だと登録できない' do
        @team.name = "aaa23aaaaaaaaaaaaaa"
        @team.valid?
        expect(@team.errors.full_messages).to include("チーム名は15文字以内で入力してください")
      end

      it '代表者名が空では登録できない' do
        @team.rep_name = ""
        @team.valid?
        expect(@team.errors.full_messages).to include("代表者名を入力してください")
      end

      it '代表者名にアルファベットが入ると登録できない' do
        @team.rep_name = "aaaa田中"
        @team.valid?
        expect(@team.errors.full_messages).to include("代表者名は不正な値です")
      end

      it '代表者名に数字が入ると登録できない' do
        @team.rep_name = "田中1"
        @team.valid?
        expect(@team.errors.full_messages).to include("代表者名は不正な値です")
      end

      it '代表者名が2文字未満だと登録できない' do
        @team.rep_name = "田"
        @team.valid?
        expect(@team.errors.full_messages).to include("代表者名は2文字以上で入力してください")
      end

      it '代表者名が9文字以上だと登録できない' do
        @team.rep_name = "田中あああああああ"
        @team.valid?
        expect(@team.errors.full_messages).to include("代表者名は8文字以内で入力してください")
      end

      it 'メールアドレスが空だと登録できない' do
       @team.email = ""
       @team.valid?
       expect(@team.errors.full_messages).to include("Eメールを入力してください")
     end
      
      it 'パスワードが空だと登録ができない' do
       @team.password = ""
       @team.valid?
       expect(@team.errors.full_messages).to include("パスワードを入力してください")
      end

      it 'パスワードが5文字以下だと登録ができない' do
       @team.password = "aa123"
       @team.valid?
       expect(@team.errors.full_messages).to include("パスワードは6文字以上10文字以下で設定してください")
      end

      it 'パスワードが11文字以上だと登録ができない' do
       @team.password = "aa123456789aa"
       @team.valid?
       expect(@team.errors.full_messages).to include("パスワードは6文字以上10文字以下で設定してください")
      end

      it 'パスワードがアルファベットだけだと登録ができない' do
       @team.password = "aaaaaa"
       @team.valid?
       expect(@team.errors.full_messages).to include("パスワードは半角英数字の混合で入力してください")
      end

      it 'パスワードが数字だけだと登録ができない' do
       @team.password = "111111"
       @team.valid?
       expect(@team.errors.full_messages).to include("パスワードは半角英数字の混合で入力してください")
      end

      it 'パスワード確認が空だと登録ができない' do
       @team.password_confirmation = ""
       @team.valid?
       expect(@team.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'パスワードとパスワード確認が違うと登録ができない' do
       @team.password_confirmation = "aaaaa2"
       @team.valid?
       expect(@team.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
    end
  
  end
end
