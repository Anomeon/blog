class AddUrlInUser < ActiveRecord::Migration
  def change
    add_column :users, :url, :string
    add_column :users, :provider, :string
  end
end
