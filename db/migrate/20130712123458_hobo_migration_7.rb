class HoboMigration7 < ActiveRecord::Migration
  def self.up
    add_column :users, :language, :string, :default => "es"
  end

  def self.down
    remove_column :users, :language
  end
end
