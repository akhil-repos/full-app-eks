# full-app-eks

- `backend1..4` — FastAPI services. `GET /status` returns `{"message": "backendN live"}`, `GET /history` reads status log from Postgres, `GET /health` for k8s probes.
- `frontend` — Angular app. Polls the 4 backends every 5s, shows `backendN live` or `backendN off`.
- Postgres tables: `service_status` (latest status + heartbeat per backend), `status_log` (`live` row on startup, `off` row on graceful shutdown; `GET /history?service=all` returns all backends).

## Run

```bash
docker compose up -d --build          # postgres + 4 backends + frontend (ports 8001-8004, 4200)
# frontend also in compose: http://localhost:4200 (nginx proxies /api/backendN to the services)
# for hot-reload dev instead: cd frontend && npm install && npm start
```

Test the "off" case: `docker compose stop backend2` — card turns to `backend2 off`.

Check DB: `docker compose exec postgres psql -U postgres appdb -c "select * from service_status"`

Backend config via env: `DATABASE_URL`, `SERVICE_NAME`, `HEARTBEAT_SECONDS`.
