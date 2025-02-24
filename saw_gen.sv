module saw_gen(
    input wire rst,
    input wire [7:0] phase,           // Pha đầu vào (8-bit)
    output reg [7:0] saw_out         // Sóng sine đầu ra (8-bit)
);
wire [7:0] lut [0:63];

assign  lut[0]  = 8'h00; assign lut[1]  = 8'h02; assign lut[2]  = 8'h04; assign lut[3]  = 8'h06;
assign  lut[4]  = 8'h08; assign lut[5]  = 8'h0A; assign lut[6]  = 8'h0C; assign lut[7]  = 8'h0E;
assign  lut[8]  = 8'h10; assign lut[9]  = 8'h12; assign lut[10] = 8'h14; assign lut[11] = 8'h16;
assign  lut[12] = 8'h18; assign lut[13] = 8'h1A; assign lut[14] = 8'h1C; assign lut[15] = 8'h1E;
assign  lut[16] = 8'h20; assign lut[17] = 8'h22; assign lut[18] = 8'h24; assign lut[19] = 8'h26;
assign  lut[20] = 8'h28; assign lut[21] = 8'h2A; assign lut[22] = 8'h2C; assign lut[23] = 8'h2E;
assign  lut[24] = 8'h30; assign lut[25] = 8'h32; assign lut[26] = 8'h34; assign lut[27] = 8'h36;
assign  lut[28] = 8'h38; assign lut[29] = 8'h3A; assign lut[30] = 8'h3C; assign lut[31] = 8'h3E;
assign  lut[32] = 8'h40; assign lut[33] = 8'h42; assign lut[34] = 8'h44; assign lut[35] = 8'h46;
assign  lut[36] = 8'h48; assign lut[37] = 8'h4A; assign lut[38] = 8'h4C; assign lut[39] = 8'h4E;
assign  lut[40] = 8'h50; assign lut[41] = 8'h52; assign lut[42] = 8'h54; assign lut[43] = 8'h56;
assign  lut[44] = 8'h58; assign lut[45] = 8'h5A; assign lut[46] = 8'h5C; assign lut[47] = 8'h5E;
assign  lut[48] = 8'h60; assign lut[49] = 8'h62; assign lut[50] = 8'h64; assign lut[51] = 8'h66;
assign  lut[52] = 8'h68; assign lut[53] = 8'h6A; assign lut[54] = 8'h6C; assign lut[55] = 8'h6E;
assign  lut[56] = 8'h70; assign lut[57] = 8'h72; assign lut[58] = 8'h74; assign lut[59] = 8'h76;
assign  lut[60] = 8'h78; assign lut[61] = 8'h7A; assign lut[62] = 8'h7C; assign lut[63] = 8'h7E;


    always @(*) begin
        if (rst) 
            saw_out  <= 8'd0;
        else begin
            case (phase[7:6])           // Xác định phần tư của chu kỳ
                2'b00: saw_out  <= lut[phase[5:0]];                          // 0° - 180°
                2'b01: saw_out  <= ~lut[~phase[5:0]];                         // 180° - 360°
                2'b10: saw_out  <= lut[phase[5:0]];                          // 0° - 180°
                2'b11: saw_out  <= ~lut[~phase[5:0]];                         // 180° - 360°            
				endcase
        end
    end
endmodule
