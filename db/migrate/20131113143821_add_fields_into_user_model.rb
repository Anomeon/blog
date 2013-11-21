class AddFieldsIntoUserModel < ActiveRecord::Migration
  def change
  	add_column :users, :first_name, :string
  	add_column :users, :second_name, :string
  	add_column :users, :patronymic, :string
  	add_column :users, :gender, :string
  end
end
