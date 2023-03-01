//------------------Vectors0-------------------//
`default_nettype none     // Disable implicit nets. Reduces some types of bugs.
module top_module( 
    input wire [15:0] in,
    output wire [7:0] out_hi,
    output wire [7:0] out_lo );
    
    assign {out_hi, out_lo} = in;

endmodule

//---------vector1: Vectors in more detail---------------------//
`default_nettype none     // Disable implicit nets. Reduces some types of bugs.
module top_module( 
    input wire [15:0] in,
    output wire [7:0] out_hi,
    output wire [7:0] out_lo );
    
    assign {out_hi, out_lo} = in;

endmodule

//---------vector2: Vector part select---------------------//
module top_module( 
    input [31:0] in,
    output [31:0] out );//

    assign out[31:0] = {in[7:0], in[15:8], in[23:16], in[31:24]};

endmodule

//-------4: Bitwise Operators------------------------------//
module top_module( 
    input [2:0] a,
    input [2:0] b,
    output [2:0] out_or_bitwise,
    output out_or_logical,
    output [5:0] out_not
);
    assign out_or_bitwise = a | b;
    assign out_or_logical = | (a | b);
    assign out_not[5:3] = ~b;
    assign out_not[2:0] = ~a;

endmodule

//-----------5: four input gates------------------//
module top_module( 
    input [3:0] in,
    output out_and,
    output out_or,
    output out_xor
);
    assign out_and = &in;
    assign out_or = |in;
    assign out_xor = ^in;

endmodule

//--------------6: Vector concatenation operator-----------//
module top_module (
    input [4:0] a, b, c, d, e, f,
    output [7:0] w, x, y, z );//

    assign {w, x, y, z} = {a, b, c, d, e, f, 2'b11};

endmodule

//--------------7: Vectorr-----------//
module top_module( 
    input [7:0] in,
    output [7:0] out
);
    always@(*)begin
        for(int i=0; i<8; i=i+1)begin
            out[i] = in[7-i];
        end  
    end    
endmodule

//--------------8: Vector4-----------//
module top_module (
    input [7:0] in,
    output [31:0] out );//

    assign out = { {24{in[7]}}, in };

endmodule

//--------------9: Vector5-----------//
module top_module (
    input a, b, c, d, e,
    output [24:0] out );//
    
    wire [24:0] first, second;
    
    assign first = {{5{a}}, {5{b}}, {5{c}}, {5{d}}, {5{e}}};
    assign second = {5{a, b, c, d, e}};
    assign out = ~ first ^ second;

endmodule

