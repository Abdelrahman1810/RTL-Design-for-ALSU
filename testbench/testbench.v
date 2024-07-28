module testbench ();
    parameter INPUT_PRIORITY = "A", FULL_ADDER = "ON";
    reg clk, rst, cin, serial_in;
    reg [2:0] A, B, opcode;
    reg red_op_A, red_op_B, bypass_A, bypass_B, direction;
    wire [15:0]leds;
    wire [5:0]out;

    reg cin_ref, serial_in_ref, direction_ref;
    reg [2:0] A_ref, B_ref;
    reg [5:0]out_ref;

    ALUS #(
        .INPUT_PRIORITY(INPUT_PRIORITY),
        .FULL_ADDER(FULL_ADDER)
    )regIns(
        clk, rst, cin, serial_in, A, B, opcode, 
        red_op_A, red_op_B, bypass_A, bypass_B, direction,
        leds, out 
    );

    initial begin
        clk = 0;
        forever #1 clk=~clk;
    end
    
    initial begin
        rst = 1;
        @(negedge clk);
        rst = 0;

    // Test (1): non-Invalid cases
        repeat(100000) begin
            red_op_B = $random;
            red_op_A = $random;
            bypass_A = $random;
            bypass_B = $random;
            if (red_op_A||red_op_B)
                opcode = $urandom_range(0,1);
            else
                opcode = $urandom_range(0,5);
            direction = $random;
            serial_in = $random;
            cin = $random;
            A = $random;
            B = $random;

            repeat(2) @(negedge clk);
            direction_ref = direction;
            serial_in_ref = serial_in;
            cin_ref = cin;
            A_ref = A;
            B_ref = B;
            out_ref = out;
            @(negedge clk);
            if (bypass_A)
                out_ref = A;
            else if (bypass_B)
                out_ref = B;
            else if (opcode==0) begin
                if (red_op_A)
                    out_ref = &A;
                else if (red_op_B)
                    out_ref = &B;
                else
                    out_ref = A & B;
            end
            else if (opcode==1) begin
                if (red_op_A)
                    out_ref = ^A;
                else if (red_op_B)
                    out_ref = ^B;
                else
                    out_ref = A ^ B;
            end
            else if (opcode==2)
                out_ref = A + B + cin;
            else if (opcode==3)
                out_ref = A * B;
            else if (opcode==4) begin
                if (direction)
                    out_ref = {out_ref[4:0], serial_in};
                else
                    out_ref = {serial_in, out_ref[5:1]};
            end
            else if (opcode==5) begin
                if (direction)
                    out_ref = {out_ref[4:0],out_ref[5]};
                else
                    out_ref = {out_ref[0],out_ref[5:1]};
            end

            if (out!=out_ref) begin
                $display("out = %b, out_ref = %b", out, out_ref);
                $stop;
            end
        end

    // Test (2): Invalid cases onley
        
        // Opcode bits are set to 110 or 111
        bypass_A = 0;
        bypass_B = 0;
        repeat(100000) begin
            red_op_B = $random;
            red_op_A = $random;
            opcode = $urandom_range(6,7);
            
            direction = $random;
            serial_in = $random;
            cin = $random;
            A = $random;
            B = $random;

            repeat(2) @(negedge clk);
            @(negedge clk);
            if (out!=0) begin
                $display("out = %b, out_ref = %b", out, out_ref);
                $stop;
            end
        end

        // red_op_A or red_op_B are set to high and the opcode is not AND or XOR operation
        red_op_B = 1;
        red_op_A = 0;
        bypass_A = 0;
        bypass_B = 0;
        repeat(35000) begin
            opcode = $urandom_range(2,7);
            
            direction = $random;
            serial_in = $random;
            cin = $random;
            A = $random;
            B = $random;

            repeat(2) @(negedge clk);
            @(negedge clk);

            if (out!=0) begin
                $display("out = %b, out_ref = %b", out, out_ref);
                $stop;
            end
        end

        red_op_B = 0;
        red_op_A = 1;
        bypass_A = 0;
        bypass_B = 0;
        repeat(35000) begin
            opcode = $urandom_range(2,7); 
            direction = $random;
            serial_in = $random;
            cin = $random;
            A = $random;
            B = $random;

            repeat(2) @(negedge clk);
            @(negedge clk);

            if (out!=0) begin
                $display("out = %b, out_ref = %b", out, out_ref);
                $stop;
            end
        end

        
        red_op_B = 1;
        red_op_A = 1;
        bypass_A = 0;
        bypass_B = 0;
        repeat(35000) begin
            opcode = $urandom_range(2,7); 
            direction = $random;
            serial_in = $random;
            cin = $random;
            A = $random;
            B = $random;

            repeat(2) @(negedge clk);
            @(negedge clk);

            if (out!=0) begin
                $display("out = %b, out_ref = %b", out, out_ref);
                $stop;
            end
        end

    // Test (3): Invalid and non-Invalid cases
        repeat(100000) begin
            red_op_B = $random;
            red_op_A = $random;
            bypass_A = $random;
            bypass_B = $random;
            opcode = $random;
            
            direction = $random;
            serial_in = $random;
            cin = $random;
            A = $random;
            B = $random;

            repeat(2) @(negedge clk);
            direction_ref = direction;
            serial_in_ref = serial_in;
            cin_ref = cin;
            A_ref = A;
            B_ref = B;
            out_ref = out;
            @(negedge clk);
            if (bypass_A)
                out_ref = A;
            else if (bypass_B)
                out_ref = B;
            else if (opcode==0) begin
                if (red_op_A)
                    out_ref = &A;
                else if (red_op_B)
                    out_ref = &B;
                else
                    out_ref = A & B;
            end
            else if (opcode==1) begin
                if (red_op_A)
                    out_ref = ^A;
                else if (red_op_B)
                    out_ref = ^B;
                else
                    out_ref = A ^ B;
            end
            else if (red_op_A || red_op_B)
                out_ref = 0;
            else if (opcode==2)
                out_ref = A + B + cin;
            else if (opcode==3)
                out_ref = A * B;
            else if (opcode==4) begin
                if (direction)
                    out_ref = {out_ref[4:0], serial_in};
                else
                    out_ref = {serial_in, out_ref[5:1]};
            end
            else if (opcode==5) begin
                if (direction)
                    out_ref = {out_ref[4:0],out_ref[5]};
                else
                    out_ref = {out_ref[0],out_ref[5:1]};
            end
            else if (opcode==6 || opcode==7)
                out_ref = 0;

            if (out!=out_ref) begin
                $display("out = %b, out_ref = %b", out, out_ref);
                $stop;
            end
        end
    $stop;
    end
endmodule