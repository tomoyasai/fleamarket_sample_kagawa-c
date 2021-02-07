require 'rails_helper'


describe User do
  describe '#create' do
    # 1. nickname、email、passwordとpassword_confirmation、birthday、family、first、family_kana、first_kanaが存在すれば登録できること
    it "is valid with a nickname, email, password, password_confirmation,birthday、family、first、family_kana、first_kana" do
      user = build(:user)
      expect(user).to be_valid
    end

    # 2. nick_nameが空では登録できないこと
    it "is invalid without a nickname" do
      user = build(:user, nick_name: nil)
      user.valid?
      expect(user.errors[:nick_name]).to include("can't be blank")
    end

    # 3. emailに@とドメインが含まれていないと登録できないこと
    it 'is invalid without @ and . an email' do
      user = build(:user, email: '@'+'.')
      user.valid?
      expect(user.errors[:email]).to include("is invalid")
    end

    # 4. emailが空では登録できないこと
    it "is invalid without an email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank", "is invalid")
    end

    # 5. passwordが空では登録できないこと
    it "is invalid without a password" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    # 6. passwordが存在してもpassword_confirmationが空では登録できないこと
    it "is invalid without a password_confirmation" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    # 7. 誕生日が空では登録できないこと
    it "is invalid without a birthday" do
      user = build(:user, birthday: nil)
      user.valid?
      expect(user.errors[:birthday]).to include("can't be blank")
    end

    # 8. 苗字が空では登録できないこと
    it "is invalid without a family" do
      user = build(:user, family: nil)
      user.valid?
      expect(user.errors[:family]).to include("can't be blank", "is invalid")
    end

    # 9. 名前が空では登録できないこと
    it "is invalid without a first" do
      user = build(:user, first: nil)
      user.valid?
      expect(user.errors[:first]).to include("can't be blank", "is invalid")
    end

    # 10. 苗字カタカナが空では登録できないこと
    it "is invalid without a family_kana" do
      user = build(:user, family_kana: nil)
      user.valid?
      expect(user.errors[:family_kana]).to include("can't be blank", "is invalid")
    end

    # 11. 名前カタカナが空では登録できないこと
    it "is invalid without a first_kana" do
      user = build(:user, first_kana: nil)
      user.valid?
      expect(user.errors[:first_kana]).to include("can't be blank", "is invalid")
    end

    # 12. 重複したemailが存在する場合登録できないこと
    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    # 13. passwordが６文字以下であれば登録できないこと
    it "is invalid with a password that has less than 6 characters " do
      user = build(:user, password: 000000, password_confirmation: 000000)
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end

    # 14. 郵便番号、都道府県、市区町村、番地が存在すれば登録できること
    it "is valid with a post_code, prefecture_id, city, block_number, user_id" do
      user = build(:user)
      address = build(:address)
      expect(address).to be_valid
    end

    # 15. 郵便番号が空では登録できないこと
    it "is invalid without a post_code" do
      address = build(:address, post_code: "")
      address.valid?
      expect(address.errors[:post_code]).to include("can't be blank", "is invalid")
    end

    # 16. 都道府県が空では登録できないこと
    it "is invalid without a prefecture_id" do
      address = build(:address, prefecture_id: "")
      address.valid?
      expect(address.errors[:prefecture_id]).to include("can't be blank")
    end

    # 17. 市区町村が空では登録できないこと
    it "is invalid without a city" do
      address = build(:address, city: "")
      address.valid?
      expect(address.errors[:city]).to include("can't be blank")
    end

    # 18. 番地が空では登録できないこと
    it "is invalid without a block_number" do
      address = build(:address, block_number: "")
      address.valid?
      expect(address.errors[:block_number]).to include("can't be blank")
    end
  end
end