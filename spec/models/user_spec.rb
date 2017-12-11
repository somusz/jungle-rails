require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @test_user = User.create(
      first_name: 'test_first',
      last_name: 'test_last',
      email: 'tesT@emAil.com',
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
        expect(@test_user.password.length).to be >=6
      end

      it 'should downcase the email' do
        expect(@test_user.email).to eql('test@email.com')
      end

    end

    context 'new users' do

      it 'should create a new user' do
        expect(@test_user).to be_valid
      end

      it 'should create a second user with different email address' do
        expect(@user_control).to be_valid
      end
    end
  end

  describe '.authenticate_with_credentials' do

    it 'should check validate user email' do
      @user_credentials = {
        email: ' teSt@emAil.com ',
        password: 'password'
      }
      expect(User.authenticate_with_credentials(@user_credentials)).to be_truthy
    end

    it 'should check user password' do
      @user_credentials = {
        email: 'test@email.com',
        password: 'password'
      }
      expect(User.authenticate_with_credentials(@user_credentials)).to eql(@test_user)
    end

  end

end


# expect(@product.errors.full_messages).to include("Name must be given please")
# params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
