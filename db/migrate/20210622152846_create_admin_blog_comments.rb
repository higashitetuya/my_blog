class CreateAdminBlogComments < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_blog_comments do |t|
      t.text :admin_blog_comment
      t.integer :admin_id
      t.integer :blog_id

      t.timestamps
    end
  end
end
