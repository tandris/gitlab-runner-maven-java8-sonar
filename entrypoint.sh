#!/bin/bash

sed 's/GITLAB_CI_URL/'"$GITLAB_CI_URL"'/' /etc/gitlab-runner/config.toml
sed 's/GITLAB_CI_TOKEN/'"$GITLAB_CI_TOKEN"'/' /etc/gitlab-runner/config.toml
sed 's/GITLAB_CI_NAME/'"$GITLAB_CI_NAME"'/' /etc/gitlab-runner/config.toml
sed 's/GITLAB_CI_EXECUTOR/'"$GITLAB_CI_EXECUTOR"'/' /etc/gitlab-runner/config.toml

sed 's/SONAR_HOST_URL/'"$SONAR_HOST_URL"'/' /home/gitlab-runner/.m2/settings.xml

exec "$@"