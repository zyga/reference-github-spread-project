.PHONY: all clean install
.DEFAULT: all

CFLAGS += -Wall
CXXFLAGS ?=

DESTDIR ?=
bindir ?= $(exec_prefix)/bin
exec_prefix ?= $(prefix)
prefix ?= /usr/local

all: demo

install: $(DESTDIR)$(bindir)/demo

uninstall:
	rm -f $(DESTDIR)$(bindir)/demo
	-rmdir --ignore-fail-on-non-empty $(DESTDIR)$(bindir)

clean:
	rm -f demo.o demo

demo: demo.o
	$(strip $(CC) -o $@ $(CFLAGS) $(CXXFLAGS) $<)
demo.o: demo.c
	$(strip $(CC) -c -o $@ $(CFLAGS) $(CXXFLAGS) $<)

$(DESTDIR)$(bindir):
	mkdir -p $@
$(DESTDIR)$(bindir)/demo: demo
	install -m 755 $< $@
