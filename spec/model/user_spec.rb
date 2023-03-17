require 'rails_helper'

RSpec.describe User do
  let(:name) { "simple name" }
  it "strips trailing whitespace in the name" do
    user = create(:user, email: "John@soe.fr   ")
    expect(user.email).to eq("John@soe.fr")
  end

  describe "validations" do
    it "is valid with valid attributes" do
      user = described_class.new(email: "john.doe@example.com", password: "12345678", password_confirmation: "12345678")
      expect(user).to be_valid
    end

    describe "email" do
      it "validates uniqueness of email" do
        create(:user, email: "john.doe@example.com")
        user = build(:user, email: "john.doe@example.com")
        user.validate
        expect(user.errors[:email]).to include("has already been taken")
      end

      it "is not valid without a email" do
        user = build(:user, email: nil)
        user.validate
        expect(user.errors[:email]).to include("can't be blank")
      end

      it "is not valid without a invalid format email" do
        user = build(:user, email: "invalideformatemail")
        user.validate
        expect(user).to_not be_valid
      end
    end

    describe "password" do
      it "does not validate presence of password" do
        user = build(:user, password: "")
        expect(user).to_not be_valid
      end

      it "is not valid if password less than 2 characters" do
        user = build(:user, password: "12")
        user.validate
        expect(user.errors[:password]).to include("is too short (minimum is 3 characters)")
      end
    end
  end
end
