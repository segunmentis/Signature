clc;
cd('Database');
dbfiles = dir('*.sig'); 
numfiles = length(dbfiles);
x = 1;
y = 2;
a = 1;
b= 1;
rowval = 1;
colval = 1;
minval = 4;
maxval = 8;
lists = [];
t = cell2table(cell(0,9),'VariableNames',{'Sample','Sumx','Sumy','Vx','Vy','D','W','H','P'});
mydata = array2table(lists);
for i=1:numfiles
info = dbfiles(i).name;
data = dlmread(info,'%s',2,0);
cd('../');
dist = totalDistance(data);
sdx = standardDev(data,x);
sdy = standardDev(data,y);
sigx = sig(data,x);
sigy = sig(data,y);
cdx = sumCoordinates(data,x);
cdy = sumCoordinates(data,y);
avgp = avgPressure(data);
if (b>8)
    a =a+1;
    b=1;
end
s = strcat('S', num2str(a));
v = strcat(s, num2str(b));
ca = {v,cdx,cdy,sdx,sdy,dist,sigx,sigy,avgp};
cb = {cdx,cdy,sdx,sdy,dist,sigx,sigy,avgp};
t = [t;ca];
mydata = [mydata;cb];

b = b+1;
 
cd('Database');
end
cd('../');
disp(t);
datalength = height(mydata);
ts = []; 
tr = [];
for j=1:datalength
    if(j>maxval)
        validate(tr,ts);
        minval = maxval+4;
        maxval = minval+4;
        rowval = 1;
        colval = 1;
    end
    if (j<=minval)
        tr(rowval,1) = table2array(mydata(j,1));
        tr(rowval,2) = table2array(mydata(j,2));
        tr(rowval,3) = table2array(mydata(j,3));
        tr(rowval,4) = table2array(mydata(j,4));
        tr(rowval,5) = table2array(mydata(j,5));
        tr(rowval,6) = table2array(mydata(j,6));
        tr(rowval,7) = table2array(mydata(j,7));
        tr(rowval,8) = table2array(mydata(j,8));
        
       
    elseif(j>minval)&&(j<=maxval)
        
        ts(colval,1) = table2array(mydata(j,1));
        ts(colval,2) = table2array(mydata(j,2));
        ts(colval,3) = table2array(mydata(j,3));
        ts(colval,4) = table2array(mydata(j,4));
        ts(colval,5) = table2array(mydata(j,5));
        ts(colval,6) = table2array(mydata(j,6));
        ts(colval,7) = table2array(mydata(j,7));
        ts(colval,8) = table2array(mydata(j,8));
        colval = colval+1;
        
    end
   rowval = rowval+1;
end
