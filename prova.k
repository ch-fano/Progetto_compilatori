extern printval(x controlchar);
global A[10];
def main() {
  for (var i=0; i<10; ++i) {
     A[i] = randk();
     printval(A[i],0)
  };
  printval(0,1);
  inssort();
  for (var i=0; i<10; ++i)
     printval(A[i],0)
};

