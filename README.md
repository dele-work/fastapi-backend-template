# FastAPI Template PJ

## Getting Started

The commands in this documentation can be customized on the **Makefile**. It can be started with and without docker.

This project uses poetry, if you don't have it installed, you can the follow the instruction
in [Poetry Documentation](https://python-poetry.org/docs/#installation).

- Run the server (Recommended using docker):

```bash
# Run locally with docker in dev mode and force build
make run-dev-build
# or
# Run locally with docker in dev mode
make run-dev
# or
# Run locally with docker in prod mode (Autorelod disabled)
make run-prod
```

Open [http://fastapi.localhost/docs](http://fastapi.localhost/docs) with your browser to see the result.

- Run the server without docker:

First, make sure you have all packages installed:

```bash
make install
```

```bash
make run-app
```

Open [http://localhost:8000/docs](http://localhost:8000/docs) with your browser to see the result.

By default, the server uses port 8000. However, if this port is already in use, the server will automatically increment and select the next available port, ensuring the application remains accessible.

You can start editing the server by modifying `src/app/main.py`.

- [fastapi-alembic-sqlmodel-async](https://github.com/jonra1993/fastapi-alembic-sqlmodel-async).
- [full-stack-fastapi-postgresql](https://github.com/tiangolo/full-stack-fastapi-postgresql).
- [sqlmodel-tutorial](https://sqlmodel.tiangolo.com/tutorial/fastapi/).
- [asyncer-tutorial](https://asyncer.tiangolo.com/tutorial/).
- [fastapi-pagination](https://github.com/uriyyo/fastapi-pagination).
- [fastapi-best-practices](https://github.com/zhanymkanov/fastapi-best-practices).
- [awesome-fastapi](https://github.com/mjhea0/awesome-fastapi).

## 開発支援

[株式会社dele](https://dele.work/)では公開・開発しているソースコードに関するご質問やご相談等にも乗っております。

その他、デプロイや開発のご依頼も受け付けております。

[→ お問い合わせはこちらから](https://locrian-swift-4d7.notion.site/1360f28b29de801eb6b5f07f84fe40bb)


[![deleシステム開発支援](https://github.com/user-attachments/assets/8adf14d6-7594-4e31-b9e5-36d61fa622ad)](https://locrian-swift-4d7.notion.site/1360f28b29de801eb6b5f07f84fe40bb)
