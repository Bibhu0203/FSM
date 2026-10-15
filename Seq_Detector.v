`timescale 1ns / 1ps
//Melay 1001 Sequennce Detector
module seq1001 (
    input  clk,
    input  rst,
    input  x,
    output reg y
);

reg [1:0] state;

parameter S0 = 2'b00,  // No match
          S1 = 2'b01,  // Detected 1
          S2 = 2'b10,  // Detected 10
          S3 = 2'b11;  // Detected 100

always @(posedge clk or posedge rst)
begin
    if (rst)
    begin
        state <= S0;
        y <= 1'b0;
    end
    else
    begin
        y <= 1'b0;     // Default output

        case(state)

            S0:
            begin
                if(x)
                    state <= S1;
                else
                    state <= S0;
            end

            S1:
            begin
                if(x)
                    state <= S1;  // Still have suffix "1"
                else
                    state <= S2;  // Got "10"
            end

            S2:
            begin
                if(x)
                    state <= S1;  // "101" ends with "1"
                else
                    state <= S3;  // Got "100"
            end

            S3:
            begin
                if(x)
                begin
                    state <= S1;  // Overlap after detecting 1001
                    y <= 1'b1;    // Sequence detected
                end
                else
                    state <= S0;
            end

            default:
            begin
                state <= S0;
                y <= 1'b0;
            end

        endcase
    end
end

endmodule
