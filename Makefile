CC = clang
SRC = analysis-test.c
OUT = $(basename $(SRC)).out

# Set a default value for NUM_RUNS
NUM_LOOPS ?= 20

all: run

run: $(OUT)
	bash -c 'for i in {1..$(NUM_LOOPS)}; do ./$(OUT); echo $$?; done; rm -f $(OUT)'

$(OUT): $(SRC)
	$(CC) $(SRC) -o $(OUT)

clean:
	rm -f $(OUT)