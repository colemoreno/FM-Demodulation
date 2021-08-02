# FM Demodulation
## Required Hardware
- **Nooelec NESDR SMArt**: The [receiver](https://www.amazon.com/gp/product/B01GDN1T4S/ref=ppx_yo_dt_b_asin_title_o00_s00?ie=UTF8&psc=1) tuned by ther user using **fc** parameter brings the signal 
centered at fc with a bandwidth of 2.4 MHz down to baseband.
- **Antenna Mast**: Needed to receive signals.
- **Antenna Base**: Connects the antenna mast to the receiver.

## Required Software
- **MatLab Toolboxes**: The required toolboxes needed to run this code are: **DSP System Toolbox**, 
**Communications System Toolbox**, **Signal Processing Toolbox**
- **MatLab Support Packages**: The **RTL-SDR Support Package** needs to be installed by navigating in MatLab to 
**Home > Environment > Add-Ons > Get Hardware Support Packages**

## Constraints
- This code only works with RTL-SDR radio.

## Operation
- Set **fc** to the desired radio station which should be in MHz (e6).
- **TunerGain** may need to be adjusted based on the location.
- **audioPlayer** may need to be adjusted, currently set to the default speaker driver. [Audio Device Writer](https://www.mathworks.com/help/dsp/ref/audiodevicewriter-system-object.html) documentation linked.
- The code is set to run on a true while loop so the user will need to manually stop the code.
- This code uses a frequency descriminator to demodulate the received FM signal.
