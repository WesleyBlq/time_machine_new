class CreateTableUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.timestamps null: false
    end

    add_attachment :users, :avatar
  end
end
