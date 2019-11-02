#Add any comments on this here

#Ensure the script is run as bash
SHELL:=/bin/bash

#Set help as the default for this makefile.
.DEFAULT: help

.PHONY: help

help:
	@echo ""
	@echo "PROJECT HELP:"
	@echo "make               	- this prints out the help for this makefile."
	@echo "make help          	- this prints out the help for this makefile."
	@echo "Setup:"
	@echo "make venv	    	- this deletes and recreates the venv virtual environment from requirements.txt"
	@echo "make venv-migrations   	- DANGER - this makes the migration file and creates/pushes it onto the database."
	@echo "make venv-admin   	- DANGER - this can be used to setup an admin password for the admin site."
	@echo "make venv-docs	    	- this deletes and recreates the html file in the docs directory using the index.rst file"
	@echo "Run:"
	@echo "make venv-run      	- runs the script in the venv virtual environment."
	@echo "Testing:"
	@echo "NO TESTS HAVE BEEN DEFINED WITH THIS TUTORIAL"
	@echo "Code Standard:"
	@echo "make py-pp   	- Code standard for personal portfolio directory."
	@echo "make pystat-pp   	- Code standard statistics for personal portfolio directory."
	@echo "make py-blog   	- Code standard for blog directory."
	@echo "make pystat-blog   	- Code standard statistics for blog directory."
	@echo "make py-projects   	- Code standard for projects directory."
	@echo "make pystat-projects   	- Code standard statistics for projects directory."
	@echo "Clean:"
	@echo "make venv-clean    	- Remove __pycache__ etc"
	@echo "make clean-venv    	- Remove venv virtual environment."
	@echo "Distribution:"
	@echo "make venv-build-req    	- Rebuilds the requirements file from the venv virtual environment."

venv:
	@echo ""
	@echo "Remove the venv virtual environment and then re-create it. using the requirements.txt file."
	@echo ""
	rm -rf venv
	@echo ""
	virtualenv --no-site-packages -p python3 venv
	@echo ""
	( source venv/bin/activate; pip install -r requirements.txt; )

venv-migrations:
	@echo ""
	@echo "Make migrations file and then push it onto the database"
	@echo ""
	( source venv/bin/activate; python manage.py makemigrations personal_portfolio;python manage.py makemigrations projects; python manage.py makemigrations blog; python manage.py migrate; )
	@echo ""

venv-admin:
	@echo ""
	@echo "Setup superuser for admin site."
	@echo ""
	( source venv/bin/activate; python manage.py createsuperuser; )
	@echo ""

venv-docs:
	@echo ""
	@echo "Remove the documents and then recreate it using index.rst"
	@echo ""
	@echo ""
	rm -rf ./docs/*.html
	@echo ""
	rst2html.py ./docs/index.rst ./docs/index.html
	@echo ""

venv-run:
	@echo ""
	@echo "Running application using venv virtual environment."
	@echo ""
	@echo ""
	@echo "  Note: the localhost website does not currently produce a useful html website."
	@echo "  You will need to look at links similar to the following:"
	@echo ""
	@echo "  http://localhost:8000/projects/"
	@echo "  http://localhost:8000/blog/"
	@echo "  http://localhost:8000/admin/"
	@echo ""
	@echo ""
	( source venv/bin/activate; python manage.py runserver; )
	@echo ""

py-pp:
	@echo ""
	@echo "Code standards for personal portfolio directory"
	@echo ""
	( source venv/bin/activate; pycodestyle ./personal_portfolio/*.py;)
	@echo ""

pystat-pp:
	@echo ""
	@echo "Code standard statistics for personal portfolio directory"
	@echo ""
	( source venv/bin/activate; pycodestyle --statistics ./personal_portfolio/*.py;)
	@echo ""

py-blog:
	@echo ""
	@echo "Code standards for blog directory"
	@echo ""
	( source venv/bin/activate; pycodestyle ./blog/*.py;)
	@echo ""

pystat-blog:
	@echo ""
	@echo "Code standard statistics for blog directory"
	@echo ""
	( source venv/bin/activate; pycodestyle --statistics ./blog/*.py;)
	@echo ""

py-projects:
	@echo ""
	@echo "Code standards for projects directory"
	@echo ""
	( source venv/bin/activate; pycodestyle ./projects/*.py;)
	@echo ""

pystat-projects:
	@echo ""
	@echo "Code standard statistics for projects directory"
	@echo ""
	( source venv/bin/activate; pycodestyle --statistics ./projects/*.py;)
	@echo ""

venv-clean:
	@echo ""
	@echo "Remove __pycache__, etc"
	@echo ""
	rm -rf ./personal_portfolio/__pycache__*
	@echo ""
	@echo ""
	rm -rf ./blog/__pycache__*
	rm -rf ./blog/migrations/__pycache__*
	@echo ""
	@echo ""
	rm -rf ./projects/__pycache__*
	rm -rf ./projects/migrations/__pycache__*

clean-venv:
	@echo ""
	@echo "Remove venv virtual environment directory"
	@echo ""
	rm -rf venv
	@echo ""

venv-build-req:
	@echo ""
	@echo "Rebuild requirements.txt from the venv virutal environment."
	@echo ""
	rm -rf requirements.txt
	@echo ""
	( source venv/bin/activate; pip freeze > requirements.txt; )
	@echo ""
