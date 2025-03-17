#!/bin/bash
sleep 5
source $APP_HOME/venv/bin/activate
python test_app/manage.py migrate
python test_app/manage.py loaddata profiles
python test_app/manage.py runserver 0:8000