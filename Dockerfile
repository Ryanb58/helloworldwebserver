FROM python:3.7

# Ensure python prints stdout instead of buffering it.
ENV PYTHONUNBUFFERED=1
ENV FLASK_APP=app
ENV FLASK_ENV=production

ADD ./ /app
WORKDIR /app

RUN pip install --no-cache-dir --upgrade pip
RUN pip install -r requirements.txt

CMD [ "make", "run" ]