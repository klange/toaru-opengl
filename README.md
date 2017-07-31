# ToaruOS OpenGL Demos

ToaruOS previously shipped with these demos - `gears` and `teapot` - as part of the base distribution, but as they were the only uses of Mesa in the standard build and no additional Mesa-based software has been ported to ToaruOS, it was decided that these would be better left as a package. Mesa weighs in at about 3MB, so it's a big thing to be including on the base live CD image with only these demos to show.

## Building Mesa

The only known-working version of Mesa is 7.5.2, which is very old (late September, 2009). It was rather arbitrarily chosen because it includes the pre-Gallium `swrast` software rasterizer in a form that manages to build with our Newlib. Later versions may still work. If you manage to build a Mesa newer than this, please let me know as I would love to update (something 8.x or newer would be very nice for the OpenGL 3.0 support).

1. Obtain Mesa - possibly from [our mirror](http://b.dakko.us/~klange/mirrors), as the actual Mesa site may not even have this particular version anymore.
2. Patch the `config.sub` to accept `-toaru*`.
3. Build it:

        ./configure --enable-32-bit --host=$TARGET --prefix=$VIRTPREFIX  --with-osmesa-bits=8 --with-driver=osmesa  --disable-egl --disable-shared --without-x --disable-glw --disable-glut --disable-driglx-direct --disable-gallium
        make
        make DESTDIR=$TOARU_SYSROOT install

4. Build `libOSMesa.so` from `libOSMesa.a` (depends on `-lm`; see the core Toaru `Makefile` if you don't know how to do this)

