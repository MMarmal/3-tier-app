FROM python:3.13-alpine

# -S : "system” account. These are non-login, lightweight accounts typically used for running apps.
RUN adduser -S appuser

WORKDIR /app

RUN --mount=type=bind,source=requirements.txt,target=/tmp/requirements.txt \
    --mount=type=cache,target=/root/.cache/pip \
    pip install -r /tmp/requirements.txt

COPY . .

USER appuser

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
