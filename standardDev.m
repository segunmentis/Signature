function sd = standardDev(data,num)
datalength = length(data);
m = datalength-1;
lists = [];
for i=1:datalength-1
    lx = data(i+1,num)-data(i,num);
    t = data(i+1,3)-data(i,3);
    result = lx/t;
    lists(end+1)= result;
end
sumdata = sum(lists);
sd = 1/m*sumdata;
end
