FROM python:3.9-slim

ENV PYTHONUNBUFFERED=1

# 必要なパッケージをインストール
RUN apt-get update && apt-get install -y curl

WORKDIR /app

COPY src/pyproject.toml ./

# poetryのインストール先の指定
ENV POETRY_HOME=/opt/poetry
# poetryインストール
RUN curl -sSL https://install.python-poetry.org | python && \
    # シンボリックによるpathへのpoetryコマンドの追加
    ln -s /opt/poetry/bin/poetry /usr/local/bin/poetry && \
    # 仮想環境を作成しない設定(コンテナ前提のため，仮想環境を作らない)
    poetry config virtualenvs.create false && \
    # pyproject.tomlから依存関係をインストール
    poetry install

CMD ["python", "/app/src/app.py"]