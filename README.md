# Easy RDP (rdesktop Wrapper Script)

Easy RDP is a Bash-based utility designed to simplify the usage of the `rdesktop` command-line tool for initiating Remote Desktop Protocol (RDP) sessions.

## Features

- Interactive and customizable RDP session launcher
- Command-line arguments for user, password, resolution, and host
- Default resolution fallback when not specified
- Built-in help menu for quick usage reference

## Requirements

- Unix-based operating system with Bash
- [`rdesktop`](https://linux.die.net/man/1/rdesktop) installed and accessible via terminal

## Installation

Simply clone this repository or copy the script to your local system and give it execution permissions:

chmod +x easy-rdp.sh

### Parameters
Option	Description

-u	Username for RDP authentication

-p	Password for RDP authentication

-r	Custom resolution (e.g., 1280x720)

-h	Display help information

## Example

./easy-rdp.sh -u admin -p secret123 -r 1366x768 192.168.1.100:3389

Note: If no resolution is provided, the script defaults to 1900x1000.

## Help Menu

To display the help instructions, run:

./easy-rdp.sh -h

## License

This project is provided "as is" without warranty. You are free to modify and distribute it under the terms of the MIT License or similar open-source licenses.

## Author

Developed by a Linux enthusiast aiming to streamline remote desktop connections for advanced users.

#### MB&D
