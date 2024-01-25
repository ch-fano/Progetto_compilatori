./kcomp prova.k 2> prova.ll
./Test_progetto/tobinary prova.ll
clang++ -c callprova.cpp
clang++ -o prova callprova.o prova.o 

rm callprova.o prova.bc prova.ll prova.o prova.s
