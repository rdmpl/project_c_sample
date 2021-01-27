# Bug1: when you generated the .d files, ant then
# remove a *h files, then you should clean and then build
# in fact, it is not too ususl when you delete files 
# Bug2: when you remove a .c files and build again, it may
# take no response 
# Remember: when you delete a file, execute make clean first
SUBDIR  := 

#configure the output dir
SRCROOT := src
OBJROOT := obj
DEPDIR  := dep
LIBDIR  := .

#library name
TARGET  := gosmod1

# auto search the c source files in subdir
OBJDIR  := $(addprefix $(OBJROOT)/, $(SUBDIR))
SRCS    := $(foreach dir, $(SUBDIR), $(wildcard $(SRCROOT)/$(dir)/*.c))
BASESRC := $(basename $(SRCS))
OBJS    := $(patsubst $(SRCROOT)/%.c,$(OBJROOT)/%.o,$(SRCS))
DEPS    := $(patsubst %.o,$(DEPDIR)/%.d,$(notdir $(OBJS)))
CURDIR  := $(shell pwd)
CFLAGS  := $(foreach item, $(SUBDIR), -I$(CURDIR)/include/$(item)) 

LIBS    := $(LIBDIR)/lib$(TARGET)

# use the grep's -c properties to check whether it contains charactor
SAFEDELDIR  = if [ "`echo $(1) | grep -ic [a-z]`" -ne "0" ]; then \
	      rm -rf $(1) ; \
	      fi;
SAFEDELFILE = if [ "`echo $(wildcard $(1)) | grep -ic [a-z]`" -ne "0" ]; then \
	      rm $(1) ; \
	      fi;

all: $(DEPDIR) $(OBJDIR) $(LIBDIR) $(LIBS).a 

$(LIBS).a: $(OBJS)
	@$(AR) $(ARFLAGS) $@ $^ 1>/dev/null
	@echo -------$(LIBS).a prepared!----------

$(LIBS).so: $(OBJS)
	@$(CC) $(LDFLAGS) -o $(LIBS).so $(OBJS)
	@echo -------$(LIBS).so prepared!---------

$(DEPDIR) $(OBJDIR) $(LIBDIR):
	@test -d $@ || mkdir -p $@

-include $(DEPS)

$(OBJS): $(OBJROOT)%.o:$(SRCROOT)%.c
	@$(CC) $(CFLAGS) -MM -MT $@ -MF $(patsubst %.o, $(DEPDIR)/%.d, $(notdir $@)) $< 1>/dev/null
	@echo CC $< ...
	@$(CC) $(CFLAGS) -c $< -g -o $@
rebuild: clean all
help:
	@echo "make [target],  the target can be one of the followings"
	@echo "all:     generate the lib"
	@echo "clean:   clean all generated files"
	@echo "rebuild: clean and build lib"
# note: don't add '/' after OBJROOT
clean:
	@$(foreach it, $(DEPDIR) $(OBJROOT) $(LIBDIR), $(call SAFEDELDIR, $(it)))
	@$(foreach it,*.d *.o *.a, $(call SAFEDELFILE, $(it)))
