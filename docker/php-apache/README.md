## Build the image.

~~~sh
docker build -t qqta/php-apache .
~~~

## Run the container.

### Run the container using docker

~~~sh
docker run -p 8090:80 -d qqta/php-apache
~~~

### Run the container using docker and mount a volume to work on it (Linux).

~~~sh
docker run -p 8090:80 -d -v $(pwd)/src:/var/www/html/ qqta/php-apache
~~~

### Run the container using docker and mount a volume to work on it (Windows).
~~~pwsh
docker run -p 8090:80 -d -v ${pwd}/src:/var/www/html/ qqta/php-apache
~~~

### Run the container using docker-compose

The docker-compose-yml mounts a volume to work on it.

~~~sh
docker-compose up -d
~~~
