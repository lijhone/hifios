#!/usr/bin/env bash

# ============================================
# HiFiOS Extension for Armbian Build Framework
# ============================================

function extension_prepare_config__hifios() {
	echo "🔧 [HiFiOS] Preparing configuration..."
}

function pre_customize_image__hifios() {
	echo "🔧 [HiFiOS] Pre-customize image hooks..."
}

function post_customize_image__hifios() {
	echo "✅ [HiFiOS] Post-customize image hooks..."
}

# 必须导出函数，否则 Armbian build 不会调用
export -f extension_prepare_config__hifios
export -f pre_customize_image__hifios
export -f post_customize_image__hifios
