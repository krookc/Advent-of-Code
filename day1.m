clc; clear all; close all;
data = load('day1input.txt');

% part 1
accumulated_weight = 0;

for i=1:1:length(data)
    accumulated_weight = accumulated_weight + (floor(data(i)/3)-2);
end

weight = accumulated_weight

% part 2
accumulated_weight = 0;
temp = 1000000;
fuel_per_module = 0;
for i=1:1:length(data)
    current_module = (floor(data(i)/3)-2);
    temp = (floor(current_module/3)-2);
    fuel_per_module = temp;
    while temp >= 0
        temp = (floor(temp/3)-2);
        if temp > 0
            fuel_per_module = fuel_per_module + temp;
        end
    end
    accumulated_weight = accumulated_weight + current_module + fuel_per_module;
end

new_weight = accumulated_weight