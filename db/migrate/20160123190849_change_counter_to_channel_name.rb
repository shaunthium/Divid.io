class ChangeCounterToChannelName < ActiveRecord::Migration
  def change
  	rename_column :sessions, :counter, :channel_name
  	change_column :sessions, :channel_name, :string
  end
end
