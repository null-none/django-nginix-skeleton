#!/bin/sh

./manage.py migrate --run-syncdb --noinput;
uwsgi --http :8080 --module django_skeleton.wsgi
