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
