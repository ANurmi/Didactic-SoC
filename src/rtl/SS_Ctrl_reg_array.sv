//-----------------------------------------------------------------------------
// File          : SS_Ctrl_reg_array.v
// Creation date : 23.02.2024
// Creation time : 12:38:00
// Description   : 
// Created by    : 
// Tool : Kactus2 3.13.1 64-bit
// Plugin : Verilog generator 2.4
// This file was generated based on IP-XACT component tuni.fi:ip:SS_Ctrl_reg_array:1.0
// whose XML file is C:/Users/kayra/Documents/repos/tau-ipxact/ipxact/tuni.fi/ip/SS_Ctrl_reg_array/1.0/SS_Ctrl_reg_array.1.0.xml
//-----------------------------------------------------------------------------
/*
  Contributors:
    * Matti Käyrä (matti.kayra@tuni.fi)
  Description:
    * Interface generated by kactus2, then manually continued and edited
    * This initial created manually. 
    * same functionality can be later created by TAU Kamel tool automatically from IPXACT
*/
module SS_Ctrl_reg_array #(
    parameter IOCELL_CFG_W     = 5,    
    parameter IOCELL_COUNT     = 28,    // update this value manually to match cell numbers
    parameter AW = 32,
    parameter DW = 32,
    parameter SS_CTRL_W = 31 // configurable up to 31 bits
) (
    // Interface: BootSel
    input  logic bootsel,

    // Interface: Clock
    input  logic clk,

    // Interface: Reset
    input  logic reset,

    // Interface: icn_ss_ctrl
    output logic [SS_CTRL_W-1:0]          ss_ctrl_icn,

    // Interface: io_cfg
    output logic [(IOCELL_CFG_W*IOCELL_COUNT)-1:0] cell_cfg,

    // Interface: mem_reg_if
    input  logic [AW-1:0] addr_in,
    input  logic [DW/8-1:0]  be_in,
    input  logic        req_in,
    input  logic [DW-1:0] wdata_in,
    input  logic        we_in,
    output logic [DW-1:0] rdata_out,

    // Interface: rst_icn
    output logic reset_icn,

    // Interface: rst_ss_0
    output logic reset_ss_0,

    // Interface: rst_ss_1
    output logic reset_ss_1,

    // Interface: rst_ss_2
    output logic reset_ss_2,

    // Interface: rst_ss_3
    output logic reset_ss_3,

    // Interface: ss_ctrl_0
    output logic irq_en_0,
    output logic [SS_CTRL_W-1:0]          ss_ctrl_0,

    // Interface: ss_ctrl_1
    output logic irq_en_1,
    output logic [SS_CTRL_W-1:0]          ss_ctrl_1,

    // Interface: ss_ctrl_2
    output logic irq_en_2,
    output logic [SS_CTRL_W-1:0]          ss_ctrl_2,

    // Interface: ss_ctrl_3
    output logic irq_en_3,
    output logic [SS_CTRL_W-1:0]          ss_ctrl_3,

    // Interface: pmod_ctrl
    output logic [7:0] pmod_sel
);
  `ifdef VERILATOR
    `include "verification/verilator/src/hdl/SS_Ctrl_reg_array.sv"
  `endif

  logic [31:0] bootSel_reg;
  logic [31:0] ss_rst_reg;
  logic [31:0] icn_rst_ctrl_reg;
  logic [31:0] ss_0_ctrl_reg;
  logic [31:0] ss_1_ctrl_reg;
  logic [31:0] ss_2_ctrl_reg;
  logic [31:0] ss_3_ctrl_reg;
  logic [31:0] ss_ctrl_reserved_0_reg;
  logic [31:0] ss_ctrl_reserved_1_reg;
  logic [31:0] io_cell_cfg_reg;
  logic [31:0] io_cell_cfg_1_reg;
  logic [31:0] io_cell_cfg_2_reg;
  logic [31:0] io_cell_cfg_3_reg;
  logic [31:0] io_cell_cfg_4_reg;
  logic [31:0] io_cell_cfg_5_reg;
  logic [31:0] io_cell_cfg_6_reg;
  logic [31:0] io_cell_cfg_7_reg;
  logic [31:0] io_cell_cfg_8_reg;
  logic [31:0] pmod_sel_reg;

    // FFs for write or read/write registers
    always_ff @( posedge clk or negedge reset )
    begin : control_register_ff
    if (~reset) begin
        bootSel_reg <= 'h0;
        ss_rst_reg <= 'h0;
        icn_rst_ctrl_reg <= 'h0;
        ss_0_ctrl_reg <= 'h0;
        ss_1_ctrl_reg <= 'h0;
        ss_2_ctrl_reg <= 'h0;
        ss_3_ctrl_reg <= 'h0;
        ss_ctrl_reserved_0_reg <= 'h0;
        ss_ctrl_reserved_1_reg <= 'h0;
        io_cell_cfg_reg <= 'h0;
        io_cell_cfg_1_reg <= 'h0;
        io_cell_cfg_2_reg <= 'h0;
        io_cell_cfg_3_reg <= 'h0;
        io_cell_cfg_4_reg <= 'h0;
        io_cell_cfg_5_reg <= 'h0;
        io_cell_cfg_6_reg <= 'h0;
        io_cell_cfg_7_reg <= 'h0;
        io_cell_cfg_8_reg <= 'h0;
        pmod_sel_reg <= 'h0;
    end
    else begin
      bootSel_reg[0] = bootsel;

    
     if (we_in) begin 
        case (addr_in)

        'h0: begin
            bootSel_reg[31:1] <= wdata_in[ 31:1 ];
        end
        'h4: begin
            ss_rst_reg <= wdata_in[ 31:0 ];
        end
        'h8: begin
            ss_0_ctrl_reg <= wdata_in[ 31:0 ];
        end
        'hC: begin
            ss_1_ctrl_reg <= wdata_in[ 31:0 ];
        end
        'h10: begin
            ss_2_ctrl_reg <= wdata_in[ 31:0 ];
        end
        'h18: begin
            ss_3_ctrl_reg <= wdata_in[ 31:0 ];
        end
        'h20: begin
            ss_ctrl_reserved_0_reg <= wdata_in[ 31:0 ];
        end
        'h24: begin
            ss_ctrl_reserved_1_reg <= wdata_in[ 31:0 ];
        end
        'h28: begin
            io_cell_cfg_reg <= wdata_in[ 31:0 ];
        end
        'h30: begin
            io_cell_cfg_1_reg <= wdata_in[ 31:0 ];
        end
        'h34: begin
            io_cell_cfg_2_reg <= wdata_in[ 31:0 ];
        end
        'h38: begin
            io_cell_cfg_3_reg <= wdata_in[ 31:0 ];
        end
        'h40: begin
            io_cell_cfg_4_reg <= wdata_in[ 31:0 ];
        end
        'h44: begin
            io_cell_cfg_5_reg <= wdata_in[ 31:0 ];
        end
        'h48: begin
            io_cell_cfg_6_reg <= wdata_in[ 31:0 ];
        end
        'h50: begin
            io_cell_cfg_7_reg <= wdata_in[ 31:0 ];
        end
        'h54: begin
            io_cell_cfg_8_reg <= wdata_in[ 31:0 ];
        end
        'h58: begin
            pmod_sel_reg <= wdata_in[ 31:0 ];
        end
        endcase
     end
    end
    end // control_register_ff

    always_comb // read process
    begin : read_logic
      rdata_out = 0;
      case(addr_in)

        'h0: begin
            rdata_out =bootSel_reg;
        end
        'h4: begin
            rdata_out =ss_rst_reg;
        end
        'h8: begin
            rdata_out =ss_0_ctrl_reg;
        end
        'h10: begin
            rdata_out =ss_2_ctrl_reg;
        end
        'h18: begin
            rdata_out =ss_3_ctrl_reg;
        end
        'h20: begin
            rdata_out =ss_ctrl_reserved_0_reg;
        end
        'h24: begin
            rdata_out =ss_ctrl_reserved_1_reg;
        end
        'h28: begin
            rdata_out = io_cell_cfg_reg;
        end
        'h30: begin
            rdata_out =io_cell_cfg_1_reg;
        end
        'h34: begin
            rdata_out =io_cell_cfg_2_reg;
        end
        'h38: begin
            rdata_out =io_cell_cfg_3_reg;
        end
        'h40: begin
            rdata_out =io_cell_cfg_4_reg;
        end
        'h44: begin
            rdata_out =io_cell_cfg_5_reg;
        end
        'h48: begin
            rdata_out =io_cell_cfg_6_reg;
        end
        'h50: begin
            rdata_out =io_cell_cfg_7_reg;
        end
        'h54: begin
            rdata_out =io_cell_cfg_8_reg;
        end
        'h54: begin
            rdata_out =pmod_sel_reg;
        end
    endcase
end // read_logic

// assign ins


// assign outs


assign reset_icn = ss_rst_reg[0];
assign reset_ss_0 = ss_rst_reg[1];
assign reset_ss_1 = ss_rst_reg[2];
assign reset_ss_2 = ss_rst_reg[3];
assign reset_ss_3 = ss_rst_reg[4];
assign irq_en_0 = ss_0_ctrl_reg[31];
assign ss_ctrl_0 = ss_0_ctrl_reg[SS_CTRL_W-1:0];
assign irq_en_1 =ss_1_ctrl_reg[31];
assign ss_ctrl_1 = ss_1_ctrl_reg[SS_CTRL_W-1:0];
assign irq_en_2 =ss_2_ctrl_reg[31] ;
assign ss_ctrl_2 = ss_2_ctrl_reg[SS_CTRL_W-1:0];
assign irq_en_3 = ss_3_ctrl_reg[31];
assign ss_ctrl_3 = ss_3_ctrl_reg[SS_CTRL_W-1:0];
assign ss_ctrl_icn = icn_rst_ctrl_reg[SS_CTRL_W-1:0];


//  continuos reg assigns for now
assign cell_cfg[31:0]  = io_cell_cfg_reg;
assign cell_cfg[63:32]  = io_cell_cfg_1_reg;
assign cell_cfg[95:64]  = io_cell_cfg_2_reg;
assign cell_cfg[119:96]  = io_cell_cfg_3_reg[23:0];
// 127
//assign cell_cfg[139:128]  = io_cell_cfg_4_reg[10:0];

assign pmod_sel = pmod_sel_reg;


// this can be recreated by kamel once memory design is finalized
endmodule
