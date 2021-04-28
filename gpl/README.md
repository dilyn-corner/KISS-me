# Trajectory for these packages

In an ideal world, this entire collection would be unecessary. But here we are,
MIT people living in a GNU world. What can be done about it? 

There are some packages that we simply can't remove. `linux` is of course the
biggest blocker. If Linux's OSS weren't GPL'd, we could try it over `alsa`, but
I don't think it's feasible. `tinyalsa` does not work with `chromium`.

`gnupg1` could theoretically be replaced with `rnp` if I found a way to make
`git` or `fossil` use it for signing commits. We should raise an issue.
I think the only blocker is essentially the formatting of the output of signed
objects - `gnupg1` line wraps after fewer characters than `rnp`.

`gmake` could go away if we decided to never build things which require it!


### Things we cannot get rid of

`linux*` - for obvious reasons
    By extension I include `libelf` and `util-linux`
    `libelf` also seems to be required for `amdgpu` support in `mesa`.


### Things we would like to replace

`alsa-{libs,utils}` - `tinyalsa` would be hella cool :(

`gnupg1` - `rnp` would be a sick replacement

`gmake` - required for many things to build :'(


### Things we need for chromium

`gperf` - make dep

`perl` - make dep
