clear all;
clc;

%Variable Settings
fc = 100.5e6;
TunerGain = 10;
fs = 2.4e6;
SamplesPerFrame = 38400;

%Initialize data to prevent latency
delaysignal = zeros(3840,1);


%% Settings

%Setting up the SDR-RTL Receiver
rx = comm.SDRRTLReceiver('CenterFrequency',fc,...
    'EnableTunerAGC',true,...
    'SampleRate',fs,...
    'OutputDataType','double',...
    'SamplesPerFrame',SamplesPerFrame);

%Setting up filter(s)
deemphasis = dsp.IIRFilter('Structure','Direct Form I','Numerator',[0.123 0.123],'Denominator',[1 -0.755]);

%Setup audio device writer
audioPlayer = audioDeviceWriter('Driver','WASAPI','SampleRate',48e3);

%% FM Receiver
while(true)
    
%Receiver 38400 samples
rxdata = rx();

%Decimate rxdata down to fs = 240e3 Hz
decimatedsignal = decimate(rxdata,10,'fir');

%Push decimatedsignal into Frequency Discriminator to get matrix of angles
%See documentation within freqdisc.m for more details
FDSignal = freqdisc(decimatedsignal,delaysignal);

%Decimate demodulated_data signal down to fs = 48e3 Hz
FMdemodulated = decimate(FDSignal,5,'fir');

%Send FMdemodulated through deemphasis filter. 
output = deemphasis(FMdemodulated);

% Output the sound to the speaker system
audioPlayer(output);
end

 


