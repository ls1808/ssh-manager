# SSH Manager

[![Beta release](https://github.com/ls1808/ssh-manager/actions/workflows/release.yml/badge.svg?branch=beta)](https://github.com/ls1808/ssh-manager/actions/workflows/release.yml)

SSH Manager is a Windows desktop app for organising SSH connections and working
with several remote terminals in one window.

The project is currently in beta. Expect changes while terminal behaviour and
the update process are tested across more systems.

## Features

- Saved SSH and SFTP connection profiles
- Embedded terminal sessions with tabs
- Password, private-key and SSH-agent authentication
- Host availability indicators
- Import and export of OpenSSH configuration
- Searchable Linux command reference
- In-place updates from GitHub beta releases

## Requirements

- Windows 10 version 1809 or newer
- Windows OpenSSH client

No Python installation or separate runtime is required.

## Download

[Download SSH Manager-beta-1.0](https://github.com/ls1808/ssh-manager/releases/download/beta-1.0/SSH%20Manager-beta-1.0.exe)
and run it directly. The checksum and release notes are available on the
[Releases](https://github.com/ls1808/ssh-manager/releases) page.

## Updates

The app checks GitHub beta releases after startup. If a newer beta is available,
it asks before downloading anything. Accepted updates are checked against their
SHA-256 digest, installed in place and restarted automatically.

To publish a beta, update `version.json` and push the change to `beta`. The
release workflow builds and publishes the executable automatically.

## Local data

Connection profiles are stored under `%APPDATA%\SSH Manager`. Saved passwords
are protected with Windows DPAPI for the current Windows account.
