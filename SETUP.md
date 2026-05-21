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
dist/current-workshop.zh-cn.copy-paste.txt
```

Show OverPy CLI help:

```bash
corepack pnpm run overpy:help
```

Run the minimal compiler smoke test:

```bash
corepack pnpm run build:smoke
```

The smoke-test Workshop text is written to:

```text
dist/overpy-smoke.zh-cn.txt
```

## Current Limits

- `src/main.opy` is the current active OverPy source.
- `src/smoke.opy` is the minimal compiler smoke test.
- `legacy/current-workshop.zh-cn.txt` is RTF-wrapped Chinese Workshop text and must stay unchanged.
- `legacy/current-workshop.zh-cn.plain.txt` is the generated plain-text copy used for OverPy decompilation attempts.
- If the plain-text copy needs to be regenerated, run:

```bash
textutil -format rtf -convert txt -encoding UTF-8 -output legacy/current-workshop.zh-cn.plain.txt legacy/current-workshop.zh-cn.txt
```

Decompile the plain-text legacy copy:

```bash
corepack pnpm run decompile:legacy
```

This writes `src/legacy-decompiled.opy`. Treat that file as reference material for migration, not as the active source of truth. The playable fallback remains the original legacy Workshop code.

Keep variable indexes during decompilation. The legacy Workshop uses `26: Kiriko_Skill`; dropping indexes lets OverPy auto-assign it to index 4, which collides with the default A-Z player variable range in-game.
