class HoboMigration5 < ActiveRecord::Migration
  def self.up
    add_column :cursos, :gratuito, :boolean, :default => true
    add_column :cursos, :ciudad, :string
  end

  def self.down
    remove_column :cursos, :gratuito
    remove_column :cursos, :ciudad
  end
end
