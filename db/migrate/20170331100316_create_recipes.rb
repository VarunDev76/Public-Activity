class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
    	t.integer :user_id 
    	t.string  :recipe_name
    	t.string  :description
      t.timestamps
    end
  end
end
