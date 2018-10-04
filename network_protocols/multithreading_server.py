import socket
import threading
import multiprocessing


def worker(sock):
    while True:
        conn, addr = sock.accept()
        th = threading.Thread(target=process_request, args=(conn, addr))
        th.start()


def process_request(conn, addr):
    with conn:
        while True:
            data = conn.recv(1024)
            if not data or data == b'close':
                    break
            conn.send(data)


def listen():
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.bind(('0.0.0.0', 2222))
    s.listen()

    workers_count = 10
    workers_list = [
        multiprocessing.Process(target=worker, args=(s,))
        for _ in range(workers_count)
        ]

    for w in workers_list:
        w.start()

    for w in workers_list:
        w.join()


if __name__ == '__main__':
    listen()
