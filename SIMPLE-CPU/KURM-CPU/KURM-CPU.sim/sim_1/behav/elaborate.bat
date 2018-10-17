@echo off
set xv_path=D:\\Xilinx\\Vivado\\2017.1\\bin
call %xv_path%/xelab  -wto e3f94aeef0c248108143680a04552d6d -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot micro_processor_behav xil_defaultlib.micro_processor xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
