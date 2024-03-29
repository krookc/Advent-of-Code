clc; clear all; close all;


clc; clear all; close all;

data = load('day7input.txt');
% data = load('temp.txt');
% data = '3,15,3,16,1002,16,10,16,1,16,15,15,4,15,99,0,0';
% data=[3 15 3 16 1002 16 10 16 1 16 15 15 4 15 99 0 0];
inputs = "";

for i= 5:1:9
    for j = 5:1:9
        for k =5:1:9
            for l = 5:1:9
                for m = 5:1:9
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
% inputs = "97856";
temp = 0;

outputs = [];

%
% for i=1:length(inputs)-1
%     if i == 121
%         disp('hello');
%     end
%     temp = char(inputs(i));
%     ap = str2num(temp(1));
%     bp = str2num(temp(2));
%     cp = str2num(temp(3));
%     dp = str2num(temp(4));
%     ep = str2num(temp(5));
%
%     [asetup, te] = intcode(data, ap, 0);
% %     [demo, aoutput] = intcode( asetup, 0, 0);
%
%     [bsetup, te] = intcode(data, bp, te);
% %     [demo, boutput] = intcode(bsetup, aoutput, 0);
%
%     [csetup, te] = intcode(data, cp, te);
% %     [demo, coutput] = intcode(csetup, boutput, 0);
%
%     [dsetup, te] = intcode(data, dp, te);
% %     [demo, doutput] = intcode(dsetup, coutput, 0);
%
%     [esetup, te] = intco de(data, ep, te);
% %     [demo, eoutput] = intcode(esetup, doutput, 0);
%     outputs = [outputs; te];
% end

%feedback loop
outputs = ones(1, length(inputs));
for i = 1:1:length(inputs)-1
    temp = char(inputs(i));
    ap = str2num(temp(1));
    bp = str2num(temp(2));
    cp = str2num(temp(3));
    dp = str2num(temp(4));
    ep = str2num(temp(5));
    
    [amachine, ao, aindex, apointer, aopc] = intcode(data, ap, 0, 0, 1);
    [bmachine, bo, bindex, bpointer, bopc] = intcode(data, bp, ao, 0, 1);
    [cmachine, co, cindex, cpointer, copc] = intcode(data, cp, bo, 0, 1);
    [dmachine, do, dindex, dpointer, dopc] = intcode(data, dp, co, 0, 1);
    [emachine, eo, eindex, epointer, eopc] = intcode(data, ep, do, 0, 1);
    
    while eopc ~= 99
        outputs(i) = eo;
        [amachine, ao, aindex, apointer, aopc] = intcode(amachine, ap, eo, aindex, apointer);
        [bmachine, bo, bindex, bpointer, bopc] = intcode(bmachine, bp, ao, bindex, bpointer);
        [cmachine, co, cindex, cpointer, copc] = intcode(cmachine, cp, bo, cindex, cpointer);
        [dmachine, do, dindex, dpointer, dopc] = intcode(dmachine, dp, co, dindex, dpointer);
        [emachine, eo, eindex, epointer, eopc] = intcode(emachine, ep, do, eindex, epointer);
        
    end
    
end

answer = max(outputs);
