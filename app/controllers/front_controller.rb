class FrontController < ApplicationController

  hobo_controller

  def index; end

  def summary
    if !current_user.administrator?
      redirect_to user_login_path
    end
  end

  def search
    if params[:query]
      site_search(params[:query])
    end
  end
  
  def ayuda
    @numero_cursos = Curso.count
    @numero_alumnos = Alumno.count
    @media_alumnos_por_curso = (@numero_alumnos / @numero_cursos).round(2)
  end

end
