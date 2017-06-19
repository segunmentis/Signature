function w = sig(data,num)
maxdata = max(data(:,num));
mindata = min(data(:,num));
w = maxdata-mindata;
end
