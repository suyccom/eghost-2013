class HoboMigration4 < ActiveRecord::Migration
  def self.up
    add_column :cursos, :descripcion, :text
  end

  def self.down
    remove_column :cursos, :descripcion
  end
end
