class AlumnosController < ApplicationController

  hobo_model_controller

  auto_actions :all, :except => [:index]
  
  auto_actions_for :curso, :create
  
  def create_for_curso
    hobo_create do
      redirect_to @alumno.curso
    end
  end

end
