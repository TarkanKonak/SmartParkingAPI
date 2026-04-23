FROM python:3.12-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host files.pythonhosted.org

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host files.pythonhosted.org


COPY . .


EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]