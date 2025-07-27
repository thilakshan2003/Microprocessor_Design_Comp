# 4-bit Microprocessor in VHDL 🚀🔧

This repository contains a custom 4-bit microprocessor built entirely using VHDL. It is designed with simplicity and modularity in mind, making it ideal for learning digital design, CPU architecture, and FPGA development.

---

## 🧠 Microprocessor Components

The processor is composed of the following modules:

### ✅ Core Logic
- **4-bit Add/Subtract Unit**: Performs arithmetic operations based on control signals.
- **3-bit Adder**: Used for internal addressing or control logic.
- **3-bit Program Counter (PC)**: Increments or loads new address for instruction fetching.

### 🔀 Multiplexers
- **2-way 3-bit MUX**
- **2-way 4-bit MUX**
- **8-way 4-bit MUX**: Used for selecting inputs across modules like ALU, registers, or buses.

### 📦 Storage
- **Register Bank**: Multiple 4-bit registers with read/write control logic.
- **Program ROM**: Stores instructions to be executed, addressed by the PC.

### 📡 Buses
- **3-bit, 4-bit, and 12-bit Buses**: Used for interconnecting components like the instruction bus, data bus, and control signals.

### 🧾 Control
- **Instruction Decoder**: Translates 4-bit opcodes into control signals for other units.



