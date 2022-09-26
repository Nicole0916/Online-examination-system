# 检测客户端权限，用户名密码通过才能退出循环
async def check_permit(websocket):
    while True:
        recv_str = await websocket.recv()
        cred_dict = recv_str.split(":")
        if cred_dict[0] == "admin" and cred_dict[1] == "123456":


            response_str = r"congratulation, you have connect with server nnow, you can do something else"
            await websocket.send(response_str)
            return True
        else:


            response_str = "sorry, the username or password is wrong, please submit again"
            await websocket.send(response_str)

# 接收客户端消息并处理，这里只是简单把客户端发来的返回回去
async def recv_msg(websocket):
    while True:
        recv_text = await websocket.recv()
        response_text = f"your submit context: {recv_text}"
        print(response_text)
        await websocket.send(response_text)

# 服务器端主逻辑
# websocket和path是该函数被回调时自动传过来的，不需要自己传
async def main_logic(websocket, path):
    await check_permit(websocket)

    await recv_msg(websocket)