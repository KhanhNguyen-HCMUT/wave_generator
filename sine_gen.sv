module sine_gen(
    input wire rst,
    input wire [7:0] phase,           // Pha đầu vào (8-bit)
    output reg [7:0] sine_out         // Sóng sine đầu ra (8-bit)
);

  wire [7:0] lut [0:63];

assign  lut[0]  = 8'h00; assign lut[1]  = 8'h02; assign lut[2]  = 8'h03; assign lut[3]  = 8'h05;
assign  lut[4]  = 8'h06; assign lut[5]  = 8'h08; assign lut[6]  = 8'h09; assign lut[7]  = 8'h0B;
assign  lut[8]  = 8'h0C; assign lut[9]  = 8'h0E; assign lut[10] = 8'h10; assign lut[11] = 8'h11;
assign  lut[12] = 8'h13; assign lut[13] = 8'h14; assign lut[14] = 8'h16; assign lut[15] = 8'h17;
assign  lut[16] = 8'h18; assign lut[17] = 8'h1A; assign lut[18] = 8'h1B; assign lut[19] = 8'h1D;
assign  lut[20] = 8'h1E; assign lut[21] = 8'h20; assign lut[22] = 8'h21; assign lut[23] = 8'h22;
assign  lut[24] = 8'h24; assign lut[25] = 8'h25; assign lut[26] = 8'h26; assign lut[27] = 8'h27;
assign  lut[28] = 8'h29; assign lut[29] = 8'h2A; assign lut[30] = 8'h2B; assign lut[31] = 8'h2C;
assign  lut[32] = 8'h2D; assign lut[33] = 8'h2E; assign lut[34] = 8'h2F; assign lut[35] = 8'h30;
assign  lut[36] = 8'h31; assign lut[37] = 8'h32; assign lut[38] = 8'h33; assign lut[39] = 8'h34;
assign  lut[40] = 8'h35; assign lut[41] = 8'h36; assign lut[42] = 8'h37; assign lut[43] = 8'h38;
assign  lut[44] = 8'h38; assign lut[45] = 8'h39; assign lut[46] = 8'h3A; assign lut[47] = 8'h3B;
assign  lut[48] = 8'h3B; assign lut[49] = 8'h3C; assign lut[50] = 8'h3C; assign lut[51] = 8'h3D;
assign  lut[52] = 8'h3D; assign lut[53] = 8'h3E; assign lut[54] = 8'h3E; assign lut[55] = 8'h3E;
assign  lut[56] = 8'h3F; assign lut[57] = 8'h3F; assign lut[58] = 8'h3F; assign lut[59] = 8'h40;
assign  lut[60] = 8'h40; assign lut[61] = 8'h40; assign lut[62] = 8'h40; assign lut[63] = 8'h40;



    always @(*) begin
        if (rst) 
            sine_out <= 8'd0;
        else begin
            case (phase[7:6])           // Xác định phần tư của chu kỳ
                2'b00: sine_out <= lut[phase[5:0]];                          // 0° - 90°
                2'b01: sine_out <= lut[~phase[5:0]];                         // 90° - 180°
                2'b10: sine_out <= ~lut[phase[5:0]] + 8'd1;                  // 180° - 270°
                2'b11: sine_out <= ~lut[~phase[5:0]] + 8'd1;                 // 270° - 360°
            endcase
        end
    end
endmodule
