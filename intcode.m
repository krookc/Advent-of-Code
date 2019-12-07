function [data, output] = intcode(data, input, input2)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

position = 0;
immediate = 1;

pointer = 1;
param1 = 0;
param2 = 0;

output = 1000;
index = 0;
while true
    opcode = data(pointer);
    param1 = 0;
    param2 = 0;
    if opcode < 100
        op = opcode;
        param1 = position;
        param2 = position;
    elseif opcode < 1000
        op = mod(opcode,100);
        param1 = floor(opcode/100);
        param2 = position;
    elseif opcode < 10000
        op = mod(opcode,100);
        param1 = floor(mod(opcode,1000)/100);
        param2 = floor(opcode/1000);
    end
    
    if op == 1
        if param1 == position
            x1 = data(data(pointer+1)+1);
        elseif param1 == immediate
            x1 = data(pointer+1);
        end
        
        if param2 == position
            x2 = data(data(pointer+2)+1);
        elseif param2 == immediate
            x2 = data(pointer+2);
        end
        
        data(data(pointer+3)+1) = x1+x2;
        pointer = pointer + 4;
    elseif op == 2
        if param1 == position
            x1 = data(data(pointer+1)+1);
        elseif param1 == immediate
            x1 = data(pointer+1);
        end
        
        if param2 == position
            x2 = data(data(pointer+2)+1);
        elseif param2 == immediate
            x2 = data(pointer+2);
        end
        
        data(data(pointer+3)+1) = x1*x2;
        pointer = pointer+4;
    elseif op ==3
        if index == 0
            data(data(pointer+1)+1) = input;
            pointer = pointer + 2;
            index = index +1;
        elseif index == 1
            data(data(pointer+1)+1) = input2;
            pointer = pointer + 2;
            index = index + 1;
        end
    elseif op == 4
        if param1 == position
            x1 = data(data(pointer+1)+1);
        elseif param1 == immediate
            x1 = data(pointer+1);
        end
        
        output = x1;
        disp(output)
        pointer = pointer + 2;
    elseif op == 99
        break;
    elseif op == 5
        if param1 == position
            x1 = data(data(pointer+1)+1);
        elseif param1 == immediate
            x1 = data(pointer+1);
        end
        
        if param2 == position
            x2 = data(data(pointer+2)+1);
        elseif param2 == immediate
            x2 = data(pointer+2);
        end
        
        if x1 ~= 0
            pointer = x2+1;
        else
            pointer = pointer + 3;
        end
    elseif op == 6
        if param1 == position
            x1 = data(data(pointer+1)+1);
        elseif param1 == immediate
            x1 = data(pointer+1);
        end
        
        if param2 == position
            x2 = data(data(pointer+2)+1);
        elseif param2 == immediate
            x2 = data(pointer+2);
        end
        
        if x1 == 0
            pointer = x2+1;
        else
            pointer = pointer + 3;
        end
    elseif op == 7
        if param1 == position
            x1 = data(data(pointer+1)+1);
        elseif param1 == immediate
            x1 = data(pointer+1);
        end
        
        if param2 == position
            x2 = data(data(pointer+2)+1);
        elseif param2 == immediate
            x2 = data(pointer+2);
        end
        
        if x1 < x2
            data(data(pointer+3)+1) = 1;
        else
            data(data(pointer+3)+1) = 0;
        end
        pointer = pointer + 4;
    elseif op == 8
        if param1 == position
            x1 = data(data(pointer+1)+1);
        elseif param1 == immediate
            x1 = data(pointer+1);
        end
        
        if param2 == position
            x2 = data(data(pointer+2)+1);
        elseif param2 == immediate
            x2 = data(pointer+2);
        end
        
        if x1 == x2
            data(data(pointer+3)+1) = 1;
        else
            data(data(pointer+3)+1) = 0;
        end
        pointer = pointer + 4;
    end
end

