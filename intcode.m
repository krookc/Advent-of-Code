function [data, output, index, pointer, op] = intcode(data, input, input2, index_in, pointer)
% [data, output, index, pointer, op] = intcode(data, input, input2, index_in, pointer)
%   Detailed explanation goes here

position = 0;
immediate = 1;

param1 = 0;
param2 = 0;

relative_base = 0;

output = 1000;
index = index_in;
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
        elseif param1 == 2
            x1 = data(data(pointer+1) +1 + relative_base);
        end
        
        if param2 == position
            x2 = data(data(pointer+2)+1);
        elseif param2 == immediate
            x2 = data(pointer+2);
        elseif param1 == 2
            x2 = data(data(pointer+2) +1 + relative_base);
        end
        
        data(data(pointer+3)+1) = x1+x2;
        pointer = pointer + 4;
    elseif op == 2
        if param1 == position
            x1 = data(data(pointer+1)+1);
        elseif param1 == immediate
            x1 = data(pointer+1);
        elseif param1 == 2
            x1 = data(data(pointer+1) +1 + relative_base);
        end
        
        if param2 == position
            x2 = data(data(pointer+2)+1);
        elseif param2 == immediate
            x2 = data(pointer+2);
        elseif param2 == 2
            x2 = data(data(pointer+2)+1+relative_base);
        end
        
        data(data(pointer+3)+1) = x1*x2;
        pointer = pointer+4;
    elseif op ==3
        if index == 0
            if param1 ~= 2
            data(data(pointer+1)+1) = input;
            pointer = pointer + 2;
            index = index +1;
            else
                data(data(pointer+1)+relative_base) = input;
                pointer = pointer +2;
                index = index+1;
            end
        elseif index ~= 0
            data(data(pointer+1)+1) = input2;
            pointer = pointer + 2;
            index = index + 1;
        end
    elseif op == 4
        if param1 == position
            x1 = data(data(pointer+1)+1);
        elseif param1 == immediate
            x1 = data(pointer+1);
        elseif param1 == 2
            x1 = data(data(pointer+1)+1+relative_base);
        end
        
        output = x1;
        disp(output)
        pointer = pointer + 2;
        %         pointer = pointer + 2;
    elseif op == 99
        break;
    elseif op == 5
        if param1 == position
            x1 = data(data(pointer+1)+1);
        elseif param1 == immediate
            x1 = data(pointer+1);
        elseif param1 == 2
            x1 = data(data(pointer+1)+1+relative_base);
        end
        
        if param2 == position
            x2 = data(data(pointer+2)+1);
        elseif param2 == immediate
            x2 = data(pointer+2);
        elseif param2 == 2
            x2 = data(data(pointer+2)+1+relative_base);
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
        elseif param1 == 2
            x1 = data(data(pointer+1)+1+relative_base);
        end
        
        if param2 == position
            x2 = data(data(pointer+2)+1);
        elseif param2 == immediate
            x2 = data(pointer+2);
        elseif param2 == 2
            x2 = data(data(pointer+2)+1+relative_base);
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
        elseif param1 == 2
            x1 = data(data(pointer+1)+1+relative_base);
        end
        
        if param2 == position
            x2 = data(data(pointer+2)+1);
        elseif param2 == immediate
            x2 = data(pointer+2);
        elseif param2 == 2
            x2 = data(data(pointer+2)+1+relative_base);
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
        elseif param1 == 2
            x1 = data(data(pointer+1)+1+relative_base);
        end
        
        if param2 == position
            x2 = data(data(pointer+2)+1);
        elseif param2 == immediate
            x2 = data(pointer+2);
        elseif param2 == 2
            x2 = data(data(pointer+2)+1+relative_base);
        end
        
        if x1 == x2
            data(data(pointer+3)+1) = 1;
        else
            data(data(pointer+3)+1) = 0;
        end
        pointer = pointer + 4;
    elseif op == 9
        if param1 == position
            relative_base = relative_base + data(data(pointer+1)+1);
        else
            relative_base = relative_base + data(pointer+1);
        end
        pointer = pointer+2;
    end
end

