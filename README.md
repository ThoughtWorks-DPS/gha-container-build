<div align="center">
	<p>
		<img alt="Thoughtworks Logo" src="https://raw.githubusercontent.com/ThoughtWorks-DPS/static/master/thoughtworks_flamingo_wave.png?sanitize=true" width=200 />
    <br />
		<img alt="DPS Title" src="https://raw.githubusercontent.com/ThoughtWorks-DPS/static/master/EMPCPlatformStarterKitsImage.png" width=350/>
	</p>
  <h3>PSK Convenience Images</h3>
  <h1>twdps/gha-container-builder</h1>
  <img alt="GitHub Actions Workflow Status" src="https://img.shields.io/github/actions/workflow/status/ThoughtWorks-DPS/gha-container-builder/.github%2Fworkflows%2Fdevelopment-build.yaml"> <img alt="GitHub Release" src="https://img.shields.io/github/v/release/ThoughtWorks-DPS/gha-container-builder"> <a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/license-MIT-blue.svg"></a>
</div>
<br />

Enterprises using GitHub Actions will find that building job containers is a common task. Having a dedicated resource, pre-configured and maintained  image with testing frameworks, security scanning, and provenance tools will make for a consistent, quality experience.  

The PSK gha container builder includes common tools:  

**configuration testing**  
- [bats](https://github.com/bats-core/bats-core)
- [conftest](https://github.com/open-policy-agent/conftest)
- [hadolint](https://github.com/hadolint/hadolint)

**scanning**  
- [snyk](https://github.com/snyk/cli)
- [trivy](https://github.com/aquasecurity/trivy)
- [grype](https://github.com/anchore/grype)

**provenance**
- [cosign](https://github.com/sigstore/cosign)
- [syft](https://github.com/anchore/syft)
- [oras](https://github.com/oras-project/oras)
- [gren](https://github.com/github-tools/github-release-notes)
