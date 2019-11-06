=====================================================
GET STARTED WITH DJANGO PART 1: BUILD A PORTFOLIO APP
=====================================================

Overview
========

Tutorial
--------

This project is based upon the Django tutorial in the following location:

   https://realpython.com/get-started-with-django-1/

The tutorial is pretty limited, but a good introduction into building Django Apps, the
admin site and using the shell to analyse the model characteristics.

I have already been through this tutorial and created some code to model the Django site
and it is saved in the following github repository:

    https://github.com/MarkyMark1000/PYTHON---RP-PORTFOLIO---TUTORIAL

This project is basically a replica of the previous project and is stored within the following github repository:

    THIS PROJECT:
    https://github.com/MarkyMark1000/PYTHON---RP-PORTFOLIO---TUTORIAL-POSTGRES

However the following changes have been made:

    - The SQLite database has been deleted and the Django project has been adjusted to use postgresql.
    - I created the database called portfolio_tutorial_db on the postgresql server.
    - I created a new admin account for the database and gave it lots of privileges using:
        - CREATE USER portfolioadmin WITH PASSWORD 'portfoliopass';
        - GRANT ALL PRIVILEGES ON DATABASE portfolio_tutorial_db TO portfolioadmin;
    - I adjusted the settings file so that it uses DATABASE characteristics that are appropriate for postgre.
    - I also installed the psycopg2-binary driver within the venv .   NOTE THIS ISN'T A RECOMMENDED SOLUTION.   THERE SEEM TO BE PROBLEMS WITH psycopg2 which I haven't got time to go into.   The binary option is an easy solution for beginners to play around with postgresql.
    - To get the migrations working, I found that I had to do the following:
        - Rebuild the requirements file so that it includes psycopg2-binary.
        - Remove all of the __pycache__ files.
        - Remove all of the migration files.
        - Remove and rebuild the virtual environment using the new requirements file.

Warning:
--------

    - Postgre and psycopg2 are a bit of a nightmare.   On my mac, I got it to work using psycopg2-binary.
    - When transfering to windows this didn't work.   I tried psycopg2 and this didn't work either.
    - To get windows working, I did the following:
        - pip install --upgrade setuptools
        - download and install postgresql
        - add C:\Program Files\PostgreSQL\10\bin to PATH using advanced system settings
        - then completely build the environment from scratch using psycopg2 (not -binary)
        - then recreate the database and permissions and then build the migrations etc from scratch.
        - it is almost as if I cannot transfer from mac to windows.   I MAY be able to get it to work
          if I can get psycopg2 to work on the mac.
    - For the mac, I did the following:
        - add /Library/PostgreSQL/11/bin to PATH in the .bash_profile file.
        - This still didn't work, so I ended up using psycopg2-binary.
    - Postgre looks like a bit of a nightmare and you may need to hack around with it depending upon
      what operating system you are on.
    - I have found myself resetting the project often.   Remove all of the pycache directories, remove
      the migration files.   remove the venv directory and rebuild from the requirements file (or django etc)
      remove the database and re-add it.   remove the database permissions and re-add.   Finally run the
      migrations.

Warning:
--------

In a similar manner to Flask, there is a default value for SECRET_KEY should be changed to some 
random bytes in production.

    python -c 'import os; print(os.urandom(16))'

    b'_5#y2L"F4Q8z\n\xec]/'


Installation Guide
==================

Manual Installation
-------------------

- If it exists, remove the venv virtual environment directory using the following:
    - ``rm -rf venv      (mac)``
    - ``rmdir venv /s    (windows)``
- Recreate the virtual environment directory using the following:
    - Mac:
        - ``virtualenv --no-site-packages -p python3 venv``
        - ``deactivate or source deactivate``
        - ``source venv/bin/activate``
        - ``pip install -r requirements.txt``
    - Windows:
        - ``virtualenv --no-site-packages -p python venv``
        - ``deactivate or source deactivate``
        - ``.\venv\Scripts\activate``
        - ``pip install -r requirements.txt``
- Make model migrations:
    - Mac:
        - ``deactivate or source deactivate``
        - ``source venv/bin/activate``
        - ``python manage.py makemigrations personal_portfolio``
        - ``python manage.py makemigrations projects``
        - ``python manage.py makemigrations blog``
        - ``python manage.py check``
        - ``python manage.py migrate``
    - Windows:
        - ``deactivate or source deactivate``
        - ``.\venv\Scripts\activate``
        - ``python manage.py makemigrations personal_portfolio``
        - ``python manage.py makemigrations projects``
        - ``python manage.py makemigrations blog``
        - ``python manage.py check``
        - ``python manage.py migrate``
- You can setup a superuser account for the admin part of the Django sit using the following:
    - Mac:
        - ``deactivate or source deactivate``
        - ``source venv/bin/activate``
        - ``python manage.py createsuperuser``
    - Windows:
        - ``deactivate or source deactivate``
        - ``.\venv\Scripts\activate``
        - ``python manage.py createsuperuser``
- Within the tutorial, the projects and blog were setup using the command line tool.   This isn't 
  necessary for the website to work, but makes it more appealing.   Please see the following link:

    `<https://realpython.com/get-started-with-django-1/>`_
    

MakeFile Installation (Mac, Linux or Unix)
------------------------------------------   
This project was written and tested on a mac and it has not been tested on Linux.

- To get help:
    - Run 'make' to get help on this project.
- It is sensible to reset the virtual environment so that it reflects the current requirements.txt file:
    - Run 'make venv' to build the virtual environment from requirements.txt.
- The first time that this project is installed, or when model changes are made:
    - Run 'make venv-migrations' to migrate models.
- To create a superuser for the admin site:
    - Run 'make venv-admin'
- Within the tutorial, the projects and blog were setup using the command line tool.   This isn't 
  necessary for the website to work, but makes it more appealing.   Please see the following link:

    `<https://realpython.com/get-started-with-django-1/>`_
    
Running the Application
=======================

Manual
------

- To run the app using the normal environment:
    - Mac:
        - ``deactivate or source deactivate``
        - ``source venv/bin/activate``
        - ``python manage.py runserver``
    - Windows:
        - ``deactivate or source deactivate``
        - ``.\venv\Scripts\activate``
        - ``python manage.py runserver``
    - Please note that the standard localhost is not a valid website that produces html.   You will need to use:
        - ``http://localhost/projects/``
        - ``http://localhost/admin/``
        - ``http://localhost/admin/``

MakeFile
--------

- To run the Django site:
    - Run 'make venv-run'

Testing the Application
=======================

DANGER: There are currently no tests associated with this project.   This is how the tutorial was structured.

Test Coding Standards
=====================

Manual
------

- Test the code within the personal_portfolio directory:
    - Mac:
        - ``deactivate or source deactivate``
        - ``source venv/bin/activate``
        - ``pycodestyle --statistics ./personal_portfolio/*.py``
    - Windows:
        - ``deactivate or source deactivate``
        - ``.\venv\Scripts\activate``
        - ``pycodestyle --statistics filename.py``
- Test the code within the projects directory:
    - Mac:
        - ``deactivate or source deactivate``
        - ``source venv/bin/activate``
        - ``pycodestyle --statistics ./projects/*.py``
    - Windows:
        - ``deactivate or source deactivate``
        - ``.\venv\Scripts\activate``
        - ``pycodestyle --statistics filename.py``
- Test the code within the blog directory:
    - Mac:
        - ``deactivate or source deactivate``
        - ``source venv/bin/activate``
        - ``pycodestyle --statistics ./blog/*.py``
    - Windows:
        - ``deactivate or source deactivate``
        - ``.\venv\Scripts\activate``
        - ``pycodestyle --statistics filename.py``

MakeFile
--------

- Test the code within the personal_portfolio directory:
    - Run 'make pystat-pp'

- Test the code within the projects directory:
    - Run 'make pystat-projects'

- Test the code within the blog directory:
    - Run 'make pystat-blog'

Cleanup
=======

Manual
------

- The django project can become cluttered with a number of directories and files.   The following can be used to clean them up:
    - Mac:
        - ``rm -rf ./personal_portfolio/__pycache__*``
        - ``rm -rf ./projects/__pycache__*``
        - ``rm -rf ./projects/migrations/__pycache__*``
        - ``rm -rf ./blog/__pycache__*``
        - ``rm -rf ./blog/migrations/__pycache__*``
    - Windows:
        - ``rmdir /S personal_portfolio\__pycache__``
        - ``rmdir /S projects\__pycache__``
        - ``rmdir /S projects\migrations\__pycache__``
        - ``rmdir /S blog\__pycache__``
        - ``rmdir /S blog\migrations\__pycache__``

- If you wish to remove the venv virtual environment directory:
    - ``rm -rf venv``
    - ``rmdir /S venv``

MakeFile
--------

- To clean files such as pytest_cache, dist etc:
    - Run 'make venv-clean'

- If you wish to remove the venv virtual environment directory:
    - Run 'make clean-venv'

Distribution
============