[![.github/workflows/test.yml](https://github.com/cucumber-actions/versions/actions/workflows/test.yml/badge.svg?branch=main)](https://github.com/cucumber-actions/versions/actions/workflows/test.yml)

# versions

This action was developed by the Cucumber team to use as part of our automated release process.

It reads version numbers from two places:

1) The latest git tag
2) The first heading in the `CHANGELOG.md` file

We use these to infer:

1) The currently released version
2) The next version to be released

If there are changes about to be released, the changelog version will be newer than the git tag version, signalling that a release is required.

## Outputs

* `released-version` - the version parsed from the git latest git tag
* `changelog-latest-version` - the version parsed from the top header in the `CHANGELOG.md`
* `is-release-required` - a boolean flag set to `false` unless the two versions are different.

## Inputs

By default, the action searches for git tags of the form `vX.Y.Z` and looks in the root directory for the `CHANGELOG.md` file. You can customize this (e.g. for a monorepo) by using these inputs:

* `tag-prefix` - A prefix to use when searching for tags, e.g. `cucumber-expressions/`
* `changelog-directory` - Path within the repo to look for the `CHANGELOG.md` file
