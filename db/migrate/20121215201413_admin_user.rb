class AdminUser < ActiveRecord::Migration
  def up
    User.create!(:email => 'admin@echef.com', :password => 'administrator', :u_type => '1')
  end

  def down
    user = User.find_by_email('admin@echef.com')
    user.delete if user
  end
end
