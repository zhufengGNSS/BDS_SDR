function Hd = bdsfilter_3M
%BDSFILTER_3M Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 8.6 and the DSP System Toolbox 9.1.
% Generated on: 07-Apr-2017 15:10:00

% Equiripple Bandpass filter designed using the FIRPM function.

% All frequency values are in MHz.
Fs = 10;  % Sampling Frequency

Fstop1 = 0.5;              % First Stopband Frequency
Fpass1 = 1;                % First Passband Frequency
Fpass2 = 4;                % Second Passband Frequency
Fstop2 = 4.5;              % Second Stopband Frequency
Dstop1 = 0.0031622776602;  % First Stopband Attenuation
Dpass  = 0.057501127785;   % Passband Ripple
Dstop2 = 0.0031622776602;  % Second Stopband Attenuation
dens   = 20;               % Density Factor

% Calculate the order from the parameters using FIRPMORD.
[N, Fo, Ao, W] = firpmord([Fstop1 Fpass1 Fpass2 Fstop2]/(Fs/2), [0 1 ...
                          0], [Dstop1 Dpass Dstop2]);

% Calculate the coefficients using the FIRPM function.
b  = firpm(N, Fo, Ao, W, {dens});
Hd = dfilt.dffir(b);

% [EOF]
