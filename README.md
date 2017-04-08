# modela_mdx-15_20_control_panel_scilab
Scilab-Programmed GUI Control Panel for Roland MODELA MDX-15/20 CNC Machine For Windows

## [Go to Homepage](https://chriskyfung.github.io/modela_mdx-15_20_control_panel_scilab/)

## Usage
A custom control panel developed for Roland MODELA MDX-15/20 desktop CNC milling machine.
- GUI buttons and indicators for manipulating the tool position of this 3-axis CNC milling machine
- Enables to input the ZO value (custom zero position for z-axis) accurately
  * Instead of leveling the tool with your eyes and UP and DOWN buttons on the machine
  * Useful for resuming interrupted machining processes with exact the same ZO setting, no matter the machine has been powered off or reset accidentally 
- Quick access of *Printer Queue* and *Start/Stop Printer Spooler*
 
#Screenshot

<a href='https://kl7.info/img-5891fdd97b172.html'>v0.2<img src='https://101img.com/upload/small/2017/02/01/5891fdd97b0cc.png' alt='image' height="213"/></a> 
<a href='https://kl7.info/img-58e88857deb42.html'>v0.3<img src='https://kl7.info/thumb/58e88857deb42.png' alt='image'></a>

## Prerequisite
* Scilab 5.5 or above (recommended)
> **What is Scilab ?** 
> Scilab is free and open source software for numerical computation providing a powerful computing environment for engineering and scientific applications. Official Site of Scilab (http://www.scilab.org/)
* MDX-15/20 is connected with port **COM1**

## How To Install
1. If you do not install Scilab, please install it on the computer
2. Download the Zip file of our repository, and then extract the files

## How To Use
1. Launch Scilab
2. Choose **File** > **Execute**, and then select **ControlPanel.sce** in the file selection dialog
3. Press **Reset** to zero out z-axis
4. Press **Home** to zero out x- and y-axes

## YouTube:
Please visit and subscribe our YouTube channel [**[DTClub.swc.HK](https://www.youtube.com/channel/UCGlT2itihZuRxMckNcfcA3A)**]

* Introduction for v0.1. - 
[Custom GUI Control Panel for Roland MODELA MDX-15/20 CNC Machine (Scilab-Programmed GUI)](https://youtu.be/1qtFWHFQnls)

## Version History
v0.3 2017-4-8
- Enable to choose the COM port for the machine
- One click to open *Print Queue* by pressing **Printer**
- Start/Stop *Windows Printer Spooler* service by pressing **Start/Stop Spool**
- Added **Help** button that link to our webpage
- Changed background color and button style

<a href='https://kl7.info/img-58e88857deb42.html'>v0.3<img src='https://kl7.info/thumb/58e88857deb42.png' alt='image' width="250"></a>

v0.2 2017-1-6
- Enable to move to a target position at once, by toggling **Direct Go**
- Added buttons for homing +X, -X, +Y and -Y position

<a href='https://kl7.info/img-5891fdd97b172.html'>v0.2<img src='https://101img.com/upload/small/2017/02/01/5891fdd97b0cc.png' alt='image'/></a>

v0.1 2016-12-23 (The version shown in the introduction video in YouTube)
- Move instantly after press a direction button
- Set custom Z0 level

## Copyright and License
**Copyright 2016 - 2017, Chris KY FUNG and the contributors in DTClub.swc.HK CNC group**

**License** GNU AFFERO GENERAL PUBLIC LICENSE Version 3 (GNU AGPLv3)
