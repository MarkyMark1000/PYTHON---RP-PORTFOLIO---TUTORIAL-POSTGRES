This is the code for the Django Tutorial:

https://realpython.com/get-started-with-django-1/

The localhost website does not produce a usable website when the server is run.
You need to test the site using links similar to the following:

  - http://localhost:8000/blog/
  - http://localhost:8000/admin/
  - http://localhost:8000/projects/

I have taken the code from the original project.   I have installed postgresql onto my local
computer and then changed the settings file so that it uses a postgresql database instead of
SQLite.   

I also installed the psycopg2-binary driver to get everything working.   NOTE THIS ISN'T A 
RECOMMENDED SOLUTION.   THERE SEEM TO BE PROBLEMS WITH psycopg2 which I haven't got time to
go into.   The binary option is an easy installation for beginners to play around with.

I created the database called portfolio_tutorial_db and then added a user etc using the following:

  CREATE USER portfolioadmin WITH PASSWORD 'portfoliopass';
  GRANT ALL PRIVILEGES ON DATABASE portfolio_tutorial_db TO portfolioadmin;