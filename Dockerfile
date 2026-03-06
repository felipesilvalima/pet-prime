FROM python:3.11-slim

WORKDIR /app

 # Copia e instala dependências
COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Copia todo o código
COPY . .

# Verifica se o main.py foi copiado corretamente
RUN echo "=== ARQUIVOS COPIADOS ===" && \
    ls -la /app && \
    echo "=== CONTEÚDO DA PASTA APP ===" && \
    ls -la /app/app/ && \
    echo "=== CONTEÚDO DO MAIN.PY ===" && \
    cat /app/app/main.py

EXPOSE 8000

# Comando para iniciar a aplicação
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]