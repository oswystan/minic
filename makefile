#######################################################################
##                     Copyright (C) 2017 wystan
##
##       filename: makefile
##    description:
##        created: 2017-07-06 11:42:13
##         author: wystan
##
#######################################################################
.PHONY: all clean

bin := a.out
src := $(wildcard *.c *.cpp)
obj := $(src:.c=.o)
obj := $(obj:.cpp=.o)
ld_flags :=
c_flags := -Werror -Wall

all: $(bin)

$(bin): $(obj)
	@gcc $^ -o $(bin) $(ld_flags)
	@strip $@
	@echo "[gen] "$@
%.o:%.c
	@echo "[ cc] "$@
	@gcc $(c_flags) -c $< -o $@
%.o:%.cpp
	@echo "[cpp] "$@
	@g++ $(c_flags) -c $< -o $@

clean:
	@echo "cleaning..."
	@rm -f *.o $(bin)
	@echo "done."

#######################################################################
