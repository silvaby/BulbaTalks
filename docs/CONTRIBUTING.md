# Contributing

Read the [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) file for details on our code of conduct.

This Contribution guide describes:

- [Work with branches](#work-with-branches).
- [Work with commits](#work-with-commits).
- [Work with versions](#work-with-versions).
- [Work with testing](#work-with-testing).
- [Work with issues/PRs](#work-with-issues-and-pull-requests).

## Work with branches

We use [git-flow model](https://nvie.com/posts/a-successful-git-branching-model/).

The central repo holds two main branches with an infinite lifetime as in [git-flow model](https://nvie.com/posts/a-successful-git-branching-model/#the-main-branches). As [supporting branches](https://nvie.com/posts/a-successful-git-branching-model/#supporting-branches) we use branches with a limited lifetime: 

1. [Feature branches](https://nvie.com/posts/a-successful-git-branching-model/#feature-branches).

Name branch as `feature-[issue number]`.

Example: `feature-59`.

2. [Release branches](https://nvie.com/posts/a-successful-git-branching-model/#release-branches).

Name branch as `release-[version number]`.

Example: `release-3.0.0`.

3. [Hotfix branches](https://nvie.com/posts/a-successful-git-branching-model/#hotfix-branches).

Name branch as `hotfix-[version number]`.

Example: `hotfix-1.0.2`.

## Work with commits

### Commit Message

1. Write in English.
1. Use the present tense in the title(the text up to the first blank line in a commit message is treated as the commit title, and that title is used throughout Git).
1. Use the imperative in the title. For example, you can start the title with these words: Refactor, Update, Remove, Release, Fix, Merge, Rename, etc.
1. Separate the title from the description with a blank line.
1. Write description to explain what changed and why.
1. Start your title and description with an uppercase letter.

**Recommendation for creating commits**

1. Try to avoid using `git add .`. Instead, try to get into the habit of checking which files are actually changed (for example, using `git status`), and then add files to your commits explicitly: `git add {file1} {file2}`.
1. When you work on the local machine and you’ve created a commit already, but then you do more work that should logically be included in that same commit, you can simply add new work to the previous commit with `git commit --amend`. This command cannot be used if the commit was sent to a remote server.

## Work with versions

We use [SemVer](https://semver.org/) for versioning.

## Work with testing

Before you contribute your PR, do some tests:
1. Try to test your changes using the [template](https://www.guru99.com/positive-and-negative-testing.html).
1. If your changes are UI changes, do tests to check the layout:
	- on devices that support our project with the smallest screen and the largest. For example, for 12 iOS version and higher, we are testing our UI layout application on iphone 5 and iPhone XS Max.
	- using the device with the minimum and maximum version of iOS that support our project.
	- while you're rotating the device. 
1. Try to test your changes on the real device, not simulator. If you can not, leave an explicit note in the PR.

## Work with issues and pull requests

### Issues 

1. Before creating an issue, please check this [list](https://github.com/dersim-davaod/CocoaHeads-iOS-School-Twitter-project/issues) as you might find out that you don't need to create one. If you created a duplicate issue, leave the commentin the duplicate: "Closed as a duplicate for #[issue-number]" (where "issue-number" is the number of the original issue, example: "Closed as a duplicate for #23"), then close the duplicate issue.

1. [How to create an issue](https://help.github.com/en/github/managing-your-work-on-github/creating-an-issue):
   - Keep your titles short and descriptive.
   - Try to describe the issue detailed as possible and based on the description, make clear acceptance criteria.
   - Include links to the information that may help.
   - Context: explain the conditions which led you to write this issue. For example: “Since we’ve moved to the latest version of smth, we’ve experienced a few performance issues (#14 and #15) on production.”.
   - Use color-coded labels, they help us categorize and filter our issues. You can [create your own label](https://help.github.com/en/github/managing-your-work-on-github/creating-a-label).
   - Use @mentions and references inside of issues, for notifying other GitHub users if needed, and cross-connect issues to each other. Sometimes issues are depend on other issues, or at least relate to them, write about that explicitly, example: "This is subtask for #2"

1. Don't start an issue until you make sure you understand AC.

1. Issues estimations are part of the scrum process that is described in the [SCRUM_PROCESS.md](SCRUM_PROCESS.md) file. So if you write estimation by your own opinion, leave information about how you estimated it.

1. You need to close the issue after successful merge PR that solves this issue.

### Pull Requests

1. [How to create a pull request](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request):

   - Check this [approach to write a Pull Request](https://github.blog/2015-01-21-how-to-write-the-perfect-pull-request/#approach-to-writing-a-pull-request) and follow it.
   - The pull request’s title should tell the changes itself generally, to give an overview idea of what the pull request is about.
   - If a PR solves some issue, then in the "Linked issues" section select the issue to be solved.
   - In the "Projects" section select the project board where you want to add the issue.
   - Add yourself in the "Assignees" section.

1. Notify the team explicitly if you have blockers(or notify assignee for this blocker).

1. If you have a controversial approach to solve the issue, discuss it with the team/team lead.

1. If you made changes after someone approved your PR and these changes are not the correction of comments on the review or correction of typos, then request a review again, since the person who approved your work may not agree with the new changes.

#### Reviewing process

1. Try to do a code review at the beginning of your workday.
1. Do a code review no later than the second day after receipt of the request.
1. If you need a review as soon as possible, notify and ask about review explicitly, don't wait.
1. Check this [approach to offering feedback and responding](https://github.blog/2015-01-21-how-to-write-the-perfect-pull-request/#offering-feedback), try to follow it. Also check our [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) file.
1. Only the person, who opened a conversation can resolve it. 
1. Approve PR if all your conversations are resolved and you have no questions, otherwise request changes or leave a comment.
1. Only the person, who created PR can merge it. If the PR has all approvals and you need changes in this PR, notify the assignee explicitly.

We use the Scrum framework for developing the product. Read more about when and how we can drag the issue between the columns on Agile board in [SCRUM_PROCESS.md file](SCRUM_PROCESS.md)
