#!/bin/bash
# Copyright (c) 2025 Jutt Studio
# Licensed under the Jutt Studio Attribution License (JSAL) 1.0
# See LICENSE file in repository root for full terms.
# Nmap Interactive Menu Script
# Easy-to-use interface for common Nmap scanning tasks

# Colors for better visibility
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m' 
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Bold Colors
B_RED='\033[1;31m'
B_GREEN='\033[1;32m'
B_YELLOW='\033[1;33m'
B_BLUE='\033[1;34m'
B_CYAN='\033[1;36m'

# Function to display banner
show_banner() {
    clear
    echo -e "${CYAN}"
    cat << "EOF"
                        ╔═══════════════════════════════════════════════╗
                        ║             Nmap Interactive Menu             ║
                        ║      An Easy-to-Use Nmap Scanning Tool        ║
                        ║    For Network Exploration & Security Audits  ║
                        ║                                               ║
                        ╚═══════════════════════════════════════════════╝
                        Developed by Jutt Studio — Created by JS
EOF
    echo -e "${NC}"
}

# Function to check if nmap is installed
check_nmap() {
    if ! command -v nmap &> /dev/null; then
        echo -e "${RED}Error: Nmap is not installed!${NC}"
        echo "Please install nmap first:"
        echo "  Ubuntu/Debian: sudo apt-get install nmap"
        echo "  CentOS/RHEL: sudo yum install nmap"
        echo "  MacOS: brew install nmap"
        exit 1
    fi
}

# Function to get target
get_target() {
    echo -e "${B_YELLOW}Enter target (IP address, hostname, or IP range):${NC}"
    read -p "$(echo -e "${B_CYAN}Target:${NC} ")" target
    if [ -z "$target" ]; then
        echo -e "${RED}No target specified!${NC}"
        return 1
    fi
    echo ""
}

# Function to pause and wait for user
pause() {
    echo ""
    echo -e "${CYAN}Press Enter to continue...${NC}"
    read
}

# Main menu
show_menu() {
    show_banner
    echo -e "${GREEN}Select a scanning option:${NC}"
    echo -e "\n${B_YELLOW}Basic Scans:${NC}"
    echo -e "  ${B_BLUE}1)${NC} ⚡ Quick Scan (Top 100 ports)"
    echo -e "  ${B_BLUE}2)${NC} 🎯 Standard Scan (Top 1000 ports)"
    echo -e "  ${B_BLUE}3)${NC} 🌐 Full Port Scan (All 65535 ports)"
    echo -e "  ${B_BLUE}4)${NC} 🏓 Ping Scan (Host discovery only)"
    echo -e "\n${B_YELLOW}Advanced Scans:${NC}"
    echo -e "  ${B_BLUE}5)${NC} ℹ️  Service Version Detection"
    echo -e "  ${B_BLUE}6)${NC} 💻 OS Detection"
    echo -e "  ${B_BLUE}7)${NC} 🚀 Aggressive Scan (OS, Version, Scripts, Traceroute)"
    echo -e "  ${B_BLUE}8)${NC} 👻 Stealth Scan (SYN scan)"
    echo -e "\n${B_YELLOW}Specific Scans:${NC}"
    echo -e "  ${B_BLUE}9)${NC} 💧 UDP Scan"
    echo -e "  ${B_BLUE}10)${NC} 📌 Specific Port Scan"
    echo -e "  ${B_BLUE}11)${NC} 🐞 Vulnerability Scan (with scripts)"
    echo -e "  ${B_BLUE}12)${NC} 🏃 Fast Scan (Limited ports, fast timing)"
    echo -e "\n${B_YELLOW}Special Options:${NC}"
    echo -e "  ${B_BLUE}13)${NC} 💾 Scan with Output to File"
    echo -e "  ${B_BLUE}14)${NC} 🌐 Scan Entire Subnet"
    echo -e "  ${B_BLUE}15)${NC} 🤝 TCP Connect Scan"
    echo -e "  ${B_BLUE}16)${NC} 🛡️  Firewall/IDS Evasion Scan"
    echo -e "  ${B_BLUE}17)${NC} 📍 ARP Discovery Scan (LAN only)"
    echo -e "  ${B_BLUE}18)${NC} 📋 List Scan (List targets)"
    echo -e "\n${B_YELLOW}Advanced Techniques:${NC}"
    echo -e "  ${B_BLUE}19)${NC} 🚫 No Ping Scan (-Pn, assumes host is up)"
    echo -e "  ${B_BLUE}20)${NC} 🧟 Idle Scan (-sI, uses a zombie host)"
    echo -e "  ${B_BLUE}21)${NC} 📜 Custom NSE Script Scan"
    echo -e "  ${B_BLUE}22)${NC} 💥 All-in-One Comprehensive Scan"
    echo ""
    echo -e "  ${B_RED}23) 🚪 Exit${NC}"
    echo ""
    echo -e "${CYAN}========================================================${NC}"
}

# Scan functions
scan_quick() {
    get_target || return


    echo -e "${BLUE}Running Quick Scan on $target (FAST MODE)...${NC}"
    echo -e "${B_CYAN}Command:${NC} nmap -F -T4 --min-rate=1000 --max-retries=2 $target"
    echo ""

    sudo nmap -F -T4 --min-rate=1000 --max-retries=2 $target
    pause
}

scan_standard() {
    get_target || return


    echo -e "${BLUE}Running Standard Scan on $target (FAST MODE)...${NC}"
    echo -e "${B_CYAN}Command:${NC} nmap -T4 --min-rate=1000 --max-retries=2 $target"
    echo ""

    sudo nmap -T4 --min-rate=1000 --max-retries=2 $target
    pause
}

scan_full() {
    get_target || return


    echo -e "${BLUE}Running Full Port Scan on $target (ULTRA FAST - Parallel Workers)...${NC}"
    echo -e "${B_CYAN}Command:${NC} nmap -p- -T4 --min-rate=5000 --max-retries=1 --min-parallelism=100 $target"
    echo ""

    sudo nmap -p- -T4 --min-rate=5000 --max-retries=1 --min-parallelism=100 $target
    pause
}

scan_ping() {
    get_target || return


    echo -e "${BLUE}Running Ping Scan on $target (FAST MODE)...${NC}"
    echo -e "${B_CYAN}Command:${NC} nmap -sn -T4 --min-parallelism=100 $target"
    echo ""

    sudo nmap -sn -T4 --min-parallelism=100 $target
    pause
}

scan_version() {
    get_target || return


    echo -e "${BLUE}Running Service Version Detection on $target (FAST MODE)...${NC}"
    echo -e "${B_CYAN}Command:${NC} nmap -sV -T4 --version-intensity 5 --min-rate=1000 $target"
    echo ""

    sudo nmap -sV -T4 --version-intensity 5 --min-rate=1000 $target
    pause
}

scan_os() {
    get_target || return

    echo -e "${BLUE}Running OS Detection on $target (with Guessing)...${NC}"
    echo -e "${B_CYAN}Command:${NC} sudo nmap -O --osscan-guess -T4 --min-rate=1000 $target"
    echo ""
    # --osscan-guess tells Nmap to guess the OS if it can't find a perfect match
    sudo nmap -O --osscan-guess -T4 --min-rate=1000 "$target"
    pause
}

scan_aggressive() {
    get_target || return


    echo -e "${BLUE}Running Aggressive Scan on $target (FAST MODE)...${NC}"
    echo -e "${B_CYAN}Command:${NC} nmap -A -T4 --min-rate=1000 --max-retries=2 $target"
    echo ""

    sudo nmap -A -T4 --min-rate=1000 --max-retries=2 $target
    pause
}

scan_stealth() {
    get_target || return


    echo -e "${BLUE}Running Stealth SYN Scan on $target (FAST MODE)...${NC}"
    echo -e "${B_CYAN}Command:${NC} nmap -sS -T4 --min-rate=1000 --max-retries=2 --min-parallelism=100 $target"
    echo ""

    sudo nmap -sS -T4 --min-rate=1000 --max-retries=2 --min-parallelism=100 $target
    pause
}

scan_udp() {
    get_target || return


    echo -e "${BLUE}Running UDP Scan on $target (FAST MODE - Top ports only)...${NC}"
    echo -e "${B_CYAN}Command:${NC} nmap -sU -F -T4 --max-retries=1 $target"
    echo ""

    sudo nmap -sU -F -T4 --max-retries=1 $target
    pause
}

scan_specific_port() {
    get_target || return
    echo -e "${B_YELLOW}Enter port(s) to scan (e.g., 80 or 80,443 or 1-1000):${NC}"
    read -p "$(echo -e "${B_CYAN}Ports:${NC} ")" ports
    if [ -z "$ports" ]; then
        echo -e "${RED}No ports specified!${NC}"
        pause
        return
    fi


    echo -e "${BLUE}Running Port Scan on $target for ports $ports (FAST MODE)...${NC}"
    echo -e "${B_CYAN}Command:${NC} nmap -p $ports -T4 --min-rate=1000 --max-retries=2 $target"
    echo ""
    sudo nmap -p $ports -T4 --min-rate=1000 --max-retries=2 $target
    pause
}

scan_vuln() {
    get_target || return
    echo -e "${BLUE}Running Vulnerability Scan on $target (FAST MODE)...${NC}"
    echo -e "${B_CYAN}Command:${NC} nmap --script vuln -T4 --min-rate=1000 $target"
    echo ""
    sudo nmap --script vuln -T4 --min-rate=1000 $target
    pause
}

scan_fast() {
    get_target || return
    echo -e "${BLUE}Running ULTRA Fast Scan on $target...${NC}"
    echo -e "${B_CYAN}Command:${NC} nmap -F -T5 --min-rate=2000 --max-retries=1 --min-parallelism=100 $target"
    echo ""
    sudo nmap -F -T5 --min-rate=2000 --max-retries=1 --min-parallelism=100 $target
    pause
}

scan_output() {
    get_target || return
    echo -e "${B_YELLOW}Enter output filename (without extension):${NC}"
    read -p "$(echo -e "${B_CYAN}Filename:${NC} ")" filename
    if [ -z "$filename" ]; then
        filename="nmap_scan_$(date +%Y%m%d_%H%M%S)"
    fi
    echo -e "${BLUE}Running Scan on $target with output to $filename (FAST MODE)...${NC}"
    echo -e "${B_CYAN}Command:${NC} nmap -oA $filename -T4 --min-rate=1000 --max-retries=2 $target"
    echo ""
    sudo nmap -oA $filename -T4 --min-rate=1000 --max-retries=2 $target
    echo -e "${GREEN}Output saved to:${NC}"
    echo "  - $filename.nmap (normal output)"
    echo "  - $filename.xml (XML output)"
    echo "  - $filename.gnmap (grepable output)"
    pause
}

scan_subnet() {
    echo -e "${B_YELLOW}Enter subnet (e.g., 192.168.1.0/24):${NC}"
    read -p "$(echo -e "${B_CYAN}Subnet:${NC} ")" target
    if [ -z "$target" ]; then
        echo -e "${RED}No subnet specified!${NC}"
        pause
        return
    fi
    echo -e "${BLUE}Running Subnet Scan on $target (FAST MODE - Parallel Workers)...${NC}"
    echo -e "${B_CYAN}Command:${NC} nmap -T4 --min-rate=1000 --max-retries=2 --min-parallelism=100 $target"
    echo ""
    sudo nmap -T4 --min-rate=1000 --max-retries=2 --min-parallelism=100 $target
    pause
}

scan_tcp_connect() {
    get_target || return
    echo -e "${BLUE}Running TCP Connect Scan on $target (FAST MODE)...${NC}"
    echo -e "${B_CYAN}Command:${NC} nmap -sT -T4 --min-rate=1000 --max-retries=2 --min-parallelism=100 $target"
    echo ""
    sudo nmap -sT -T4 --min-rate=1000 --max-retries=2 --min-parallelism=100 $target
    pause
}

scan_evasion() {
    get_target || return
    echo -e "${BLUE}Running Firewall/IDS Evasion Scan on $target...${NC}"
    echo -e "${B_CYAN}Command:${NC} nmap -f -T2 -D RND:10 $target"
    echo ""
    sudo nmap -f -T2 -D RND:10 $target
    pause
}

# New scan function for ARP discovery
scan_arp_discovery() {
    echo -e "${B_YELLOW}Enter local subnet to scan (e.g., 192.168.1.0/24):${NC}"
    read -p "$(echo -e "${B_CYAN}Subnet:${NC} ")" target
    if [ -z "$target" ]; then
        echo -e "${RED}No subnet specified!${NC}"
        pause
        return
    fi

    echo -e "${BLUE}Running ARP Discovery Scan on $target...${NC}"
    echo -e "${B_CYAN}Command:${NC} sudo nmap -sn -PR -T4 $target"
    echo ""
    sudo nmap -sn -PR -T4 "$target"
    pause
}

# New scan function for List Scan
scan_list() {
    get_target || return

    echo -e "${BLUE}Running List Scan for $target...${NC}"
    echo -e "${B_CYAN}Command:${NC} nmap -sL $target"
    echo ""
    # No sudo needed for -sL
    nmap -sL "$target"
    pause
}

# New scan function for No Ping Scan
scan_no_ping() {
    get_target || return

    echo -e "${BLUE}Running Scan with No Ping (-Pn) on $target...${NC}"
    echo -e "${B_CYAN}Command:${NC} sudo nmap -Pn -T4 --min-rate=1000 $target"
    echo ""
    sudo nmap -Pn -T4 --min-rate=1000 "$target"
    pause
}

# New scan function for Idle Scan
scan_idle() {
    echo -e "${B_YELLOW}Enter the IP of the 'zombie' host (must be idle on the network):${NC}"
    read -p "$(echo -e "${B_CYAN}Zombie IP:${NC} ")" zombie
    if [ -z "$zombie" ]; then
        echo -e "${RED}No zombie host specified!${NC}"
        pause
        return
    fi

    get_target || return

    echo -e "${BLUE}Running Idle Scan on $target using zombie $zombie...${NC}"
    echo -e "${B_CYAN}Command:${NC} sudo nmap -sI $zombie -T4 $target"
    echo ""
    sudo nmap -sI "$zombie" -T4 "$target"
    pause
}

# New scan function for Custom NSE Scripts
scan_custom_nse() {
    get_target || return
23
24\23
    # Display a list of useful scripts for the user
    echo -e "${GREEN}--- Common NSE Scripts ---${NC}"
    echo -e "${B_YELLOW}Discovery:${NC}"
    echo -e "  ${CYAN}http-title${NC}              - Gets web page title"
    echo -e "  ${CYAN}smb-os-discovery${NC}        - Gathers OS info from SMB (Windows)"
    echo -e "  ${CYAN}ssl-enum-ciphers${NC}        - Lists supported SSL/TLS ciphers"
    echo -e "  ${CYAN}dns-brute${NC}               - Finds subdomains for a domain"
    echo -e "  ${CYAN}ftp-anon${NC}                - Checks for anonymous FTP access"
    echo ""
    echo -e "${B_YELLOW}Vulnerability:${NC}"
    echo -e "  ${CYAN}vulners${NC}                 - Checks for vulns using Vulners DB"
    echo -e "  ${CYAN}smb-vuln-ms17-010${NC}       - Checks for EternalBlue"
    echo -e "  ${CYAN}http-shellshock${NC}         - Checks for Shellshock bug"
    echo -e "  ${CYAN}ssl-heartbleed${NC}          - Checks for Heartbleed bug"
    echo ""
    echo -e "${B_YELLOW}Tip: You can combine scripts with a comma, e.g., http-title,ftp-anon${NC}"
    echo ""
    echo -e "${B_YELLOW}Enter NSE script names to run:${NC}"
    read -p "$(echo -e "${B_CYAN}Scripts:${NC} ")" scripts
    if [ -z "$scripts" ]; then
        echo -e "${RED}No scripts specified!${NC}"
        pause
        return
    fi

    echo -e "${BLUE}Running Custom NSE Scripts ($scripts) on $target...${NC}"
    echo -e "${B_CYAN}Command:${NC} sudo nmap --script \"$scripts\" -sV -T4 $target"
    echo ""
    sudo nmap --script "$scripts" -sV -T4 "$target"
    pause
}

# Upgraded scan function for a powerful, all-in-one scan
scan_all_in_one() {
    get_target || return

    # A curated list of useful and safe discovery scripts to add to the aggressive scan
    local custom_scripts="http-title,smb-os-discovery,ssl-enum-ciphers,ftp-anon,ssh2-enum-algos"

    # This combines Aggressive scan (-A), a full port scan (-p-), and extra scripts for maximum information
    echo -e "${BLUE}Running Full Comprehensive Scan (Extensive Scripting) on $target...${NC}"
    echo -e "${YELLOW}This is a very thorough scan and may take a long time.${NC}"
    echo -e "${B_CYAN}Command:${NC} sudo nmap -A -p- --script=\"default,discovery,safe,vuln,auth,broadcast,external,malware,$custom_scripts\" -T4 --min-rate=1000 \"$target\""
    
    # Capture output to a variable while also displaying it to the screen
    local scan_output
    scan_output=$(sudo nmap -A -p- --script="default,discovery,safe,vuln,auth,broadcast,external,malware,$custom_scripts" -T4 --min-rate=1000 "$target" | tee /dev/tty)
    
    # Ask the user if they want to save the output
    echo ""
    read -p "$(echo -e "${B_YELLOW}Do you want to save the full audit log to a file? (y/n):${NC} ")" save_choice
    
    if [[ "$save_choice" == "y" || "$save_choice" == "Y" ]]; then
        local filename="comprehensive_scan_${target}_$(date +%Y%m%d_%H%M%S).txt"
        # Save the output and append the developer credit line
        {
            echo "$scan_output"
            echo ""
            echo "Developed by Jutt Studio — Created by JS"
        } > "$filename"
        echo -e "${GREEN}Scan output saved to: $filename${NC}"
    fi
    
    pause
}


# Main program loop
main() {
    check_nmap
    
    while true; do
        show_menu
        read -p "$(echo -e "${B_GREEN}Enter your choice [1-23]:${NC} ")" choice
        echo ""
        
        case $choice in
            1) scan_quick ;;
            2) scan_standard ;;
            3) scan_full ;;
            4) scan_ping ;;
            5) scan_version ;;
            6) scan_os ;;
            7) scan_aggressive ;;
            8) scan_stealth ;;
            9) scan_udp ;;
            10) scan_specific_port ;;
            11) scan_vuln ;;
            12) scan_fast ;;
            13) scan_output ;;
            14) scan_subnet ;;
            15) scan_tcp_connect ;;
            16) scan_evasion ;;
            17) scan_arp_discovery ;;
            18) scan_list ;;
            19) scan_no_ping ;;
            20) scan_idle ;;
            21) scan_custom_nse ;;
            22) scan_all_in_one ;;
            23)
                echo -e "${GREEN}Thank you for using Nmap Interactive Menu!${NC}"
                exit 0
                ;;
            *)
                echo -e "${RED}Invalid option! Please select a valid number.${NC}"
                pause
                ;;
        esac
    done
}

# Run the main program
main
