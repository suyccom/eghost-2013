class HoboMigration2 < ActiveRecord::Migration
  def self.up
    add_column :alumnos, :telefono, :string
  end

  def self.down
    remove_column :alumnos, :telefono
  end
end
