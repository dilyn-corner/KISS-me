|/  
|\ISS Repo                                                      https://k1ss.org
________________________________________________________________________________


KISS-me - A KISS repository for forks, projects, and fun
________________________________________________________________________________


This repository is for:
1) Staging things prior to submitting them to 
[Community](https://github.com/kisslinux/community),
2) for things I know will 
[never be accepted into Community](https://k1ss.org/guidestones),
3) for forks.


## The structure of this repository

`KISS-me/core`: kernels, compilers, utils. It also includes a compressor (`lz4`)
and proper MacbookPro fan support (`mbpfan`)

`KISS-me/extra`: Basically an analogue to `repo/extra`. It includes two version of 
`mesa`, one for strict-wayland and the other Xorg. Anything from `paleta` to 
`viper` and `r` live here.

`KISS-me/wayland`: Just `wayland` things. 

`KISS-me/xorg`: Just `xorg` things.

`KISS-me/hesitation`: Things that are being tested. Loosely.


## Thoughts

In the ever-excruciating pursuit of being different for the sake of difference,
I have switched from KISS proper to
[wyverkiss](https://github.com/wyvertux/wyverkiss).
Additionally, Due to recent 
[issues with Xorg](https://gitlab.freedesktop.org/xorg/xserver/-/issues/1068), 
I have decided to commit to trying out `wayland`. So far, I'm really enjoying 
it! Because the *initial* [wayland repository](https://github.com/sdsddsd1/mywayland) 
was archived, and the [second one](https://github.com/Himmalerin/kiss-wayland)
is more narrow in focus, I decided to just handle my own `wayland` packages.
I've opted for `hikari` over `sway` and others. It's just enough, even perhaps 
too much. The configuration is easy, the dependencies are small, and the 
environment is sane!

Because wyverkiss uses `llvm` instead of `gcc`, `rust` is a no-go. Which is fine
for me; I'm not a big fan of the compile time of `rust`. This means that
`alacritty` is out. `kitty` requires `dbus`. `wayst` couldn't find my favorite
font, and it would segfault with terminus. `foot` is an excellent option - the
only downside is it builds with `meson`, but it's fast and easy. The developer
suggests pgo, so read that build file for some giggles. But it pays off; it's
probably the fastest, most responsive terminal emulator I've ever used. 

If you want to try out `wayland` on KISS, you can just:

```
# kiss-reset would make everything easy. 
# Just remove xorg et al first to ensure simplicity.

cd $REPOS && git clone https://github.com/dilyn-corner/KISS-me

# Fix symlinks as necessary
# Fix depends files as needed (byacc -> bison, drop gmake, etc)
# Drop the i915/965/intel lines in mesa/build for a full-mesa

export KISS_PATH=$REPOS/KISS-me/wayland:$REPOS/KISS-me/extra:$KISS_PATH
kiss b hikari # you'll need to install bmake
```

`qt5` builds just fine using the latest git branch - there's [some strange issue
I encounter build 5.15.0 with LLVM](https://bugreports.qt.io/browse/QTBUG-85010),
though it's unclear if it's reproducible. Unfortunately, `qt5-webengine` is a 
literal bitch that I'm working on fixing for wyverkiss. One day I will have a 
browser again.


--- 

## My other stuff

I am the maintainer of a couple other repositories:

[KISS-haskell](https://github.com/dilyn-corner/KISS-haskell) - a KISS-compliant
repository that contains a bootstrappable `ghc`. 

[KISS-kde](https://github.com/dilyn-corner/KISS-kde) - A KISS-compliant
repository that brings the wonders of a `plasma` desktop to KISS.

[dotfiles](https://github.com/dilyn-corner/dotfiles) - Just a simple way to
maintain my dotfiles and share screenshots. Don't use it, just marvel.


---

# Useful fork-facts

## So you made a fork

This is more-so for me and anyone like me who is both new to Git(hub) and forks. 

## Keeping up 

If you want to keep your fork in-line with upstream, there's a very straightforward way of doing this!<sup>1</sup>
Simply add the upstream repository as a remote URL for git to track, and then you will be able to pull down any changes upstream makes and merge them into your fork.
```
git remote add upstream _upstreamURL_   # Add upstream to your remotes
git fetch upstream                      # Fetch upstream's changes 
git checkout master                     # Switch to master
git merge upstream/master               # Merge upstream's master branch
```

Suppose upstream is _very_ busy while you do your work. They push a lot of changes that you wish you had while you're working on your branch. If you `merge` upstream into your branch, you'll have some hairy commit messages they won't _super_ appreciate when you make your PR. So you can rebase instead. It's very handy.
```
git checkout -b _newBranch_
> You do work
> They do work
git fetch upstream
git rebase upstream/master
```

Rebasing<sup>2</sup> is essentially just a patch of the work you did based off the commit you made your fork from, that you can then simply slide into the history without making it look wonky (with a bunch of `merge` commit messages).

This will be edited heavily in the future maybe hopefully probably.<sup>3</sup>

<sup>1</sup>[Syncing a fork with upstream](https://www.atlassian.com/git/tutorials/git-forks-and-upstreams)

<sup>2</sup>[Rebasing](https://git-scm.com/book/en/v2/Git-Branching-Rebasing)

<sup>3</sup>[Cleaning commits](https://medium.com/@catalinaturlea/clean-git-history-a-step-by-step-guide-eefc0ad8696d)

---

# Repository trust
All commits signed with my own GPG key.

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
FTjDC7NBgOvvveXb5ccd
=j6ND
-----END PGP PUBLIC KEY BLOCK-----
