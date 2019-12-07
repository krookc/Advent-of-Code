clc; clear all; close all;


clc; clear all; close all;

data = load('day7input.txt');

inputs = "";

for i= 0:1:4
    for j = 0:1:4
        for k =0:1:4
            for l = 0:1:4
                for m = 0:1:4
                    if i ~= j && i ~= k && i ~= l && i ~= m
                        if j ~= k && j ~= l && j ~= m
                            if k ~= l && k ~= m
                                if l ~= m
                                    inputs = inputs + num2str(i) + num2str(j) + num2str(k) + num2str(l) + num2str(m) + ",";
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end


inputs = split(inputs, ",");
% inputs = "10432";
temp = 0;

outputs = [];

for i=1:length(inputs)-1
    if i == 121
        disp('hello');
    end
    temp = char(inputs(i));
    ap = str2num(temp(1));
    bp = str2num(temp(2));
    cp = str2num(temp(3));
    dp = str2num(temp(4));
    ep = str2num(temp(5));
    
    [asetup, te] = intcode(data, ap, 0);
%     [demo, aoutput] = intcode( asetup, 0, 0);
    
    [bsetup, te] = intcode(data, bp, te);
%     [demo, boutput] = intcode(bsetup, aoutput, 0);
    
    [csetup, te] = intcode(data, cp, te);
%     [demo, coutput] = intcode(csetup, boutput, 0);
    
    [dsetup, te] = intcode(data, dp, te);
%     [demo, doutput] = intcode(dsetup, coutput, 0);
    
    [esetup, te] = intcode(data, ep, te);
%     [demo, eoutput] = intcode(esetup, doutput, 0);
    outputs = [outputs; te];
end


disp(num2str(max(outputs)));