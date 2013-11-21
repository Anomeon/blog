class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :tag_text
      t.timestamps
    end

    create_table :posts_tags, id: false do |t|
      t.belongs_to :post
      t.belongs_to :tag
    end
  end
end