# Releasing SSH Manager

The repository has two update channels:

- `main` publishes stable releases such as `1.1.0`.
- `beta` publishes prereleases such as `1.2.0-beta.1`.

To publish an update, open **Actions → Publish SSH Manager → Run workflow**,
select the appropriate branch, and enter the new semantic version. GitHub Actions
builds the single-file executable, generates its SHA-256 checksum, and creates a
GitHub Release with both assets.

Stable executables query the latest stable GitHub Release. Beta executables query
the latest prerelease. An update is only offered when its semantic version is newer
than the version embedded in the running executable.

The repository must remain public for unauthenticated update checks. Supporting a
private repository would require a separate authenticated distribution service;
an access token must never be embedded in the desktop application.

