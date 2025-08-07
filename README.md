# SPI-Controlled 4-Digit 7-Segment Display Driver (VHDL)

This project implements a 4-digit multiplexed seven-segment display controller using VHDL, designed to interface with an SPI master. The display driver receives commands over SPI and updates individual digits accordingly.

## 🛠 Features

- **SPI Slave Interface** for receiving data
- **Double Buffering** with `rx_buff_reg`
- **Memory Buffer** to store four hex digits
- **2-to-4 Address Decoder** for register selection
- **Finite State Machine (FSM)** to control data latching
- **4:1 Multiplexer** to route selected digit to display
- **Top-level module** combining all components

## 💡 How It Works

- The SPI interface writes a command byte.
- The most significant bit (bit 7) indicates if it's a command.
- Address bits (6-4) select which digit register to update.
- Data bits (3-0) represent the hex digit to display.
- FSM coordinates timing and ensures stable writes.
- A multiplexer selects which digit appears on the 7-segment display.

## ✅ Tools Used

- **Aldec Active-HDL** for simulation
- **Lattice Diamond & Synplify** for synthesis
- **VHDL** for hardware description

## 📌 Notes

- Functional and self-checking testbenches are included.
- Code is modular and componentized for reusability.
- Designed for educational and prototyping purposes on FPGAs/PLDs.

## 👤 Author

**Naafiul Hossain**


