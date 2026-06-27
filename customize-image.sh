#!/usr/bin/env bash

# ============================================
# HiFiOS Custom Image Script
# ============================================
# This script runs inside chroot during image build
#
# Available variables:
# - ARCH        (arm64 / amd64)
# - LINUXFAMILY (meson / generic / rockchip ...)
# - BOARD       (aml-s905x-p212 / generic-x86_64 ...)
# - RELEASE     (trixie / noble ...)
# ============================================

set -e

echo "🎯 [HiFiOS] Entering customize-image stage"
echo "    ARCH        : $ARCH"
echo "    LINUXFAMILY : $LINUXFAMILY"
echo "    BOARD       : $BOARD"
echo "    RELEASE     : $RELEASE"

# ---------- Platform Detection ----------
case "$LINUXFAMILY" in
	meson)
		echo "📦 [HiFiOS] Detected Amlogic S905 platform"
		HIFIOS_PLATFORM="s905"
		;;
	generic)
		if [[ "$ARCH" == "amd64" ]]; then
			echo "📦 [HiFiOS] Detected x86_64 platform"
			HIFIOS_PLATFORM="x86"
		else
			echo "⚠️ [HiFiOS] Unknown generic architecture"
			HIFIOS_PLATFORM="unknown"
		fi
		;;
	*)
		echo "⚠️ [HiFiOS] Unsupported platform: $LINUXFAMILY"
		HIFIOS_PLATFORM="unsupported"
		;;
esac

# ---------- Future Hooks ----------
mkdir -p /etc/hifios
echo "$HIFIOS_PLATFORM" > /etc/hifios/platform

echo "✅ [HiFiOS] Platform marker written to /etc/hifios/platform"