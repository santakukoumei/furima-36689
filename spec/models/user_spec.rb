require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  it "全ての項目が入力されていれば登録できる" do
    @user. = ''
    @user.valid?
    expect(@user.errors.full_messages).to include "入力されていない項目があります"
  end

  describe "ユーザー新規登録" do

    it "nameが空だと登録できない" do
      @user.name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Name can't be blank"
    end
    it "emailが空では登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it "encrypted_passwordが空だと登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it "first_nameが空では登録できない" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name 全角文字を使用してください"
    end
    it "second_nameが空だと登録できない" do
      @user.second_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Second name 全角文字を使用してください"
    end
    it "first_name_kanaが空では登録できない" do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana 全角文字を使用してください"
    end
    it "second_name_kanaが空だと登録できない" do
      @user.second_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Second name kana 全角文字を使用してください"
    end
    it "birth_dateが空では登録できない" do
      @user.birth_date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birth date can't be blank"
    end
    it "重複したメールアドレスは登録できない" do
      @user.email = 'aaa@aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include "メールアドレスが重複しています"
    end
    it "メールアドレスに@を含まない場合は登録できない" do
      @user.email = 'abcabc'
      @user.valid?
      expect(@user.errors.full_messages).to include "メールアドレスに@を含めてください"
    end
    it "パスワードが6文字未満では登録できない" do
      @user.password = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include "パスワードを6文字以上で入力してください"
    end
    it "英字のみのパスワードでは登録できない" do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include "数字を含めて入力してください"
    end
    it "数字のみのパスワードでは登録できない" do
      @user.password = '111111' '11111a'
      @user.valid?
      expect(@user.errors.full_messages).to include "英字を含めて入力してください"
    end
    it "全角文字を含むパスワードでは登録できない" do
      @user.password = '１１１１１１'
      @user.valid?
      expect(@user.errors.full_messages).to include "半角文字のみで入力してください"
    end
    it "パスワードとパスワード（確認用）が不一致だと登録できない" do
      @user.password = '11111a' '11111s'
      @user.valid?
      expect(@user.errors.full_messages).to include "同一のパスワードを入力してください"
    end
    it "姓（全角）に半角文字が含まれていると登録できない" do
      @user.first_name = 'sei'
      @user.valid?
      expect(@user.errors.full_messages).to include "姓を全角文字で入力してください"
    end
    it "名（全角）に半角文字が含まれていると登録できない" do
      @user.second_name = 'mei'
      @user.valid?
      expect(@user.errors.full_messages).to include "名を全角文字で入力してください"
    end
    it "姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない" do
      @user.first_name_kana = 'あ姓$0'
      @user.valid?
      expect(@user.errors.full_messages).to include "姓（カナ）を平仮名・漢字・英数字・記号を含まない全角文字で入力してください"
    end
    it "名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない" do
      @user.second_name_kana = 'あ名$0'
      @user.valid?
      expect(@user.errors.full_messages).to include "名（カナ）を平仮名・漢字・英数字・記号を含まない全角文字で入力してください"
    end
  end
end