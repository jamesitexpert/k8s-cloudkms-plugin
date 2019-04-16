#!/usr/bin/env bash

set -o xtrace
set -o errexit
set -o nounset

BLAZE_BIN="$(bazel info bazel-bin)"
GCS_BUCKET='tpm-lab'

bazel build cmd/...:all

$HOME/google-cloud-sdk/bin/gsutil cp "${BLAZE_BIN}"/cmd/tpmseal/linux_amd64_stripped/tpmseal gs://"${GCS_BUCKET}"
$HOME/google-cloud-sdk/bin/gsutil cp "${BLAZE_BIN}"/cmd/tpmunseal/linux_amd64_stripped/tpmunseal gs://"${GCS_BUCKET}"