# Trove package source

`trove.json` is the extra catalog that the **Trove** utility in 10tweaker reads on top of WinGet.
It is plain JSON with a versioned schema, so it can be edited by hand and validated in any
JSON-Schema-aware editor.

## Files

| File | Purpose |
| --- | --- |
| `trove.json` | The catalog itself. This is what the app downloads. |
| `trove.schema.json` | Schema for `schemaVersion: 1`. Editors use it for validation and autocomplete. |
| `icons/` | Optional package icons. Any HTTPS URL is also accepted. |

The app will use this raw URL:

```
https://raw.githubusercontent.com/timinside/10tweaker/main/packages/trove.json
```

## Adding a program

1. Add an object to the `packages` array.
2. Give it a stable, lowercase `id` in reverse-DNS form: `publisher.program`.
3. Fill in `name`, `version`, and an `install` block.
4. Update the top-level `updated` date.
5. Validate the file against `trove.schema.json`.

Minimal direct-installer entry:

```json
{
  "id": "timinside.example",
  "name": "Example",
  "publisher": "timinside",
  "description": "What the program does.",
  "version": "1.0.0",
  "homepage": "https://github.com/timinside/example",
  "license": "MIT",
  "tags": ["utility"],
  "install": {
    "type": "exe",
    "url": "https://github.com/timinside/example/releases/download/1.0.0/ExampleSetup.exe",
    "sha256": "0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef",
    "silentArgs": "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART",
    "requiresAdmin": true
  }
}
```

### Install types

| `type` | Required fields | Notes |
| --- | --- | --- |
| `winget` | `id` | Delegates to WinGet; optional `scope` is `user` or `machine`. |
| `exe` | `url`, `sha256` | Direct installer. `silentArgs` and `requiresAdmin` are optional. |
| `msi` | `url`, `sha256` | Installed through `msiexec`. |
| `zip` | `url`, `sha256`, `extractTo` | Portable package. `extractTo` may use environment variables. |

All three programs currently in the catalog are **Inno Setup** installers, so they share the same
silent switches:

```
/VERYSILENT /SUPPRESSMSGBOXES /NORESTART
```

### Getting a SHA-256 digest

```powershell
Get-FileHash .\ExampleSetup.exe -Algorithm SHA256 | Select-Object -ExpandProperty Hash
```

Paste the 64-character lowercase hex string into `sha256`.

## Rules

- Only `https://` URLs are accepted.
- `exe`, `msi` and `zip` entries must include `sha256`; the app verifies it before running anything.
- The catalog is **metadata only**. Do not put scripts, commands or credentials in it.
- Keep `id` stable across versions so updates are detected correctly.
- The app asks for confirmation and shows the source before installing.

## Current entries

| Package | Version | Installer |
| --- | --- | --- |
| BetterDevelNext | 17.2.2 | `BetterDevelNextSetup.exe` |
| bbruntime | 1.2 | `bbruntimeSetup.exe` |
| NextJPPM | 0.8.0 | `NextSetup.exe` |

`bbruntime` also publishes an offline installer and a `jre.zip`; they can be added later as
separate entries if needed.
