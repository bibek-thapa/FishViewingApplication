class User < ApplicationRecord
  has_secure_password
  validates:email,presence:true,uniqueness:true,length:{minimum:5,maximum:20}
  validates:firstname,presence:true,length:{minimum:2,maximum:20}
  validates:lastname,presence:true,length:{minimum:2,maximum:80}
end
