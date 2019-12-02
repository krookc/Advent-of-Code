clc; clear all; close all;
data =load('day2input.txt');
% matlab räknar från 1
data(2) = 12;
data(3) = 2;

temp = zeros(1,4);
for i = 1:4:length(data)
    temp = data(i:i+3);
    i
    if data(i) == 1
        data(temp(4)+1) = data(temp(2)+1) + data(temp(3)+1);
    elseif data(i) == 2
        data(temp(4)+1) = data(temp(2)+1) * data(temp(3)+1);
    elseif data(i) == 99 || data(i) == 165
        break;
    end
end

data(1)

% part 2

input = (0:99);

%ny fräsch grej
flip = 0;
while flip == 0
    for verb = input(1):1:input(100)
        for noun = input(1) : 1 : input(100)
            if flip ~= 1
                data(2) = input(verb+1);
                data(3) = input(noun+1);
                
                temp = zeros(1,4);
                for i = 1:4:length(data)
                    temp = data(i:i+3);
                    if data(i) == 1
                        data(temp(4)+1) = data(temp(2)+1) + data(temp(3)+1);
                    elseif data(i) == 2
                        data(temp(4)+1) = data(temp(2)+1) * data(temp(3)+1);
                    elseif data(i) == 99 || data(i) == 165
                        break;
                    end
                end
                if data(1) == 19690720
                    flip = 1;
                    verb
                    noun
                    break;
                end
                data = load('day2input.txt');
            end
        end
    end
end