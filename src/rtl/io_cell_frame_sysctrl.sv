//-----------------------------------------------------------------------------
// File          : i_io_cell_frame.sv
// Creation date : 02.02.2024
// Creation time : 12:20:14
// Description   :
// Created by    :
// Tool : Kactus2 3.13.0 64-bit
// Plugin : Verilog generator 2.4
//  component tuni.fi:subsystem.io:i_io_cell_frame:1.0
// whose XML file ipxact/tuni.fi/subsystem.io/i_io_cell_frame/1.0/i_io_cell_frame.1.0.xml
//-----------------------------------------------------------------------------
/*
  Contributors:
    * Matti Käyrä (matti.kayra@tuni.fi)
  Description:
    * This file was originally generated by kactus2 based on IP-XACT
    * Contains SoC IO cells
*/

`ifdef VERILATOR
  `include "verification/verilator/src/hdl/nms/io_cell_frame_sysctrl.sv"
`endif

module io_cell_frame_sysctrl #(
    parameter IOCELL_CFG_W = 5,
    // count and modify according to cells
    parameter IOCELL_COUNT = 26,
    parameter NUM_GPIO = 8
  )(

    // Interface: Cfg
    input  logic [(IOCELL_CFG_W*IOCELL_COUNT)-1:0] cell_cfg,

    // Interface: Clock
    inout  wire        clk_in,

    // Interface: Clock_internal
    output logic       clk_internal,

    // Interface: GPIO
    inout  wire  [NUM_GPIO-1:0] gpio,

    // Interface: GPIO_internal
    input  logic [NUM_GPIO-1:0] gpio_from_core,
    output logic [NUM_GPIO-1:0] gpio_to_core,

    // Interface: JTAG
    inout  wire        jtag_tck,
    inout  wire        jtag_tdi,
    inout  wire        jtag_tdo,
    inout  wire        jtag_tms,
    inout  wire        jtag_trst,

    // Interface: JTAG_internal
    input  logic       jtag_tdo_internal,
    output logic       jtag_tck_internal,
    output logic       jtag_tdi_internal,
    output logic       jtag_tms_internal,
    output logic       jtag_trst_internal,

    // Interface: Reset
    inout  wire        reset,

    // Interface: Reset_internal
    output logic       reset_internal,

    // Interface: SPI
    inout  wire  [1:0] spi_csn,
    inout  wire  [3:0] spi_data,
    inout  wire        spi_sck,

    // Interface: SPI_internal
    input  logic [1:0] spim_csn_internal,
    input  logic [3:0] spim_mosi_internal,
    input  logic       spim_sck_internal,
    output logic [3:0] spim_miso_internal,

    // Interface: UART
    inout  wire        uart_rx,
    inout  wire        uart_tx,

    // Interface: UART_internal
    input  logic       uart_tx_internal,
    output logic       uart_rx_internal
  );
  `ifdef VERILATOR
    `include "verification/verilator/src/hdl/ms/io_cell_frame_sysctrl.sv"
  `endif

  // jtag, reset and clk not configurable to avoid locking SoC

  // reset
  io_cell_wrapper#(.CELL_TYPE(2), .IOCELL_CFG_W(IOCELL_CFG_W)) i_io_cell_rst(.FROM_CORE(1'b0), .TO_CORE(reset_internal), .PAD(reset), .io_cell_cfg({IOCELL_CFG_W{1'b1}}));
  // clk
  io_cell_wrapper#(.CELL_TYPE(2), .IOCELL_CFG_W(IOCELL_CFG_W)) i_io_cell_clk(.FROM_CORE(1'b0), .TO_CORE(clk_internal), .PAD(clk_in), .io_cell_cfg({IOCELL_CFG_W{1'b1}}));


  // gpio
  io_cell_wrapper#(.CELL_TYPE(0), .IOCELL_CFG_W(IOCELL_CFG_W)) i_io_cell_gpio0(.FROM_CORE(gpio_from_core[0]), .TO_CORE(gpio_to_core[0]), .PAD(gpio[0]), .io_cell_cfg(cell_cfg[1*IOCELL_CFG_W-1:0*IOCELL_CFG_W]));
  io_cell_wrapper#(.CELL_TYPE(0), .IOCELL_CFG_W(IOCELL_CFG_W)) i_io_cell_gpio1(.FROM_CORE(gpio_from_core[1]), .TO_CORE(gpio_to_core[1]), .PAD(gpio[1]), .io_cell_cfg(cell_cfg[2*IOCELL_CFG_W-1:1*IOCELL_CFG_W]));
  io_cell_wrapper#(.CELL_TYPE(0), .IOCELL_CFG_W(IOCELL_CFG_W)) i_io_cell_gpio2(.FROM_CORE(gpio_from_core[2]), .TO_CORE(gpio_to_core[2]), .PAD(gpio[2]), .io_cell_cfg(cell_cfg[3*IOCELL_CFG_W-1:2*IOCELL_CFG_W]));
  io_cell_wrapper#(.CELL_TYPE(0), .IOCELL_CFG_W(IOCELL_CFG_W)) i_io_cell_gpio3(.FROM_CORE(gpio_from_core[3]), .TO_CORE(gpio_to_core[3]), .PAD(gpio[3]), .io_cell_cfg(cell_cfg[4*IOCELL_CFG_W-1:3*IOCELL_CFG_W]));
  io_cell_wrapper#(.CELL_TYPE(0), .IOCELL_CFG_W(IOCELL_CFG_W)) i_io_cell_gpio4(.FROM_CORE(gpio_from_core[4]), .TO_CORE(gpio_to_core[4]), .PAD(gpio[4]), .io_cell_cfg(cell_cfg[5*IOCELL_CFG_W-1:4*IOCELL_CFG_W]));
  io_cell_wrapper#(.CELL_TYPE(0), .IOCELL_CFG_W(IOCELL_CFG_W)) i_io_cell_gpio5(.FROM_CORE(gpio_from_core[5]), .TO_CORE(gpio_to_core[5]), .PAD(gpio[5]), .io_cell_cfg(cell_cfg[6*IOCELL_CFG_W-1:5*IOCELL_CFG_W]));
  io_cell_wrapper#(.CELL_TYPE(0), .IOCELL_CFG_W(IOCELL_CFG_W)) i_io_cell_gpio6(.FROM_CORE(gpio_from_core[6]), .TO_CORE(gpio_to_core[6]), .PAD(gpio[6]), .io_cell_cfg(cell_cfg[7*IOCELL_CFG_W-1:6*IOCELL_CFG_W]));
  io_cell_wrapper#(.CELL_TYPE(0), .IOCELL_CFG_W(IOCELL_CFG_W)) i_io_cell_gpio7(.FROM_CORE(gpio_from_core[7]), .TO_CORE(gpio_to_core[7]), .PAD(gpio[7]), .io_cell_cfg(cell_cfg[8*IOCELL_CFG_W-1:7*IOCELL_CFG_W]));

  // jtag
  io_cell_wrapper#(.CELL_TYPE(2), .IOCELL_CFG_W(IOCELL_CFG_W)) i_io_cell_jtag_tck (.FROM_CORE(1'b0),              .TO_CORE(jtag_tck_internal),  .PAD(jtag_tck),  .io_cell_cfg({IOCELL_CFG_W{1'b1}}));
  io_cell_wrapper#(.CELL_TYPE(2), .IOCELL_CFG_W(IOCELL_CFG_W)) i_io_cell_jtag_tms (.FROM_CORE(1'b0),              .TO_CORE(jtag_tms_internal),  .PAD(jtag_tms),  .io_cell_cfg({IOCELL_CFG_W{1'b1}}));
  io_cell_wrapper#(.CELL_TYPE(2), .IOCELL_CFG_W(IOCELL_CFG_W)) i_io_cell_jtag_trst(.FROM_CORE(1'b0),              .TO_CORE(jtag_trst_internal), .PAD(jtag_trst), .io_cell_cfg({IOCELL_CFG_W{1'b1}}));
  io_cell_wrapper#(.CELL_TYPE(2), .IOCELL_CFG_W(IOCELL_CFG_W)) i_io_cell_jtag_tdi (.FROM_CORE(1'b0),              .TO_CORE(jtag_tdi_internal),  .PAD(jtag_tdi),  .io_cell_cfg({IOCELL_CFG_W{1'b1}}));
  io_cell_wrapper#(.CELL_TYPE(1), .IOCELL_CFG_W(IOCELL_CFG_W)) i_io_cell_jtag_tdo (.FROM_CORE(jtag_tdo_internal), .TO_CORE(),                   .PAD(jtag_tdo),  .io_cell_cfg({IOCELL_CFG_W{1'b0}}));

  // spi
  io_cell_wrapper#(.CELL_TYPE(2), .IOCELL_CFG_W(IOCELL_CFG_W)) i_io_cell_spim_sck  (.FROM_CORE(spim_sck_internal),     .TO_CORE(),                      .PAD(spi_sck),     .io_cell_cfg(cell_cfg[9*IOCELL_CFG_W-1:8*IOCELL_CFG_W]));
  io_cell_wrapper#(.CELL_TYPE(2), .IOCELL_CFG_W(IOCELL_CFG_W)) i_io_cell_spim_csn0 (.FROM_CORE(spim_csn_internal[0]),  .TO_CORE(),                      .PAD(spi_csn[0]),  .io_cell_cfg(cell_cfg[10*IOCELL_CFG_W-1:9*IOCELL_CFG_W]));
  io_cell_wrapper#(.CELL_TYPE(2), .IOCELL_CFG_W(IOCELL_CFG_W)) i_io_cell_spim_csn1 (.FROM_CORE(spim_csn_internal[1]),  .TO_CORE(),                      .PAD(spi_csn[1]),  .io_cell_cfg(cell_cfg[11*IOCELL_CFG_W-1:10*IOCELL_CFG_W]));
  io_cell_wrapper#(.CELL_TYPE(0), .IOCELL_CFG_W(IOCELL_CFG_W)) i_io_cell_spim_data0(.FROM_CORE(spim_mosi_internal[0]), .TO_CORE(spim_miso_internal[0]), .PAD(spi_data[0]), .io_cell_cfg(cell_cfg[12*IOCELL_CFG_W-1:11*IOCELL_CFG_W]));
  io_cell_wrapper#(.CELL_TYPE(0), .IOCELL_CFG_W(IOCELL_CFG_W)) i_io_cell_spim_data1(.FROM_CORE(spim_mosi_internal[1]), .TO_CORE(spim_miso_internal[1]), .PAD(spi_data[1]), .io_cell_cfg(cell_cfg[13*IOCELL_CFG_W-1:12*IOCELL_CFG_W]));
  io_cell_wrapper#(.CELL_TYPE(0), .IOCELL_CFG_W(IOCELL_CFG_W)) i_io_cell_spim_data2(.FROM_CORE(spim_mosi_internal[2]), .TO_CORE(spim_miso_internal[2]), .PAD(spi_data[2]), .io_cell_cfg(cell_cfg[14*IOCELL_CFG_W-1:13*IOCELL_CFG_W]));
  io_cell_wrapper#(.CELL_TYPE(0), .IOCELL_CFG_W(IOCELL_CFG_W)) i_io_cell_spim_data3(.FROM_CORE(spim_mosi_internal[3]), .TO_CORE(spim_miso_internal[3]), .PAD(spi_data[3]), .io_cell_cfg(cell_cfg[15*IOCELL_CFG_W-1:14*IOCELL_CFG_W]));

  // uart
  io_cell_wrapper#(.CELL_TYPE(2), .IOCELL_CFG_W(IOCELL_CFG_W)) i_io_cell_uart_rx(.FROM_CORE(1'b0),             .TO_CORE(uart_rx_internal), .PAD(uart_rx), .io_cell_cfg(cell_cfg[16*IOCELL_CFG_W-1:15*IOCELL_CFG_W]));
  io_cell_wrapper#(.CELL_TYPE(1), .IOCELL_CFG_W(IOCELL_CFG_W)) i_io_cell_uart_tx(.FROM_CORE(uart_tx_internal), .TO_CORE(),                 .PAD(uart_tx), .io_cell_cfg(cell_cfg[17*IOCELL_CFG_W-1:16*IOCELL_CFG_W]));

endmodule
