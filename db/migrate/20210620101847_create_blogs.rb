class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|

      t.string :image_id
      t.text :title
      t.text :body
      t.integer :admin_id

      t.timestamps
    end
  end
end
