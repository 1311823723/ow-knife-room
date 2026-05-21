# Setup

## OverPy

This project uses the official `overpy` npm package through `pnpm`.

Install dependencies:

```bash
corepack pnpm install
```

Compile the current OverPy entry point:

```bash
corepack pnpm run build
```

The compiled Workshop text is written to:

```text
dist/overpy-smoke.zh-cn.txt
```

Show OverPy CLI help:

```bash
corepack pnpm run overpy:help
```

## Current Limits

- `src/main.opy` is only a minimal compile smoke test. It does not contain migrated legacy gameplay yet.
- `legacy/current-workshop.zh-cn.txt` is currently RTF-wrapped Chinese Workshop text, not clean Workshop source text.
- Running `corepack pnpm run decompile:legacy` currently fails with:

```text
Error: Invalid rule (mismatched brackets): has 0 top-level brackets, should be 4
```

Before decompiling legacy code, create a clean plain-text Workshop copy from the playable legacy source and keep the original `legacy/current-workshop.zh-cn.txt` unchanged.
