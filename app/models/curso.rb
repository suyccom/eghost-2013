class Curso < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    titulo :string, :required, :name => true
    fecha  :date
    descripcion :text
    timestamps
  end
  attr_accessible :titulo, :fecha, :descripcion
  
  has_many :alumnos
  children :alumnos

  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator?
  end

  def update_permitted?
    acting_user.administrator?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

end
