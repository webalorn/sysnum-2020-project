# on VM : clang --target=riscv32 -std=c++17 -S clock.cpp -o build/clock.s -O2

mkdir -p proc/__build__ netsim/__build__ && \
# cd proc && python3 riscv.py && cd .. &&\
cp proc/__build__/riscv.net netsim/__build__/proc.net && \
asm2rv code/build/clock.s -o code/build/clock.risc --rom && \
python3 vhdd/vhdd.py new vhdd/drive_clock.vhdd - - && \
# make -C netsim proc && \
printf "\e[32mBuild success [Clock]\e[0m\n"

# start with : netsim/runproc code/build/clock.risc vhdd/drive.vhdd
