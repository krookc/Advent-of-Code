clc; clear all; close all;

input  = (206938:679128);

valids = "";

for i = input:1:input(end)
    %skapara strängen med värdet
    current = split(string(i),"");
    current = current(2:7);
    %har den identiska tal?
    equal = 0;
    for j = 1:5
        % Avbryt om nuvarande är större än nästa
        if str2double(current(j)) > str2double(current(j+1))
            equal = 0;
            break
        end
        %sätt equal till 1 om två på varandra följande siffror är likadana
        if str2double(current(j)) == str2double(current(j+1))
            equal = 1;
        end
    end
    
    if equal
        %bygger lång sträng med resultaten
        valids = valids + string(i) + ",";
    end
end
length_passwords = length(split(string(valids), ","));