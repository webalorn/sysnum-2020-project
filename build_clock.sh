mkdir -p proc/__build__ netsim/__build__ && \
ln -sf ../hdl/hdl proc/hdl && \
cd proc && python3 riscv_clock.py && cd .. &&\
cp proc/__build__/riscv_clock.net netsim/__build__/proc_clock.net && \
python3 asmv code/build/clock.s -o code/build/clock.risc --rom -b && \
python3 asmv code/build/clock_fast.s -o code/build/clock_fast.risc --rom -b && \
make -C netsim clock && \
printf "\e[32mBuild success [Clock]\e[0m\n"

# start with : netsim/runclock code/build/clock.risc
