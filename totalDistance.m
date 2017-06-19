function d = totalDistance(data)
datalength = length(data);
listx = [];
listy = [];
for i=1:datalength-1
    x = data(i+1,1)-data(i,1);
    result = x.^2;
    listx(end+1)= result;
    y = data(i+1,2)-data(i,2);
    results = y.^2;
    listy(end+1) = results;
end
sumx = sum(listx);
sumy = sum(listy);
tot = sumx +sumy;
d = sqrt(tot);
end