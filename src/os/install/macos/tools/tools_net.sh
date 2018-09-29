#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../../utils.sh" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Network Tools\n\n"

declare -a FORMULAS=(
    "libpcap"              # the LIBpcap interface to various kernel packet capture mechanism
    "aircrack-ng"          # Aircrack- ng is a complete suite of tools to assess WiFi network security
    "ettercap"             # Ettercap is a comprehensive suite for man in the middle attacks
    "nmap"                 # Nmap Free Security Scanner, Port Scanner, & Network Exploration Tool
    "openssl"              # TLS/SSL and crypto library
    "curl --with-openssl"  # A command line tool and library for transferring data with URL syntax
    "wget --with-iri"      # GNU Wget is a free network utility to retrieve files from the World Wide Web using HTTP and FTP
    "aria2"                # aria2 is a lightweight multi-protocol & multi-source command-line download utility
    "libnet"               # libnet provides a portable framework for low-level network packet construction
    "tcpflow"              # TCP/IP packet demultiplexer
    "tcpreplay"            # Tcpreplay is a suite of free Open Source utilities for editing and replaying previously captured network traffic
    "tcptrace"             # tcptrace is a tool for analysis of TCP dump files
    "dns2tcp"              # Dns2tcp is a network tool designed to relay TCP connections through DNS traffic.
    "lynx"                 # Lynx is a customizable text-based web browser
    "ssh-copy-id"          # ssh-copy-id installs an SSH key on a server as an authorized key
    "httpie"               # HTTPie: a CLI, cURL-like tool for humans
    "youtube-dl"           # youtube-dl - download videos from youtube.com or other video platforms
    "dnscrypt-proxy --with-plugins" # DNSCrypt
    "speedtest-cli"        # Command line speedtest
    "neomutt/homebrew-neomutt/neomutt --with-gpgme --with-notmuch-patch --with-lua"
    "iperf"                # Network speedtest between 2 computers

)

for i in "${FORMULAS[@]}"; do
   brew_install "$i" "$i"
done
