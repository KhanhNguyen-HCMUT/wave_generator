module rec_gen(
    input wire rst,
    input wire [7:0] phase,
	input wire [7:0] duty_cycle,  // Duty cycle (0-255)
    output reg [7:0] rec_out         
);
    wire [7:0] lut;              
	 assign lut = 40;

    always @(*) begin
        if (rst) 
            rec_out <= 8'd0;
        else begin           
                if(phase[7:0] < (256/256)*duty_cycle)
										 rec_out = lut;
							 else		 rec_out = -lut;
				 end
    end
endmodule

