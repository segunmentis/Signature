function d = decision(result)
a = 1.0e+05;
fa = 0;
fr =0;
[m,n] = size(result);
s = m*n;
d = min(result,[],1);
%disp(d(1,1));
for i=1:m
    for j=1:n
        val = result(i,j);
        if(val<=a)
          if(val ~= d(1,j))
              fa = fa+1;             
          end
          else
         if isequal(val,d(1,j))
              fr = fr+1;
             
          end
        end
        
    end
end

far = (fa/s)*100;
frr = (fr/s)*100;

fprintf('\nThe false acceptance rate is %d',far);

fprintf('\nThe false rejection rate is %d\n',frr);

end
