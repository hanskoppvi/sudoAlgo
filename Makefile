# -O2		= Increases optimization levels. At -O2, additional optimizations are added, such as common subexpression elimination and strict aliasing.
# -g        = Produce debugging information. 
# -	Wall	= This enables all the warnings about constructions that some users consider questionable, and that are easy to avoid (or modify to prevent the warning), even in conjunction with macros.

CXXFLAGS :=-O2 -g -Wall

CC :=gcc # This is the main compiler
INC :=-I ./include

# Directories
SRCDIR :=./src
BUILDDIR =./build
TARGETDIR :=./bin

PROGRAM_NAME :=out
TARGET :=$(TARGETDIR)/$(PROGRAM_NAME)

SRCEXT :=.c
OBJECTS :=$(patsubst $(SRCDIR)/%$(SRCEXT),$(BUILDDIR)/%.o,$(wildcard $(SRCDIR)/*$(SRCEXT)))


$(TARGET): $(OBJECTS)
	@mkdir -p $(TARGETDIR) 
	$(CC) $^ -o $(TARGET)

# Creating the object files allows the linker to optimize compiling time.
$(BUILDDIR)/%.o: $(SRCDIR)/%$(SRCEXT)
	@mkdir -p $(BUILDDIR) 
	$(CC) $(CXXFLAGS) $(INC) -c -o $@ $<

# Clean Target.
clean:
	rm -rf $(BUILDDIR) $(TARGET)

# Runs the program.
run:
	$(TARGET)

.PHONY : clean run


