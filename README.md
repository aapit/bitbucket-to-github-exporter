This shell script moves a repository from Bitbucket to GitHub.

It assumes you are authenticated with both (e.g. by a public key).

# Requirements
* Git, obviously
* Hub, by Github. On Mac, it's `brew install hub`

# Usage
```
$ sh export.sh [BITBUCKET_USER] [GITHUB_USER] [REPOSITORY] [DESCRIPTION] [META_URL]
```
* BITBUCKET_USER: The username or organization that owns the repo
* GITHUB_USER: The username or organization that will own the repo
* REPOSITORY: The repository name (without .git)
* DESCRIPTION: An optional repository description
* URL: An optional meta url, or the url of the website

# Known Issues
This script also tries to clone the repository's wiki, if present.
Unfortunately, it seems that GitHub requires one to manually create a Wiki page first,
before it is available as a repo.
At least you will get a permission error, so then you could create the page, and run the script
again.
