# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

GITY Blog is a Japanese-language community tech blog built with **Hugo** (static site generator) using the **Stack** theme (v3.29.0). It is deployed to GitHub Pages via GitHub Actions on push to `main`. Live at blog.gity.co.jp.

## Commands

```bash
pnpm install          # Install dependencies
pnpm run dev          # Start local dev server (localhost:1313, hot reload)
pnpm run build        # Build static site to /public
pnpm run new          # Create new post (auto-generates YYYYMMDD directory)
pnpm prettier --write .  # Format all files
```

## Architecture

- **Hugo config**: `hugo.yaml` — site settings, theme params, menus, taxonomies
- **Theme**: Stack v3 via Hugo modules (`go.mod`), minimal custom overrides
- **Custom layouts**: `layouts/` — only `_default/baseof.html` overrides the theme
- **Custom CSS**: `static/global.css`
- **Custom icons**: `assets/icons/` (Tabler icons)
- **CI/CD**: `.github/workflows/hugo.yaml` — builds with Hugo v0.137.1 + Dart Sass, deploys to GitHub Pages

## Content Structure

Posts live at `content/post/YYYYMMDD/article-slug/index.md`. Each post is a self-contained directory with its images alongside the markdown file.

Static pages (about, archives, member profiles, writing guide, search) are in `content/page/`.

### Post Frontmatter

```yaml
---
title: Article Title
description: Short description
date: 2025-01-16T22:40:28+09:00
image: featured-image.png
draft: false
hidden: false
categories:
  - Category Name
tags:
  - tag1
authors:
  - Author Name
---
```

Key fields: `authors` (multi-author support), `categories`, `tags`, `image` (featured), `draft`/`hidden` for publication control, `aliases` for URL redirects.

## Contribution Workflow

1. Create branch: `git switch -c name/article-title`
2. Create post: `pnpm run new` (then rename the directory slug)
3. Preview: `pnpm run dev`
4. PR to `main` triggers deploy on merge

## Code Style

- **Prettier**: 4-space tabs, no semicolons, double quotes (`.prettierrc.json`)
- **Markdown lint**: `.markdownlint.json` — HTML allowed, no line length limit
- Permalink format: `/posts/:year:month:day/:filename/`
- Language: Japanese (ja) with CJK word count enabled
- Unsafe HTML rendering is enabled in goldmark (markdown parser)
