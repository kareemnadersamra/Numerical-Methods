x= [2 4 6 8 10];
interv= length(x)-1; %Interval Calculation
h = (x(end)-x(1))/interv;          %Height Calculation
sum = x(1)^3;
for i= 2:2:length(x)-1           %Giving more weight to the middle.
    sum = sum + 4 * (x(i)^3)   
end
for i= 3:2:length(x)-1
    sum = sum + 2 * (x(i)^3)   

end

sum = sum + (x(end)^3) 
Simpson= (h*sum)/3

