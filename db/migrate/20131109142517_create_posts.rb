class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :text
      t.references :user, index: true, null: false

      t.timestamps
    end
  end
end
