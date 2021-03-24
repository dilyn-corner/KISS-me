# Trajectory for these packages

In an ideal world, this entire collection would be unecessary. But here we are,
MIT people living in a GNU world. What can be done about it? 

There are some packages that we simply can't remove. `linux` is of course the
biggest blocker. If the Linux version of OSS weren't GPL'd, we could try it over
`alsa`, but I don't wreckon it's feasible. `tinyalsa` is an option.

`x264`, `x265`, and `lame` are probably super useful to `chromium`. Sigh. 

`gnupg1` could theoretically be replaced with `rnp` if I found a way to make
`git` or `fossil` use it for signing commits. 

`gmake` could go away if we just decided to never build things which require
it!


### Things we cannot get rid of

`linux*` - for obvious reasons
    By extension I include `libelf` and `util-linux`


### Things we would like to replace

`alsa-{libs,utils}` - `tinyalsa` would be hella cool

`gnupg1` - `rnp` would be a sick replacement

`gmake` - required for many things to build :'(

`perl` - just a make dep for `chromium`


### Things we don't need

`ccache` - don't technically need it


### Things we need for chromium

`gperf` - make dep


### Things we could do without

`ffmpeg` - only if we enable gpl

`x264` - I don't think we can do without this

`x265` - liekwise

`xvidcore` - likewise

`lame` - likewise

`fribidi` - `pango` (want to eliminate), `libass` (don't need?)


### Things we would like to kill

`glib` - required by `pango`

`pango` - would have to abandon `hikari`
