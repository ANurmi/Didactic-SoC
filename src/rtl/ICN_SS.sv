//-----------------------------------------------------------------------------
// File          : ICN_SS.v
// Creation date : 19.02.2024
// Creation time : 15:01:06
// Description   : 
// Created by    : 
// Tool : Kactus2 3.13.1 64-bit
// Plugin : Verilog generator 2.4
// This file was generated based on IP-XACT component tuni.fi:interconnect:ICN_SS:1.0
// whose XML file is C:/Users/kayra/Documents/repos/tau-ipxact/ipxact/tuni.fi/interconnect/ICN_SS/1.0/ICN_SS.1.0.xml
//-----------------------------------------------------------------------------
/*
  Contributors:
    * Matti Käyrä (matti.kayra@tuni.fi)
  Description:
    * example "interconnect"
    * splits axi4 to apb
    * interface generated by kactus2
*/
module ICN_SS #(
    parameter APB_AW           = 32,
    parameter APB_DW           = 32,
    parameter APB_TARGETS      = 4,
    parameter AXI_AW           = 32,
    parameter AXI_DW           = 32,
    parameter AXI_IDW          = 10,
    parameter AXI_USERW        = 1,
    parameter SS_CTRL_W        = 8
) (
    // Interface: AXI
    input   logic [AXI_AW-1:0]              AR_ADDR,
    input   logic [1:0]                     AR_BURST,
    input   logic [3:0]                     AR_CACHE,
    input   logic [AXI_IDW-1:0]             AR_ID,
    input   logic [7:0]                     AR_LEN,
    input   logic                           AR_LOCK,
    input   logic [2:0]                     AR_PROT,
    input   logic [3:0]                     AR_QOS,
    input   logic [2:0]                     AR_REGION,
    input   logic [2:0]                     AR_SIZE,
    input   logic [AXI_USERW-1:0]           AR_USER,
    input   logic                           AR_VALID,
    input   logic [AXI_AW-1:0]              AW_ADDR,
    input   logic [5:0]                     AW_ATOP,
    input   logic [1:0]                     AW_BURST,
    input   logic [3:0]                     AW_CACHE,
    input   logic [AXI_IDW-1:0]             AW_ID,
    input   logic [7:0]                     AW_LEN,
    input   logic                           AW_LOCK,
    input   logic [2:0]                     AW_PROT,
    input   logic [3:0]                     AW_QOS,
    input   logic [3:0]                     AW_REGION,
    input   logic [2:0]                     AW_SIZE,
    input   logic [AXI_USERW-1:0]           AW_USER,
    input   logic                           AW_VALID,
    input   logic                           B_READY,
    input   logic                           R_READY,
    input   logic [AXI_DW-1:0]              W_DATA,
    input   logic                           W_LAST,
    input   logic [(AXI_DW/8)-1:0]          W_STROBE,
    input   logic [AXI_USERW-1:0]           W_USER,
    input   logic                           W_VALID,
    output  logic                           AR_READY,
    output  logic                           AW_READY,
    output  logic [AXI_IDW-1:0]             B_ID,
    output  logic [1:0]                     B_RESP,
    output  logic [AXI_USERW-1:0]           B_USER,
    output  logic                           B_VALID,
    output  logic [AXI_DW-1:0]              R_DATA,
    output  logic [AXI_IDW-1:0]             R_ID,
    output  logic                           R_LAST,
    output  logic [1:0]                     R_RESP,
    output  logic [AXI_USERW-1:0]           R_USER,
    output  logic                           R_VALID,
    output  logic                           W_READY,

    // Interface: Clock
    input  logic                            clk,

    // Interface: Reset
    input  logic                            reset_int,

    // Interface: SS_Ctrl
    input  logic [SS_CTRL_W-1:0]            ss_ctrl_icn,

    // There ports are contained in many interfaces
    input  logic [(APB_DW*APB_TARGETS)-1:0] PRDATA,
    input  logic [APB_TARGETS-1:0]          PREADY,
    input  logic [APB_TARGETS-1:0]          PSLVERR,
    output logic [APB_AW-1:0]               PADDR,
    output logic                            PENABLE,
    output logic [APB_TARGETS-1:0]          PSEL,
    output logic [APB_DW-1:0]               PWDATA,
    output logic                            PWRITE
);
  `ifdef VERILATOR
    `include "verification/verilator/src/hdl/ICN_SS.sv"
  `endif

  AXI_BUS #(
    .AXI_ADDR_WIDTH(AXI_AW), 
    .AXI_DATA_WIDTH(AXI_DW), 
    .AXI_ID_WIDTH(AXI_IDW), 
    .AXI_USER_WIDTH(AXI_USERW)
  ) axi4bus ();
  
  AXI_LITE #(
   .AXI_ADDR_WIDTH(AXI_AW),
   .AXI_DATA_WIDTH(AXI_DW)
  ) axi4lite_bus ();

  // Assign axi to sv interface
  assign axi4bus.ar_addr = AR_ADDR;
  assign axi4bus.ar_burst = AR_BURST;
  assign axi4bus.ar_cache = AR_CACHE;
  assign axi4bus.ar_id = AR_ID;
  assign axi4bus.ar_len = AR_LEN;
  assign axi4bus.ar_lock = AR_LOCK;
  assign axi4bus.ar_prot = AR_PROT;
  assign axi4bus.ar_qos = AR_QOS;
  assign axi4bus.ar_region = AR_REGION;
  assign axi4bus.ar_size = AR_SIZE;
  assign axi4bus.ar_user = AR_USER;
  assign axi4bus.ar_valid = AR_VALID;
  assign axi4bus.aw_addr = AW_ADDR;
  assign axi4bus.aw_atop = AW_ATOP;
  assign axi4bus.aw_burst = AW_BURST;
  assign axi4bus.aw_cache = AW_CACHE;
  assign axi4bus.aw_id = AW_ID;
  assign axi4bus.aw_len = AW_LEN;
  assign axi4bus.aw_lock = AW_LOCK;
  assign axi4bus.aw_prot = AW_PROT;
  assign axi4bus.aw_qos = AW_QOS;
  assign axi4bus.aw_region = AW_REGION;
  assign axi4bus.aw_size = AW_SIZE;
  assign axi4bus.aw_user = AW_USER;
  assign axi4bus.aw_valid = AW_VALID;
  assign axi4bus.b_ready = B_READY;
  assign axi4bus.r_ready = R_READY;
  assign axi4bus.w_data = W_DATA;
  assign axi4bus.w_last = W_LAST;
  assign axi4bus.w_strb = W_STROBE;
  assign axi4bus.w_user = W_USER;
  assign axi4bus.w_valid = W_VALID;
  //
  assign AR_READY = axi4bus.ar_ready;
  assign AW_READY = axi4bus.aw_ready;
  assign B_ID = axi4bus.b_id;
  assign B_RESP = axi4bus.b_resp;
  assign B_USER = axi4bus.b_user;
  assign B_VALID = axi4bus.b_valid;
  assign R_DATA = axi4bus.r_data;
  assign R_ID = axi4bus.r_id;
  assign R_LAST = axi4bus.r_last;
  assign R_RESP = axi4bus.r_resp;
  assign R_USER = axi4bus.r_user;
  assign R_VALID = axi4bus.r_valid;
  assign W_READY = axi4bus.w_ready;

  axi_to_axi_lite_intf #(
  .AXI_ADDR_WIDTH(AXI_AW),
  .AXI_DATA_WIDTH(AXI_DW),
  .AXI_ID_WIDTH(AXI_IDW),
  .AXI_USER_WIDTH(AXI_USERW)
  )
  i_axi_to_axi_lite(
    .clk_i(clk),
    .rst_ni(reset_int),
    .testmode_i(1'b0),
    .slv(axi4bus),
    .mst(axi4lite_bus)
  );

  // TODO: Finalize APB addr decoding
  localparam NoAddrRules =APB_TARGETS;
  localparam ADDR_BASE=32'h1900_0000;
  localparam APB_SIZE='h100;

  typedef axi_pkg::xbar_rule_32_t rule_t;

  rule_t [NoAddrRules-1:0] AddrMapAPB;
  // TODO: finalize Address table based on APB Subsystems
  assign AddrMapAPB = '{
                         '{idx: 32'd3, start_addr: ADDR_BASE+APB_SIZE*3, end_addr: ADDR_BASE+APB_SIZE*4-1},
                         '{idx: 32'd2, start_addr: ADDR_BASE+APB_SIZE*2, end_addr: ADDR_BASE+APB_SIZE*3-1},
                         '{idx: 32'd1, start_addr: ADDR_BASE+APB_SIZE*1, end_addr: ADDR_BASE+APB_SIZE*2-1},
                         '{idx: 32'd0, start_addr: ADDR_BASE+APB_SIZE*0, end_addr: ADDR_BASE+APB_SIZE*1-1}
                         };

  axi_lite_to_apb_intf #(
    .NoApbSlaves(APB_TARGETS),
    .NoRules(NoAddrRules),
    .AddrWidth(AXI_AW),
    .DataWidth(AXI_DW),
    .rule_t(rule_t)
    )
  i_axi_lite_to_apb_intf(
    .clk_i(clk),
    .rst_ni(reset_int),
    // axi4lite
    .slv(axi4lite_bus),
    // apb
    .paddr_o(PADDR),
    .pprot_o(),
    .pselx_o(PSEL),
    .penable_o(PENABLE),
    .pwrite_o(PWRITE),
    .pwdata_o(PWDATA),
    .pstrb_o(),
    .pready_i(PREADY),
    .prdata_i(PRDATA),
    .pslverr_i(PSLVERR),
    // address rules
    .addr_map_i(AddrMapAPB)
  );


endmodule
