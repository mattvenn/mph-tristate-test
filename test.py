import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, ClockCycles

@cocotb.test()
async def test_tri(dut):
    clock = Clock(dut.clk, 10, units="ns")
    cocotb.fork(clock.start())

    dut.enable <= 0
    dut.tri_in <= 0
    await ClockCycles(dut.clk, 5)

    dut.enable <= 0
    dut.tri_in <= 1
    await ClockCycles(dut.clk, 5)

    dut.enable <= 1
    dut.tri_in <= 0
    await ClockCycles(dut.clk, 5)

    dut.enable <= 1
    dut.tri_in <= 1
    await ClockCycles(dut.clk, 5)
