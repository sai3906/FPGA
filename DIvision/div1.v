module div1(
    input [7:0] Q,
    input [7:0] B,
    output reg [7:0] quotient,
    output reg [7:0] remainder
);
    reg [15:0]EAQ; // 16-bit EAQ for division operation
    integer i; // loop variable
    E=1'b0;

    always @(*) 
    begin
        //EAQ = Q;
        EAQ= EAQ << 8; // shift left to make space for quotient

        for(i=0; i<8; i=i+1) 
        begin
            EAQ= EAQ< 1; // shift left for division operation
            if(EAQ[15] == 1'b0) 
            begin
                EAQ[15:8] = EAQ[15:8] - B;
                if(EAQ[16] == 1'b1)
                begin
                    EAQ[0] = 1'b0;
                end
                else 
                begin
                    EAQ[0] = 1'b1;
                end
            end 
            else 
            begin
                EAQ[15:8] = EAQ[15:8] + B;
                if(EAQ[15] == 1'b0) 
                begin
                    EAQ[0] = 1'b1;
                end
                else 
                begin
                    //EAQ[15:8] = EAQ[15:8] - B;
                    EAQ[0] = 1'b0;
                end
            end
             if(EAQ[15] == 1'b1) 
                begin
                    EAQ[15:8] = EAQ[15:8] + B;
                    EAQ[0] = 1'b0;
                end
        end

        quotient = EAQ[7:0];
        remainder = EAQ[15:8];
    end
endmodule
