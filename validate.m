function md = validate(tr,ts)
result = [];
tp = [];
[m,n] = size(tr);
[a,b] = size(ts);
for i=1:m
    for j=1:a
        for k=1:n
            val = tr(i,k);
            val2 = ts(j,k);
            tp(1,k) = abs(val-val2);
        end
        data = sum(tp);
        result(i,j) = data;
    end
end
md = result;
%disp('Matching Score is');
disp(mp);
decision(md);
%disp(md);
end
