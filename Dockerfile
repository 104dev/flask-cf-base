FROM python:3.9-slim

ENV PYTHONUNBUFFERED=1

WORKDIR /app

RUN pip install poetry

COPY pyproject.toml ./

RUN poetry config virtualenvs.create false \
  && poetry install

  CMD ["python", "app.py"]