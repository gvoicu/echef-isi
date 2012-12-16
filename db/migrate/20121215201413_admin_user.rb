class AdminUser < ActiveRecord::Migration
  def up
    User.create!(:name => 'Administrator', :email => '', :username => 'administrator', :password => 'administrator', :u_type => '1')
  end

  def down
    user = User.find_by_username('administrator')
    user.delete if user
  end
end
