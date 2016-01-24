class AddMasterToSessions < ActiveRecord::Migration
  def change
    add_column :sessions, :master, :boolean, default: false
    add_column :sessions, :num_people, :integer, default: 0
  end
end
