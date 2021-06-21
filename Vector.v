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
