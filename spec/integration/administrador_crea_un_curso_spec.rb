# encoding: UTF-8

require 'spec_helper'
 
feature 'Gestión de cursos', :driver => :selenium do

  before do
    User.delete_all
    Curso.delete_all
    Category.delete_all
    Alumno.delete_all
    User.create!(:email_address => 'test@test.com', :name => 'Test', :password => 'TestTest', :administrator => true)
  end

  scenario 'El administrador crea un curso con una categoría y un alumno' do
    # El administrador inicia sesión
    visit '/'
    visit '/login'
    fill_in 'login', :with => 'test@test.com'
    fill_in 'password', :with => 'TestTest'
    click_button 'Iniciar Sesión'
    page.should have_content 'Ha iniciado la sesión'
  
    # La lista de cursos tiene que estar vacía
    page.should have_content 'Lista de cursos'
    page.should_not have_css 'tr.curso'
    
    # El administrador crea una categoría
    click_on 'Categorías'
    click_on 'Nuevo registro de Categoría'
    fill_in 'category[nombre]', :with => 'Cocina'
    click_on 'Crear Categoría'
    click_on 'Categorías'
    page.should have_css 'tr.category'
    page.should have_content 'Cocina'
    
    # El administrador crea un curso
    visit '/cursos'
    click_on 'Nuevo curso'
    fill_in 'curso[titulo]', :with => 'Curso de introducción a la cocina mediterránea'
    fill_in 'curso[fecha]', :with => '11/08/2013'
    fill_in 'curso[descripcion]', :with => 'En este curso aprenderemos las recetas básicas de la cocina mediterránea. Grupos pequeños y mucha diversión'
    select 'Vitoria'
    select 'Cocina'
    click_on 'Crear Curso'
    
    # El curso aparece en la lista de cursos
    visit '/cursos'
    page.should have_css 'tr.curso'
    page.should have_content 'Curso de introducción a la cocina mediterránea'
    
    # En la página del curso, añadimos un alumno
    click_on 'Curso de introducción a la cocina mediterránea'
    fill_in 'alumno[nombre]', :with => 'Manuel'
    fill_in 'alumno[email]', :with => 'manuel@test.com'
    fill_in 'alumno[telefono]', :with => '645 70 77 35'
    click_on 'Añadir'
    
    # Después de añadir un alumno, deberíamos volver a la página del curso
    page.should have_content 'Curso de introducción a la cocina mediterránea'
    page.should have_content 'Alumnos'
    within '.collection' do
      page.should have_content 'Manuel'  end
    end
end

