require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.create(
      first_name: 'test_first',
      last_name: 'test_last',
      email: 'test@email.com',
      password: 'password',
      password_confirmation: 'password'
    )
    @user_control = User.create(
      first_name: 'test_first',
      last_name: 'test_last',
      email: 'test2@email.com',
      password: 'password',
      password_confirmation: 'password'
    )
  end

  describe 'Validations' do

    context 'fields' do

      it 'should check if the password is long enough' do
        expect(@user.password.length).to be >=6
      end

    end

    context 'new users' do

      it 'should create a new user' do
        expect(@user).to be_valid
      end

      it 'should create a second user with different email address' do
        expect(@user_control).to be_valid
      end
    end
  end

  describe '.authenticate_with_credentials' do

    it 'should check validate user email' do
      @user_credentials = {
        email: 'test@email.com',
        password: 'password'
      }
      expect(User.authenticate_with_credentials(@user_credentials)).to be_truthy
    end

    it 'should check user password' do
      @user_credentials = {
        email: 'test@email.com',
        password: 'password'
      }
      expect(User.authenticate_with_credentials(@user_credentials)).to eql(@user)
    end

  end

end


# expect(@product.errors.full_messages).to include("Name must be given please")
# params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
