class User < ApplicationRecord
  has_secure_password
  scope :active_users , -> {where(active:true)}
  scope :inactive_users , -> {where(active:false)}
  validates:email,presence:true,uniqueness:true,length:{minimum:5,maximum:80}
  validates:firstname,presence:true,length:{minimum:2,maximum:20}
  validates:lastname,presence:true,length:{minimum:2,maximum:80}
end
