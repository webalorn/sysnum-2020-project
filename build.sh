mkdir -p proc/__build__ netsim/__build__ && \
ln -sf ../hdl/hdl proc/hdl && \
cd proc && python3 riscv.py && cd .. &&\
cp proc/__build__/riscv.net netsim/__build__/proc.net && \
python3 asmv code/build/clock.s -o code/build/clock.risc --rom -b && \
python3 asmv code/build/boot.s -o code/build/boot.risc --rom -b && \
python3 asmv code/build/main.s -o code/build/main.risc -b && \
python3 asmv code/build/screen_clock.s -o code/build/screen_clock.risc -b && \
python3 vhdd/vhdd.py new vhdd/drive.vhdd code/build/main.risc vhdd/files -b && \
python3 vhdd/vhdd.py new vhdd/drive_clock.vhdd code/build/screen_clock.risc vhdd/files/images/alphabet -b && \
make -C netsim proc && \
printf "\e[32mBuild success [Proc]\e[0m\n"

# run with : netsim/runproc code/build/boot.risc vhdd/drive.vhdd
