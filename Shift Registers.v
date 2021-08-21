//--------------shift4-----------------------
module top_module(
    input clk,
    input areset,  // async active-high reset to zero
    input load,
    input ena,
    input [3:0] data,
    output reg [3:0] q); 
    
    always@(posedge clk, posedge areset)begin
        if(areset)begin
            q <= 0;
        end
        else begin
            if(load)
            	q <= data;
            else if(ena)
            	q <= q>>1;
        end
  
    end
endmodule
//-------------------Rotate100----------------------------
module top_module(
    input clk,
    input load,
    input [1:0] ena,
    input [99:0] data,
    output reg [99:0] q); 
    
    always@(posedge clk)begin
        if(load)
            q <= data;
        else begin
            case(ena)
            2'b01:begin
                q <= {q[0],q[99:1]};
            end
        	2'b10:begin
                q <= {q[98:0], q[99]};
            end
        	2'b00, 2'b11:begin
            	q <= q;
            end
         	endcase
        end
   end
                
endmodule

//-----------------Left/right arith shift by 1 or 8--------------//
module top_module(
    input clk,
    input load,
    input ena,
    input [1:0] amount,
    input [63:0] data,
    output reg [63:0] q); 
    
    always@(posedge clk)begin
        if(load)begin
            q <= data;
        end
        else if(ena)begin
            case(amount)
                2'b00: q <= q <<< 1;
                2'b01: q <= q <<< 8;
                2'b10: q <= {q[63],q[63:1]};
                2'b11: q <= {{8{q[63]}}, q[63:8]};
            endcase
        end
    end
endmodule

//-----------------5-bit lfsr--------------//
module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 5'h1
    output reg[4:0] q
); 

    always@(posedge clk)begin
        if(reset)begin
            q <= 5'b1;
        end
        else begin
            q[0] <= q[1];
            q[1] <= q[2];
            q[2] <= q[3] ^ q[0];
            q[3] <= q[4];
            q[4] <= 1'd0 ^ q[0];
        end
    end
endmodule

//-------------------3-bit LFSR---------------------//
module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output [2:0] LEDR);  // Q
	
    muxdff g0 (SW, KEY[0], KEY[1], LEDR);
endmodule

    

module muxdff(r, clk, L, Q);
    input clk;
    input [2:0] r;
    input L;
    output reg [2:0] Q;
    
    always@(posedge clk)begin
        Q[0] <= L ? r[0] : Q[2];
        Q[1] <= L ? r[1] : Q[0];
        Q[2] <= L ? r[2] : (Q[2] ^ Q[1]);
    end
endmodule

//-------------------32-bit LFSR---------------------//
module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 32'h1
    output [31:0] q
); 
    always@(posedge clk)begin
        if(reset)
            q <= 32'b1;
        else begin
            q <= {q[0], q[31:23], q[22]^ q[0], q[21:3], q[2]^q[0], q[1]^q[0]};
        end
    end        
    

endmodule

//-------------------Shifter register Exams/m2014 q4k---------------------//
module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output reg out);
    
    reg [3:0]temp;

    always@(posedge clk)begin
        if(!resetn)begin
            temp <= 0;
        end
        else begin
            temp <= {temp[2:0], in};
        end
    end
    assign out = temp[3];

endmodule

//--------------Shift Register Exams/2014 q4b--------------------//
module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); //
    
    wire Q3, Q2, Q1, Q0;
    MUXDFF g0(KEY[3], KEY[1], SW[3], KEY[2], KEY[0], Q3);
    MUXDFF g1(Q3, KEY[1], SW[2], KEY[2], KEY[0], Q2);
    MUXDFF g2(Q2, KEY[1], SW[1], KEY[2], KEY[0], Q1);
    MUXDFF g3(Q1, KEY[1], SW[0], KEY[2], KEY[0], Q0);
    
    assign LEDR[3] = Q3;
    assign LEDR[2] = Q2;
    assign LEDR[1] = Q1;
    assign LEDR[0] = Q0;
    
    
endmodule

module MUXDFF (w, e, r, l, clk, Q);
    input clk;
    input w, e, r, l;
    output reg Q;

    always@(posedge clk)begin
        if(e)begin
            if(!l)
                Q <= w;
            else 
                Q <= r;
        end
        else begin
            if(!l)
                Q <= Q;
            else
                Q <= r;
        end
    end
endmodule 

module DFF_ckt(clk, enable, S, Q);
    input clk;
    input enable;
    input S;
    output reg [7:0]Q;
    
    always@(posedge clk)begin
        if(enable)begin
            Q <= {Q[6:0], S};
        end
        else 
            Q <= Q;
    end

endmodule

//-------------------3-input LUT: Exams/ece241 2013 q12---------------//

module top_module (
    input clk,
    input enable,
    input S,
    input A, B, C,
    output reg Z ); 
    
    wire [7:0]Q;
    DFF_ckt g0(clk, enable, S, Q);
    
    always@(*)begin
            case({A,B,C})
                3'b000: begin
                    Z = Q[0];
                end
                3'b001:begin
                    Z = Q[1];
                end
                3'b010: begin
                    Z = Q[2];
                end
                3'b011:begin
                    Z = Q[3];
                end
                3'b100: begin
                    Z = Q[4];
                end
                3'b101:begin
                    Z = Q[5];
                end  
                3'b110: begin
                    Z = Q[6];
                end
                3'b111:begin
                    Z = Q[7];
                end                
                default: begin
                    Z = Q[0];
                end
            endcase
    end

endmodule