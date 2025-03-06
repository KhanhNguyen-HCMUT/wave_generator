module ecg_gen(
    input wire rst,
    input wire [7:0] phase,           // Pha đầu vào (8-bit)
    output reg [7:0] ecg_out         // Sóng sine đầu ra (8-bit)
);
wire signed [7:0] lut [0:63];

assign lut[0]  = 8'h00; assign lut[1]  = 8'h01; assign lut[2]  = 8'h02; assign lut[3]  = 8'h03;
assign lut[4]  = 8'h05; assign lut[5]  = 8'h07; assign lut[6]  = 8'h0A; assign lut[7]  = 8'h0C;
assign lut[8]  = 8'h0D; assign lut[9]  = 8'h0E; assign lut[10] = 8'h0E; assign lut[11] = 8'h0E;
assign lut[12] = 8'h0D; assign lut[13] = 8'h0B; assign lut[14] = 8'h09; assign lut[15] = 8'h07;
assign lut[16] = 8'h05; assign lut[17] = 8'h04; assign lut[18] = 8'h03; assign lut[19] = 8'h02;
assign lut[20] = 8'h01; assign lut[21] = 8'h01; assign lut[22] = 8'h00; assign lut[23] = 8'h00;
assign lut[24] = 8'h00; assign lut[25] = 8'h01; assign lut[26] = 8'h03; assign lut[27] = 8'h09;
assign lut[28] = 8'h16; assign lut[29] = 8'h2B; assign lut[30] = 8'h46; assign lut[31] = 8'h5D;
assign lut[32] = 8'h64; assign lut[33] = 8'h56; assign lut[34] = 8'h38; assign lut[35] = 8'h16;
assign lut[36] = 8'hFB; assign lut[37] = 8'heb; assign lut[38] = 8'he3; assign lut[39] = 8'he1;
assign lut[40] = 8'he2; assign lut[41] = 8'he6; assign lut[42] = 8'hea; assign lut[43] = 8'hef;
assign lut[44] = 8'hf4; assign lut[45] = 8'hf8; assign lut[46] = 8'hfc; assign lut[47] = 8'hfe;
assign lut[48] = 8'h00; assign lut[49] = 8'h01; assign lut[50] = 8'h01; assign lut[51] = 8'h01;
assign lut[52] = 8'h01; assign lut[53] = 8'h01; assign lut[54] = 8'h01; assign lut[55] = 8'h00;
assign lut[56] = 8'h00; assign lut[57] = 8'h00; assign lut[58] = 8'h00; assign lut[59] = 8'h00;
assign lut[60] = 8'h00; assign lut[61] = 8'h00; assign lut[62] = 8'h00; assign lut[63] = 8'h00;

always @(*) begin
        if (rst) 
            ecg_out <= 8'd0;
        else begin
            case (phase[7:6])           // Xác định phần tư của chu kỳ
                2'b00: ecg_out <= lut[phase[5:0]];                          // 0° - 90°
                2'b01: ecg_out <= lut[phase[5:0]];                         // 90° - 180°
                2'b10: ecg_out <= lut[phase[5:0]];                  // 180° - 270°
                2'b11: ecg_out <= lut[phase[5:0]];                 // 270° - 360°
            endcase
        end
    end
endmodule
