clc; clear all; close all; 

data = load('day9input.txt');

data_memory = zeros(1,10000);
data_memory(1:length(data)) = data;
% data = [209, 19];


[output_memory, output, index, pointer, op] = intcode(data_memory, 1, 0, 0, 1);