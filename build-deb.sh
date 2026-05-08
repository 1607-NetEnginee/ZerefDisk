#!/bin/bash
# build-deb.sh — Script untuk build zeRefdisk.deb
# Usage: bash build-deb.sh

set -e

VERSION="1.0.0"
PACKAGE="zeRefdisk"
OUTPUT="${PACKAGE}_${VERSION}_all.deb"

echo ""
echo "  ▓▒░ ZerefDisk .deb Builder ░▒▓"
echo "  ─────────────────────────────────"

# Pastikan struktur ada
mkdir -p ${PACKAGE}/DEBIAN
mkdir -p ${PACKAGE}/usr/bin
mkdir -p ${PACKAGE}/var/lib/zeRefdisk

# Set permissions
chmod 755 ${PACKAGE}/DEBIAN
chmod +x  ${PACKAGE}/usr/bin/zeRefdisk
chmod +x  ${PACKAGE}/DEBIAN/postinst
chmod +x  ${PACKAGE}/DEBIAN/prerm

# Build
echo "  [→] Building ${OUTPUT}..."
dpkg-deb --build ${PACKAGE} ${OUTPUT}

echo "  [✓] Done: ${OUTPUT}"
echo "  [*] Ukuran: $(du -h ${OUTPUT} | cut -f1)"
echo ""
echo "  Install dengan:"
echo "    sudo dpkg -i ${OUTPUT}"
echo "    sudo apt-get install -f  # jika ada dependency kurang"
echo ""
echo "  Setelah install:"
echo "    sudo zeRefdisk"
echo "    sudo zeRefdisk --help"
echo ""
