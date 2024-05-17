#!/usr/bin/env bats

@test "nodejs version" {
  run bash -c "docker exec gha-container-builder-image node --version"
  [[ "${output}" =~ "21.7" ]]
}

@test "npm version" {
  run bash -c "docker exec gha-container-builder-image npm --version"
  [[ "${output}" =~ "10.2" ]]
}

@test "bats version" {
  run bash -c "docker exec gha-container-builder-image bats -v"
  [[ "${output}" =~ "1.11" ]]
}

@test "hadolint version" {
  run bash -c "docker exec gha-container-builder-image hadolint --version"
  [[ "${output}" =~ "2.12" ]]
}

@test "snyk version" {
  run bash -c "docker exec gha-container-builder-image snyk --version"
  [[ "${output}" =~ "1.1291" ]]
}

@test "trivy version" {
  run bash -c "docker exec gha-container-builder-image trivy --version"
  [[ "${output}" =~ "0.51" ]]
}

@test "grype version" {
  run bash -c "docker exec gha-container-builder-image grype --version"
  [[ "${output}" =~ "0.77" ]]
}

@test "cosign version" {
  run bash -c "docker exec gha-container-builder-image cosign version"
  [[ "${output}" =~ "2.2" ]]
}

@test "syft version" {
  run bash -c "docker exec gha-container-builder-image syft version"
  [[ "${output}" =~ "1.4" ]]
}

@test "oras version" {
  run bash -c "docker exec gha-container-builder-image oras version"
  [[ "${output}" =~ "1.1" ]]
}
