
ifndef COMPILER
define compiler_help
Set COMPILER to ensure correct flags are set.
Available compilers are:
  GNU CLANG INTEL CRAY
endef
$(info $(compiler_help))
endif

COMPILER_ = $(CXX)
COMPILER_GNU = g++
COMPILER_CLANG = clang++
COMPILER_INTEL = icpc
COMPILER_CRAY = CC

FLAGS_ = -O3 -std=c++11
FLAGS_GNU = -O3 -std=c++11
FLAGS_CLANG = -O3 -std=c++11
FLAGS_INTEL = -O3 -std=c++11
FLAGS_CRAY = -O3 -hstd=c++11
CXXFLAGS=$(FLAGS_$(COMPILER))

ocl-stream: main.cpp OCLStream.cpp
	$(COMPILER_$(COMPILER)) $(CXXFLAGS) -DOCL $^ $(EXTRA_FLAGS) -lOpenCL -o $@

.PHONY: clean
clean:
	rm -f ocl-stream

