for i = -25:25
   
    format long;
    n=0;
    sum=0;
    oldsum=100;
    
    if i < 0
      while (abs(sum-oldsum) > 0.0000000000000001)
        oldsum=sum;
        sum = sum + abs(i)^n/factorial(n);
        n=n+1;
      end
      sum = 1/sum;

    else
      while (abs(sum-oldsum) > 0.0000000000000001)
        oldsum=sum;
        sum = sum + i^n/factorial(n);
        n=n+1;
      end
    end
 
    y = (sum - exp(i))/exp(i);
    disp(['Value of x is ', num2str(i), ', relative error is ', num2str(y, 20),'.']);
end	

