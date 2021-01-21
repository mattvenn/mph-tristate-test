import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, ClockCycles

@cocotb.test()
async def test_tri(dut):
    clock = Clock(dut.clk, 10, units="ns")
    cocotb.fork(clock.start())

    dut.rst <= 1
    await ClockCycles(dut.clk, 5)
    dut.rst <= 0
    dut.active <= 1 << 0
    dut.sig_in <= 0

    for i in range(10):
        await ClockCycles(dut.clk, 10)
        dut.sig_in <= i % 2

    dut.active <= 1 << 1

    for i in range(10):
        await ClockCycles(dut.clk, 10)
        dut.sig_in <= i % 2
