from pymodbus.server import StartTcpServer
from pymodbus.datastore import ModbusSequentialDataBlock
from pymodbus.datastore import ModbusSlaveContext, ModbusServerContext

# Baseline "process"
# coils: pompe / vanne
# holding regs: pression / debit
store = ModbusSlaveContext(
    co=ModbusSequentialDataBlock(0, [0]*10),
    hr=ModbusSequentialDataBlock(0, [50, 120] + [0]*8),
)

context = ModbusServerContext(slaves=store, single=True)

print("[PLC] Modbus TCP server listening on 0.0.0.0:502")
StartTcpServer(context=context, address=("0.0.0.0", 502))
