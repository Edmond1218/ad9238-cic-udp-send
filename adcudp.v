`timescale 1ns / 1ps

module adcudp(
	input rst_n,
	input sys_clk,
	input [3:0] key_in,
	input trigger,
	output [3:0] led,
	// ADC interface //
	input [11:0] ad1_data,
	input [11:0] ad2_data,
	output ad1_clk,
	output ad2_clk,
	// Ethernet interface //
	output e_reset,
   output e_mdc,
	inout  e_mdio,
	input	 e_rxc,                       //125Mhz ethernet gmii rx clock
	input	 e_rxdv,	
	input	 e_rxer,						
	input  [7:0] e_rxd,        
	input	 e_txc,                     //25Mhz ethernet mii tx clock         
	output e_gtxc,                    //25Mhz ethernet gmii tx clock  
	output e_txen, 
	output e_txer, 					
	output [7:0] e_txd,
	// DDR2 interface //
	output  [ 14: 0] mem_addr,
   output  [  2: 0] mem_ba,
   output           mem_cas_n,
   output  [  0: 0] mem_cke,
   inout   [  0: 0] mem_clk,
   inout   [  0: 0] mem_clk_n,
   output  [  0: 0] mem_cs_n,
   output  [  1: 0] mem_dm,
   inout   [ 15: 0] mem_dq,
   inout   [  1: 0] mem_dqs,
   output  [  0: 0] mem_odt,
   output           mem_ras_n,
   output           mem_we_n 
);
///////////////CLK//////////////////////
wire clk65m, locked, clk20m, clk5m;
wire rst_n1;
/////////////////RAM/////////////////////////
wire [31:0] ram_rd_data;
wire [7:0] ram_rd_addr;
////////////////Ethernet/////////////////
wire [15:0] tx_total_length;          //tx 的IP包的长度
wire [15:0] tx_data_length;           //tx 的UDP的数据包长度

reg oen;
//////////////Initialize and input control//////////////////
reg [7:0] addra;
reg [1:0] save_state;
reg [27:0] isample_cnt;
parameter init_delay = 28'd32500000;
parameter total_sample = 28'd130000;//5MHZ 130000, 65MHz 1690000
///////////////////DDR2///////////////////////
parameter DATA_WIDTH = 32;           //总线数据宽度
parameter ADDR_WIDTH = 28;           //总线地址宽度
parameter IDLE = 3'd0;
parameter MEM_READ = 3'd1;
parameter MEM_WRITE  = 3'd2; 
reg[2:0] state;
reg[2:0] next_state;
reg [ADDR_WIDTH - 1:0] wr_burst_addr;
reg [ADDR_WIDTH - 1:0] rd_burst_addr;
wire wr_burst_data_req;
wire rd_burst_data_valid;
reg  [9:0] wr_burst_len;
reg  [9:0] rd_burst_len;
reg  wr_burst_req;
reg  rd_burst_req;
wire [DATA_WIDTH - 1:0] wr_burst_data;
wire [DATA_WIDTH - 1:0] rd_burst_data;
wire [ADDR_WIDTH - 1:0]	local_address;   
wire local_write_req;
wire local_read_req;
wire [DATA_WIDTH - 1:0]	local_wdata;
wire [DATA_WIDTH/8 - 1:0]	local_be;   
wire [2:0]	local_size;
wire local_ready;
wire [DATA_WIDTH - 1:0]	local_rdata;
wire local_rdata_valid;
wire local_wdata_req;
wire local_init_done;
wire phy_clk;
wire aux_full_rate_clk;
wire aux_half_rate_clk;
wire rd_burst_finish;
wire wr_burst_finish;
reg  wr_finish;
reg  rd_finish;
///////////////////FIFO////////////////
wire [31:0] fifo_odata;
wire fifo_empty, fifo_full;
reg  fifo_wrreq;
reg fifo_clr;
/////////////////////////////////////////////
pll65m pll_inst(
	.inclk0(sys_clk),
	.areset(!rst_n),
	.c0(clk65m),
	.c1(clk5m),
	.c2(clk20m),
	.locked(locked)
);
assign rst_n1 = rst_n;
assign ad1_clk = clk65m;
assign ad2_clk = clk65m;

///////////////////NCO 14.95MHz sine wave generation///////////////////
wire [17:0] sin1495, cos1495;
wire nco_ovalid;

nco0 nco0_inst (
		.clk(clk65m),
		.clken(1'b1),
		.phi_inc_i(32'd198229260),
		.fsin_o(sin1495),
		.fcos_o(cos1495),
		.out_valid(nco_ovalid),
		.reset_n(rst_n1)
	);
////////////////Sine wave production/////////////////////////

wire [30:0] idata1, qdata1;

product product_sin1(
	.dataa({1'b0, ad1_data}),
	.datab(sin1495),
	.result(qdata1)
);

product product_cos1(
	.dataa({1'b0, ad1_data}),
	.datab(cos1495),
	.result(idata1)
);
////////////////CIC decimator////////////////////
wire [15:0] cidata1;
wire civaild1;
wire [1:0] cierror;

cic cic_i1(
		.in_error(2'b0),  //  av_st_in.error
		.in_valid(1'b1),  //          .valid
		.in_ready(open),  //          .ready
		.in_data(idata1[30:15]),   //          .in_data
		.out_data(cidata1),  // av_st_out.out_data
		.out_error(cierror), //          .error
		.out_valid(civaild1), //          .valid
		.out_ready(1'b1), //          .ready
		.clk(clk65m),       //     clock.clk
		.reset_n(rst_n1)    //     reset.reset_n
	);

wire [15:0] cqdata1;
wire cqvaild1;
wire [1:0] cqerror;

cic cic_q1(
		.in_error(2'b0),  //  av_st_in.error
		.in_valid(1'b1),  //          .valid
		.in_ready(open),  //          .ready
		.in_data(qdata1[30:15]),   //          .in_data
		.out_data(cqdata1),  // av_st_out.out_data
		.out_error(cqerror), //          .error
		.out_valid(cqvaild1), //          .valid
		.out_ready(1'b1), //          .ready
		.clk(clk65m),       //     clock.clk
		.reset_n(rst_n1)    //     reset.reset_n
	);
////////////////FIR filter////////////////////////////
wire [37:0] fidata1;

filter fir_i1(
		.clk(clk5m),              //                     clk.clk
		.reset_n(rst_n1),          //                     rst.reset_n
		.ast_sink_data(cidata1),    //   avalon_streaming_sink.data
		.ast_sink_valid(civaild1),   //                        .valid
		.ast_sink_error(cierror),   //                        .error
		.ast_source_data(fidata1),  // avalon_streaming_source.data
		.ast_source_valid(open), //                        .valid
		.ast_source_error(open)  //                        .error
	);

wire [37:0] fqdata1;

filter fir_q1(
		.clk(clk5m),              //                     clk.clk
		.reset_n(rst_n1),          //                     rst.reset_n
		.ast_sink_data(cqdata1),    //   avalon_streaming_sink.data
		.ast_sink_valid(cqvaild1),   //                        .valid
		.ast_sink_error(cqerror),   //                        .error
		.ast_source_data(fqdata1),  // avalon_streaming_source.data
		.ast_source_valid(open), //                        .valid
		.ast_source_error(open)  //                        .error
	);
///////////////////Key Scan///////////////////
reg [19:0] count2ms;
reg [3:0] key_scan;
reg [3:0] key_scan_d;
reg trigger_d, trigger_dd, trigger_ddd;
wire flag_trigger;

always @(posedge clk65m, negedge rst_n1) begin
	if(rst_n1 == 1'b0) begin
		key_scan <= 4'b0;
		key_scan_d <= 4'b0;
		trigger_d <= 1'b0;
		trigger_dd <= 1'b0;
		trigger_ddd <= 1'b0;
	end
	else begin
		key_scan <= key_in;
		key_scan_d <= key_scan;
		trigger_d <= trigger;
		trigger_dd <= trigger_d;
		trigger_ddd <= trigger_dd;
	end
end    
assign flag_trigger = (!trigger) & (!trigger_d) & trigger_dd & trigger_ddd;
///////////////////Init delay and fifo control////////////////
always @(posedge clk65m, negedge rst_n1) begin
	if(rst_n1 == 1'b0) begin
		save_state <= 2'b0;
		isample_cnt <= 28'b0;
		fifo_wrreq <= 1'b0;
		count2ms <= 20'd0;
		fifo_clr <= 1'b1;
	end
	else begin
		case(save_state)
			2'b00: begin
				if(flag_trigger) save_state <= 2'b01;
				else save_state <= 2'b00;
			end
			2'b01: begin
				if(count2ms ==20'd129999) begin
					count2ms <= 20'b0;
					save_state <= 2'b10;
					fifo_clr <= 1'b0;
				end
				else begin
					count2ms <= count2ms + 20'b1;
					save_state <= 2'b01;
					fifo_clr <= 1'b1;
				end
			end
			2'b10: begin
				if(wr_finish == 1'b1) begin
					save_state <= 2'b11;
					fifo_wrreq <= 1'b0;
					isample_cnt <= 28'b0;
					fifo_clr <= 1'b1;
				end
				else begin
					fifo_wrreq <= 1'b1;
					isample_cnt <= isample_cnt + 1'b1;
					save_state <= 2'b10;
					fifo_clr <= 1'b0;
				end
			end
			2'b11: begin
				if(rd_finish == 1'b1) save_state <= 2'b00;
				else save_state <= 2'b11;
			end
			default: begin
				save_state <= 2'b00;
			end
		endcase
	end
end
/////////Debug////////////////
wire [7:0] rdusedw;
reg [7:0] count;
/*always @(posedge clk65m) begin
	if(rst_n1 == 1'b0) begin
		count <= 8'b0;
	end
	else begin
		if(fifo_wrreq) begin
			if(count == 8'hff) begin
				count <= 8'b0;
			end
			else	count <= count + 1'b1;
		end
	end
end*/
reg [11:0] adcount;
always @(posedge clk65m) begin
	if(rst_n1 == 1'b0) begin
		adcount <= 12'b0;
	end
	else begin
		if(fifo_wrreq) begin
			if(adcount == 12'hfff) begin
				adcount <= 12'b0;
			end
			else	adcount <= adcount + 1'b1;
		end
		else adcount <= 12'b0;
	end
end
reg [15:0] debug1;
always @(posedge phy_clk) begin
	if(rst_n1 == 1'b0) begin
		debug1 <= 16'b0;
	end
	else begin
		if(wr_burst_data_req) debug1 <= debug1 + 1'b1;
	end
end
/////////////////Input data Temp//////////////////
fifo indata_temp(
	.aclr(fifo_clr),
	.data({fidata1[20:5], fqdata1[21:6]}), //{ad1_data, ad2_data}, {6{count}}
	.rdclk(phy_clk),
	.rdreq(wr_burst_data_req), // fifo_rdreq, wr_burst_data_req
	.wrclk(clk5m),
	.wrreq(fifo_wrreq),
	.q(fifo_odata),
	.rdempty(fifo_empty),
	.rdfull(fifo_full),
	.rdusedw(rdusedw)
	);
////////////////Memory DDR2 control/////////////////////
always@(posedge phy_clk) begin
	if(~local_init_done)          //等待初始化成功
		state <= IDLE;
	else	
		state <= next_state;
end
wire state_chg;
reg state_chg_d, state_chg_dd;
always @(posedge phy_clk) begin
	state_chg_d <= state_chg;
	state_chg_dd <= state_chg_d;
end

reg [2:0] read_state;
reg [1:0] write_state;
always@(posedge phy_clk, negedge rst_n1) begin
	if(rst_n1 == 1'b0) begin
		addra <= 8'b0;
		wr_finish <= 1'b0;
		next_state <= IDLE;
		wr_burst_addr <= {ADDR_WIDTH{1'b0}};
		rd_finish <= 1'b0;
		wr_burst_req <= 1'b0;
		rd_burst_addr <= {ADDR_WIDTH{1'b0}};
		oen <= 1'b0;
		write_state <= 2'b00;
		read_state <= 3'b0;
		count <= 8'b0;
	end
	else begin
		case(state)
			IDLE: begin
				next_state <= MEM_WRITE;
				wr_burst_addr <= {ADDR_WIDTH{1'b0}};
				wr_finish <= 1'b0;
				oen <= 1'b0;
				write_state <= 2'b00;
			end
			MEM_WRITE: begin
				rd_burst_req <= 1'b0;
				case(write_state)
					2'b00: begin
						if(rdusedw == 8'd252) begin
							wr_burst_req <= 1'b1;
							write_state <= 2'b01;
							count <= 8'b0;
						end
						else write_state <= 2'b00;
					end
					2'b01: begin
						if(count == 8'hff) begin
							count <= 8'b0;
							write_state <= 2'b10;
							wr_burst_req <= 1'b0;
							wr_burst_addr <= wr_burst_addr + {{(ADDR_WIDTH-9){1'b0}},9'd256};
						end
						else begin
							if(wr_burst_data_req) count <= count + 1'b1;
							write_state <= 2'b01;
						end
						/*
						if(wr_burst_finish) begin
							write_state <= 2'b10;
							wr_burst_req <= 1'b0;
						end
						else begin
							write_state <= 2'b01;
							wr_burst_req <= 1'b1;
						end
						*/
					end
					2'b10: begin
						wr_burst_req <= 1'b0;
						if(wr_burst_finish) begin
							write_state <= 2'b11;
						end
						else begin
							write_state <= 2'b10;
						end
						/*
						if(wr_burst_finish) begin
							write_state <= 2'b10;
						end
						else begin
							wr_burst_addr <= wr_burst_addr + {{(ADDR_WIDTH-9){1'b0}},9'd256};
							write_state <= 2'b11;
						end
						*/
					end
					2'b11: begin
						wr_burst_req <= 1'b0;
						if(wr_burst_finish) begin
							write_state <= 2'b11;
						end
						else begin
							write_state <= 2'b00;
							if(wr_burst_addr > total_sample) begin
								wr_finish <= 1'b1;
								rd_finish <= 1'b0;
								next_state <= MEM_READ;
								rd_burst_addr <= {ADDR_WIDTH{1'b0}};
								read_state <= 3'b0;
							end
							else begin
								wr_finish <= 1'b0;
							end
						end
					end
					default: begin
						write_state <= 2'b00;
					end
				endcase				
			end
			MEM_READ: begin
				wr_burst_req <= 1'b0;
				case(read_state)
					3'b000: begin
						oen <= 1'b0;
						if((ram_rd_addr == 8'd0) & (next_state == MEM_READ)) begin
							rd_burst_req <= 1'b1;
							addra <= 8'b0;
							read_state <= 3'b001;
						end
						else read_state <= 3'b000;
					end
					3'b001: begin
						if(rd_burst_data_valid) begin
							rd_burst_req <= 1'b0;
							if(addra == 8'd255) begin
								addra <= 8'd0;
							end
							else addra <= addra + 1'b1;
						end
						else begin
							rd_burst_req <= rd_burst_req;
						end
						if(rd_burst_finish) begin
							read_state <= 3'b010;
							oen <= 1'b0;
							rd_burst_req <= 1'b0;
						end
						else read_state <= 3'b001;
					end
					3'b010: begin
						if(state_chg_d) begin
							oen <= 1'b1;
							read_state <= 3'b011;
						end
					end
					3'b011: begin
						if(state_chg_d == 1'b0) begin
							oen <= 1'b0;
							read_state <= 3'b100;
						end
					end
					3'b100: begin
						if(state_chg_d) begin
							read_state <= 3'b101;
							rd_burst_addr <= rd_burst_addr + {{(ADDR_WIDTH-9){1'b0}},9'd256};
						end
						else read_state <= 3'b100;
					end
					3'b101: begin
						if(rd_burst_addr > total_sample) begin
							read_state <= 3'b100;
						end
						else read_state <= 3'b000;
					end
					3'b100: begin
						rd_finish <= 1'b1;
						next_state <= IDLE;
						wr_finish <= 1'b0;
						wr_burst_addr <= {ADDR_WIDTH{1'b0}};
						rd_burst_req <= 1'b0;
						read_state <= 3'b000;
					end
					default: begin
						read_state <= 3'b000;
					end
				endcase
			end
			default:
				next_state <= IDLE;
		endcase
	end
end

assign wr_burst_data = {fifo_odata[31:16], fifo_odata[15:0]};//{debug1} {4'b0, fifo_odata[23:12], 4'b0, fifo_odata[11:0]};     //写入DDR的数据

mem_burst_v2
#(
	.MEM_DATA_BITS(DATA_WIDTH)
)
mem_burst_m0(
	.rst_n(rst_n1),
	.mem_clk(phy_clk),
	.rd_burst_req(rd_burst_req),
	.wr_burst_req(wr_burst_req),
	.rd_burst_len(10'd256),
	.wr_burst_len(10'd256),
	.rd_burst_addr(rd_burst_addr),
	.wr_burst_addr(wr_burst_addr),
	.rd_burst_data_valid(rd_burst_data_valid),
	.wr_burst_data_req(wr_burst_data_req),
	.rd_burst_data(rd_burst_data),
	.wr_burst_data(wr_burst_data),
	.rd_burst_finish(rd_burst_finish),
	.wr_burst_finish(wr_burst_finish),
	///////////////////
	.local_init_done(local_init_done),
	.local_ready(local_ready),
	.local_burstbegin(local_burstbegin),
	.local_wdata(local_wdata),
	.local_rdata_valid(local_rdata_valid),
	.local_rdata(local_rdata),
	.local_write_req(local_write_req),
	.local_read_req(local_read_req),
	.local_address(local_address),
	.local_be(local_be),
	.local_size(local_size)
);

ddr2 ddr_m0(
	.local_address(local_address),
	.local_write_req(local_write_req),
	.local_read_req(local_read_req),
	.local_wdata(local_wdata),
	.local_be(local_be),
	.local_size(local_size),
	.global_reset_n(rst_n1),
	//.local_refresh_req(1'b0), 
	//.local_self_rfsh_req(1'b0),
	.pll_ref_clk(sys_clk),
	.soft_reset_n(1'b1),
	.local_ready(local_ready),
	.local_rdata(local_rdata),
	.local_rdata_valid(local_rdata_valid),
	.reset_request_n(),
	.mem_cs_n(mem_cs_n),
	.mem_cke(mem_cke),
	.mem_addr(mem_addr),
	.mem_ba(mem_ba),
	.mem_ras_n(mem_ras_n),
	.mem_cas_n(mem_cas_n),
	.mem_we_n(mem_we_n),
	.mem_dm(mem_dm),
	.local_refresh_ack(),
	.local_burstbegin(local_burstbegin),
	.local_init_done(local_init_done),
	.reset_phy_clk_n(),
	.phy_clk(phy_clk),
	.aux_full_rate_clk(),
	.aux_half_rate_clk(),
	.mem_clk(mem_clk),
	.mem_clk_n(mem_clk_n),
	.mem_dq(mem_dq),
	.mem_dqs(mem_dqs),
	.mem_odt(mem_odt)
	);
////////////////////////Output data Temp////////////////
ram outdata_temp(
  .wrclock(phy_clk),           // input write clock
  .wren(rd_burst_data_valid),                // input [0 : 0] ram write enable
  .wraddress(addra),         // input [8 : 0] ram write address
  .data({rd_burst_data}),               // input [31 : 0] ram write data
  .rdclock(e_rxc),           // input read clock
  .rdaddress(ram_rd_addr),   // input [8 : 0] ram read address
  .q(ram_rd_data)            // output [31 : 0] ram read data
);
//////////////////Ethernet Transmit////////////////
assign e_gtxc=e_rxc;	                //gtxc输出125Mhz的时钟
assign e_reset = 1'b1; 
assign tx_data_length=16'd1032;
assign tx_total_length=16'd1052;

udp u1(
	.reset_n(rst_n1),
	.e_rxc(e_rxc),
	.e_rxd(e_rxd),
   .e_rxdv(e_rxdv),
	.e_txen(e_txen),
	.e_txd(e_txd),
	.e_txer(e_txer),		
	
	.ram_rd_data({ram_rd_data}), 
	.tx_data_length(tx_data_length),                //发送IP包的数据长度/	
	.tx_total_length(tx_total_length),              //接发送IP包的总长度/
	.ram_rd_addr(ram_rd_addr),
	.rdreq(state_chg),
	.oen(oen)
	);
	
assign led[0] = trigger;
assign led[1] = (state == MEM_WRITE)? 1'b0: 1'b1;
assign led[2] = (state == MEM_READ)? 1'b0: 1'b1;
assign led[3] = (save_state == 2'b00)? 1'b0:1'b1;
	
endmodule
