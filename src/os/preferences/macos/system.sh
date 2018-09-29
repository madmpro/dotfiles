
cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Adjusting System Settings\n\n"

# TRIM isn't supported in external enclosures that use USB or FireWire
# as the method of connection to your Mac. Thunderbolt enclosures with SSDs
# do support the use of TRIM.
execute "sudo TRIMforce enable" \
    "Enable TRIM for Any SSD in OS X"
