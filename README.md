# SSH Manager

A standalone Windows SSH connection manager with saved hosts, an embedded
multi-tab terminal, connection status checks, and a categorized Linux command
library. The application is built as one self-contained executable and requires
no Python runtime or installer.

## Build

```powershell
.\scripts\build.ps1 -Version 1.0.0 -Channel main
```

Use `-Channel beta` and a prerelease version such as `1.1.0-beta.1` for beta
builds. The output is `release\SSH-Manager.exe`.

## Automatic updates

- Builds from `main` follow stable GitHub Releases.
- Builds from `beta` follow GitHub prereleases.
- The app checks for an update after startup.
- The user is asked before downloading.
- Downloads are verified with SHA-256, installed in place, and the app restarts
  automatically without an installer wizard.

See [RELEASING.md](RELEASING.md) for the release process.

Connection data is stored in the current Windows user's application-data folder.
