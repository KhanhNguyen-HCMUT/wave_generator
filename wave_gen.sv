module wave_gen(
    input logic clk,
    input logic rst,
    input logic signed [7:0] amp,     
    input logic [7:0] freq,
    input logic [1:0] wave_sel,
    input logic inj_sel,
	 input logic [7:0] duty_cycle,
    output logic signed [15:0] wave_out, 
	 output logic signed [7:0] noise_out
);

logic signed [7:0] wave_preout;
logic signed [7:0] sine_wave;
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
noise_gen noise_gen(.lfsr(noise), .rst(rst), .clk(phase_out));
// Chọn dạng sóng
always @(*) begin
    case (wave_sel) 
        2'b00: wave_preout = sine_wave;
        2'b01: wave_preout = rec_wave;
        2'b10: wave_preout = saw_wave;
        2'b11: wave_preout = tria_wave;
    endcase
end

always @(*) begin
    mult_result = amp * wave_preout; 
end

assign noise_out = noise; //Đưa nhiễu ra ngoài để quan sát

always @(*) begin
    case (inj_sel) 
        1'b0: wave_out = mult_result;  
        1'b1: wave_out = mult_result + noise; 
    endcase
end

endmodule
