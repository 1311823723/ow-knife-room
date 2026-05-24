# Naming Conventions

These conventions apply to new OverPy code and migration work. Legacy Workshop files and auto-decompiled reference files should stay traceable to the original source unless a task explicitly migrates one module.

## Sources Of Truth

- Use official OverPy syntax for built-ins. Do not invent function names.
- OverPy built-in functions use `camelCase`, such as `createEffect()` and `setMatchTime()`.
- When a Workshop function takes a player, array, or string as the first argument, prefer the OverPy member-function form, such as `eventPlayer.teleport(...)`.
- Use OverPy enums for constants, such as `Hero.ANA`, `Button.JUMP`, and `Color.WHITE`.

## Files

- Source files use lowercase names with hyphens only when needed: `hud.opy`, `double-jump.opy`.
- Generated or reference files must say so in the filename: `legacy-decompiled.opy`, `overpy-smoke.zh-cn.txt`.
- `src/legacy-decompiled.opy` is an auto-generated reference. Do not hand-edit it except by rerunning the decompile command.

## Rule Names

Use this format for migrated OverPy rules:

```text
[module] action phrase
```

Examples:

- `[hud] create rule hints`
- `[movement] arm double jump`
- `[host-tools] spawn dummy on crouch`
- `[kiriko] create knockdown zone`

Rules should describe one trigger and one responsibility. Avoid vague names such as `规则 1`, `规则 3`, or duplicated names such as two separate `二段跳` rules.

## Player Variables

Use `lower_snake_case` and include a module prefix when the variable is not obviously local.

Examples:

- `movement_double_jump_charges`
- `movement_double_jump_ready`
- `mercy_revive_armor_count`
- `kiriko_zone_effects`
- `kiriko_zone_active`
- `soldier_antman_scale`

Boolean variables should read like states:

- Good: `kiriko_zone_active`, `hud_created`, `sleep_penalty_active`
- Avoid: `Kiriko_Skill`, `flag`, `can`, `state`

Array variables should be plural:

- Good: `kiriko_zone_effects`
- Avoid: `kiriko_effect_handle`

Handle variables should include the resource type:

- `hacked_lightshaft_effect`
- `hud_rule_hint_handles`

HUD variables follow the UI layering rules in `docs/ui-guidelines.md`.
Use paired names for persistent HUD lifecycle:

- `hero_resource_hud_created`
- `hero_resource_hud_id`
- `hero_status_hud_created`
- `hero_status_hud_id`

## Global Variables

Use `lower_snake_case`. Prefer clear ownership:

- `hud_created`
- `host_dummy_spawn_locked`

Avoid generic global names like `debug`, `active`, or `timer`.

## Subroutines And Macros

Custom OverPy subroutines use `lowerCamelCase`, matching OverPy function style:

- `clearKirikoZoneEffects()`
- `resetSoldierAntmanState()`
- `createRuleHintHud()`

Macros that behave like constants use `UPPER_SNAKE_CASE`:

- `SOLDIER_MIN_SCALE`
- `SOLDIER_MAX_SCALE`

Macros that behave like functions use `lowerCamelCase`.

## Comments

Use comments to explain lifecycle or risk, not obvious syntax.

Good:

```py
# Keep this guard separate from HUD handles so reconnects can be handled later.
global.hud_created = true
```

Avoid:

```py
# Set variable to true.
global.hud_created = true
```

## Migration Rules

- Do not rename legacy variables inside `legacy/current-workshop.zh-cn.txt`.
- Do not hand-edit `src/legacy-decompiled.opy`; regenerate it from `legacy/current-workshop.zh-cn.plain.txt`.
- When migrating a module, introduce semantic variable names in the migrated OverPy module and update `docs/variable-map.md`.
- If a name is uncertain, mark it TODO rather than inventing certainty.
