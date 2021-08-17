#!/bin/sh

next_version_heading=$(changelog latest)
next_version=${next_version_heading/v}
echo "::set-output name=changelog-latest-version::$next_version"

git fetch --tags
current_version_label=$(git describe --tags $(git rev-list --tags --max-count=1))
current_version=${current_version_label/v/}
echo "::set-output name=released-version::$current_version"

is_release_required=$([ $next_version == $current_version ] && echo "" || echo "true" )
echo "::set-output name=is-release-required::$is_release_required"