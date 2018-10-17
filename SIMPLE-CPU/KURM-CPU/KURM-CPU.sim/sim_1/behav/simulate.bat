@echo off
set xv_path=D:\\Xilinx\\Vivado\\2017.1\\bin
call %xv_path%/xsim micro_processor_behav -key {Behavioral:sim_1:Functional:micro_processor} -tclbatch micro_processor.tcl -view D:/2018-2/SIMPLE-CPU/KURM-CPU/micro_processor_behav1.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
