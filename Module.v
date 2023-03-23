//--------------1. module----------------------//
module top_module ( input a, input b, output out );
    mod_a g0 (a, b, out);

endmodule

//--------------2. connection ports by position----------------------//
module top_module ( 
    input a, 
    input b, 
    input c,
    input d,
    output out1,
    output out2
);
    mod_a g0 ( out1, out2, a, b, c, d );

endmodule

//--------------3. connecting ports by name----------------------//
module top_module ( 
    input a, 
    input b, 
    input c,
    input d,
    output out1,
    output out2
);
    mod_a g0 ( .out1(out1), .out2(out2), .in1(a), .in2(b), .in3(c), .in4(d));

endmodule


//-------------4. Three modules----------------------//
module top_module ( input clk, input d, output q );

    wire q0, q1;
    my_dff g0 (clk, d, q0 );
    my_dff g1 (clk, q0, q1 );
    my_dff g2 (clk, q1, q );
    
endmodule


//-------------5. modules and vectors----------------------//
module top_module (
	input clk,
	input [7:0] d,
	input [1:0] sel,
	output reg [7:0] q
);

    wire [7:0] q1, q2, q3;		// output of each my_dff8
	
	// Instantiate three my_dff8s
    my_dff8 d1 ( clk, d, q1 );
    my_dff8 d2 ( clk, q1, q2 );
    my_dff8 d3 ( clk, q2, q3 );

	// This is one way to make a 4-to-1 multiplexer
	always @(*)		// Combinational always block
		case(sel)
			2'h0: q = d;
			2'h1: q = q1;
			2'h2: q = q2;
			2'h3: q = q3;
		endcase

endmodule
