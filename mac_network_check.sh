#!/bin/bash
# mac_network_check.sh - Detect suspicious outbound network activity on macOS
# Usage: chmod +x mac_network_check.sh && ./mac_network_check.sh

RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
BOLD='\033[1m'
NC='\033[0m'

echo "${BOLD}=== Mac Network Activity Scanner ===${NC}"
echo "Scan time: $(date)"
echo ""

# 1. List all processes with established outbound connections
echo "${BOLD}[1] Processes with ESTABLISHED internet connections:${NC}"
echo "----------------------------------------------------"
lsof -i -nP 2>/dev/null | grep ESTABLISHED | awk '{printf "%-8s %-20s %-10s %s\n", $2, $1, $8, $9}' | sort -u
echo ""

# 2. List all LISTENING ports (services waiting for connections)
echo "${BOLD}[2] Processes LISTENING on network ports:${NC}"
echo "-----------------------------------------"
lsof -i -nP 2>/dev/null | grep LISTEN | awk '{printf "PID=%-8s %-20s %s\n", $2, $1, $9}' | sort -u
echo ""

# 3. Flag processes connecting to non-standard ports
echo "${BOLD}[3] Connections on unusual ports (not 80/443/53/22/993/587/465/143):${NC}"
echo "---------------------------------------------------------------------"
COMMON_PORTS="80|443|53|22|993|587|465|143|8080|8443|5223|5228"
lsof -i -nP 2>/dev/null | grep ESTABLISHED | awk '{print $2, $1, $9}' | \
  grep -vE ":(${COMMON_PORTS})$" | sort -u | while read pid name addr; do
    echo "${YELLOW}  PID=$pid  $name  -> $addr${NC}"
done
echo ""

# 4. Check for processes running from unusual locations
echo "${BOLD}[4] Network-active processes running from unusual paths:${NC}"
echo "--------------------------------------------------------"
lsof -i -nP 2>/dev/null | grep ESTABLISHED | awk '{print $2}' | sort -u | while read pid; do
  path=$(ps -o comm= -p "$pid" 2>/dev/null)
  if echo "$path" | grep -qiE '/tmp/|/var/tmp/|/Users/.*/Downloads/|/Users/.*/Desktop/|\.[a-z]'; then
    name=$(ps -o comm= -p "$pid" 2>/dev/null)
    echo "${RED}  SUSPICIOUS: PID=$pid  Path=$path${NC}"
  fi
done
echo ""

# 5. Check for unsigned or ad-hoc signed binaries with network access
echo "${BOLD}[5] Signature check on network-active processes:${NC}"
echo "-------------------------------------------------"
lsof -i -nP 2>/dev/null | grep ESTABLISHED | awk '{print $2}' | sort -u | while read pid; do
  exe=$(ps -o comm= -p "$pid" 2>/dev/null)
  if [ -n "$exe" ] && [ -f "$exe" ]; then
    sig=$(codesign -dv "$exe" 2>&1)
    if echo "$sig" | grep -q "code object is not signed"; then
      echo "${RED}  UNSIGNED: PID=$pid  $exe${NC}"
    elif echo "$sig" | grep -q "adhoc"; then
      echo "${YELLOW}  AD-HOC SIGNED: PID=$pid  $exe${NC}"
    fi
  fi
done
echo ""

# 6. DNS: recent lookups (if log is available)
echo "${BOLD}[6] Recent DNS queries (last 50 from dns-sd cache):${NC}"
echo "----------------------------------------------------"
log show --predicate 'process == "mDNSResponder"' --info --last 2m 2>/dev/null | \
  grep -oE 'question [^ ]+' | sort -u | tail -50 || echo "  (requires sudo or log access)"
echo ""

# 7. Check LaunchAgents/LaunchDaemons for persistence (common malware tactic)
echo "${BOLD}[7] Non-Apple LaunchAgents/LaunchDaemons (persistence check):${NC}"
echo "--------------------------------------------------------------"
for dir in ~/Library/LaunchAgents /Library/LaunchAgents /Library/LaunchDaemons; do
  if [ -d "$dir" ]; then
    for f in "$dir"/*.plist; do
      [ -f "$f" ] || continue
      if ! plutil -p "$f" 2>/dev/null | grep -q "com.apple"; then
        label=$(basename "$f")
        echo "  $dir/${YELLOW}$label${NC}"
      fi
    done
  fi
done
echo ""

# 8. Summary of top talkers by connection count
echo "${BOLD}[8] Top processes by connection count:${NC}"
echo "--------------------------------------"
lsof -i -nP 2>/dev/null | grep ESTABLISHED | awk '{print $1}' | sort | uniq -c | sort -rn | head -10
echo ""

echo "${BOLD}=== Scan Complete ===${NC}"
echo ""
echo "Tips:"
echo "  - Review items in ${YELLOW}yellow${NC} (unusual but not necessarily malicious)"
echo "  - Investigate items in ${RED}red${NC} (likely suspicious)"
echo "  - Run with ${BOLD}sudo${NC} for more complete results"
echo "  - Use 'lsof -i -nP -p <PID>' to dig into a specific process"
echo "  - Use 'whois <IP>' to look up unknown destination IPs"
