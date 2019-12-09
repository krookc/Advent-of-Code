clc; clear all; close all;

data = fileread('day8input.txt');

layer_size = 25*6;
number_of_layers = length(data)/layer_size;

layers = zeros(600, 25);

layer_nr = 0;
layer = zeros(6,25);
sums = zeros(1,100);
while layer_nr < 100
    for j = 1:1:6
        for i = 1:1:25
            layer(j,i) = str2double(data((25*6)*layer_nr+i*j));
%             layers((6*layer_nr)+j,i) = str2double(data((25*6)*layer_nr+i*j));
        end
    end
    boole = sum(sum(layer==0));
    sums(layer_nr+1) = 150-boole;
    layer_nr = layer_nr +1;
end