mkdir -p proc/__build__ netsim/__build__ && \
ln -sf ../hdl/hdl proc/hdl && \
cd proc && python3 riscv_rv32im.py && cd .. &&\
cp proc/__build__/riscv_mul.net netsim/__build__/proc.net && \
python3 asmv code/build/mul.s -o code/build/mul.risc -b --mext && \
python3 vhdd/vhdd.py new vhdd/drive_mul.vhdd code/build/mul.risc vhdd/files/empty && \
make -C netsim proc && \
printf "\e[32mBuild success [Proc]\e[0m\n"

# run with : netsim/runproc code/build/boot.risc vhdd/drive_mul.vhdd
