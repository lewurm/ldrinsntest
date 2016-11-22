ANDROID_NDK := /Users/bernhardu/work/monodroid.build/monodroid/external/android-sdk-tool/android-ndk
PREFIX := $(ANDROID_NDK)/toolchains/arm-linux-androideabi-4.9/prebuilt/darwin-x86_64/bin/arm-linux-androideabi

ARCHSTUFF := -march=armv5te -mtune=xscale -msoft-float

CC := "$(PREFIX)-gcc" -MMD -MP -MF harness.o.d -fpic -ffunction-sections -funwind-tables -fstack-protector-strong -no-canonical-prefixes $(ARCHSTUFF) -Os -g -DNDEBUG -fomit-frame-pointer -fno-strict-aliasing -finline-limit=64 -I/cutils -DANDROID -DNO_ANDROID_FUNCS=1 -DHAVE_POSIX_FALLOCATE=0 -DNDEBUG=1 -DHAVE_USLEEP=1 -DHAVE_MALLOC_H=1 -Wa,--noexecstack -Wformat -Werror=format-security  -isystem $(ANDROID_NDK)/platforms/android-9/arch-arm/usr/include

LD := "$(PREFIX)-as"

SHARED := "$(PREFIX)-gcc" $(ARCHSTUFF) -shared --sysroot=$(ANDROID_NDK)/platforms/android-9/arch-arm -lgcc -no-canonical-prefixes  -Wl,--no-undefined -Wl,-z,noexecstack -Wl,-z,relro -Wl,-z,now -Wl,--warn-shared-textrel -Wl,--fatal-warnings -lc -lm -llog


all: libldrinsn.so

harness.o: harness.c
	$(CC) $^ -c -o $@

ldrinsn.o: ldrinsn.s
	$(CC) -c -o $@ $^

libldrinsn.so: ldrinsn.o harness.o
	$(SHARED) -Wl,-soname,$@ $^ -o $@

.PHONY: clean
clean:
	rm -rf libldrinsn.so *.o
