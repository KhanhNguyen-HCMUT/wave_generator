module phase_ctrl(
input logic clk,
input logic rst,
input logic [7:0]freq,
output logic [7:0] phase_out
);

reg [7:0]count;

always@(posedge clk or posedge rst) begin
if(rst)
count = 0;
else begin 
if(count < freq)
count = count + 1;
else count = 0;
end
end

always@(*)begin
if(rst)
phase_out = 0;
else begin
case(count == freq) 
1'b0: phase_out = phase_out;
1'b1: phase_out = phase_out + 1;
endcase
end
end

endmodule
