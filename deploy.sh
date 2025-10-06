#!/bin/bash

# Build the Jekyll site
bundle exec jekyll build

# Navigate into the build directory
cd _site

# Initialize git inside _site (if first deploy)
git init
git remote add origin git@github.com:AlanMDaniel/bayesjump-public.git || true

# Checkout or create main branch
git checkout -B main

# Add all files and commit
git add --all
git commit -m "Deploy site $(date +'%Y-%m-%d %H:%M:%S')"

# Push to public repo
git push -f origin main

# Go back to root
cd ..
echo "Deployment complete!"
