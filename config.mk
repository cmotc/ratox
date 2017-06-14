# ratox version
VERSION = 0.3

# paths
PREFIX = /usr/local
MANPREFIX = $(PREFIX)/share/man

CC = gcc
LD = $(CC)
CPPFLAGS = -DVERSION=\"${VERSION}\"
CFLAGS   = -g -I/usr/include -Wall -Wunused $(CPPFLAGS)
LDFLAGS  = -g -L/usr/local/lib -Bstatic
LDLIBS   = -l:libtoxcore.a -ltoxav -ltoxencryptsave -l:libsodium.a -l:libopus.a -l:libvpx.a -lm -lpthread
