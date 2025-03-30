Traffic Light

One of my first Verilog projects, developed for the Lattice 6900C FPGA board. The goal of this project was to create a traffic light system that controls the state of the traffic lights (red, green, yellow) based on specific time intervals and external input.

The traffic light system works by cycling through the three traffic light states (green, yellow, and red) in a fixed time sequence, ensuring proper traffic control at an intersection. Additionally, the system includes a button (switch) to manually trigger a change in the light sequence.
![image-removebg-preview (5)](https://github.com/user-attachments/assets/5f3c6de3-03e8-4170-a5a1-305134dbe4d4)
Key Features:

- Time-Based Control: The traffic light transitions between green, yellow, and red lights based on predefined time intervals for each state. This ensures predictable behavior.

- Manual Override: A switch input allows the user to override the automatic sequence, providing flexibility in controlling the traffic lights.

- LED Indicators: LEDs represent the states of the traffic lights, with additional LEDs indicating time intervals (such as a "1 second on, 1 second off" signal).

- FPGA Implementation: The design was synthesized and implemented on the Lattice 6900C FPGA
