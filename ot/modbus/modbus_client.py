import time
import random
from pymodbus.client import ModbusTcpClient

PLC_IP = "172.20.10.10"
PLC_PORT = 502

client = ModbusTcpClient(PLC_IP, port=PLC_PORT)

print("[SCADA] Connecting to PLC...")
while not client.connect():
    print("[SCADA] Waiting for PLC...")
    time.sleep(1)

print("[SCADA] Connected. Generating Modbus traffic...")

while True:
    # READ holding registers (pression, debit)
    rr = client.read_holding_registers(0, 2, unit=1)
    if rr.isError():
        print("[READ] Error")
    else:
        pression, debit = rr.registers
        print(f"[READ] pression={pression} debit={debit}")

    # WRITE coil 0 (pompe)
    pompe = random.choice([0, 1])
    wr = client.write_coil(0, pompe, unit=1)
    if wr.isError():
        print("[WRITE] Error")
    else:
        print(f"[WRITE] pompe={'ON' if pompe else 'OFF'}")

    time.sleep(2)
