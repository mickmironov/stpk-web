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