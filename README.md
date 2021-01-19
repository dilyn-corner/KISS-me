|/  
|\ISS Repo                                                      https://k1ss.org
________________________________________________________________________________


KISS-me - A KISS repository for forks, projects, and fun
________________________________________________________________________________


The master branch is for: 
1) A self-maintained 'fork' of [wyverkiss](https://github.com/wyvertux/wyverkiss) 
2) NonGNU experimentation

The wyverkiss-static branch is for:
1) A (mostly) completely static system
2) Experimenting with minimalism
3) NonGNU experimentation

Other branches are for:
1) Staging things prior to submitting them to 
[Community](https://github.com/kisslinux/community),
2) for things I know will 
[never be accepted into Community](https://k1ss.org/guidestones),
3) for forks.


## The structure of this repository

The BDFL of [KISS](https://github.com/kisslinux/kiss) has disappeared. After a
month of his absence, I decided to put his theory to the test: his distro can be
simply maintained by a single person. I'm only clocking in at ~100 packages
installed for a full wayland-stack + web browser, but this was Dylan's baseline
goal anyways. I'd say his project was proven a success, and I think I'll be able
to maintain this system basically indefinitely.

The master branch is very finicky and I would not recommend using it for a usual
system; use it as a reference for building packages. As an example, many build
scripts have been modified to make use of `meson` or `cmake` when available,
leaving perhaps a large amount of overhead in the build system. Not to mention
the fact that it is intended for wyverkiss. Additionally, due to my distaste for
GPL, much of the core system has changed to include `toybox`, `sbase`, `ubase`,
`ripgrep`, `uutils-coreutils`, `nawk`, and `libarchive`. As a result, core has
been extended to include `rust`. A lot of utilities are gone because of dropping
`busybox` (still available in gpl if need be), but I would like to assume that
I'll be just fine. We will see. 

Any packages that use a GPL license will end up in the gpl directory, regardless
of their position in the system hierarchy. Ideally, there will be almost no GPL
in the core, runtime system. Of course, concessions will have to be made for
certain things. But we take what we get, and we get what we can.

Other branches are used by me for things like my
[KISS-kde](https://github.com/dilyn-corner/KISS_kde) partition. These branches
are more suitable for everyday KISS use.

## Thoughts

In the ever-excruciating pursuit of being different for the sake of difference,
I have switched from KISS-proper to
[wyverkiss](https://github.com/wyvertux/wyverkiss).

Additionally, due to recent 
[issues with Xorg](https://gitlab.freedesktop.org/xorg/xserver/-/issues/1068), 
I have decided to commit to trying out `wayland`.

If you're using wyverkiss or some other `gcc`-less KISS implementation and want
a working `qt5`, revert `9ad56f3587e572ed87a12a3a9b6641fd9812153c` to get my
5.15.2 build.

## For the curious

Here is a roughly current list of all the licenses each package in this
repository uses. Dropping GPL *entirely* doesn't seem super possible, but we can
get there for the most part! The real question is how one feels about
GPL-compatible (what I would think of as semi-GPL) licenses (PSF, MPL).

Finally, the list doesn't go into the nuances of several licenses. Big examples
are things like `mesa` or `llvm` - projects which inherit extra licenses because
of code blobs they borrow. In general, I am semi-fine with this (if not wholly
forced to accept it).

  +--------------------+---------------+--------------------+---------------+
  | CORE               | LICENSE       | WAYLAND            | LICENSE       |
  +--------------------+---------------+--------------------+---------------+
  | byacc              | Public Domain | foot               | MIT           |
  | bzip2              | bzip2         | grim               | MIT           |
  | cmake              | BSD 3-Clause  | hikari             | BSD 2-Clause  |
  | curl               | MIT           | libxkcommon        | MIT           |
  | flex               | BSD 2-Clause  | wayland            | MIT           |
  | hummingbird        | MIT           | wayland-protocols  | MIT           |
  | kiss               | MIT           | wbg                | MIT           |
  | libarchive         | BSD-2-Clause  | wlroots            | MIT           |
  | libressl           | ISC           | xkeyboard-config   | MIT           |
  | llvm               | Apache-2.0    | yambar             | MIT           |
  | lz4                | BSD 2-Clause  +--------------------+---------------+
  | m4                 | BSD/ISC       | EXTRA              |               |
  | make               | BSD 2-Clause  +--------------------+---------------+
  | musl               | MIT           | blis               | BSD 3-Clause  |
  | nawk               | MIT           | botan              | BSD 2-Clause  |
  | oksh               | Public Domain | bottom             | MIT           |
  | openntpd           | ISC           | brightnessctl      | MIT           |
  | pigz               | zlib          | broadcom-wl        | shrug         |
  | procs              | MIT           | cairo              | MPLv1.1       |
  | rust               | APACHE/MIT    | cbindgen           | MPLv2         |
  | samurai            | Apache-2.0    | cozette-font       | MIT           |
  | sbase              | MIT           | dash               | BSD           |
  | toybox             | 0BSD          | dhcpcd             | BSD           |
  | ubase              | MIT           | dust               | Apache-2.0    |
  | uutils-coreutils   | MIT           | expat              | MIT           |
  | zlib               | zlib          | firefox            | MPLv2         |
  +--------------------+---------------+ fontconfig         | MIT           |
  | GPL                | LICENSE       | freetype-harfbuzz  | BSD           |
  +--------------------+---------------+ github-cli         | MIT           |
  | R-blis             | GPLv2         | gitui              | MIT           |
  | acpid              | GPLv2         | go                 | BSD 3-Clause  |
  | alsa-lib           | GPLv2.1       | gotop              | MIT           |
  | alsa-utils         | GPLv2         | iosevka-nerd-fonts | MIT           |
  | atk                | GPLv2         | libass             | ISC           |
  | autoconf           | GPLv3         | libdrm             | MIT           |
  | automake           | GPLv2         | libepoxy           | MIT           |
  | bash               | GPLv3         | libevdev           | MIT           |
  | bison              | GPLv3         | libffi             | MIT           |
  | busybox            | GPLv2         | libglvnd           | BSD-like      |
  | ccache             | GPLv3         | libinput           | X11           |
  | dosfstools         | GPLv3         | libjpeg-turbo      | IJG           |
  | e2fsprogs          | GPLv2         | libogg             | BSD           |
  | efibootmgr         | GPLv2         | libpciaccess       | X11           |
  | efivar             | GPLv2.1       | libpng             | libpngv2      |
  | ffmpeg             | GPLv2.1       | libucl             | BSD 2-Clause  |
  | fribidi            | GPLv2.1       | libudev-zero       | ISC           |
  | gdk-pixbuf         | GPLv2.1       | libvorbis          | BSD 3-Clause  |
  | git                | LGPLv2.1      | libvpx             | BSD 3-Clause  |
  | glib               | GPLv2.1       | libwebp            | BSD 3-Clause  |
  | gmake              | GPLv3         | mesa               | MIT           |
  | gnu-as             | GPLv2         | meson              | Apache-2.0    |
  | gnu-m4             | GPLv3         | mtdev              | MIT           |
  | gnupg1             | GPLv3         | nasm               | BSD 2-Clause  |
  | gperf              | GPLv3         | netbsd-curses      | BSD 2-Clause  |
  | gtk+3              | GPLv2         | nodejs             | MIT           |
  | hicolor-icon-theme | GPLv2         | nss                | MPLv2         |
  | lame               | LGPLv2        | opus               | BSD 3-Clause  |
  | libcap-ng          | GPLv2         | paleta             | MIT           |
  | libelf             | GPLv3         | pash               | MIT           |
  | libtool            | GPLv2         | pfetch             | MIT           |
  | linux              | GPLv2         | pixman             | MIT           |
  | mbpfan             | GPLv3         | pkgconf            | ISC           |
  | mpv                | GPLv2         | python             | PSFv2         |
  | pango              | LGPLv2.1      | ripgrep            | UNLICENSE/MIT |
  | perl               | GPLv1         | rnp                | BSD 2-Clause  |
  | procps-ng          | GPLv2         | sqlite             | Public Domain |
  | rustybox           | GPLv2         | tzdata             | Public Domain |
  | sls                | GPLv3         | unzip              | Info-ZIP      |
  | sysmgr             | GPLv3         | vim                | Vim           |
  | uksmd              | GPLv3         | wpa_supplicant     | BSD           |
  | util-linux         | GPLv2         | yaml               | MIT           |
  | wl-clipboard       | GPLv3         | zip                | Info-ZIP      |
  | x264               | GPLv2         | zstd               | BSD 3-Clause  |
  | x265               | GPLv2         +--------------------+---------------+
  | xvidcore           | GPLv2         |
  | xz                 | LGPLv2.1      |
  +------------------------------------+

--- 


## My other stuff

I am the maintainer of a couple other repositories:

[KISS-haskell](https://github.com/dilyn-corner/KISS-haskell) - a KISS-compliant
repository that contains a bootstrappable `ghc`. 

[KISS-kde](https://github.com/dilyn-corner/KISS-kde) - A KISS-compliant
repository that brings the wonders of a `plasma` desktop to KISS.

[KISS-static](https://github.com/dilyn-corner/KISS_static) - A KISS-compliant
repository that provides a static KISS rootfs.

[dotfiles](https://github.com/dilyn-corner/dotfiles) - Just a simple way to
maintain my dotfiles and share screenshots. Don't use it, just marvel.

---


# Useful fork-facts

## So you made a fork

This is more-so for me and anyone like me who is both new to Git(hub) and forks. 

## Keeping up 

If you want to keep your fork in-line with upstream, there's a very
straightforward way of doing this!<sup>1</sup> Simply add the upstream
repository as a remote URL for git to track, and then you will be able to pull
down any changes upstream makes and merge them into your fork.

```
git remote add upstream $upstreamURL # Add upstream to your remotes
git fetch upstream                   # Fetch upstream's changes 
git checkout master                  # Switch to master
git merge upstream/master            # Merge upstream's master branch
```

Suppose upstream is _very_ busy while you do your work. They push a lot of
changes that you wish you had while you're working on your branch. If you
`merge` upstream into your branch, you'll have some hairy commit messages they
won't _super_ appreciate when you make your PR. So you can rebase instead. It's
very handy.

```
git checkout -b $newBranch
> You do work
> They do work
git fetch upstream
git rebase upstream/master
```

Rebasing<sup>2</sup> is essentially just a patch of the work you did based off
the commit you made your fork from, that you can then simply slide into the
history without making it look wonky (with a bunch of `merge` commit messages).

This will be edited heavily in the future maybe hopefully probably.<sup>3</sup>

<sup>1</sup>[Syncing a fork with upstream](https://www.atlassian.com/git/tutorials/git-forks-and-upstreams)

<sup>2</sup>[Rebasing](https://git-scm.com/book/en/v2/Git-Branching-Rebasing)

<sup>3</sup>[Cleaning commits](https://medium.com/@catalinaturlea/clean-git-history-a-step-by-step-guide-eefc0ad8696d)

---

# Repository trust
All commits signed with my own GPG key.

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
FTjDC7NBgOvvveXb5ccd=j6ND

-----END PGP PUBLIC KEY BLOCK-----
