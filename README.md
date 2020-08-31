|/  
|\ISS Repo                                                      https://k1ss.org
________________________________________________________________________________


KISS-me - A KISS repository for forks, projects, and fun
________________________________________________________________________________

# KISS-me
My self-managed package repository for [KISS](https://k1ss.org).

This repository is for:
1) Staging things prior to submitting them to 
[Community](https://github.com/kisslinux/community),
2) for things I know will 
[never be accepted into Community](https://k1ss.org/guidestones),
3) for forks.

## The structure of this repository: 
core) kernels, compilers, utils. It also includes a compressor (`lz4`) and
proper MacbookPro fan support (`mbpfan`)

extra) Basically an analogue to repo/extra. It includes two version of `mesa`,
one for strict-wayland and the other Xorg. Anything from `paleta` to `viper` and
`r` live here.

wayland) Just `wayland` things. 

xorg) Just `xorg` things.

hesitation) Things that are being tested. Loosely.


## Thoughts

In the ever-excruciating pursuit of being different for the sake of difference,
I have switched from KISS proper to [wyverkiss](https://github.com/wyvertux/wyverkiss)
Additionally, Due to recent 
[issues with Xorg](https://gitlab.freedesktop.org/xserver/-/issues/1068), 
I have decided to commit to trying out `wayland`. So far, I'm really enjoying 
it! Because the *initial* [wayland repository](https://github.com/sdsddsd1/mywayland) 
was archived, and the [second one](https://github.com/Himmalerin1/kiss-wayland)
is more narrow in focus, I decided to just handle my own `wayland` packages.
I've opted for `hikari` over `sway` and others. It's just enough, perhaps too
much. The configuration is easy, the dependencies are small, and the environment
is sane!

Because wyverkiss uses `llvm` instead of `gcc`, `rust` is a no-go. Which is fine
for me; I'm not a big fan of the compile time of `rust`. This means that
`alacritty` is out; `kitty` requires `dbus`. `wayst` couldn't find my favorite
font, and it would segfault with `terminus`. `foot` is an excellent option - the
only downside is it builds with `meson`, but it's fast and easy. The developer
suggests pgo, so read that build file for some giggles. But it pays off; it's
probably the fastest, most responsive terminal emulator I've ever used. 

If you want to try out `wayland` on KISS, you can just:

```
cd $REPOS && git clone https://github.com/dilyn-corner/KISS-me
export KISS_PATH=$REPOS/KISS-me/wayland:$REPOS/KISS-me/extra:$KISS_PATH
kiss b hikari # you'll need to install bmake
```

You'll just have to ensure symlinks point in the right places where necessary
and fix the dependends files (things like `byacc`, `gmake`, etc.), and modify
`mesa`'s build file for your GPU (cutting out the intel stuff will build a full
`mesa`). 

`qt5` builds just fine using the latest git branch - there's [some strange issue
I encounter build 5.15.0 with LLVM](https://bugreports.qt.io/browse/QTBUF-85010),
though it's unclear if it's reproducible. Unfortunately, `qt5-webengine` is a 
literal bitch that I'm working on fixing for wyverkiss. One day I will have a 
browser again.

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

