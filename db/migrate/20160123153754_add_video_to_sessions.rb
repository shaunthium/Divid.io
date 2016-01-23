class AddVideoToSessions < ActiveRecord::Migration
  def change
    add_column :sessions, :video, :string
  end
end
