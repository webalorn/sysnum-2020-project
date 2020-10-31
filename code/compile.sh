clang --target=riscv32 -std=c++17 -O2 -S boot.cpp -o build/boot.s && \
clang --target=riscv32 -std=c++17 -O2 -S main.cpp -o build/main.s 
