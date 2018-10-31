sudo sed -i -e 's/17.5/19.9.0/g' /usr/sbin/gunicorn-debian
sudo sed -i -e 's/17.5/19.9.0/g' /usr/bin/gunicorn
sudo sed -i -e 's/17.5/19.9.0/g' /usr/bin/gunicorn_django
sudo sed -i -e 's/17.5/19.9.0/g' /usr/bin/gunicorn_paster
sudo sed -i -e 's/python/python3/g' /usr/sbin/gunicorn-debian
sudo sed -i -e 's/python/python3/g' /usr/bin/gunicorn
sudo sed -i -e 's/python/python3/g' /usr/bin/gunicorn_django
sudo sed -i -e 's/python/python3/g' /usr/bin/gunicorn_paster
sudo pip3 install django==2.0.9
sudo pip3 install gunicorn --upgrade
sudo unlink /etc/nginx/sites-enabled/default
sudo ln -sf /home/box/web/etc/nginx.conf  /etc/nginx/sites-enabled/test.conf
sudo /etc/init.d/nginx restart
sudo ln -sf /home/box/web/etc/gunicorn.conf /etc/gunicorn.d/test-wsgi
sudo ln -sf /home/box/web/etc/gunicorn-django.conf /etc/gunicorn.d/test-django
sudo /etc/init.d/gunicorn restart
sudo /etc/init.d/mysql start