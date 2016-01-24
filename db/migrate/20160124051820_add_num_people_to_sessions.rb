class AddNumPeopleToSessions < ActiveRecord::Migration
  def change
    add_column :sessions, :num_people, :integer
  end
end
