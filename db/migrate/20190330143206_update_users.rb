class UpdateUsers < ActiveRecord::Migration[5.1]
  def change
    @u = User.find_by( email: 'suren.dura@yahoo.com' )
    @u.update_attribute :admin, true 

  end
end
