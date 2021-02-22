# The line below states we will base our new image on the Latest Official Ubuntu 
FROM ubuntu:latest
# Identify the maintainer of an image
LABEL maintainer="jorge.cuel@softvision.com"
# Update the image to the latest packages
RUN apt-get update && apt-get upgrade -y
#Let's install NGINX 
RUN apt-get install nginx -y
#Let's intall GIT
RUN apt-get install git -y && rm -rf /var/www/html
#Let's download our custom website & Publish new home
RUN git clone https://github.com/arvind37/Basic-Website-using-HTML-CSS /var/www/html
# Expose port 80
EXPOSE 80
# Last is the actual command to start up NGINX within our Container
CMD ["nginx","-g","daemon off;"]
