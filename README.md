# Setting-up-W25Q64JV-with-FPGA
## W25Q64JV
W25Q64JV is a Serial Flash memory provides a storage solution for  systems with  limited space, 
pins and power.The W25Q64JV array is organized into 32,768 programmable pages of 256-bytes each.
It supports the standard Serial Peripheral Interface (SPI), Dual/Quad I/O SPI.SPI clock frequencies of W25Q64JV of up to 133MHz 
are supported allowing equivalent clock rates of 266MHz (133MHz x 2) for Dual I/O and 532MHz (133MHz x 
4)  for  Quad  I/O  when  using  the  Fast  Read  Dual/Quad  I/O. You can read the datasheet of the ic if you need more information about how it works.

## Project Preview
In this project we are going to set up W25Q64JV.Since this IC supports high frequencies we use FPGA as the controller.This program only supports the
standard mode of the ic.I used machine state method in this program.For sending data for the ic we first send data and the bit address that we want to write on it, from computer to fpga using UART interface.After that FPGA forms the correct format of data suitable for the ic and start sending it using SPI interface.For reading data from ic we first send the
bit address that we want to read from and then we wait until FPGA requests the data and after retrieval, sends it for us via UART interface.

## Modules
There are several modules forming this program:

1- BaudRate_Generator: which generates the predefined baudrate for the uart interface.

2- UART_Receiver_Unit: which receives data from computer.

3- Input_Data_Collector_Unit: which after receiving data from computer processes them and correct it's format for sending them for ic.

4- SPI_Master_Unit: It is our SPI core and It receives or sends data via SPI interface.

5- Output_Data_Collector: which after receiving data from ic processes them and correct it's format for sending them for computer.

6- Uart_Transmitter_Unit: which sends data for computer.

7- MainModule: which connects all above modules togather.
