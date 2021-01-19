import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, ClockCycles

async def activate_project(dut, number, compare):
    dut.la_data_in <= (1 << 32 + number)

    # reset it
    dut.la_data_in <= (1 << 32 + number) + (1 << 25)
    await ClockCycles(dut.wb_clk_i, 1)
    dut.la_data_in <= (1 << 32 + number)
    await ClockCycles(dut.wb_clk_i, 1)

    # load a smaller value
    dut.la_data_in <= (1 << 32 + number) + compare + (1 << 24)
    await ClockCycles(dut.wb_clk_i, 1)
    dut.la_data_in <= (1 << 32 + number) 


@cocotb.test()
async def test_tri(dut):
    clock = Clock(dut.wb_clk_i, 10, units="ns")
    cocotb.fork(clock.start())

    dut.wb_rst_i <= 1
    await ClockCycles(dut.wb_clk_i, 5)
    dut.wb_rst_i <= 0
    dut.la_data_in <= 0

    await ClockCycles(dut.wb_clk_i, 100)

    # activate proj0
    await activate_project(dut, 0, 10)

    await ClockCycles(dut.wb_clk_i, 120)

    # activate proj1
    await activate_project(dut, 1, 5)

    await ClockCycles(dut.wb_clk_i, 120)
