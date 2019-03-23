class CreateTestPayer < ActiveRecord::Migration[5.1]
  def change
    create_table :test_payers do |t|
      t.integer :No
      t.string :name
      t.string :description
    end
  end
end
