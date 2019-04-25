require 'rails_helper'

RSpec.describe UsersController, type: :controller do

	context 'GET#index' do 
		it 'returns a success response' do
			get:index
			expect(response).to be_success
		end


	end


	context 'GET#show' do 
		it 'returns a success response' do
			user = User.create!(firstname:"First",lastname:"Last",email:"abc@gmail.com",password:"123456",password_confirmation:"123456")
			get:show, params:{id:user.to_param}
			expect(response).to be_success
		end


	end
end
