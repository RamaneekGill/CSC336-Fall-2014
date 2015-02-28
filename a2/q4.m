

QUESTION 4
////////////////////////////////////////////////////////////////////////////////////////////////
A)
	A\B =   
		   10.8579
		   -7.6777
		   10.0000
		  -25.0000
		   46.2132
		   -7.6777
		         0
		  -25.0000
		    3.5355
		   22.5000
		   20.0000
		  -31.8198
		   22.5000
B)

	||f-f_hat|| / ||f|| <= cond(A) ||r|| / ||b||
						<= 404.2256

////////////////////////////////////////////////////////////////////////////////////////////////
code: q4.m
A = zeros(13, 13);    
B = zeros(13, 1);     

B(2,1) = 10;
B(8,1) = 15;
B(10,1) = 20;
                      
A(1,2) = 1;           
A(1,6) = -1;          
A(2,3) = 1;           
A(3,1) = -sqrt(2)/2;           
A(3,4) = 1;          
A(3,5) = sqrt(2)/2;  
A(4,1) = sqrt(2)/2;   
A(4,3) = 1;           
A(4,4) = sqrt(2)/2;   
A(5,4) = 1;           
A(5,8) = -1;
A(6,7) = 1;           
A(7,5) = sqrt(2)/2;   
A(7,6) = 1;
A(7,9) = -sqrt(2)/2;
A(7,10) = -1;
A(8,5) = sqrt(2)/2;
A(8,7) = 1;
A(8,8) = sqrt(2)/2;
A(9,10) = 1;
A(9,13) = -1;
A(10,11) = 1;
A(11,8) = 1;
A(11,9) = sqrt(2)/2;
A(11,12) = -sqrt(2)/2;
A(12,9) = sqrt(2)/2;
A(12,11) = 1;
A(12,12) = sqrt(2)/2;
A(13,12) = sqrt(2)/2;
A(13,13) = 1;

A
B
A\B
cond = cond(A, 1)
r = norm(B - A*A\B, 1)
b = norm(B, 1)
disp(['||f-f.hat|| / ||f|| is less than or equal to ', num2str(cond*r/b)]);



output:
>> q4

A =

  Columns 1 through 7

         0    1.0000         0         0         0   -1.0000         0
         0         0    1.0000         0         0         0         0
   -0.7071         0         0    1.0000    0.7071         0         0
    0.7071         0    1.0000    0.7071         0         0         0
         0         0         0    1.0000         0         0         0
         0         0         0         0         0         0    1.0000
         0         0         0         0    0.7071    1.0000         0
         0         0         0         0    0.7071         0    1.0000
         0         0         0         0         0         0         0
         0         0         0         0         0         0         0
         0         0         0         0         0         0         0
         0         0         0         0         0         0         0
         0         0         0         0         0         0         0

  Columns 8 through 13

         0         0         0         0         0         0
         0         0         0         0         0         0
         0         0         0         0         0         0
         0         0         0         0         0         0
   -1.0000         0         0         0         0         0
         0         0         0         0         0         0
         0   -0.7071   -1.0000         0         0         0
    0.7071         0         0         0         0         0
         0         0    1.0000         0         0   -1.0000
         0         0         0    1.0000         0         0
    1.0000    0.7071         0         0   -0.7071         0
         0    0.7071         0    1.0000    0.7071         0
         0         0         0         0    0.7071    1.0000


B =

     0
    10
     0
     0
     0
     0
     0
    15
     0
    20
     0
     0
     0


ans =

   10.8579
   -7.6777
   10.0000
  -25.0000
   46.2132
   -7.6777
         0
  -25.0000
    3.5355
   22.5000
   20.0000
  -31.8198
   22.5000


cond =

   27.7279


r =

  656.0229


b =

    45

||f-f.hat|| / ||f|| is less than or equal to 404.2256

/////////////////////////////////////////////////////////////////////

QUESTION 5
/////////////////////////////////////////////////////////////////////
Refer to the program output below for the justification for these
answers.

A) The Hilbery Matrix can go up to 13 dimensions before its relative 
error is greater than or equal to 1.

B) As n gets bigger so does the condition number for the hilbert matrix 
with a dimension of n. This shows that the bigger the hilbert matrix is
the bigger the error will be in calculating x_hat. The condition number
seems to grow exponentially based on n. This is observed by the log10
operation used condition number of the Hilbert Matrix.

C) As n grows by 1 each loop, the amount of correct digits seem to decrease
by slightly more than 1. When n == 1 the correctness of x_hat is almost
at the magnitude of a single percision floating point number. As n
grows the correct digits continue to decrease to the point where no
digit is in x_hat is correct when n = 13.

/////////////////////////////////////////////////////////////////////
code: q5.m

n = 1;
H = hilb(n);
x = ones(n);
B = H*x;
xhat = H\B;
relerror = norm(x-xhat, inf)/norm(x,inf);

while relerror < 1
	H = hilb(n);
	con = cond(H, inf);
	x = ones(n);
	B = H*x;
	xhat = H\B;
	relerror = norm(x-xhat, inf)/norm(x,inf);
	digits = -log10(relerror);
	lcond = log10(con);

	disp(['N = ',num2str(n),' relative error: ',num2str(relerror),' condition number: ',num2str(con),' log10(con): ',num2str(lcond),' # correct digits: ',num2str(digits)]);
	n = n+1;
end



output:
N = 1 relative error: 0 condition number: 1 log10(con): 0 # correct digits: Inf
N = 2 relative error: 7.7716e-16 condition number: 27 log10(con): 1.4314 # correct digits: 15.1095
N = 3 relative error: 4.885e-15 condition number: 748 log10(con): 2.8739 # correct digits: 14.3111
N = 4 relative error: 2.9587e-13 condition number: 28375 log10(con): 4.4529 # correct digits: 12.5289
N = 5 relative error: 1.9926e-12 condition number: 943656 log10(con): 5.9748 # correct digits: 11.7006
N = 6 relative error: 4.6634e-10 condition number: 29070279.0029 log10(con): 7.4634 # correct digits: 9.3313
N = 7 relative error: 2.0028e-08 condition number: 985194889.7198 log10(con): 8.9935 # correct digits: 7.6984
N = 8 relative error: 4.3834e-07 condition number: 33872790819.4947 log10(con): 10.5299 # correct digits: 6.3582
N = 9 relative error: 1.9351e-05 condition number: 1099650991701.052 log10(con): 12.0413 # correct digits: 4.7133
N = 10 relative error: 0.00037952 condition number: 35353724553756.42 log10(con): 13.5484 # correct digits: 3.4208
N = 11 relative error: 0.0066196 condition number: 1230369938308720 log10(con): 15.09 # correct digits: 2.1792
Warning: Matrix is close to singular or badly scaled.
         Results may be inaccurate. RCOND = 2.632766e-17.
> In cond at 48
  In q5 at 11
Warning: Matrix is close to singular or badly scaled.
         Results may be inaccurate. RCOND = 2.409320e-17.
> In q5 at 14
N = 12 relative error: 0.2395 condition number: 37983201226912104 log10(con): 16.5796 # correct digits: 0.62069
Warning: Matrix is close to singular or badly scaled.
         Results may be inaccurate. RCOND = 2.339949e-18.
> In cond at 48
  In q5 at 11
Warning: Matrix is close to singular or badly scaled.
         Results may be inaccurate. RCOND = 2.339949e-18.
> In q5 at 14
N = 13 relative error: 5.7974 condition number: 427595335326831488 log10(con): 17.631 # correct digits: -0.76323