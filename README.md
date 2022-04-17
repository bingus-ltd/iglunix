# [Iglunix for servers](https://stallman.org/)
Unix like software distribution with GNU components

All build scripts are 0BSD Licensed.

To create an ISO from a non-iglunix OS please see https://github.com/iglunix/iglunix-autobuild

## Is this GNU/Linux
yeah

## Discord
Join us at [link](https://discord.gg/NKB9qD2bMx)

## Status of Other Kernels

### FreeBSD
FreeBSD has solid upstream LLVM support which would make it ideal for iglunix.
However, I haven't been successful at building the required parts of the base
system.

### OpenBSD
Iglunix has been tested to work on OpenBSD. (don't forget to symlink `libc.so`
otherwise the toolchain breaks).

### Darwin
I have found no easy way of building libc on Darwin platforms as on yet.
Because of this I haven't got far at all porting Iglunix to Darwin
based systems such as MacOS and PureDarwin.

## Web Browsers
Iglunix has Firefox ESR packaged requiring 2 extra GNU packages: `gm4` and
`autoconf`. Iglunix may switch to using a patched version of webkit gtk with
openssl and maybe ffmpeg replacing gstreamer.

## Replacements LUT

|standard tool | iglunix tool       | use                              |
|--------------|--------------------|----------------------------------|
|glibc         | musl               | libc                             |
|glibc         | libexecinfo        | Backtrace functions              |
|libstdc++     | libc++             | C++ standard library             |
|libgcc        | libunwind          | Stack unwinding                  |
|libgcc        | compiler-rt        | Compiler builtins                |
|bison         | byacc              | POSIX yacc                       |
|coreutils     | toybox+busybox     | POSIX utilities                  |
|gcc           | clang              | C++ compiler                     |
|zlib          | zlib-ng            | Compression library              |
|gmake         | bmake, others      | POSIX Make implementation        |
|ninja         | samurai            | Ninja build implementation       |
|GNU M4        | OpenBSD M4         | POSIX M4 implementation          |
|ncurses       | netbsd-curses      | X/Open Curses implementation     |
|bash          | mksh               | Shell                            |
|Linux PAM     | Open PAM           | Pluggable Authentication Modules |
|sudo          | doas               | Privilege escalation             |
|pkg-config    | pkgconf            | Package configuration tool       |
|e2fsprogs     | make_ext4fs        | Make an ext4 file system         |



## TODO (lots more TODO items in the Discord)
 - LLVM (Work out how to split packages)
 - QEMU for multiarch (need lots of work on glibr to get this to build)
