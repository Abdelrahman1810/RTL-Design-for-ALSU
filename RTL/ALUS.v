module ALUS #(
    parameter INPUT_PRIORITY = "A", FULL_ADDER = "ON"
) (
    input clk, cin, serial_in,
    input [2:0] A, B, opcode, 
    input red_op_A, red_op_B, bypass_A, bypass_B, direction,

    output reg [15:0]leds, 
    output reg [5:0]out 
);
    always @(posedge clk) begin
        leds <= 0;
        if (bypass_A && bypass_B) begin
            if (INPUT_PRIORITY=="A")
                out <= A;
            else if (INPUT_PRIORITY=="B")
                out <= B;
        end
        else if (bypass_A)
            out <= A;
        else if (bypass_B)
            out <= B;

        else if (opcode==3'b000) begin
            if (red_op_A&&red_op_B) begin
                if (INPUT_PRIORITY=="A")
                    out <= &A;
                else if (INPUT_PRIORITY=="B")
                    out <= &B;
            end
            else if (red_op_A)
                out <= &A;
            else if (red_op_B)
                out <= &B;
            else
                out <= A & B;
        end 

        else if (opcode==3'b001) begin
            if (red_op_A&&red_op_B) begin
                if (INPUT_PRIORITY=="A") out <= ^A;
                else if (INPUT_PRIORITY=="B") out <= ^B;
            end
            else if (red_op_A)
                out <= ^A;
            else if (red_op_B)
                out <= ^B;
            else
                out <= A ^ B;
        end 

        else if (red_op_A||red_op_B) begin
            leds <= ~leds;
            out <= 0;
        end

        else if (opcode==3'b010) begin
            if (FULL_ADDER=="ON") 
                out <= A + B + cin;
            else if (FULL_ADDER=="OFF")
                out <= A + B;
        end 

        else if (opcode==3'b011)
            out <= A * B;

        else if (opcode==3'b100)
            out <= (direction)? {out[4:0],serial_in}:{serial_in,out[5:1]};
        
        else if (opcode==3'b101) 
            out <= (direction)? {out[4:0],out[5]}:{out[0],out[5:1]};
         
        else if (opcode==3'b110 || opcode==3'b111) begin
            leds <= ~leds;
            out <= 0;
        end
    end
endmodule