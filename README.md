# Nmap Interactive Menu

**GitHub Repository:** [https://github.com/Juttstodio/Nmap-Interactive-Menu](https://github.com/Juttstodio/Nmap-Interactive-Menu)

## An Easy-to-Use Nmap Scanning Tool for Network Exploration & Security Audits

This bash script provides a user-friendly, interactive menu to perform various Nmap scanning tasks. It simplifies complex Nmap commands into straightforward menu options, making network reconnaissance and security auditing more accessible.

## Features

The script offers a wide range of scanning options, categorized for ease of use:

### Basic Scans
- Quick Scan (Top 100 ports)
- Standard Scan (Top 1000 ports)
- Full Port Scan (All 65535 ports)
- Ping Scan (Host discovery only)

### Advanced Scans
- Service Version Detection
- OS Detection
- Aggressive Scan (OS, Version, Scripts, Traceroute)
- Stealth Scan (SYN scan)

### Specific Scans
- UDP Scan
- Specific Port Scan
- Vulnerability Scan (with scripts)
- Fast Scan (Limited ports, fast timing)

### Special Options
- Scan with Output to File (saves to .nmap, .xml, .gnmap)
- Scan Entire Subnet
- TCP Connect Scan
- Firewall/IDS Evasion Scan
- ARP Discovery Scan (LAN only)
- List Scan (List targets)

### Advanced Techniques
- No Ping Scan (-Pn, assumes host is up)
- Idle Scan (-sI, uses a zombie host)
- Custom NSE Script Scan (allows user to specify scripts)
- **All-in-One Comprehensive Scan**: A very thorough scan including OS detection, version detection, all ports, and an extensive set of Nmap Scripting Engine (NSE) scripts (`default`, `discovery`, `safe`, `vuln`, `auth`, `broadcast`, `external`, `malware`, plus custom scripts like `http-title`, `smb-os-discovery`, `ssl-enum-ciphers`, `ftp-anon`, `ssh2-enum-algos`). This option also prompts to save the full audit log to a timestamped text file.

## Prerequisites

Before running this script, you need to have Nmap installed on your system.

### How to Install Nmap:

-   **Ubuntu/Debian:**
    ```bash
    sudo apt-get update
    sudo apt-get install nmap
    ```
-   **CentOS/RHEL:**
    ```bash
    sudo yum install nmap
    ```
-   **macOS (using Homebrew):**
    ```bash
    brew install nmap
    ```

## Usage

1.  **Save the script:** Save the provided script as `nmap_menu.sh` (or any other `.sh` filename).
2.  **Make it executable:**
    ```bash
    chmod +x nmap_menu.sh
    ```
3.  **Run the script:**
    ```bash
    sudo ./nmap_menu.sh
    ```
    *(Note: Many Nmap scans require root privileges, hence `sudo` is used.)*

Follow the on-screen prompts to select your desired scanning option and enter the target information.

---
Developed by Jutt Studio — Created by JS
