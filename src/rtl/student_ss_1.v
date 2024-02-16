//-----------------------------------------------------------------------------
// File          : student_ss_1.v
// Creation date : 15.02.2024
// Creation time : 15:31:23
// Description   : 
// Created by    : 
// Tool : Kactus2 3.13.1 64-bit
// Plugin : Verilog generator 2.4
// This file was generated based on IP-XACT component tuni.fi:subsystem:student_ss_1:1.0
// whose XML file is C:/Users/kayra/Documents/repos/tau-ipxact/tuni.fi/subsystem/student_ss_1/1.0/student_ss_1.1.0.xml
//-----------------------------------------------------------------------------
/*
  Contributors:
    * Matti Käyrä (matti.kayra@tuni.fi)
  Description:
    * example student area rtl code with off chip gpio interface 
    * original interface created with kactus2. Do not rewrite from kactus.
*/
module student_ss_1(
    // Interface: APB
    input    logic            [31:0]         PADDR,
    input    logic                           PENABLE,
    input     logic                          PSEL,
    input    logic            [31:0]         PWDATA,
    input     logic                          PWRITE,
    output    logic          [31:0]         PRDATA,
    output    logic                          PREADY,
    output    logic                          PSELERR,

    // Interface: Clock
    input  logic                        clk_in,

    // Interface: IRQ
    output   logic                           irq_1,

    // Interface: Reset
    input    logic                           reset_int,

    // Interface: gpio
    input     logic           [1:0]          gpi_i,
    output    logic           [1:0]          gpio_oe,
    output     logic          [1:0]          gpo_o,

    // Interface: ss_ctrl
    input     logic                          irq_en_1,
    input      logic          [7:0]          ss_ctrl_1
);

  logic [31:0] field_0;
  logic [31:0] field_1;

  always_ff @(posedge clk or negedge rst_n)
  output_w_r: begin
    if (~rst_n) begin
      PSLVERR_reg <=1'b0;
      PRDATA_reg  <='d0;
      PREADY_reg  <=1'b0;
      field_0 <= 32'd0;
      field_1 <= 32'd0;

    end
    else begin
      field_1[1:0] <= gpi_i;


      if(PSEL) begin
        //if access already happened, cut the response signals
        if (PREADY_reg == 1 && PSLVERR_reg == 1 ) begin
          PSLVERR_reg <= 1'b0;
          // error signal does not require it's own process as it
          // can't be without ready
          PREADY_reg <= 1'b0;
        end
        else if (PREADY_reg == 1) begin
          PREADY_reg <= 1'b0;
        end
        else if(PWRITE) begin // write 
            if(PADDR == 0) begin
              field_0 <= PWDATA;
              PSLVERR_reg <= 1'b0;
              PREADY_reg  <= 1'b1;
            end
            else begin // psel
                PSLVERR_reg <= 1'b0;
                PREADY_reg  <= 1'b0;
            end
        end
        else begin // read
            if(PADDR == 0) begin
              PRDATA_reg <= field_0;
              PSLVERR_reg <= 1'b0;
              PREADY_reg  <= 1'b1;
            end
            if(PADDR == 4) begin
              PRDATA_reg <= field_1;
              PSLVERR_reg <= 1'b0;
              PREADY_reg  <= 1'b1;
            end
        end
      end
      else begin // psel
        PSLVERR_reg <= 1'b0;
        PREADY_reg  <= 1'b0;
      end
    end
  end

  always_comb
    output_assignment : begin

    PSLVERR <= PSLVERR_reg;
    PRDATA  <= PRDATA_reg;
    PREADY  <= PREADY_reg;

    gpo_o <= field_0 [1:0];
  end

assign irq = 1'b0;

/////// SVA /////////

`ifndef SYNTHESIS
// insert here unsynthesizeable verification assertions.
`endif


endmodule
