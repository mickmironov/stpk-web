import socket


def listen():
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.bind(('0.0.0.0', 2222))
    s.listen(5)

    while True:
        conn, adrr = s.accept()
        while True:
            data = conn.recv(1024)
            if not data or data == b'close':
                break
            conn.send(data)
        conn.close()


if __name__ == '__main__':
    listen()
