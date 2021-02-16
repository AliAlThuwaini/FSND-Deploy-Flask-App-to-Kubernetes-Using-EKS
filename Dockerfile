
# Read python stretch image (https://github.com/docker-library/python/tree/72724b61c96c9685e831991de913f633852e8e07/3.7/stretch)
FROM python:stretch


# copy all the content from the current directory to /app directory inside the image
COPY . /app

# make /app inside the image the working directory
WORKDIR /app

RUN apt-get update -y

# use pip to upgrade itself.
RUN pip install --upgrade pip

# use pip to install project requirements
RUN pip install -r requirements.txt
#RUN pip install -r requirements.txt --proxy http(s)://proxy:8080 --trusted-host pypi.python.org


ENTRYPOINT ["gunicorn", "-b", ":8080", "main:APP"]


