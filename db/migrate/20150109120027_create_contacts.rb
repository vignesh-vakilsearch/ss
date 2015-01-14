class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :address
      t.string :city
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
