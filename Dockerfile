# source image = python#stretch
FROM python:stretch

# set up app directory for code 
COPY . /application_dir
WORKDIR application_dir

# install pip and packages from requirements.txt
RUN pip install --upgrade pip
RUN pip install -r requirements.txt 

# define entrypoint which will run the app using Gunicorn WSGI server--> ["gunicorn", "-b", ":5000", "main:APP"]
ENTRYPOINT ["gunicorn", "-b", ":8080", "main:APP"]