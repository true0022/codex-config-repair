# Codex Config Repair

A lightweight Windows utility for detecting and recovering from a specific type of corrupted OpenAI Codex configuration file.

## Overview

Codex Config Repair checks the `config.toml` file located in the user's `.codex` directory. It detects when the file contains only zero-valued bytes (`0x00`) and helps restore normal Codex startup by preserving the corrupted file under a different name.

This tool was created in response to a recurring Windows issue where Codex fails to start because its configuration file becomes corrupted.

## Features

- Checks the byte contents of `config.toml`.
- Detects files entirely filled with zero-valued bytes.
- Preserves corrupted files by renaming them instead of deleting them.
- Leaves files with non-zero content unchanged.
- Avoids automatically modifying partially corrupted files.
- Requires no installation.

## Requirements

- Windows
- OpenAI Codex for Windows
- Windows PowerShell

## Usage

1. Close Codex completely.
2. Download `Codex_Config_Repair.cmd`.
3. Double-click the CMD file to run it.
4. Review the diagnostic output.
5. If a fully zero-filled configuration file is detected and renamed, launch Codex again.

## Important Notes

- This utility addresses a specific configuration file corruption pattern. It does not repair every possible Codex startup error.
- It does not identify or prevent the underlying cause of file corruption.
- The original corrupted file is preserved under a different filename.
- Files containing a mixture of zero-valued and non-zero bytes are not automatically modified.
- Back up important configuration files before running the utility.

## Disclaimer

This is an unofficial, community-made utility. It is not affiliated with, endorsed by, or supported by OpenAI.

Use this software at your own risk. It is provided "as is", without warranties of any kind.

## License

Specify a license in this repository before granting permissions for others to use, modify, or redistribute this software.

