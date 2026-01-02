FROM python:3.10-slim AS builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --user -r requirements.txt

FROM python:3.10-slim
RUN useradd -m appuser
WORKDIR /app

COPY --from=builder /root/.local /home/appuser/.local
COPY . .

ENV PATH=/home/appuser/.local/bin:$PATH
USER appuser

EXPOSE 5000
CMD ["python", "app.py"]
