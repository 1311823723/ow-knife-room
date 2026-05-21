# 变量映射

源文件：`legacy/current-workshop.zh-cn.txt`

旧代码变量表只显式声明了玩家变量 `26: Kiriko_Skill`。`A`、`B`、`C`、`D`、`Y`、`Z` 以 Workshop 默认玩家变量字母形式直接使用。

| 原变量名 | 建议语义名 | 当前在哪些规则里使用 | 当前用途 | 是否需要重命名 | 是否需要初始化 | 是否需要死亡/换英雄/离开时重置 |
| --- | --- | --- | --- | --- | --- | --- |
| `A` | `movement_double_jump_charges` | `规则 1`、两条 `二段跳`、`规则 3`、`规则 5` | 二段跳剩余次数。落地设为 1，二段跳执行后减 1，耗尽后关闭许可。 | 是，迁移时按命名规范使用模块前缀。 | 是，玩家加入/重生/落地时都应明确设为 1。 | 死亡或换英雄后建议重置；离开时无需保留。 |
| `B` | `movement_double_jump_ready` | 两条 `二段跳`、`规则 3`、`规则 5` | 二段跳许可标记。离地松开跳跃后设真，执行或耗尽后设假。 | 是。 | 是，默认应为假。 | 死亡、落地、换英雄、离开时应设假。 |
| `C` | `mercy_revive_armor_available` / `mercy_revive_armor_state` | `[mercy] grant revive armor on spawn`、`[mercy] revive armor breaks on lethal damage`、`[mercy] clear revive armor state on death` | 天使复活甲状态。当前 `0` 表示本条命未初始化，`1` 表示复活甲可用，`2` 表示本条命复活甲已破碎。 | 是，后续迁移时建议改成语义变量；当前保留 `C` 避免重排旧变量。 | 是。天使存活且 `C == 0` 时设为 `1`。 | 死亡时重置为 `0`；换英雄和离开时后续应补生命周期清理。 |
| `D` | `kiriko_zone_effects` | `雾子法阵击倒` | 保存雾子法阵创建的 3 个效果实体句柄，5 秒后按索引清理并清空数组。 | 是。 | 是，使用技能前设为空数组；更好是在玩家加入/换英雄时也初始化。 | 死亡、换英雄、离开时应清理已有实体并清空数组。 |
| `Y` | `soldier_antman_scale` | `76初始化`、`76变大`、`76变小`、`76复活后回归`、`76长时间变大` | 士兵 76 体型倍率。当前 `76初始化` 持续 `+= 1`，所以实际值不可靠。 | 是。 | 是，士兵 76 初始化时应设为明确基准值，例如 1；不要持续累加。 | 死亡、换出士兵 76、离开时应停止调整体型并重置。 |
| `Z` | `soldier_antman_stat_percent`，后续建议拆为 `soldier_antman_damage_percent` / `soldier_antman_move_speed_percent` | `76变大`、`76变小`、`76复活后回归` | 当前同时作为伤害百分比和移动速度百分比使用。`76变大` 降低 `Z` 后设置造成伤害，`76变小` 增加 `Z` 后设置移动速度，复活后回归持续设 100。 | 是，且建议拆分或改为由 `Y` 派生。 | 是，默认应为 100。 | 死亡、换英雄、离开时应重置伤害和速度。 |
| `Kiriko_Skill` | `kiriko_zone_active` | 变量表显式声明；`雾子法阵击倒` 中设真/设假 | 标记雾子法阵是否正在运行。当前没有作为条件使用，所以不能阻止重复触发。 | 是。 | 是，默认应为假。 | 死亡、换英雄、离开时应设假，并清理 `D` 中效果。 |
| `roadhog_hook_melee_boost_ready` | `roadhog_hook_melee_boost_ready` | `[roadhog] hook weakens target`、`[roadhog] consume boosted melee knockback` | 路霸钩中目标后，标记下一次近战附加击退。 | 否，已按命名规范。 | 是，默认假；钩中后设真，近战触发后设假。 | 死亡、换英雄、离开时应重置为假。 |
| `lucio_was_airborne` | `lucio_was_airborne` | `[lucio] remember airborne state`、`[lucio] landing bounce` | 记录卢西奥是否从空中落地，用于落地边沿触发，避免站地上连续弹人。 | 否，已按命名规范。 | 是，默认假；空中设真，落地触发后设假。 | 死亡、换英雄、离开时应重置为假。 |
| `lucio_landing_bounce_cooldown` | `lucio_landing_bounce_cooldown` | `[lucio] remember airborne state`、`[lucio] landing bounce` | 卢西奥落地冲击冷却，避免落地后被弹起再落地形成循环。 | 否。 | 是，默认假。 | 死亡、换英雄、离开时应重置为假。 |
| `sojourn_slide_bump_cooldown` | `sojourn_slide_bump_cooldown` | `[sojourn] power slide launches nearby players` | 索杰恩滑铲创飞的 0.8 秒冷却。 | 否。 | 是，默认假。 | 死亡、换英雄、离开时应重置为假。 |
| `illari_sunburn_cooldown` | `illari_sunburn_cooldown` | `[illari] apply sunburn on damage` | 伊拉锐晒黑触发冷却，约 6 秒。 | 否。 | 是，默认假。 | 死亡、换英雄、离开时应重置为假，并恢复目标状态。 |
| `illari_sunburn_active` | `illari_sunburn_active` | `[illari] apply sunburn on damage`、`[illari] pop sunburned target on damage` | 标记目标正在被晒黑，二次命中时可被向上小弹飞。 | 否。 | 是，默认假。 | 死亡、换英雄、离开时应恢复体型、速度、击退并设假。 |
| `illari_burst_cooldown` | `illari_burst_cooldown` | `[illari] outburst knocks nearby players` | 伊拉锐技能 2 爆发弹开冷却，约 5 秒。 | 否。 | 是，默认假。 | 死亡、换英雄、离开时应重置速度和冷却。 |
| `freya_launch_circle_cooldown` | `freya_launch_circle_cooldown` | `[freya] launch circle` | 芙蕾娅飞天法阵冷却，约 4 秒。 | 否。 | 是，默认假。 | 死亡、换英雄、离开时应重置并清理效果。 |
| `ana_sleep_fx_active` | `ana_sleep_fx_active` | `被睡冷却` | 防止沉睡期间重复创建睡眠标记效果。 | 否。 | 是，默认假。 | 不再沉睡、死亡、换英雄、离开时应设假。 |
| `ana_sleep_fx_handle` | `ana_sleep_fx_handle` | `被睡冷却` | 保存沉睡标记效果实体句柄，用于醒来后清理。 | 否。 | 是，默认空。 | 不再沉睡、死亡、换英雄、离开时应销毁并清空。 |
| `illari_sunburn_pop_cooldown` | `illari_sunburn_pop_cooldown` | `[illari] apply sunburn on damage`、`[illari] pop sunburned target on damage` | 晒黑目标被二次命中弹飞的小冷却，避免连续伤害一帧内反复弹飞。 | 否。 | 是，默认假。 | 晒黑结束、死亡、换英雄、离开时应设假。 |
| `freya_launch_circle_effects` | `freya_launch_circle_effects` | `[freya] launch circle` | 保存芙蕾娅法阵效果句柄数组，发射后清理。 | 否。 | 是，触发前设为空数组。 | 死亡、换英雄、离开时应清理已有实体并清空数组。 |
| `genji_dash_reset_cooldown` | `genji_dash_reset_cooldown` | `[genji] dash reset on kill with overheat`、`[genji] dash reset blocked while overheated`、`[genji] clear overheat on death`、`[genji] clear overheat after hero swap` | 源氏击杀刷新 Shift 的 8 秒内置冷却。冷却中再次击杀只提示，不刷新。 | 否。 | 是，默认假。 | 死亡、换英雄、离开时应设假。 |
| `genji_overheat_active` | `genji_overheat_active` | `[genji] dash reset on kill with overheat`、`[genji] clear overheat on death`、`[genji] clear overheat after hero swap` | 源氏击杀刷新后的 4 秒过热状态标记，用于清理受到伤害、移速和体型调整。 | 否。 | 是，默认假。 | 死亡、换英雄、离开时应恢复属性并设假。 |

## 建议新增变量

| 建议变量 | 类型 | 用途 | 备注 |
| --- | --- | --- | --- |
| `hud_created` | 全局布尔 | 防止 `规则提示` 重复创建 HUD | 需要确认中文 Workshop 或 OverPy 中全局变量命名方式。 |
| `host_dummy_spawn_locked` | 全局布尔或主机玩家变量 | 主机蹲下生成机器人防连发 | 可用按键边沿、冷却或等待松键实现；语法待确认。 |
| `hacked_lightshaft_effect` | 玩家实体句柄 | 保存每名玩家被入侵时创建的光柱 | 替代 `最后创建的实体`。 |
| `hacked_damage_active` | 玩家布尔或伤害句柄 | 避免被入侵持续伤害重复叠加 | Workshop 持续伤害是否可保存句柄需确认。 |
| `sleep_penalty_active` | 玩家布尔 | 避免沉睡惩罚重复播放效果 | 也可以改为状态变化触发，具体语法待确认。 |
| `soldier_resize_locked` | 玩家布尔 | 防止士兵 76 按住左/右键连续变大/变小 | 后续可以改为按键边沿或短冷却。 |

## TODO

- TODO：确认 `C` 的真实玩法语义是“复活次数计数”还是“一次复活甲已使用”。
- TODO：确认持续治疗、持续伤害、HUD 文本是否能安全保存并销毁句柄。
- TODO：确认换英雄事件或玩家离开事件在目标 Workshop/OverPy 版本中的写法，再补全生命周期规则。
- TODO：确认芙蕾娅“飞天”的准确 Workshop 检测方式；当前新版法阵临时使用跳跃键触发。
- TODO：确认路霸钩子、索杰恩滑铲、伊拉锐爆发在实战中是否分别对应 `技能1`、`技能1`、`技能2`。
- TODO：确认源氏 Shift 在 Workshop 中是否稳定对应 `技能1`；当前沿用 `Button.ABILITY_1` / `isUsingAbility1()`。
