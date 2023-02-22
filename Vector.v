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
