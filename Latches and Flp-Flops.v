


//--detect postive edge----//
module Edgedetect (
    input clk,
    input [7:0] in,
    output reg [7:0] pedge
);
    reg [7:0] temp;
    
    always@(posedge clk)begin
        temp <= in;
    end
    
    always@(posedge clk)begin
        pedge <= in & (~temp);
    end    
endmodule

//--------detect postive and negetive edge----------------/

module Edgedetect2 (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);
    
    reg [7:0] temp, p, n;
    
    always@(posedge clk)begin
        temp <= in;
    end
    
    always@(posedge clk)begin
        p <= ~temp & in;
        n <= temp & (~in);
    end
    
    assign anyedge = p | n;

endmodule


//----------Edge capture register--------------------//

module Edgecapture (
    input clk,
    input reset,
    input [31:0] in,
    output reg[31:0] out
);
    
    reg[31:0] temp;
    wire [31:0] capture;
    
    assign capture = ~in & temp;
    
    always@(posedge clk)begin
        temp <= in;
    end    
	    
    always@(posedge clk)begin
        if(reset)begin
            out <= 0;
        end    
        else begin   
            for(int i=0; i<32; i=i+1)begin
                if(capture[i] == 1)begin
                    out[i] <= 1;
                end
            end    
        end    
    end    
    
endmodule


//------------Rual-edge triggered flip flop-----------------//
module Dualedge (
    input clk,
    input d,
    output q
);
    
    reg n, p;
    always@(posedge clk)begin
        p <= d;
    end
    
    always@(negedge clk)begin
        n <= d;
    end
    
    assign q = clk? p : n;

endmodule