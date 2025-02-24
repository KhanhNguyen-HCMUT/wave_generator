# wave_generator
Lab 1 project for DSP on FPGA.
Team member: 
- Nguyen Dang Khanh (khanh.nguyendang@hcmut.edu.vn)
- Nguyen Van Trong Hieu
- Bui Khanh Hoang
The wave generator consists of:
- 4 sub-modules:
  + phase_control: control the phase acculmulation to adjust the frequency of wave_out
  + rec_gen: generate a rectangle wave.
  + saw_gen: generate a sawtooth wave.
  + tria_gen: generate a triangle wave.
  + sine_gen: generate a sinusoidal wave. 
- 1 top module (wave_gen):
  + Choose the waveform for wave_out.
  + Determine wave_out's frequency, amplitude and duty cycle (for rectangle wave).
  + Support noise injection.
