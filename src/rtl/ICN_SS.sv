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
    * splits axi4lite to apb
    * interface generated by kactus2
*/

`ifdef VERILATOR
  `include "verification/verilator/src/hdl/nms/ICN_SS.sv"
`endif

module ICN_SS #(
    parameter APB_AW           = 32,
    parameter APB_DW           = 32,
    parameter APB_TARGETS      = 4,
    parameter AXI4LITE_AW      = 32,
    parameter AXI4LITE_DW      = 32,
    parameter SS_CTRL_W        = 8
) (

    // AXI4LITE
    input  logic [AXI4LITE_AW-1:0]     icn_ar_addr_in,
    input  logic                       icn_ar_valid_in,
    input  logic [AXI4LITE_AW-1:0]     icn_aw_addr_in,
    input  logic                       icn_aw_valid_in,
    input  logic                       icn_b_ready_in,
    input  logic                       icn_r_ready_in,
    input  logic [AXI4LITE_DW-1:0]     icn_w_data_in,
    input  logic [(AXI4LITE_DW/8)-1:0] icn_w_strb_in,
    input  logic                       icn_w_valid_in,
    output logic                       icn_ar_ready_out,
    output logic                       icn_aw_ready_out,
    output logic [1:0]                 icn_b_resp_out,
    output logic                       icn_b_valid_out,
    output logic [AXI4LITE_DW-1:0]     icn_r_data_out,
    output logic [1:0]                 icn_r_resp_out,
    output logic                       icn_r_valid_out,
    output logic                       icn_w_ready_out,

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
    `include "verification/verilator/src/hdl/ms/ICN_SS.sv"
  `endif
  
  AXI_LITE #(
   .AXI_ADDR_WIDTH(AXI4LITE_AW),
   .AXI_DATA_WIDTH(AXI4LITE_DW)
  ) axi4lite_bus ();

// Interface: AXI4LITE_icn
  assign axi4lite_bus.ar_addr  = icn_ar_addr_in;
  assign axi4lite_bus.ar_valid = icn_ar_valid_in;
  assign axi4lite_bus.aw_addr  = icn_aw_addr_in;
  assign axi4lite_bus.aw_valid = icn_aw_valid_in;
  assign axi4lite_bus.b_ready  = icn_b_ready_in;
  assign axi4lite_bus.r_ready  = icn_r_ready_in;
  assign axi4lite_bus.w_data   = icn_w_data_in;
  assign axi4lite_bus.w_strb   = icn_w_strb_in;
  assign axi4lite_bus.w_valid  = icn_w_valid_in;
  //
  assign icn_ar_ready_out = axi4lite_bus.ar_ready;
  assign icn_aw_ready_out = axi4lite_bus.aw_ready;
  assign icn_b_resp_out   = axi4lite_bus.b_resp;
  assign icn_b_valid_out  = axi4lite_bus.b_valid;
  assign icn_r_data_out   = axi4lite_bus.r_data;
  assign icn_r_resp_out   = axi4lite_bus.r_resp;
  assign icn_r_valid_out  = axi4lite_bus.r_valid;
  assign icn_w_ready_out  = axi4lite_bus.w_ready;
  
  assign axi4lite_bus.ar_prot = 'd0;
  assign axi4lite_bus.aw_prot = 'd0;


  // TODO: Finalize APB addr decoding
  localparam NoAddrRules = APB_TARGETS;
  localparam ADDR_BASE   = 32'h0105_0000;
  localparam APB_SIZE    = 'h1000;

  axi_pkg::xbar_rule_32_t [NoAddrRules-1:0] AddrMapAPB;
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
    .AddrWidth(AXI4LITE_AW),
    .DataWidth(AXI4LITE_DW),
    .rule_t(axi_pkg::xbar_rule_32_t)
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
