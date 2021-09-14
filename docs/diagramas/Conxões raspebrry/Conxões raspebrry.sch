EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector:Raspberry_Pi_2_3 J?
U 1 1 6138DE65
P 3950 4000
F 0 "J?" H 3950 5481 50  0000 C CNN
F 1 "Raspberry_Pi_2_3" H 3950 5390 50  0000 C CNN
F 2 "" H 3950 4000 50  0001 C CNN
F 3 "https://www.raspberrypi.org/documentation/hardware/raspberrypi/schematics/rpi_SCH_3bplus_1p0_reduced.pdf" H 3950 4000 50  0001 C CNN
	1    3950 4000
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x04_Female J?
U 1 1 6139018D
P 5700 3150
F 0 "J?" H 5728 3126 50  0000 L CNN
F 1 "Conn_01x04_Female" H 5728 3035 50  0000 L CNN
F 2 "" H 5700 3150 50  0001 C CNN
F 3 "~" H 5700 3150 50  0001 C CNN
	1    5700 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 2700 3750 2450
Wire Wire Line
	3750 2450 5500 2450
Wire Wire Line
	5500 2450 5500 3050
Wire Wire Line
	3550 5300 3550 5500
Wire Wire Line
	5400 5500 5400 3350
Wire Wire Line
	5400 3350 5500 3350
Wire Wire Line
	3550 5500 5400 5500
Wire Wire Line
	4750 3500 5300 3500
Wire Wire Line
	5300 3500 5300 3250
Wire Wire Line
	5300 3250 5500 3250
Wire Wire Line
	4750 3400 5200 3400
Wire Wire Line
	5200 3400 5200 3150
Wire Wire Line
	5200 3150 5500 3150
$EndSCHEMATC
