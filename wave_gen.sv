module wave_gen(
    input logic clk,
    input logic rst,
    input logic signed [7:0] wave_amp,
    input logic signed [7:0] noise_amp, 
    input logic [7:0] freq,
    input logic [2:0] wave_sel,
    input logic inj_sel,
    input logic [7:0] duty_cycle,
    output logic signed [15:0] wave_out, 
    output logic signed [15:0] noise_out
);

logic signed [7:0] wave_preout;
logic signed [7:0] sine_wave;
logic signed [7:0] ecg_wave;
logic signed [7:0] rec_wave;
logic signed [7:0] saw_wave;
logic signed [7:0] tria_wave;
logic [7:0] phase_out;
logic signed [15:0] mult_result; 
logic signed [7:0] noise;
// Các module con
phase_ctrl phase_ctrl(.clk(clk), .rst(rst), .freq(freq), .phase_out(phase_out));
sine_gen sine_gen(.sine_out(sine_wave), .rst(rst), .phase(phase_out));
rec_gen rec_gen(.rec_out(rec_wave), .rst(rst), .phase(phase_out), .duty_cycle(duty_cycle));
saw_gen saw_gen(.saw_out(saw_wave), .rst(rst), .phase(phase_out));
tria_gen tria_gen(.tria_out(tria_wave), .rst(rst), .phase(phase_out));
ecg_gen ecg_gen(.ecg_out(ecg_wave), .rst(rst), .phase(phase_out));
noise_gen noise_gen(.lfsr(noise), .rst(rst), .clk(phase_out));
// Chọn dạng sóng
always @(*) begin
    case (wave_sel) 
        3'b000: wave_preout = sine_wave;
        3'b001: wave_preout = rec_wave;
        3'b010: wave_preout = saw_wave;
        3'b011: wave_preout = tria_wave;
 	3'b100: wave_preout = ecg_wave;
	default: wave_preout = 0;
    endcase
end

assign mult_result = wave_amp * wave_preout; 


assign noise_out = noise * noise_amp; //Đưa nhiễu ra ngoài để quan sát

always @(*) begin
    case (inj_sel) 
        1'b0: wave_out = mult_result;  
        1'b1: wave_out = mult_result + noise_out; 
    endcase
end

endmodule
