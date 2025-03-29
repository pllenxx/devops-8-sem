FROM system AS build

ENV APP_HOME=/code
WORKDIR $APP_HOME

COPY ./code/django_web_front/package.json $APP_HOME/
COPY ./code/django_rest_api/requirements.txt $APP_HOME/

RUN npm install --omit=dev
RUN python3 -m venv venv && source venv/bin/activate && pip install --no-cache-dir -r requirements.txt

COPY ./code/django_web_front $APP_HOME/django_web_front/
COPY ./code/django_rest_api $APP_HOME/django_rest_api/
