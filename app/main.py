from fastapi import FastAPI

app = FastAPI()

@app.get("/teste/{valor}")
async def teste(valor: int):
    return {"mensagem" : f"O valor enviado e {valor}"}