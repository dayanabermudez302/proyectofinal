
# 1. Imagen oficial de Python 3.12 liviana
FROM python:3.12-slim

# 2. Carpeta de trabajo
WORKDIR /app

# 3. Copiar e instalar dependencias
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 4. Copiar las carpetas necesarias
COPY app/ ./app/
COPY frontend/ ./frontend/
COPY models/ ./models/

# 5. Exponer el puerto 8000
EXPOSE 8000

# 6. Iniciar el servidor FastAPI
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
