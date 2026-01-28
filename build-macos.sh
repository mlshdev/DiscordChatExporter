#!/bin/bash
set -e

# Build script for macOS (targeting arm64 by default, compatible with Apple Silicon)
# Usage: ./build-macos.sh

echo "Building DiscordChatExporter for macOS (osx-arm64)..."

# Ensure dependencies are restored
dotnet restore

# Publish the GUI project
# -c Release: Release configuration
# -r osx-arm64: Target macOS ARM64
# --self-contained: Bundle the runtime (optional, but good for distribution)
# -o: Output directory

dotnet publish DiscordChatExporter.Gui/DiscordChatExporter.Gui.csproj \
    -c Release \
    -r osx-arm64 \
    --self-contained true \
    -o release/macos/gui \
    -p:PublishSingleFile=true

echo "Build complete. Artifacts are in release/macos/"
