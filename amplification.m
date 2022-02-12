clear;

[bass, fs] = audioread('bass.wav');
guitar = audioread('guitar.wav');
drums = audioread('drums.wav');

duration = 5;
b = bass(1:fs*duration); 
g = guitar(1:fs*duration);
d = drums(1:fs*duration);

comp = b + g + d; 

L = length(comp); % 
inc = 9/(L-1); 
w = 1:inc:10; 
comp1 = b + w'.*g + d;

t = ((1:fs*duration)-1)/fs;
sound(comp1, fs);
plot(t, comp1);

file = 'guitar.wav';
audiowrite(filename,comp1,fs)
