FROM python:3.9-slim-bookworm

RUN apt update && apt install -y \
    git \
    curl \
    ffmpeg \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN chmod +x start.sh

EXPOSE 8000

CMD ["bash", "start.sh"]
