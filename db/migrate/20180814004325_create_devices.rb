class CreateDevices < ActiveRecord::Migration[5.1]
  def change
    create_table :devices do |t|
      t.string :no, :state, :owner
      t.timestamps null:false
    end
    
    
  end
end
