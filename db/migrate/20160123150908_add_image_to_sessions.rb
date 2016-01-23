class AddImageToSessions < ActiveRecord::Migration
  def change
    add_column :sessions, :image, :string
  end
end
