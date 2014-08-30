#
# makefile for TINY
# Borland C Version
# K. Louden 2/3/98
#

CC = gcc

CFLAGS = 

#OBJS = main.o util.o scan.o parse.o symtab.o analyze.o code.o cgen.o
OBJS = $(patsubst %.c,%.o,$(wildcard *.c))

OBJSTM = $(patsubst tmcode/%.c,%.o,$(wildcard tmcode/*.c))

tiny: $(OBJS)
	$(CC) $(CFLAGS) -o tiny $(OBJS)

tm: $(OBJSTM)
	$(CC) $(CFLAGS) -o tm $(OBJSTM)

%.o: tmcode/%.c
	$(CC) $(CFLAGS) -c $< -o $@

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	-@rm -f tiny
	-@rm -f tm
	-@rm -f *.o

all: tm tiny

