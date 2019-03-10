sudo unlink /etc/nginx/sites-enabled/default
sudo ln -sf /home/box/web/etc/nginx.conf  /etc/nginx/sites-enabled/test.conf
sudo /etc/init.d/nginx restart
sudo ln -sf /home/box/web/etc/gunicorn.conf /etc/gunicorn.d/test-wsgi
sudo ln -sf /home/box/web/etc/gunicorn-django.conf /etc/gunicorn.d/test-django
sudo /etc/init.d/gunicorn restart
sudo /etc/init.d/mysql start
mysql -uroot -e "create database stpk_web;"
mysql -uroot -e "grant all privileges on stpk_web.* to 'box'@'localhost' with grant option;"
python3 /home/box/web/ask/manage.py makemigrations qa
python3 /home/box/web/ask/manage.py migrate qa
python3 /home/box/web/ask/manage.py makemigrations
python3 /home/box/web/ask/manage.py migrate