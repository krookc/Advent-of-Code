clc; clear all; close all;

input  = (206938:679128);

valids = "";

for i = input:1:input(end)
    %skapara str�ngen med v�rdet
    current = split(string(i),"");
    current = current(2:7);
    %har den identiska tal?
    equal = 0;
    for j = 1:5
        % Avbryt om nuvarande �r st�rre �n n�sta
        if str2double(current(j)) > str2double(current(j+1))
            equal = 0;
            break
        end
        %s�tt equal till 1 om tv� p� varandra f�ljande siffror �r likadana
        if str2double(current(j)) == str2double(current(j+1))
            equal = 1;
        end
    end
    
    if equal
        %bygger l�ng str�ng med resultaten
        valids = valids + string(i) + ",";
    end
end
length_passwords = length(split(string(valids), ","));