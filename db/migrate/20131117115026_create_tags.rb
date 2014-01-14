class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :tag_text
      t.timestamps
    end

    create_table :posts_tags_assignments do |t|
      t.belongs_to :tag
      t.belongs_to :post
      t.timestamps
    end
  end
end
