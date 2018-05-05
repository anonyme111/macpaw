FROM macpaw/internship
RUN apt-get update
RUN apt-get install zip
RUN apt-get install logrotate
RUN echo '<h1> Hello from docker. My name is Serhii,' \
        >/var/www/html/index.html
RUN mkdir -p /var/www/internship.macpaw.io/html
RUN echo '<h1> Hello from docker. My name is Serhii,' \
        >/var/www/internship.macpaw.io/html/index.html
RUN echo 'server {
listen 80;
listen [::]:80;
root /var/www/html;
index index.html index.htm index.nginx-debian.html;
server_name internship.macpaw.io www.internship.macpaw.io;
location / {
try_files $uri $uri/ =404;
}
}' \ 
>/etc/nginx/sites-available/internship.macpaw.io
RUN ln -s /etc/nginx/sites-available/internship.macpaw.io /etc/nginx/sites-enabled/
RUN service nginx start
EXPOSE 80
