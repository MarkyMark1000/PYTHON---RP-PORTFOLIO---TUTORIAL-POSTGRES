:: This is the makefile equivalent for windows, but instead it uses make.bat.
:: Run make with no arguments to get the help, then run the appropriate command
:: to execute the desired functionality, eg make venv-run, .....

echo off

if [%1]==[] (

	@echo ""
	@echo "PROJECT HELP:"
	@echo "make               	- this prints out the help for this makefile."
	@echo "Setup:"
	@echo "make venv	    	- this deletes and recreates the venv virtual environment from requirements.txt"
	@echo "make venv-migrations   - DANGER - this makes the migration file and creates/pushes it onto the database."
	@echo "make venv-admin   	- DANGER - this can be used to setup an admin password for the admin site."
	@echo "Run:"
	@echo "make venv-run      	- runs the script in the venv virtual environment."
	@echo "Testing:"
	@echo "DANGER: NO TESTS ASSOCIATED WITH THIS PROJECT YET."
	@echo "Code Standard:"
	@echo "make py-pp   	- Code standard for personal_portfolio directory."
	@echo "make pystat-pp   	- Code standard statistics for personal_portfolio directory."
	@echo "make py-blog   	- Code standard for blog directory."
	@echo "make pystat-blog   	- Code standard statistics for blog directory."
    @echo "make py-projects   	- Code standard for projects directory."
	@echo "make pystat-projects   	- Code standard statistics for projects directory."
	@echo "Clean:"
	@echo "make venv-clean    	- Remove __pycache__ etc"
	@echo "make clean-venv    	- Remove venv virtual environment."
	@echo "Distribution:"
	@echo "make venv-build-req    - Rebuilds the requirements file from the venv virtual environment."

)

if "%1" EQU "venv" (

	@echo ""
	@echo "Remove the venv virtual environment and then re-create it. using the requirements.txt file."
	@echo ""
	rmdir venv /s
	@echo ""
	virtualenv --no-site-packages -p python venv
	@echo ""
	.\venv\Scripts\activate
	@echo ""
	pip install -r requirements.txt

)

if "%1" EQU "venv-migrations" (

	@echo ""
	@echo "Make migrations file and then push it onto the database"
	@echo ""
	.\venv\Scripts\activate
	@echo ""
	python manage.py makemigrations personal_portfolio
    @echo ""
	python manage.py makemigrations projects
    @echo ""
	python manage.py makemigrations blog
	@echo ""
	python manage.py migrate

)

if "%1" EQU "venv-admin" (

	@echo ""
	@echo "Setup superuser for admin site."
    @echo ""
    @echo "At present I cannot get this to work reliably - I must be missing something"
	@echo ""
	.\venv\Scripts\activate
	@echo ""
	python manage.py createsuperuser

)

if "%1" EQU "venv-run" (

	@echo ""
	@echo "Running application using venv virtual environment."
	@echo ""
	@echo "  Note: the localhost website does not currently produce a useful html website."
	@echo "  You will need to look at links similar to the following:"
	@echo ""
	@echo ""
	@echo "  http://localhost:8000/projects/"
    @echo "  http://localhost:8000/blog/"
	@echo "  http://localhost:8000/admin/"
	@echo ""
	@echo ""
	.\venv\Scripts\activate
	@echo ""
	python manage.py runserver

)

if "%1" EQU "venv-test" (

	@echo ""
	@echo "DANGER: No tests are currently associated with this project"
	@echo ""

)

if "%1" EQU "py-pp" (

	@echo ""
	@echo "Code standards for personal_portfolio directory"
	@echo ""
	@echo ""
	.\venv\Scripts\activate
	@echo ""
	for %%f in (.\personal_portfolio\*.py) do pycodestyle %%f

)

if "%1" EQU "pystat-pp" (

	@echo ""
	@echo "Code standard statistics for personal_portfolio directory"
	@echo ""
	@echo ""
	.\venv\Scripts\activate
	@echo ""
	for %%f in (.\personal_portfolio\*.py) do pycodestyle --statistics %%f

)

if "%1" EQU "py-blog" (

	@echo ""
	@echo "Code standards for blog directory"
	@echo ""
	@echo ""
	.\venv\Scripts\activate
	@echo ""
	for %%f in (.\blog\*.py) do pycodestyle %%f

)

if "%1" EQU "pystat-blog" (

	@echo ""
	@echo "Code standard statistics for blog directory"
	@echo ""
	@echo ""
	.\venv\Scripts\activate
	@echo ""
	for %%f in (.\blog\*.py) do pycodestyle --statistics %%f

)

if "%1" EQU "py-projects" (

	@echo ""
	@echo "Code standards for projects directory"
	@echo ""
	@echo ""
	.\venv\Scripts\activate
	@echo ""
	for %%f in (.\projects\*.py) do pycodestyle %%f

)

if "%1" EQU "pystat-projects" (

	@echo ""
	@echo "Code standard statistics for projects directory"
	@echo ""
	@echo ""
	.\venv\Scripts\activate
	@echo ""
	for %%f in (.\projects\*.py) do pycodestyle --statistics %%f

)

if "%1" EQU "venv-clean" (

	@echo ""
	@echo "Remove __pycache__, etc"
	@echo ""
	@echo ""
	rmdir /S personal_portfolio\__pycache__
	@echo ""
	rmdir /S blog\__pycache__
	rmdir /S blog\migrations\__pycache__
	@echo ""
	rmdir /S projects\__pycache__
	rmdir /S migrations\__pycache__
	@echo ""
)

if "%1" EQU "clean-venv" (

	@echo ""
	@echo "Remove venv virtual environment directory"
	@echo ""
	@echo ""
	rmdir /S venv
	@echo ""
	
)

if "%1" EQU "venv-build-req" (

	@echo ""
	@echo "Rebuild requirements.txt from the venv virutal environment."
	@echo ""
	@echo ""
	del requirements.txt
	@echo ""
	.\venv\Scripts\activate
	@echo ""
	pip freeze > requirements.txt
	
)