class CreateFriendships < ActiveRecord::Migration[5.0]
  def change
    create_table :friendships do |t|
    	t.integer :user_id 
    	t.integer :recipe_id
    	t.string  :frnd_name
      t.timestamps
    end
  end
end
