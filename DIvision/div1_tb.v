module div1_tb;
    reg [7:0] Q;
    reg [7:0] B;

    wire [7:0] quotient;
    wire [7:0] remainder;

    div1 u1 (
        .Q(Q),
        .B(B),
        .quotient(quotient),
        .remainder(remainder)
    );

    initial begin
        Q = 8'h39; // 57 in decimal
        B = 8'h03; // 3 in decimal
        #10;
        $display("Q: %d, B: %d, Quotient: %d, Remainder: %d", Q, B, quotient, remainder);
        $finish;
    end
endmodule
