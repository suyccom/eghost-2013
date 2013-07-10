class Category < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    nombre :string, :name => true
    timestamps
  end
  attr_accessible :nombre
  
  has_many :category_cursos
  has_many :cursos, :through => :category_cursos

  children :cursos
  
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
