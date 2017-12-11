require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    before :each do
      @user = User.create(
        first_name: 'test_first',
        last_name: 'test_last',
        email: 'test@email.com',
        password: 'password',
        password_confirmation: 'password'
      )
    end

    context 'fields' do

      it 'should check if the password is long enough' do
        expect(@user.password.length).to be >=6
      end

    end

    context 'new users' do

      it 'should create a new user' do
        expect(@user).to be_valid
      end

    end

  end
end


# expect(@product.errors.full_messages).to include("Name must be given please")
# params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
