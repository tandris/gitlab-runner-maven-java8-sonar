#!/bin/bash

sed -i 's/GITLAB_CI_URL/'"$GITLAB_CI_URL"'/g' /etc/gitlab-runner/config.toml
sed -i 's/GITLAB_CI_TOKEN/'"$GITLAB_CI_TOKEN"'/g' /etc/gitlab-runner/config.toml
sed -i 's/GITLAB_CI_NAME/'"$GITLAB_CI_NAME"'/g' /etc/gitlab-runner/config.toml
sed -i 's/GITLAB_CI_EXECUTOR/'"$GITLAB_CI_EXECUTOR"'/g' /etc/gitlab-runner/config.toml

sed -i 's/SONAR_HOST_URL/'"$SONAR_HOST_URL"'/g' /home/gitlab-runner/.m2/settings.xml

exec "$@"