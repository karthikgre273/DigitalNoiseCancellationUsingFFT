# DigitalNoiseCancellationUsingFFT
This is my source code of Digital noise cancellation flow used to eliminate high frequency noise from a random sound
The Deign consists of 
1. verilog implementation of FFT and IFFT algorithm to convert signal from time to frequency and vice versa
2. A filter designed using MATLAB
3. Java Source code which was used to generate the verilog FFT and IFFT files. 
      This helped us to generate different FFT and IFFT designs (512 point, 256 point and 125 point) on the click of a button. This later helped us compare the performance and use a particular filter suitable to our purpose.
