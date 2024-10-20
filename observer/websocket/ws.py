import asyncio
import websockets

# Almacenar todas las conexiones activas
connected_clients = set()

async def handler(websocket, path):
    # Registrar una nueva conexión
    connected_clients.add(websocket)
    try:
        async for message in websocket:
            print(f"Mensaje recibido: {message}")
            # Procesar el mensaje (si es necesario)
    finally:
        # Remover el cliente al desconectarse
        connected_clients.remove(websocket)

async def broadcast(message):
    # Enviar el mensaje a todos los clientes conectados
    if connected_clients:  # Solo si hay clientes conectados
        await asyncio.wait([client.send(message) for client in connected_clients])

async def input_handler():
    while True:
        # Pedir un input manual al usuario
        message = input("Escribe el mensaje a enviar a todos los clientes: ")
        # Enviar el mensaje a todos los clientes conectados
        await broadcast(message)

# Configuración del servidor WebSocket
start_server = websockets.serve(handler, "localhost", 6789)

# Ejecutar el servidor
loop = asyncio.get_event_loop()
loop.run_until_complete(start_server)

# Ejecutar la función que maneja el input manual en paralelo con el servidor WebSocket
loop.run_until_complete(input_handler())

# Mantener el servidor corriendo
loop.run_forever()