# Trajectory for these packages

In an ideal world, this entire collection would be unecessary. But here we are,
MIT people living in a GNU world. What can be done about it? 

There are some packages that we simply can't remove. `linux` is of course the
biggest blocker. If the Linux version of OSS weren't GPL'd, we could try it over
`alsa`, but I don't wreckon it's feasible. 

`x264`, `x265`, and `lame` are probably super useful to `chromium`. Sigh. 

That `xz` is GPL'd is very disheartening.

`gnupg1` could theoretically be replaced with `botan` if I found a way to make
`git` use it for signing commits. 

`gmake` could go away if we just decided to never build things which require
it!


### Things we cannot get rid of

`git` - I mean, come on

`linux*` - for obvious reasons

`perl` - make dep for llvm

`xz` - maybe there's a replacement?


### Things we only need once

`dosfstools` - Only need on *host* during installation

`e2fsprogs` - Only need if we opt for ext4...

`efibootmgr` - Only needed to set bootloader

`efivar` - `efibootmgr`


### Things we would like to replace

`alsa-libs` - OSS would be GREAT! If it were not GPL on Linux.

`alsa-utils` - We need a way to adjust volumes

`busybox` - `mdev` (figure out `toybox`'s), `modprobe` (only on kernel upgrades)

`gnupg1` - `botan` would be a sick replacement if `git` could use it

`gmake` - required for many things to build :'( 


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

`glib` - required by `chromium`, `pango`

`pango` - will have to abandon `hikari`
