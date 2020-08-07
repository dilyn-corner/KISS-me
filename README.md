|/
|\ISS                                                           https://k1ss.org
________________________________________________________________________________


KISS-me - A KISS repository for forks, projects, and fun
________________________________________________________________________________

# KISS-me
My self-managed package repository for [KISS](https://k1ss.org).

This repository is for:
1) Staging things prior to submitting them to [Community](https://github.com/kisslinux/community),
2) for things I know will [never be accepted into Community](https://k1ss.org/guidestones),
3) for forks.

All commits signed with my own GPG key.


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
