CC=gcc
CFLAGS=-lWarn -pedantic

therm:	Thermometer.o libmyifttt.a
	cc Thermometer.o -L. -lmyifttt -lcurl -o Therm

libmyifttt.a:	ifttt.o
	ar -rcs libmyifttt.a ifttt.o

ifttt.o:	ifttt.c ifttt.h
	$(CC) $(CFLAGS) -c -ansi $<

Thermomter.o:	Thermometer.c ifttt.h
	$(CC) $(CFLAGS) -c -ansi $<

all: therm

clean: rm *.o
