#include <iostream>

int main() {
    double A[10] = {0.395613, 
0.671956,
5.28714e-06,
0,
0,
0,
0,
0,
0,
0};
    for (int i=1; i<10; ++i) {
       double pivot = A[i];
       int step = 1;
       for (int j = i-1; -1<j; j=j-step)
           if (pivot < A[j])
            A[j+1] = A[j];
           else {
             A[j+1] = pivot;
             step = 10;
           };
       if (step==1) A[0] = pivot;    
    }

    for (int i=0; i<10; ++i) 
        std::cout<<A[i]<<" ";
}