class CreatePostPictures < ActiveRecord::Migration
  def change
    create_table :post_pictures do |t|
      t.string :picture
      t.references :post, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
