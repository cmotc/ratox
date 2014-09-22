# ratox version
VERSION = 0.0

# paths
PREFIX = /usr/local
MANPREFIX = $(PREFIX)/share/man

CC = cc
LD = $(CC)
CPPFLAGS = -DVERSION=\"${VERSION}\"
CFLAGS   = -I/usr/local/include -Wall -Wunused $(CPPFLAGS)
LDFLAGS  = -L/usr/local/lib -ltoxcore -ltoxencryptsave
