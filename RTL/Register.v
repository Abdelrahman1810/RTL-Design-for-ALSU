module Register #(
    parameter INPUT_PRIORITY = "A", FULL_ADDER = "ON"
) (
    input clk, rst, cin, serial_in,
    input [2:0] A, B, opcode, 
    input red_op_A, red_op_B, bypass_A, bypass_B, direction,

    output [15:0]leds,
    output reg [5:0]out 
);

    reg cin_reg, serial_in_reg;
    reg [2:0] A_reg, B_reg, opcode_reg;
    reg red_op_A_reg, red_op_B_reg, bypass_A_reg, bypass_B_reg, direction_reg;

    wire [5:0]out_reg;


    always @(posedge clk or posedge rst) begin
        if (rst) begin
            cin_reg <= 0;
            serial_in_reg <= 0;
            A_reg <= 0;
            B_reg <= 0;
            opcode_reg <= 0;
            red_op_A_reg <= 0;
            red_op_B_reg <= 0;
            bypass_A_reg <= 0;
            bypass_B_reg <= 0;
            direction_reg <= 0;
            
            out <= 0;
        end
        else begin
            cin_reg <= cin;
            serial_in_reg <= serial_in;
            A_reg <= A;
            B_reg <= B;
            opcode_reg <= opcode;
            red_op_A_reg <= red_op_A;
            red_op_B_reg <= red_op_B;
            bypass_A_reg <= bypass_A;
            bypass_B_reg <= bypass_B;
            direction_reg <= direction;

            out <= out_reg;
        end
    end

    ALUS #(
    .INPUT_PRIORITY(INPUT_PRIORITY), .FULL_ADDER(FULL_ADDER)
    )alu(
        clk, cin_reg, serial_in_reg, A_reg, B_reg, opcode_reg, 
        red_op_A_reg, red_op_B_reg, bypass_A_reg, bypass_B_reg, direction_reg, 
        leds, out_reg 
    );

endmodule