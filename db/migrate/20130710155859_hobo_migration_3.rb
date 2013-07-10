class HoboMigration3 < ActiveRecord::Migration
  def self.up
    add_column :alumnos, :curso_id, :integer

    add_index :alumnos, [:curso_id]
  end

  def self.down
    remove_column :alumnos, :curso_id

    remove_index :alumnos, :name => :index_alumnos_on_curso_id rescue ActiveRecord::StatementInvalid
  end
end
