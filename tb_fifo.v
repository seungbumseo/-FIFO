`timescale 1ns / 1ps

module tb_fifo();

reg         clk;
reg         reset;
reg         wr;
wire        full;
reg [7 :0]  wr_data;
reg         rd;
wire        empty;
wire [7:0]  rd_data;


FIFO #(
    .ADDR_WIDTH(2), 
    .DATA_WIDTH(8)
) U_FIFO_CTRL(
        .clk(clk),
        .reset(reset),
        .wr(wr),
        .full(full),
        .wr_data(wr_data),
        .rd(rd),
        .empty(empty),
        .rd_data(rd_data)
);

always #5 clk = ~clk;

initial begin
    #00 clk = 1'b0; reset = 1'b1; wr = 1'b0; rd = 1'b0; wr_data = 8'b0;
    #10 reset = 1'b0; 
    #10 wr_data = 8'h01; wr = 1'b1;
    @(posedge clk);
    #10 wr_data = 8'h02; wr = 1'b1;
    @(posedge clk);
    #10 wr_data = 8'h03; wr = 1'b1;
    @(posedge clk);
    #10 wr_data = 8'h04; wr = 1'b1;
    @(posedge clk);
    #10 wr_data = 8'h05; wr = 1'b1;
    @(posedge clk);

    #10 rd = 1'b1; wr = 1'b0;
    @(posedge clk);
    #10 rd = 1'b1; wr = 1'b0;
    @(posedge clk);
    #10 rd = 1'b1; wr = 1'b0;
    @(posedge clk);
    #10 rd = 1'b1; wr = 1'b0;
    @(posedge clk);
    #10 rd = 1'b1; wr = 1'b0;
    @(posedge clk);
    #10 rd = 1'b1; wr = 1'b0;
    @(posedge clk);
    #10 $finish;
    
end

endmodule
