# Variáveis
CC = gcc
CFLAGS = -pedantic-errors -Wall `pkg-config --cflags gtk+-3.0`
LFLAGS = `pkg-config --libs gtk+-3.0`

# Regra : dependências
all: linkedContactList.o contatos.o
	$(CC) $(LFLAGS) contatos.o include/linkedContactList.o -o contatos

contatos.o: contatos.c
	$(CC) $(CFLAGS) -c contatos.c -o contatos.o

linkedContactList.o: include/linkedContactList.c
	$(CC) $(CFLAGS) -c include/linkedContactList.c -o include/linkedContactList.o

clean:
	rm *.o include/*.o contatos

run:
	./contatos

# See target-specific variables https://www.gnu.org/software/make/manual/make.html#Target_002dspecific
debug: CFLAGS += -g
debug: clean all
