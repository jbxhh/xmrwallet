#!/bin/bash

# Monerujo APK Build Script
# This script builds APK files for the Monero wallet

set -e

echo "========================================"
echo "Monerujo APK Build Script"
echo "========================================"
echo ""

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if gradlew exists
if [ ! -f "./gradlew" ]; then
    echo -e "${YELLOW}Error: gradlew not found. Please run this script from the project root directory.${NC}"
    exit 1
fi

# Make gradlew executable
chmod +x ./gradlew

echo -e "${BLUE}Select build type:${NC}"
echo "1) Debug APK (assembleDebug)"
echo "2) Release APK (assembleRelease)"
echo "3) All variants (assemble)"
echo "4) Mainnet Release"
echo "5) Stagenet Release"
read -p "Enter choice (1-5): " choice

case $choice in
    1)
        echo -e "${BLUE}Building Debug APK...${NC}"
        ./gradlew assembleDebug
        ;;
    2)
        echo -e "${BLUE}Building Release APK...${NC}"
        ./gradlew assembleRelease
        ;;
    3)
        echo -e "${BLUE}Building all variants...${NC}"
        ./gradlew assemble
        ;;
    4)
        echo -e "${BLUE}Building Mainnet Release APK...${NC}"
        ./gradlew assembleMainnetProdRelease
        ;;
    5)
        echo -e "${BLUE}Building Stagenet Release APK...${NC}"
        ./gradlew assembleStagenetProdRelease
        ;;
    *)
        echo -e "${YELLOW}Invalid choice${NC}"
        exit 1
        ;;
esac

echo ""
echo -e "${GREEN}========================================"
echo "Build completed successfully!"
echo "========================================${NC}"
echo ""
echo -e "${BLUE}APK files location:${NC}"
echo "app/build/outputs/apk/"
echo ""
echo -e "${BLUE}To install the APK on a connected device:${NC}"
echo "adb install app/build/outputs/apk/mainnet/prod/debug/app-debug.apk"
echo ""
