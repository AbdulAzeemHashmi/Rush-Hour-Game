CC = g++
CFLAGS = -Wall -g
LDFLAGS = -lglut -lGL -lGLU -lX11 -lfreeimage -pthread $(shell sdl2-config --libs) -lSDL2_mixer
TARGET = game
SOURCES = game.cpp
OBJECTS = game.o util.o

all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CC) $(OBJECTS) -o $(TARGET) $(LDFLAGS)

game.o: game.cpp util.h
	$(CC) $(CFLAGS) $(shell sdl2-config --cflags) -c game.cpp -o game.o

# Assume util.o is precompiled or provided; if util.cpp exists, uncomment the next line
# util.o: util.cpp util.h
#	$(CC) $(CFLAGS) -c util.cpp -o util.o

clean:
	rm -f $(OBJECTS) $(TARGET)

.PHONY: all clean
