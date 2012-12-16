class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :u_type, :name
  # attr_accessible :title, :body
  
  def admin?
    return self.u_type == 1
  end
  
  def waiter?
    return self.u_type == 2
  end
  
  def chef?
    return self.u_type == 3
  end
end
