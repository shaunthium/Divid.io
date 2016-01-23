class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.integer :counter

      t.timestamps null: false
    end
  end
end
