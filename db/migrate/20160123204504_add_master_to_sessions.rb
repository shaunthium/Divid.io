class AddMasterToSessions < ActiveRecord::Migration
  def change
    add_column :sessions, :master, :boolean, default: false
  end
end
