#!/usr/bin/python3
# Requires smtp_servers.txt and smtp_users.txt files in the same folder
# Enums each server with each username using the netcat VRFY SMTP command

import socket
import sys

with open("smtp_servers.txt") as smtp_servers:
    for server in smtp_servers:
        server = server.rstrip()
        print(f"[#] Enumerating {server}")
        # Create a Socket
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        # Connect to the Server
        connect = s.connect((server,25))
        # Receive the banner
        banner = s.recv(1024)
        print(banner)
        # VRFY users
        with open("smtp_users.txt") as smtp_users:
            for user in smtp_users:
                try:
                    user = user.rstrip()
                    s.send(b'VRFY ' + bytes(user,"utf-8") + b'\r\n')
                    result = s.recv(1024)
                    print(result)
                    # Close the socket
                    s.close()
                except:
                    pass
