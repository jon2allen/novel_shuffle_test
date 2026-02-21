CC = gcc
CFLAGS = -O2 -Wall -Wextra -std=c11
TARGET = shuffle_demo
ALG = fisher_yates

all: $(TARGET)

$(TARGET): main.o $(ALG).o
	$(CC) $(CFLAGS) -o $@ $^

$(ALG).o: $(ALG).c
	$(CC) $(CFLAGS) -c $<

main.o: main.c
	$(CC) $(CFLAGS) -c $<

clean:
	rm -f *.o $(TARGET)
