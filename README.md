# NonOS: this OS is not an "os"

NonOS is an experimental OS for RISCV-32gc (virt). With a bit of luck, NonOS will be made (mainly) in Rust (no way).

# Installation

Build the RISC-V cross-compiler with:
```bash
export RISCV=/path/to/installation/dir
./configure --prefix=$RISCV --enable-llvm --disable-linux --with-arch=rv32gc --with-abi=ilp32d
make -j$(nproc) all build-sim SIM=qemu
export PATH=$PATH:$RISCV/bin
```

Build the RISC-V dedicated version of QEmu:
```bash
./configure --target-list=riscv32-softmmu --prefix=/path/to/installation/dir
make -j$(nproc)
make install
```

And that must be all. For more information, go check [this page](https://theintobooks.wordpress.com/2019/12/28/hello-world-on-risc-v-with-qemu/).

# Build

- To build NonOS, run `make bios`.
- To launch NonOS in QEmu, run `make qemu`.
- To launch NonOS in GDB debug mode, run `make debug` and, in another bash instance, run `make gdb`.
