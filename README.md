This shell script moves a repository from Bitbucket to GitHub.

It assumes you are authenticated with both (e.g. by a public key).

# Requirements
* Git, obviously
* Hub, by Github. On Mac, it's `brew install hub`

# Usage
```
$ sh export.sh [BITBUCKET_USER] [GITHUB_USER] [REPOSITORY] [DESCRIPTION]
```
* BITBUCKET_USER: The username or organization that owns the repo
* GITHUB_USER: The username or organization that will own the repo
* REPOSITORY: The repository name (without .git)
* DESCRIPTION: An optional repository description
