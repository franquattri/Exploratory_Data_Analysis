---
title: "ReadMe"
output: html_document
date: ""
fontsize: 11pt
---
This is a readme document to the first project of the Coursera course "Exploratory Data Analysis" by Johns Hopkins.

The following section ("Introduction") is taken from the assignment.

## Introduction

This assignment uses data from the [UC Irvine Machine Learning Repository](http://archive.ics.uci.edu/ml/), a popular repository for machine learning datasets. In particular, we will be using the "Individual household electric power consumption Data Set" which I have made available on the course web site:

> Dataset: Electric power consumption [20Mb]

####Description: 
Measurements of electric power consumption in one household with a one-minute sampling rate over a period of almost 4 years. Different electrical quantities and some sub-metering values are available.

The following descriptions of the 9 variables in the dataset are taken from the UCI web site:

*  **Date**: Date in format dd/mm/yyyy
* **Time**: time in format hh:mm:ss
*  **Global_active_power**: household global minute-averaged active power (in kilowatt)
*  **Global_reactive_power**: household global minute-averaged reactive power (in kilowatt)
*  **Voltage**: minute-averaged voltage (in volt)
*  **Global_intensity**: household global minute-averaged current intensity (in ampere)
*  **Sub_metering_1**: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
*  **Sub_metering_2**: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
*  **Sub_metering_3**: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.


## Aim
The objective of the project is to reproduce the four plots presented in the assignment, by keeping in mind a few rules:

- The dataset is very big, but only a two-day time span will be considered to generate the plots (from 2007-02-01 to 2007-02-02)
- The plots have been saved in PNG format 
- The code for the plots and the code which shows how they have been saved in PNG format need to be saved for each plot (hence you can find a total of eight uploaded files under these folder, 4 plotx.R and 4 plotx.png)


## Further notes

The code should be reproducible. Hence, notes have been added for the generation of each plot, which motivate the 
decisions made while coding and which should help understanding the code.
