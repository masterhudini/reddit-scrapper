# Dockerfile
FROM python:3.12-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

COPY requirements.txt ./
RUN pip install --upgrade pip && pip install -r requirements.txt

COPY reddit_scraper .

CMD ["gunicorn", "reddit_scraper.wsgi:application", "--bind", "0.0.0.0:8080"]