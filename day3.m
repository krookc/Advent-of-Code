clc; clear all; close all;

data_1 = fileread('day3inputwire1.txt');
data_1 = split(string(data_1), ',');

grid_wire_1 = zeros(27000, 27000);
xpos_wire_1 = 17250; ypos_wire_1 = 17250;

for i = 1:1:length(data_1)
    current = char(data_1(i));
    direction = current(1);
    stepsize = str2num(current(2:end));
    
    if direction == 'R'
        if i == 1
            grid_wire_1(ypos_wire_1,xpos_wire_1+1:xpos_wire_1+stepsize) = 1;
        end
        grid_wire_1(ypos_wire_1,xpos_wire_1:xpos_wire_1+stepsize) = 1;
        xpos_wire_1 = xpos_wire_1+stepsize;
    elseif direction == 'U'
        grid_wire_1(ypos_wire_1-stepsize:ypos_wire_1,xpos_wire_1) = 1;
        ypos_wire_1 = ypos_wire_1-stepsize;
    elseif direction == 'L'
        grid_wire_1(ypos_wire_1,xpos_wire_1-stepsize:xpos_wire_1) = 1;
        xpos_wire_1 = xpos_wire_1-stepsize;
    elseif direction == 'D'
        grid_wire_1(ypos_wire_1:ypos_wire_1+stepsize:xpos_wire_1) = 1;
        ypos_wire_1 = ypos_wire_1+stepsize;
    end
end

data_2 = fileread('day3inputwire2.txt');
data_2 = split(string(data_2), ',');

grid_wire_2 = zeros(27000, 27000);
xpos_wire_2 = 17250; ypos_wire_2 = 17250;

for i = 1:1:length(data_2)
    current = char(data_2(i));
    direction = current(1);
    stepsize = str2num(current(2:end));
    
    if direction == 'R'
        grid_wire_2(ypos_wire_2,xpos_wire_2:xpos_wire_2+stepsize) = 1;
        xpos_wire_2 = xpos_wire_2+stepsize;
    elseif direction == 'U'
        grid_wire_2(ypos_wire_2-stepsize:ypos_wire_2,xpos_wire_2) = 1;
        ypos_wire_2 = ypos_wire_2-stepsize;
    elseif direction == 'L'
        if i == 1
            grid_wire_2(ypos_wire_2,xpos_wire_2-stepsize:xpos_wire_2-1) = 1;
        end
        grid_wire_2(ypos_wire_2,xpos_wire_2-stepsize:xpos_wire_2) = 1;
        xpos_wire_2 = xpos_wire_2-stepsize;
    elseif direction == 'D'
        grid_wire_2(ypos_wire_2:ypos_wire_2+stepsize:xpos_wire_2) = 1;
        ypos_wire_2 = ypos_wire_2+stepsize;
    end
end
intersections = grid_wire_1.*grid_wire_2;

smallest = 1000000;
for i = 1:1:27000
    for j = 1:1:27000
        if intersections(i,j) == 1
            distance = (17250-i)+abs(17250-j);
            if distance < smallest
                smallest = distance;
            end
        end
    end
end

%%
clc; clear all; close all;

data_1 = fileread('day3inputwire1.txt');
data_1 = split(string(data_1), ',');

positions_wire_1 = 10000.*ones(160000,2);
x_pos_1 = 0;
y_pos_1 = 0;

x_col_1 = 1;

for i = 1:1:length(data_1)
    current = char(data_1(i));
    direction = current(1);
    stepsize = str2num(current(2:end));
    
    if direction == 'R'
        x = (x_pos_1:x_pos_1+stepsize).';
        y = y_pos_1.*ones(1,stepsize+1).';
        
        positions_wire_1((x_col_1:x_col_1+stepsize),1) = x;
        positions_wire_1((x_col_1:x_col_1+stepsize),2) = y;
        x_pos_1 = x_pos_1 + stepsize;
        x_col_1 = x_col_1 + stepsize+1;
    elseif direction == 'U'
        x = x_pos_1.*ones(1,stepsize+1).';
        y = (y_pos_1:y_pos_1+stepsize).';
        positions_wire_1((x_col_1:x_col_1+stepsize),1) = x;
        positions_wire_1((x_col_1:x_col_1+stepsize),2) = y;
        y_pos_1 = y_pos_1 + stepsize;
        x_col_1 = x_col_1 + stepsize+1;
    elseif direction == 'L'
        x = (x_pos_1-stepsize:x_pos_1);
        y = y_pos_1.*ones(1,stepsize+1);
        positions_wire_1((x_col_1:x_col_1+stepsize),1) = x;
        positions_wire_1((x_col_1:x_col_1+stepsize),2) = y;
        x_pos_1 = x_pos_1 - stepsize;
        x_col_1 = x_col_1 + stepsize+1;
    elseif direction == 'D'
        x = x_pos_1.*ones(1,stepsize+1).';
        y = (y_pos_1-stepsize:y_pos_1).';
        positions_wire_1((x_col_1:x_col_1+stepsize),1) = x;
        positions_wire_1((x_col_1:x_col_1+stepsize),2) = y;
        y_pos_1 = y_pos_1 - stepsize;
        x_col_1 = x_col_1 + stepsize+1;
    end
end
wire_1 = positions_wire_1;

data_2 = fileread('day3inputwire2.txt');
data_2 = split(string(data_2), ',');

positions_wire_1 = 10000.*ones(160000,2);
x_pos_1 = 0;
y_pos_1 = 0;

x_col_1 = 1;

for i = 1:1:length(data_2)
    current = char(data_2(i));
    direction = current(1);
    stepsize = str2num(current(2:end));
    
    if direction == 'R'
        x = (x_pos_1:x_pos_1+stepsize).';
        y = y_pos_1.*ones(1,stepsize+1).';
        
        positions_wire_1((x_col_1:x_col_1+stepsize),1) = x;
        positions_wire_1((x_col_1:x_col_1+stepsize),2) = y;
        x_pos_1 = x_pos_1 + stepsize;
        x_col_1 = x_col_1 + stepsize+1;
    elseif direction == 'U'
        x = x_pos_1.*ones(1,stepsize+1).';
        y = (y_pos_1:y_pos_1+stepsize).';
        positions_wire_1((x_col_1:x_col_1+stepsize),1) = x;
        positions_wire_1((x_col_1:x_col_1+stepsize),2) = y;
        y_pos_1 = y_pos_1 + stepsize;
        x_col_1 = x_col_1 + stepsize+1;
    elseif direction == 'L'
        x = flip((x_pos_1-stepsize:x_pos_1));
        y = y_pos_1.*ones(1,stepsize+1).';
        positions_wire_1((x_col_1:x_col_1+stepsize),1) = x;
        positions_wire_1((x_col_1:x_col_1+stepsize),2) = y;
        x_pos_1 = x_pos_1 - stepsize;
        x_col_1 = x_col_1 + stepsize+1;
    elseif direction == 'D'
        x = x_pos_1.*ones(1,stepsize+1).';
        y = flip((y_pos_1-stepsize:y_pos_1).');
        positions_wire_1((x_col_1:x_col_1+stepsize),1) = x;
        positions_wire_1((x_col_1:x_col_1+stepsize),2) = y;
        y_pos_1 = y_pos_1 - stepsize;
        x_col_1 = x_col_1 + stepsize+1;
    end
end

wire_2 = positions_wire_1;

smallest = 1000000;
for i = 2:2:length(wire_1)
    for j = 2:2:length(wire_2)
        if wire_1(i) ~= 10000 || wire_1(i+160000) ~= 10000 || wire_2(j) ~= 10000 || wire_2(j+160000) ~= 10000
            if wire_1(i) == wire_2(j) %&& wire_1(i+160000) == wire_2(j+160000)
                disp(['i = ' num2str(i) ' wire 1 x ' num2str(wire_1(i)) ' wire 2 x ' num2str(wire_2(j))]);
                if wire_1(i+160000) == wire_2(j+160000)
                    disp(['j = ' num2str(j) ' wire 1 y ' num2str(wire_1(i+160000)) ' wire 2 y ' num2str(wire_2(j+160000))]);
                end
            end
        end
    end
end