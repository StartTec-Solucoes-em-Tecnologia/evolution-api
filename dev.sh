#!/bin/bash

# Evolution API Development Script with pnpm
# This script helps set up the development environment

set -e

echo "🚀 Setting up Evolution API development environment..."

# Check if pnpm is installed
if ! command -v pnpm &> /dev/null; then
    echo "❌ pnpm is not installed. Please install it first:"
    echo "   npm install -g pnpm"
    exit 1
fi

# Install dependencies
echo "📦 Installing dependencies..."
pnpm install

# Check if .env exists
if [ ! -f ".env" ]; then
    echo "⚠️  .env file not found. Creating from .env.example..."
    if [ -f ".env.example" ]; then
        cp .env.example .env
        echo "✅ .env file created. Please edit it with your configuration."
    else
        echo "❌ .env.example not found. Please create a .env file manually."
    fi
fi

# Generate Prisma client
echo "🗄️  Generating Prisma client..."
pnpm run db:generate

echo "✅ Development environment ready!"
echo ""
echo "Available commands:"
echo "  pnpm run dev:server  - Start development server"
echo "  pnpm run build       - Build the project"
echo "  pnpm run lint        - Run linting"
echo "  pnpm run db:studio   - Open Prisma Studio"
echo ""
echo "Happy coding! 🎉"
