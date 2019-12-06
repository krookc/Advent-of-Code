clc; clear all; close all;

data = fileread('day6input.txt');

orbits = [];

for i=1:8:length(data)
    orbits = [orbits; data(i:i+5)];
end