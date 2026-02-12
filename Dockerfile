FROM python:3.11-slim
WORKDIR /app

# Install the application dependencies
COPY requirements.txt ./
RUN apt-get update \
    && apt-get install -y --no-install-recommends ffmpeg \
    && rm -rf /var/lib/apt/lists/*
RUN pip install --no-cache-dir -r requirements.txt


# Copy in the source code
COPY ./ ./
EXPOSE 5000

CMD ["python", "app.py"]