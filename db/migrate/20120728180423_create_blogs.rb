class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
    	t.integer :user_id
      t.string :title
      t.date :posting_date
      t.string :location
      t.text :content

      t.timestamps
    end
    add_index :blogs, [:user_id, :created_at]
  end
end
