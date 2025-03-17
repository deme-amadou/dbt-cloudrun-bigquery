FROM python:3.12.4-slim

WORKDIR /app

COPY . .

RUN pip install --upgrade pip --root-user-action=ignore
RUN pip install -r requirements.txt --root-user-action=ignore


RUN dbt deps

ENV DBT_PROFILES_DIR=/app

ENTRYPOINT ["dbt","run"]