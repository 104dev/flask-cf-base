## ディレクトリ構成

```
プロジェクトルート/
├── Dockerfile
├── docker-compose.yml
└── src/
    ├── app.py
    ├── pyproject.toml
    ├── poetry.lock
    ├── config/
    │   └── settings.py
    ├── presentation/
    │   ├── __init__.py
    │   ├── hello_controller.py
    │   └── answer_controller.py
    └── app/
        ├── __init__.py
        └── main.py
```

## requirement.txtの作成

```
poetry export -f requirements.txt --output requirements.txt --without-hashes
```