function p = avgPressure(data)
datalength = length(data);
sumval = sum(data(:,4));
p = 1/datalength*sumval;
end