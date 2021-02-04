require 'rails_helper'

describe User do
  describe '#create' do
    # 1. nicknameとemail、passwordとpassword_confirmation、birthday、family、first、family_kana、first_kanaが存在すれば登録できること
    it "is valid with a nickname, email, password, password_confirmation" do
      user = build(:user)
      expect(user).to be_valid
    end

    # 2. nick_nameが空では登録できないこと
    it "is invalid without a nickname" do
      user = build(:user, nick_name: nil)
      user.valid?
      expect(user.errors[:nick_name]).to include("can't be blank")
    end

    # 3. emailが空では登録できないこと
    it "is invalid without an email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    # 4. passwordが空では登録できないこと
    it "is invalid without a password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    # 5. passwordが存在してもpassword_confirmationが空では登録できないこと
    it "is invalid without a password_confirmation" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    # 6. 誕生日が空では登録できないこと
    it "is invalid without a birthday" do
      user = build(:user, birthday: nil)
      user.valid?
      expect(user.errors[:birthday]).to include("can't be blank")
    end

    # 7. 苗字が空では登録できないこと
    it "is invalid without a family" do
      user = build(:user, family: nil)
      user.valid?
      expect(user.errors[:family]).to include("can't be blank")
    end

    # 8. 名前が空では登録できないこと
    it "is invalid without a first" do
      user = build(:user, first: nil)
      user.valid?
      expect(user.errors[:first]).to include("can't be blank")
    end

    # 9. 苗字カタカナが空では登録できないこと
    it "is invalid without a family_kana" do
      user = build(:user, family_kana: nil)
      user.valid?
      expect(user.errors[:family_kana]).to include("can't be blank")
    end

    # 10. 名前カタカナが空では登録できないこと
    it "is invalid without a first_kana" do
      user = build(:user, first_kana: nil)
      user.valid?
      expect(user.errors[:first_kana]).to include("can't be blank")
    end

    # 11. 重複したemailが存在する場合登録できないこと
    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

     # 12. 重複したnick_nameが存在する場合登録できないこと
     it "is invalid with a duplicate nick_name address" do
      user = create(:user)
      another_user = build(:user, nick_name: user.nick_name)
      another_user.valid?
      expect(another_user.errors[:nick_name]).to include("has already been taken")
    end

    # 13. passwordが７文字以上であれば登録できること
    it "is valid with a password that has more than 7 characters " do
      user = build(:user, password: "0000000", password_confirmation: "0000000")
      expect(user).to be_valid
    end

    # 14. passwordが６文字以下であれば登録できないこと
    it "is invalid with a password that has less than 6 characters " do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end
  end
end