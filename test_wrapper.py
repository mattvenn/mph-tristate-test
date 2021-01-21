import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, ClockCycles

@cocotb.test()
async def test_tri(dut):
    clock = Clock(dut.clk, 10, units="ns")
    cocotb.fork(clock.start())

    await ClockCycles(dut.clk, 200)
