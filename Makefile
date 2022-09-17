CFLAGS?=	-Wall -ggdb -W -O
CC?=		gcc
LIBS?=
LDFLAGS?=
PREFIX?=	/usr/local
VERSION=1.5
TMPDIR=/tmp/webbench-$(VERSION)


all:   webbench
# cc -Wall -ggdb -W -O   -c -o webbench.o webbench.c
# cc -Wall -ggdb -W -O  -o webbench webbench.o
# ctags *.c


tags:  *.c
	-ctags *.c
# ctags *.c


install: webbench
	install -s webbench $(DESTDIR)$(PREFIX)/bin	
	install -m 644 webbench.1 $(DESTDIR)$(PREFIX)/man/man1	
	install -d $(DESTDIR)$(PREFIX)/share/doc/webbench
	install -m 644 debian/copyright $(DESTDIR)$(PREFIX)/share/doc/webbench
	install -m 644 debian/changelog $(DESTDIR)$(PREFIX)/share/doc/webbench
# cc -Wall -ggdb -W -O   -c -o webbench.o webbench.c
# cc -Wall -ggdb -W -O  -o webbench webbench.o
# install -s webbench /usr/local/bin
# install -m 644 webbench.1 /usr/local/man/man1
# install -d /usr/local/share/doc/webbench
# install -m 644 debian/copyright /usr/local/share/doc/webbench
# install -m 644 debian/changelog /usr/local/share/doc/webbench


webbench: webbench.o Makefile
	$(CC) $(CFLAGS) $(LDFLAGS) -o webbench webbench.o $(LIBS) 
# cc -Wall -ggdb -W -O   -c -o webbench.o webbench.c
# cc -Wall -ggdb -W -O  -o webbench webbench.o


clean:
	-rm -f *.o webbench *~ core *.core tags
# rm -f *.o webbench *~ core *.core tags


tar:   clean
	-debian/rules clean
	rm -rf $(TMPDIR)
	install -d $(TMPDIR)
	cp -p Makefile webbench.c socket.c webbench.1 $(TMPDIR)
	install -d $(TMPDIR)/debian
	-cp -p debian/* $(TMPDIR)/debian
	ln -sf debian/copyright $(TMPDIR)/COPYRIGHT
	ln -sf debian/changelog $(TMPDIR)/ChangeLog
	-cd $(TMPDIR) && cd .. && tar cozf webbench-$(VERSION).tar.gz webbench-$(VERSION)
# rm -f *.o webbench *~ core *.core tags
# debian/rules clean
# rm -rf /tmp/webbench-1.5
# install -d /tmp/webbench-1.5
# cp -p Makefile webbench.c socket.c webbench.1 /tmp/webbench-1.5
# install -d /tmp/webbench-1.5/debian
# cp -p debian/* /tmp/webbench-1.5/debian
# ln -sf debian/copyright /tmp/webbench-1.5/COPYRIGHT
# ln -sf debian/changelog /tmp/webbench-1.5/ChangeLog
# cd /tmp/webbench-1.5 && cd .. && tar cozf webbench-1.5.tar.gz webbench-1.5


webbench.o:	webbench.c socket.c Makefile
# cc -Wall -ggdb -W -O   -c -o webbench.o webbench.c


.PHONY: clean install all tar
