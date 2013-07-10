Este repositorio contiene la aplicación del curso de Rails + Hobo de los cursillos de verano eghost 2013



Instalación de Rails+Hobo en Ubuntu 12.04
=========================================

Abre una terminal y ejecuta:

     sudo apt-get install curl
     curl unoycero.com/get_hobo.sh | bash


Ciérrala, abre una nueva y crea tu aplicación:

     hobo new gestion_cursos --setup


Arranca tu aplicación

    cd gestion_cursos
    rails s

Visita http://localhost:3000 y crea tu cuenta de administrador!



El curso
========

Este curso ha sido documentado mediante los commits de Git. Puedes pulsar en "Commits" y ver el histórico del curso y los pasos que se han dado.



Probar la aplicación
====================

Si quieres descargar y probar la aplicación completa, realiza los siguientes pasos:

     sudo apt-get install curl
     curl unoycero.com/get_hobo.sh | bash
     git clone https://github.com/suyccom/eghost-2013.git
     cd eghost-2013
     bundle
     bundle exec rake db:migrate
     rails s

