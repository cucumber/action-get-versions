#!/bin/sh

next_version_heading=$(changelog latest --filename $2/CHANGELOG.md)
next_version=${next_version_heading/v}
next_version=$([[ "$next_version" == There* ]] && echo "" || echo $next_version)
echo "changelog-latest-version=$next_version" >> $GITHUB_OUTPUT

git fetch --tags
current_version_label=$(git describe --tags --match "$1*" --abbrev=0)
current_version=${current_version_label/$1v/}
echo "released-version=$current_version" >> $GITHUB_OUTPUT

is_release_required=$([ $next_version == $current_version ] && echo "" || echo "true" )
echo "is-release-required=$is_release_required" >> $GITHUB_OUTPUT
