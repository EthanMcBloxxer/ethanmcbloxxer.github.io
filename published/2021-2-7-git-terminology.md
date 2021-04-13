---
layout: post
title: Git Terminology
subtitle: Understanding what all this git stuff means
thumbnail-img: assets/img/posts/thumb/git.svg
tags: [git]
---

I'm still a bit novice to Git, even after more than a year of *kind of* using it often. I'll be explaining most terms that are useful in the best way I can.

# Commit
A commit is a change to a repository. You can change multiple files with one commit on most applications, but barely any Git services (like GitHub), where you can only change a single file for each commit. Each commit comes with a title or message, which should (standardly) be approximately 50 characters (this is not enforced), and an optional description, where you can put (standardly) 200 characters to describe why you commited changes or other things that are important but shouldn't be on the title.

Good commit naming is always praised upon. Here's the normal standard commit guidelines:

<p style="position: relative;">
  <span class="fas fa-check-circle about-icon" style="
    font-size: 1.5rem;
    position: absolute;
    left: -2.5rem;
    margin-top: 0.3125rem;
  "></span>
  Capital letter at the beginning of the commit

  <br/>

  <span class="fas fa-check-circle about-icon" style="
    font-size: 1.5rem;
    position: absolute;
    left: -2.5rem;
    margin-top: 0.3125rem;
  "></span>
  Short & simple

  <br/>

  <span class="fas fa-check-circle about-icon" style="
    font-size: 1.5rem;
    position: absolute;
    left: -2.5rem;
    margin-top: 0.3125rem;
  "></span>
  Tests: ensure support on IE11

  <br/>

  <span class="fas fa-times-circle about-icon" style="
    font-size: 1.5rem;
    position: absolute;
    left: -2.5rem;
    margin-top: 0.3125rem;
  "></span>
  ending with a period.

  <br/>

  <span class="fas fa-times-circle about-icon" style="
    font-size: 1.5rem;
    position: absolute;
    left: -2.5rem;
    margin-top: 0.3125rem;
  "></span>
  bdaspeling (bad spelling and no spaces)
</p>

There are also even more adopted standards, like [Angular's commit format](https://github.com/angular/angular/blob/master/CONTRIBUTING.md#-commit-message-format), or even [EmojiLog (commits with emoji meanings)](https://opensource.com/article/19/2/emoji-log-git-commit-messages#getting-started).

If you're working in a team, they may define these themselves. Use those over any of these.

# Repository (Repo)
This is basically a root folder where all of your code and files are stored, with different parts.

## Branch
A branch is a part, or another folder, of a repository. You can have multiple branches on a single repo, each containing their own code.

## Fork
A clone of a repository, tracking the differences from both the repo you cloned it from and itself. This often means you can make pull requests between the fork and the original repository.

## master/main/primary
The default, for lack of a better term, *main* branch of your repo. Every repo needs one of these, otherwise they are completely empty. GitHub and other services have decided to change the original `master` term to `main` to avoid slavery references.

## slave/replica/secondary (often just called by the branch name)
A branch that isn't `main`. GitHub and other services have decided to change the original `slave` term to `replica` to avoid slavery references.

## origin
Often only used when referring to the actual Git CLI, this is the **default upstream repo**. On GitHub or other Git services, this is simply the repo on their servers.

## HEAD
This is the primary active "snapshot" of the repo. It references the main branch, and then the current commit.

Note: A "head" (lowercase) refers to any one of the named heads in the repository; "HEAD" (UPPERCASE) refers exclusively to the currently active head. This distinction is used frequently in Git documentation.

## Pushing/Pulling
When you push, you *push* (add) the changes (commits) that you've made locally on your computer onto the origin (GitHub). When you pull, you *pull* (get) the changes (commits) that you **don't** have on your computer from the origin. If you *fetch*, then you are asking the origin if any requests need to be pulled before you can push.

# Pull Request (PR)
When you want to either combine a repo and another repo, a repo and a fork, a repo's branch and another repo('s branch) (and vice versa for each of them), you create a pull request, or PR, to "merge" the two together. There are a few different types of merging:

## Normal Merges
Similarly to Squash Merges, all commits from the pull request are added to the main repo in a merge commit using the `--no-ff` (no fast-forward merge) option. This means that a new commit is needed to store the combined history, so two commits will be created instead of just a single one.

![Normal Merge Diagram](/assets/img/embed/standard-merge-diagram.png){: .mx-auto.d-block :}
<div align="center"><i>Credit: GitHub</i></div><p></p>

## Squash Merges
When you propose a squash merge, the pull request's commits, or the commits on the repo you are adding to the main repo, are all merged into a single commit and added to the base repository.

![Squash Merge Diagram](/assets/img/embed/squash-merge-diagram.png){: .mx-auto.d-block :}
<div align="center"><i>Credit: GitHub</i></div><p></p>

Disadvantages:

* Specific commit information is lost (and their SHA ID are also removed)
* Previously PR'd commits will also be listed if you need to squash+merge again afterwards

## Rebase Merges
What you would immediately expect when you learn you would be merging two repos together, this method copies all commits from the pull request *individually*, so each commit is replicated from the pull request onto the main repo. If you require using it, though, it may be disabled sometimes. To see the workflow to re-enable it, see ["About pull request merges"](https://docs.github.com/en/github/collaborating-with-issues-and-pull-requests/about-pull-request-merges#rebase-and-merge-your-pull-request-commits) on the GitHub docs.

Disadvantages:

* Contributors may have to rebase on the CLI, resolve conflicts, and force push changes (which is dangerous, you could overwrite other work!).

# Staging
When you make changes locally, those changes become unstaged. What this means is that those changes aren't ready to be pushed to the origin, and are waiting for you to review them and then stage them. When they are staged, you can write a commit title and description, then push them to the origin. A commit will be created with those changes.
