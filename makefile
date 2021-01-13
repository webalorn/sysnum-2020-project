all: clock proc

prepare:
	mkdir -p proc/__build__ netsim/__build__
	ln -sf ../hdl/hdl proc/hdl

# run with : netsim/runclock code/build/clock.risc
clock: prepare
	cd proc && python3 riscv_clock.py && cd ..
	cp proc/__build__/riscv_clock.net netsim/__build__/proc_clock.net
	python3 asmv code/build/clock.s -o code/build/clock.risc --rom -b
	python3 asmv code/build/clock_fast.s -o code/build/clock_fast.risc --rom -b
	make -C netsim clock


# run with : netsim/runproc code/build/boot.risc vhdd/drive.vhdd
riscv: prepare
	cd proc && python3 riscv.py && cd ..
	cp proc/__build__/riscv.net netsim/__build__/proc.net
	python3 asmv code/build/clock.s -o code/build/clock.risc --rom -b
	python3 asmv code/build/boot.s -o code/build/boot.risc --rom -b
	python3 asmv code/build/main.s -o code/build/main.risc -b
	python3 asmv code/build/screen_clock.s -o code/build/screen_clock.risc -b
	python3 vhdd/vhdd.py new vhdd/drive.vhdd code/build/main.risc vhdd/files -b
	python3 vhdd/vhdd.py new vhdd/drive_clock.vhdd code/build/screen_clock.risc vhdd/files/images/alphabet -b
	make -C netsim proc


# run with : netsim/runproc code/build/boot.risc vhdd/drive_mul.vhdd
mul: prepare
	cd proc && python3 riscv_rv32im.py && cd ..
	cp proc/__build__/riscv_mul.net netsim/__build__/proc.net
	python3 asmv code/build/mul.s -o code/build/mul.risc -b --mext
	mkdir -p vhdd/files/empty
	python3 vhdd/vhdd.py new vhdd/drive_mul.vhdd code/build/mul.risc vhdd/files/empty
	make -C netsim proc

clean:
	make -C netsim clean ; rm -R code/build/*.risc netsim/__build__/ proc/__build__/ vhdd/drive*.vhdd
