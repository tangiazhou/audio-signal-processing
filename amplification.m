% This simple program consists of reading in three .wave files, combining them, and gradually amplifying the sound in guitar.wav

clear;

[bass, fs] = audioread('bass.wav');
guitar = audioread('guitar.wav');
drums = audioread('drums.wav');

duration = 5;
b = bass(1:fs*duration); 
g = guitar(1:fs*duration);
d = drums(1:fs*duration);

comp = b + g + d; 

L = length(comp); % Length of the sound sequence 
inc = 9/(L-1); % Increment
w = 1:inc:10; % Gain from the first to last sample
comp1 = b + w'.*g + d; % New signal with the gradually increasing gain in g

t = ((1:fs*duration)-1)/fs;
sound(comp1, fs);
plot(t, comp1);

file = 'guitar.wav';
audiowrite(filename,comp1,fs)
