## 🚦 Automatic Railway Gate Simulator using FSM (Verilog on FPGA)

### 🔧 Project Description

This project simulates an *automatic railway gate control system* using a *Finite State Machine (FSM)* designed in Verilog and implemented on an FPGA (Boolean Board). The system monitors the presence of an approaching train and controls two LEDs representing the gate and alert signals.

---

### ⚙ Working Principle

The system operates in *three states*:

#### 1. **Idle State (Idle)**
- Initial/default state.
- The gate is *open*.
- Both LEDs (LED1 for alert and LED2 for gate closed) are *OFF*.
- System waits for a train signal (SW1 = 1).

#### 2. **Alert State (alert)**
- Triggered when SW1 becomes high, indicating a train is approaching.
- LED1 (alert LED) is *turned ON*.
- A counter (count1) starts counting clock cycles.
- After *10 clock cycles*, the system transitions to the next state.

#### 3. **Gate Close State (close_gate)**
- The gate is considered *closed*.
- LED2 is *turned ON*.
- LED1 is turned OFF.
- This state persists for *2 clock cycles* using a second counter (count2).
- Afterward, if SW1 is still high, the system returns to the *alert* state (to handle another train).
- If SW1 is low, the system returns to the *Idle* state, and the gate is reopened.

---

### 🧠 Technical Details

- FSM implemented in Verilog.
- Uses *two separate 4-bit counters* to manage time-based transitions:
  - count1 for alert state
  - count2 for close_gate state
- Tested via simulation and synthesized on an *FPGA Boolean Board*.
- Switch SW1 simulates a train detection sensor.
- LED1 indicates alert (train approaching), LED2 indicates the gate is closed.
- Clock and reset are used to drive FSM transitions and counter operation.

---

### ✅ Challenges Faced & How I Solved Them

During development, one major issue was:
> 🔁 The LED1 (alert LED) toggled OFF prematurely instead of staying ON for 10 clock cycles.

This happened because the FSM used a *shared counter*, which continued incrementing regardless of the current state. The counter value carried over across states, causing incorrect transitions.

💡 *Fix*:
I solved this by using *two separate counters*:
- count1: Counts clock cycles during alert
- count2: Counts during close_gate

Each counter resets automatically when leaving its respective state, ensuring accurate delay and eliminating unwanted toggling.

---

### 🧪 Demo Flow

| Time (cycles) | Input (SW1) | State        | LED1 | LED2 |
|---------------|----------------|--------------|------|------|
| 0             | 0              | Idle         | 0    | 0    |
| ↑             | 1              | Alert        | 1    | 0    |
| +10 clocks    | 1              | Close Gate   | 0    | 1    |
| +2 clocks     | 0              | Idle         | 0    | 0    |

---

### 💻 How to Run

1. Connect Boolean Board to your PC and open Vivado/Quartus.
2. Add the Verilog files:
   - railway_gate_sim.v
   - tb_project.v (optional for simulation)
3. Assign pins to:
   - clk (system clock)
   - reset (button or switch)
   - SW1 (train detection switch)
   - LED1, LED2
4. Synthesize, implement, and generate the bitstream.
5. Program the FPGA and test in real-time.

---

### 📂 File Structure


├── railway_gate_sim.v     // FSM and counter logic
├── tb_project.v           // Testbench (optional)
├── README.md              // Project documentation


---

Let me know if you'd like to include:
- A waveform screenshot showing the fixed behavior
- Block diagram in image form
- A simulation .vcd or .gtkw file for GTKWave
- 
