AS = as
LD = ld

OBJS = string_to_int.o int_to_string.o main.o
TARGET = main.out

all: $(TARGET)

$(TARGET): $(OBJS)
	$(LD) $(OBJS) -o $(TARGET)

string_to_int.o: string_to_int.s
	$(AS) string_to_int.s -o string_to_int.o

int_to_string.o: int_to_string.s
	$(AS) int_to_string.s -o int_to_string.o

main.o: main.s
	$(AS) main.s -o main.o

run: $(TARGET)
	./$(TARGET)

clean:
	rm -f $(OBJS) $(TARGET)

.PHONY: all run clean
