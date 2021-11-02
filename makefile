TARGET = tripe

CC = g++
#CFLAGS =  -Os -s -Wfatal-errors  -fno-stack-protector  -fno-unwind-tables -fno-asynchronous-unwind-tables  -fno-math-errno  -fno-unroll-loops
CFLAGS =  -g -s# -Wfatal-errors  -fno-stack-protector  -fno-unwind-tables -fno-asynchronous-unwind-tables  -fno-math-errno  -fno-unroll-loops

OUTDIR = bin
DATADIR = data
SUBDIR = src
DIR_OBJ = obj

INCS = $(wildcard *.h $(foreach fd, $(SUBDIR), $(fd)/*.h))
SRCS = $(wildcard *.cpp $(foreach fd, $(SUBDIR), $(fd)/*.cpp))
NODIR_SRC = $(notdir $(SRCS))
OBJS = $(addprefix $(DIR_OBJ)/, $(SRCS:cpp=o)) # obj/xxx.o obj/folder/xxx .o
INC_DIRS = -I./ $(addprefix -I, $(SUBDIR))
LIBS =  #-Wl,--gc-sections
LIB_DIRS =

PHONY := $(TARGET)
$(TARGET): $(OBJS)
	$(CC) -o $(OUTDIR)/$@ $(OBJS) $(LIB_DIRS) $(LIBS)
#	strip --strip-all  bin/lcc
$(DIR_OBJ)/%.o: %.cpp $(INCS)
	mkdir -p $(@D)
	$(CC) -o $@ $(CFLAGS) -c $< $(INC_DIRS)

PHONY += clean
clean:
	rm -rf $(OUTDIR)/* $(DATADIR)/* $(DIR_OBJ)/*

PHONY += echoes
echoes:
	@echo "INC files: $(INCS)"
	@echo "SRC files: $(SRCS)"
	@echo "OBJ files: $(OBJS)"
	@echo "LIB files: $(LIBS)"
	@echo "INC DIR: $(INC_DIRS)"
	@echo "LIB DIR: $(LIB_DIRS)"

.PHONY = $(PHONY)
