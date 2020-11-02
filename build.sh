mkdir -p proc/__build__ netsim/__build__ && \
# cd proc && python3 riscv.py && cd .. &&\
# cp proc/__build__/riscv.net netsim/__build__/proc.net && \
asm2rv code/build/boot.s -o code/build/boot.risc --rom && \
asm2rv code/build/main.s -o code/build/main.risc && \
python3 vhdd/vhdd.py new vhdd/drive.vhdd code/build/main.risc vhdd/files && \
make -C netsim proc && \
printf "\e[32mBuild success [Proc]\e[0m\n"

# run with : netsim/runproc code/build/boot.risc vhdd/drive.vhdd
