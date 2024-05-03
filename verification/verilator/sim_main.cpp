#include <fstream>
#include <iostream>
#include <iterator>
#include <memory>
#include <sstream>
#include <string>
#include <vector>
#include <verilated.h>
#if VM_TRACE
#include <verilated_vcd_c.h>
#endif

#include "VDidactic.h"

// Simulation time
vluint64_t main_time = 0;
double sc_time_stamp() { return main_time; }

enum TestBenchState
{
    starting,
    assert_reset,
    deassert_reset,
    assert_fetch_enable,
    finished,
};

int main(int argc, char **argv)
{
    std::cout << "hello from " << __FILE__ << std::endl;
    const std::unique_ptr<VerilatedContext> contextp{new VerilatedContext};
    contextp->commandArgs(argc, argv);
    const std::unique_ptr<VDidactic> didactic{new VDidactic{contextp.get(), "DIDACTIC"}};
    TestBenchState tb_state = TestBenchState::starting;
    const int maximum_iterations = 10;
    for (int i = 0; i < maximum_iterations; i++)
    {
        bool stop_iteration = false;
        switch (tb_state)
        {
        case TestBenchState::starting:
            printf("[%ld] initialize inputs\n", contextp->time());
            didactic->boot_sel = 0;
            didactic->clk_in = 1;
            didactic->fetch_en = 0;
            didactic->gpio = 0;
            didactic->jtag_tck = 0;
            didactic->jtag_tdi = 0;
            didactic->jtag_tdo = 0;
            didactic->jtag_tms = 0;
            didactic->jtag_trst = 0;
            didactic->reset = 0;
            didactic->sdio_clk = 0;
            didactic->sdio_cmd = 0;
            didactic->sdio_data = 0;
            didactic->spi_csn = 0;
            didactic->spi_data = 0;
            didactic->spi_sck = 0;
            didactic->ss_1_gpio = 0;
            didactic->uart_rx = 0;
            didactic->uart_tx = 0;
            tb_state = TestBenchState::assert_reset;
            break;
        case TestBenchState::assert_reset:
            printf("[%ld] assert reset\n", contextp->time());
            didactic->reset = 1;
            tb_state = TestBenchState::deassert_reset;
            break;
        case TestBenchState::deassert_reset:
            printf("[%ld] deassert reset\n", contextp->time());
            didactic->reset = 0;
            tb_state = TestBenchState::assert_fetch_enable;
            break;
        case TestBenchState::assert_fetch_enable:
            printf("[%ld] assert fetch_enable\n", contextp->time());
            didactic->fetch_en = 1;
            tb_state = TestBenchState::finished;
            break;
        case TestBenchState::finished:
            printf("[%ld] finished\n", contextp->time());
            stop_iteration = true;
            tb_state = TestBenchState::finished;
            break;
        }
        main_time++;
        didactic->clk_in = !didactic->clk_in;
        didactic->eval();
        if (stop_iteration)
        {
            break;
        }
    }
    didactic->final();
    return 0;
}
