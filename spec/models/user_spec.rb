require 'rails_helper'

RSpec.describe User, type: :model do
  	
  	context 'validation tests' do 

  		it 'sees the first name presence' do 
  			user = User.new(lastname:"La1",email:"abcde@gmail.com").save
  			expect(user).to eq(false)
  		end

  		it 'sees the last name presence' do 
  			user = User.new(firstname:"First1",email:"abcde@gmail.com").save
  			expect(user).to eq(false)
  		end

  		it 'sees the  email presence' do 
  			user = User.new(lastname:"Last1",firstname:"First1").save
  			expect(user).to eq(false)

  		end

  		it 'sees saved succesfully or not' do 
  			user = User.new(lastname:"L",email:"abcde@gmail.com",firstname:"First1",password:"123456",password_confirmation:"123456").save
  			expect(user).to eq(true)

  		end

  	end

  	context 'scope tests' do

  		let(:params){{lastname:"La",email:"abcde@gmail.com",firstname:"First1",password:"123456",password_confirmation:"123456"}}

  		before(:each) do

  			User.new(params).save
  			User.new(params).save
  			User.new(params.merge(active:true)).save
  			User.new(params.merge(active:false)).save
  			User.new(params.merge(active:false)).save

  		end


  		it 'returns active users' do
  			expect(User.active_users.size).to eq(3)
  		end

  		it 'returns inactive users'do
  			expect(User.active_users.size).to eq(2)

  		end

  	end



end
