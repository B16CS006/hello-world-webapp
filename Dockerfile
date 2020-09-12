FROM python:3.6-alpine

WORKDIR /app
COPY . .

RUN pip install -r requirements.txt

# EXPOSE 8000

ENTRYPOINT ["gunicorn"  , "-b", "0.0.0.0:8000", "app:app"]
