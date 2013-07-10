class Curso < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    titulo :string, :required, :name => true
    fecha  :date
    descripcion :text
    gratuito :boolean, :default => true
    ciudad enum_string(:bilbao, :vitoria)
    timestamps
  end
  attr_accessible :titulo, :fecha, :descripcion, :gratuito, :ciudad, :categories
  
  has_many :alumnos
  children :alumnos, :categories
  
  has_many :category_cursos
  has_many :categories, :through => :category_cursos, :accessible => true

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
