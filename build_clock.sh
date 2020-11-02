mkdir -p proc/__build__ netsim/__build__ && \
cd proc && python3 riscv_clock.py && cd .. &&\
cp proc/__build__/riscv_clock.net netsim/__build__/proc_clock.net && \
asm2rv code/build/clock.s -o code/build/clock.risc --rom && \
asm2rv code/build/clock_fast.s -o code/build/clock_fast.risc --rom && \
make -C netsim clock && \
printf "\e[32mBuild success [Clock]\e[0m\n"

# start with : netsim/runclock code/build/clock.risc
