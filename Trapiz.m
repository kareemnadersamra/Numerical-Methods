x= [0 2 4 6 8 10];
interv= length(x)-1;          %Interval Calculation
h = (x(end)-x(1))/interv;          %Height Calculation
sum = x(1);
for i=2:length(x)-1
    sum = sum + 2*(x(i));

end
sum = sum + x(end);
trapm = (h*sum)/2