module noise_gen (
    input wire clk,
    input wire rst,
    output reg [7:0] lfsr
);

    wire feedback = lfsr[7] ^ lfsr[6] ^ lfsr[5] ^ lfsr[4]; // bit8^bit7^bit6^bit5

    always @(posedge clk or posedge rst) begin
        if (rst)
            lfsr <= 8'h1; // Giá trị khởi tạo khác 0
        else begin
            lfsr <= {lfsr[6:0], feedback};
        end
    end

endmodule
