clc; clear all; close all;

data = fileread('day8input.txt');
% data = '0222112222120000';
width = 25;
height = 6;
layer_size = width*height;
number_of_layers = length(data)/layer_size;

layers = zeros(height * number_of_layers, width);

layer_nr = 0;

sums = zeros(1,number_of_layers);


while layer_nr < number_of_layers
    layer = zeros(height, width);
    position = 1;
    for j = 1:1:height
        for i = 1:1:width
            layer(j,i) = str2double(data((width*height)*layer_nr+position));
            %             layers((6*layer_nr)+j,i) = str2double(data((25*6)*layer_nr+i*j));
            position = position +1;
        end
    end
    layers((height*layer_nr)+1:(height*layer_nr)+height, 1:width) = layer;
    boole = sum(sum(layer==0));
    sums(layer_nr+1) = boole;
    layer_nr = layer_nr +1;
end

mini = min(sums);
index = find(sums == mini);

min_layer = layers((height*(index-1)+1):(height*(index-1)+height), 1:width);

onee = sum(sum(min_layer==1));
twoo = sum(sum(min_layer==2));
answer = onee*twoo;

finalimage = layers(1:height, 1:width);
for k = 0:1:(number_of_layers-1)
    for j = 1:1:height
        for i = 1:1:width
            if finalimage(j,i) ~= 0
                if finalimage(j,i) ~= 1
                    finalimage(j,i) = layers(k*height+j, i);
                end
            end
        end
    end
end

stri = "";
for j = 1:1:height
    for i = 1:1:width
        stri = stri + num2str(finalimage(j,i));
    end
end
imagesc(finalimage)