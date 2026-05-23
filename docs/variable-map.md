# 变量映射

源文件：`src/main.opy`。当前项目是 **OverPy** 源码项目，`dist/current-workshop.zh-cn.copy-paste.txt` 为编译产物；不要同时手改 `dist/` 和 `src/`。

## 当前占用概览

- 显式 `playervar`：72 个。
- 仍使用的 Workshop 默认玩家变量：`A`、`B`、`C`、`D`、`Y`、`Z` 共 6 个。
- 当前实际使用玩家变量槽约 78 个。
- 第一轮前显式 `playervar` 为 109 个；两轮迁移后为 72 个。
- 已迁入 `player_state` 的旧独立变量共 38 个；新增数组变量 1 个，净减少 37 个显式玩家变量。
- `player_state` 当前定义 `0..95`，其中 `38..44` 为半藏新增技能状态索引，`45..49` 为奥丽莎强固裁决状态索引，`50..65` 为小美寒气掌控状态索引，`66..80` 为伊拉锐召唤太阳状态索引，`81..95` 为生命之梭园艺保龄球状态索引。
- 当前未发现 `disabled rule` / 禁用规则块；没有变量属于“只在禁用规则中使用”。

## 当前玩家变量列表

| 槽位 | 变量 | 类型 | 用途 | 使用规则/位置 | 迁移判断 |
| --- | --- | --- | --- | --- | --- |
| 0 | `A` | resource/state | 通用二段跳剩余次数，落地恢复为 1，跳跃消耗。 | 规则 1<br>二段跳<br>规则 3<br>规则 5 | 暂不迁移。 |
| 1 | `B` | active/flag | 通用二段跳许可边沿。 | 二段跳<br>规则 3<br>规则 5 | 暂不迁移。 |
| 2 | `C` | resource/state | 天使复活甲本条命状态，0 未初始化，1 可用，2 已破碎。 | [mercy] grant revive armor on spawn<br>[mercy] revive armor breaks on lethal damage<br>[mercy] clear revive armor state on death | 暂不迁移。 |
| 3 | `D` | effect handle array | 雾子法阵效果句柄数组。 | 雾子法阵击倒 | 暂不迁移。 |
| 4 | `winston_barrier_active` | active/flag | 温斯顿电蚊香屏障存在状态。 | [winston] electric barrier field<br>[winston] electric barrier zaps nearby players<br>[winston] clear electric barrier on death<br>[winston] clear electric barrier after hero swap | 后续可评估迁入数组。 |
| 5 | `winston_barrier_pos` | reference/position | 温斯顿电蚊香屏障位置。 | [winston] electric barrier field<br>[winston] electric barrier zaps nearby players<br>[winston] clear electric barrier on death<br>[winston] clear electric barrier after hero swap | 暂不迁移。 |
| 6 | `winston_barrier_fx` | effect/HUD handle | 温斯顿屏障效果句柄数组。 | [winston] electric barrier field<br>[winston] clear electric barrier on death<br>[winston] clear electric barrier after hero swap | 暂不迁移。 |
| 7 | `winston_zap_cd` | cooldown | 温斯顿屏障触电目标短冷却。 | [winston] electric barrier zaps nearby players | 后续可评估迁入数组。 |
| 8 | `winston_zap_fx` | effect/HUD handle | 温斯顿屏障触电光束句柄。 | [winston] electric barrier zaps nearby players | 暂不迁移。 |
| 24 | `Y` | resource/state | 士兵 76 蚁人体型档位。 | [state] initialize player state array<br>[soldier] initialize antman state<br>[soldier] grow one antman step<br>[soldier] shrink one antman step<br>[soldier] clear antman state on death<br>[soldier] clear antman state after hero swap<br>76长时间变大 | 暂不迁移。 |
| 25 | `Z` | resource/state | 士兵 76 派生属性百分比。 | [state] initialize player state array<br>[soldier] initialize antman state<br>[soldier] clear antman state on death<br>[soldier] clear antman state after hero swap | 暂不迁移。 |
| 26 | `Kiriko_Skill` | resource/state | 雾子法阵运行标记，目前只设真/假，不作为条件使用，疑似可进一步清理。 | 雾子法阵击倒 | 疑似旧逻辑残留，未删除。 |
| 27 | `player_state` | state array | 统一玩家状态数组，承载短状态、临时目标、HUD id、短冷却、资源状态，以及半藏箭雨令/多段跳状态。 | [state] initialize player state array<br>被睡冷却<br>[hud] open current hero ability guide on interact<br>[hud] close current hero ability guide on interact<br>[hud] unlock ability guide toggle<br>[hud] clear current hero ability guide on death<br>[bastion] create scrap hud<br>[bastion] gain scrap on damage<br>[bastion] activate scrap modification<br>[bastion] clear modification on death keep scrap<br>[bastion] clear scrap after hero swap<br>[ramattra] destroy pain core by melee<br>[reaper] disable secondary fire<br>[winston] disable secondary fire<br>[reaper and winston] restore secondary fire after hero swap<br>[zenyatta] elemental primary hit<br>[zenyatta] clear elemental state on death<br>[zenyatta] clear elemental state after hero swap<br>[baptiste] fake drug injection<br>[torbjorn] create parts hud<br>[torbjorn] gain parts on elimination<br>[torbjorn] activate illegal modification<br>[torbjorn] clear illegal modification on death<br>[torbjorn] clear illegal modification after hero swap<br>[roadhog] hook weakens target<br>[roadhog] consume boosted melee knockback<br>[lucio] remember airborne state<br>[lucio] landing bounce<br>[lucio] clear landing bounce cooldown<br>[sojourn] power slide launches nearby players<br>[brigitte] shield bash blink stun<br>[brigitte] shield counter melee attackers<br>[brigitte] clear shield bash blink on death<br>[brigitte] clear shield bash blink after hero swap<br>[brigitte] clear shield counter attacker state<br>[hanzo] arrow rain command<br>[hanzo] extra air jump<br>[hanzo] unlock extra air jump button<br>[hanzo] clear arrow rain and jumps<br>[illari] create/gain/summon/clear mini sun<br>[freya] launch circle | 新统一状态数组。 |
| 32 | `illari_sunburn_active` | active/flag | 旧版伊拉锐晒黑目标状态；召唤太阳重做后源码不再写入。 | 无运行时引用 | 疑似旧逻辑残留，未删除。 |
| 38 | `freya_launch_circle_effects` | effect/HUD handle | 芙蕾娅飞天法阵持续特效句柄数组。 | [freya] launch circle | 暂不迁移。 |
| 39 | `genji_dash_reset_cooldown` | cooldown | 旧源氏过热机制遗留，只在源氏清理规则中兜底设假，疑似可清理。 | [genji] clear blade window on death<br>[genji] clear blade window after hero swap | 疑似旧逻辑残留，未删除。 |
| 40 | `genji_overheat_active` | active/flag | 旧源氏过热机制遗留，只在源氏清理规则中兜底设假，疑似可清理。 | [genji] clear blade window on death<br>[genji] clear blade window after hero swap | 疑似旧逻辑残留，未删除。 |
| 41 | `baptiste_mirror_active` | active/flag | 巴蒂哈哈镜触发锁。 | [baptiste] mirror matrix trigger<br>[baptiste] clear mirror active on death<br>[baptiste] clear mirror active after hero swap | 后续可评估迁入数组。 |
| 42 | `baptiste_mirror_roll` | roll | 巴蒂哈哈镜随机结果。 | [baptiste] mirror matrix trigger<br>[baptiste] mirror giant effect<br>[baptiste] mirror tiny effect<br>[baptiste] mirror glass effect<br>[baptiste] mirror iron effect | 后续可评估迁入数组。 |
| 43 | `baptiste_mirror_target_active` | active/flag | 目标正在承受哈哈镜效果。 | [baptiste] mirror matrix trigger<br>[baptiste] mirror giant effect<br>[baptiste] mirror tiny effect<br>[baptiste] mirror glass effect<br>[baptiste] mirror iron effect | 后续可评估迁入数组。 |
| 45 | `baptiste_drug_target_active` | active/flag | 目标正在承受假药副作用。 | [baptiste] fake drug injection | 后续可评估迁入数组。 |
| 46 | `baptiste_fake_drug_roll` | roll | 假药副作用随机结果。 | [baptiste] fake drug injection | 后续可评估迁入数组。 |
| 47 | `genji_ult_window_active` | active/flag | 源氏疯狗龙刃窗口状态。 | [genji] lock swift strike outside blade window<br>[genji] start blade window on final blow<br>[genji] refresh blade window on final blow<br>[genji] blade damage cap during window<br>[genji] clear blade window on death<br>[genji] clear blade window after hero swap<br>[genji] clear blade window after leaving alive window | 后续可评估迁入数组。 |
| 48 | `genji_ult_window_timer` | timer | 源氏疯狗窗口倒计时。 | [genji] start blade window on final blow<br>[genji] refresh blade window on final blow<br>[genji] clear blade window on death<br>[genji] clear blade window after hero swap<br>[genji] clear blade window after leaving alive window | 后续可评估迁入数组。 |
| 49 | `genji_ult_window_token` | token | 源氏窗口版本 token。 | [genji] start blade window on final blow<br>[genji] refresh blade window on final blow<br>[genji] clear blade window on death<br>[genji] clear blade window after hero swap<br>[genji] clear blade window after leaving alive window | 暂不迁移。 |
| 57 | `genji_ult_window_hud_created` | active/flag | 源氏疯狗窗口 HUD 创建标记。 | [genji] start blade window on final blow<br>[genji] clear blade window on death<br>[genji] clear blade window after hero swap<br>[genji] clear blade window after leaving alive window | 后续可评估迁入数组。 |
| 58 | `genji_ult_window_hud_id` | effect/HUD handle | 源氏疯狗窗口 HUD id。 | [genji] start blade window on final blow<br>[genji] clear blade window on death<br>[genji] clear blade window after hero swap<br>[genji] clear blade window after leaving alive window | 后续可评估迁入数组。 |
| 61 | `soldier_resize_cooldown` | cooldown | 士兵 76 体型变档短冷却。 | [soldier] initialize antman state<br>[soldier] grow one antman step<br>[soldier] shrink one antman step<br>[soldier] clear antman state on death<br>[soldier] clear antman state after hero swap | 后续可评估迁入数组。 |
| 63 | `tracer_auto_recall_state` | resource/state | 猎空自动回溯本条命状态。 | [tracer] grant auto recall on spawn<br>[tracer] auto recall on lethal damage<br>[tracer] clear auto recall on death<br>[tracer] clear auto recall after hero swap | 暂不迁移。 |
| 64 | `tracer_debt_active` | active/flag | 猎空时间债务状态。 | [tracer] grant auto recall on spawn<br>[tracer] auto recall on lethal damage<br>[tracer] clear auto recall on death<br>[tracer] clear auto recall after hero swap | 后续可评估迁入数组。 |
| 75 | `winston_grapple_active` | active/flag | 温斯顿抱摔流程状态。 | [winston] grapple slam on jump contact<br>[winston] clear grapple on death<br>[winston] clear grapple after hero swap<br>[winston] clear grappled target on death or hero swap | 后续可评估迁入数组。 |
| 76 | `winston_grapple_target` | reference/position | 温斯顿抱摔目标。 | [winston] grapple slam on jump contact<br>[winston] clear grapple on death<br>[winston] clear grapple after hero swap<br>[winston] clear grappled target on death or hero swap | 暂不迁移。 |
| 77 | `winston_grapple_lock` | active/flag | 温斯顿抱摔一次跳跃触发锁。 | [winston] grapple slam on jump contact<br>[winston] clear grapple on death<br>[winston] clear grapple after hero swap<br>[winston] clear grappled target on death or hero swap | 暂不迁移。 |
| 78 | `winston_grapple_carrier` | resource/state | 被抱摔目标反向记录抓取者。 | [winston] grapple slam on jump contact<br>[winston] clear grapple on death<br>[winston] clear grapple after hero swap<br>[winston] clear grappled target on death or hero swap | 暂不迁移。 |
| 79 | `winston_grapple_original_hero` | reference/position | 被抱摔目标原英雄，用于换英雄清理。 | [winston] grapple slam on jump contact<br>[winston] clear grapple on death<br>[winston] clear grapple after hero swap<br>[winston] clear grappled target on death or hero swap | 暂不迁移。 |
| 82 | `ramattra_ow_stacks` | resource/state | 拉玛刹超重层数。 | [ramattra] apply overweight on damage<br>[ramattra] overweight stack window expires<br>[ramattra] trigger gravity suppression at three stacks<br>[ramattra] pain punch on melee<br>[ramattra] clear overweight after target death or hero swap | 暂不迁移。 |
| 83 | `ramattra_ow_window_active` | active/flag | 拉玛刹超重叠层窗口计时锁。 | [ramattra] overweight stack window expires<br>[ramattra] trigger gravity suppression at three stacks<br>[ramattra] clear overweight after target death or hero swap | 后续可评估迁入数组。 |
| 84 | `ramattra_ow_hit_cooldown` | cooldown | 拉玛刹超重施加短冷却。 | [ramattra] apply overweight on damage<br>[ramattra] clear overweight after target death or hero swap | 后续可评估迁入数组。 |
| 85 | `ramattra_ow_compress_cooldown` | cooldown | 拉玛刹重力压制短冷却。 | [ramattra] trigger gravity suppression at three stacks<br>[ramattra] clear overweight after target death or hero swap | 后续可评估迁入数组。 |
| 86 | `ramattra_ow_active` | active/flag | 目标当前处于超重临时属性状态。 | [ramattra] apply overweight on damage<br>[ramattra] overweight temporary slow cleanup<br>[ramattra] overweight stack window expires<br>[ramattra] trigger gravity suppression at three stacks<br>[ramattra] pain punch on melee<br>[ramattra] clear overweight after target death or hero swap | 后续可评估迁入数组。 |
| 87 | `ramattra_ow_original_hero` | reference/position | 超重目标原英雄，用于换英雄清理。 | [ramattra] apply overweight on damage<br>[ramattra] pain punch on melee<br>[ramattra] clear overweight after target death or hero swap | 暂不迁移。 |
| 88 | `ramattra_pain` | resource/state | 拉玛刹痛苦值。 | [ramattra] create pain hud<br>[ramattra] apply overweight on damage<br>[ramattra] pain punch on melee<br>[ramattra] gain pain near core<br>[ramattra] clear pain gravity on death<br>[ramattra] clear pain gravity after hero swap | 暂不迁移。 |
| 89 | `ramattra_pain_ready` | active/flag | 拉玛刹痛苦满值提示/就绪标记。 | [ramattra] apply overweight on damage<br>[ramattra] pain punch on melee<br>[ramattra] gain pain near core<br>[ramattra] clear pain gravity on death<br>[ramattra] clear pain gravity after hero swap | 后续可评估迁入数组。 |
| 90 | `ramattra_pain_hud_created` | active/flag | 拉玛刹痛苦 HUD 创建标记。 | [ramattra] create pain hud<br>[ramattra] clear pain gravity on death<br>[ramattra] clear pain gravity after hero swap | 后续可评估迁入数组。 |
| 91 | `ramattra_pain_hud_id` | effect/HUD handle | 拉玛刹痛苦 HUD id。 | [ramattra] create pain hud<br>[ramattra] clear pain gravity on death<br>[ramattra] clear pain gravity after hero swap | 后续可评估迁入数组。 |
| 92 | `ramattra_pain_punch_cooldown` | cooldown | 拉玛刹痛苦拳短冷却。 | [ramattra] pain punch on melee<br>[ramattra] clear pain gravity on death<br>[ramattra] clear pain gravity after hero swap | 后续可评估迁入数组。 |
| 93 | `ramattra_core_active` | active/flag | 拉玛刹痛苦核心存在状态。 | [ramattra] place pain core<br>[ramattra] gain pain near core<br>[ramattra] destroy pain core by melee<br>[ramattra] clear pain gravity on death<br>[ramattra] clear pain gravity after hero swap | 后续可评估迁入数组。 |
| 94 | `ramattra_core_position` | reference/position | 拉玛刹痛苦核心位置。 | [ramattra] place pain core<br>[ramattra] gain pain near core<br>[ramattra] destroy pain core by melee<br>[ramattra] clear pain gravity on death<br>[ramattra] clear pain gravity after hero swap | 暂不迁移。 |
| 95 | `ramattra_core_effects` | effect/HUD handle | 拉玛刹痛苦核心效果句柄数组。 | [ramattra] place pain core<br>[ramattra] destroy pain core by melee<br>[ramattra] clear pain gravity on death<br>[ramattra] clear pain gravity after hero swap | 暂不迁移。 |
| 96 | `ramattra_core_cooldown` | cooldown | 拉玛刹痛苦核心冷却。 | [ramattra] place pain core<br>[ramattra] clear pain gravity on death<br>[ramattra] clear pain gravity after hero swap | 后续可评估迁入数组。 |
| 98 | `ramattra_ow_source` | reference/position | 最近一次超重来源拉玛刹。 | [ramattra] apply overweight on damage<br>[ramattra] trigger gravity suppression at three stacks<br>[ramattra] pain punch on melee<br>[ramattra] clear overweight after target death or hero swap | 暂不迁移。 |
| 99 | `sigma_black_hole_active` | active/flag | 西格玛小黑洞运行状态。 | [sigma] release small black hole<br>[sigma] clear small black hole on death<br>[sigma] clear small black hole after hero swap | 后续可评估迁入数组。 |
| 100 | `sigma_black_hole_cooldown` | cooldown | 西格玛小黑洞冷却。 | [sigma] release small black hole<br>[sigma] clear small black hole on death<br>[sigma] clear small black hole after hero swap | 后续可评估迁入数组。 |
| 101 | `sigma_black_hole_position` | reference/position | 西格玛小黑洞位置。 | [sigma] release small black hole<br>[sigma] clear small black hole on death<br>[sigma] clear small black hole after hero swap | 暂不迁移。 |
| 102 | `sigma_black_hole_effects` | effect/HUD handle | 西格玛小黑洞持续效果句柄数组。 | [sigma] release small black hole<br>[sigma] clear small black hole on death<br>[sigma] clear small black hole after hero swap | 暂不迁移。 |
| 103 | `sigma_black_hole_tick` | resource/state | 西格玛小黑洞循环计数。 | [sigma] release small black hole<br>[sigma] clear small black hole on death<br>[sigma] clear small black hole after hero swap | 暂不迁移。 |
| 104 | `sigma_black_hole_damage_taken` | resource/state | 目标在当前小黑洞中累计受伤。 | [sigma] release small black hole<br>[sigma] clear small black hole on death<br>[sigma] clear small black hole after hero swap | 暂不迁移。 |
| 105 | `reaper_anchor_active` | active/flag | 死神亡魂锚点存在状态。 | [reaper] leave soul anchor on final blow<br>[reaper] soul anchor timer<br>[reaper] soul hunt to anchor<br>[reaper] clear soul hunt on death<br>[reaper] clear soul hunt after hero swap | 后续可评估迁入数组。 |
| 106 | `reaper_anchor_pos` | reference/position | 死神亡魂锚点位置。 | [reaper] leave soul anchor on final blow<br>[reaper] soul anchor timer<br>[reaper] soul hunt to anchor<br>[reaper] clear soul hunt on death<br>[reaper] clear soul hunt after hero swap | 暂不迁移。 |
| 107 | `reaper_anchor_fx` | effect/HUD handle | 死神亡魂锚点效果句柄数组。 | [reaper] leave soul anchor on final blow<br>[reaper] soul anchor timer<br>[reaper] soul hunt to anchor<br>[reaper] clear soul hunt on death<br>[reaper] clear soul hunt after hero swap | 暂不迁移。 |
| 108 | `reaper_hunt_cd` | cooldown | 死神借魂追猎冷却。 | [reaper] soul hunt to anchor<br>[reaper] clear soul hunt on death<br>[reaper] clear soul hunt after hero swap | 后续可评估迁入数组。 |
| 109 | `reaper_anchor_timer` | timer | 死神亡魂锚点剩余时间。 | [reaper] leave soul anchor on final blow<br>[reaper] soul anchor timer<br>[reaper] soul hunt to anchor<br>[reaper] clear soul hunt on death<br>[reaper] clear soul hunt after hero swap | 后续可评估迁入数组。 |
| 110 | `reaper_anchor_timer_on` | timer | 死神亡魂锚点倒计时线程锁。 | [reaper] soul anchor timer<br>[reaper] soul hunt to anchor<br>[reaper] clear soul hunt on death<br>[reaper] clear soul hunt after hero swap | 后续可评估迁入数组。 |
| 111 | `reaper_hunt_active` | active/flag | 死神追猎强化/猎场状态。 | [reaper] soul hunt to anchor<br>[reaper] clear soul hunt on death<br>[reaper] clear soul hunt after hero swap | 后续可评估迁入数组。 |
| 112 | `reaper_hunt_fx` | effect/HUD handle | 死神追猎猎场效果句柄数组。 | [reaper] soul hunt to anchor<br>[reaper] clear soul hunt on death<br>[reaper] clear soul hunt after hero swap | 暂不迁移。 |
| 114 | `sigma_grasp_was_active` | active/flag | 西格玛动能俘获边沿记录。 | [sigma] clear small black hole on death<br>[sigma] clear small black hole after hero swap<br>[sigma] remember kinetic grasp active<br>[sigma] kinetic grasp release gravity burst | 后续可评估迁入数组。 |
| 115 | `sigma_burst_cd` | cooldown | 西格玛重力震爆冷却。 | [sigma] clear small black hole on death<br>[sigma] clear small black hole after hero swap<br>[sigma] kinetic grasp release gravity burst | 后续可评估迁入数组。 |
| 116 | `sigma_burst_pos` | reference/position | 西格玛重力震爆位置。 | [sigma] clear small black hole on death<br>[sigma] clear small black hole after hero swap<br>[sigma] kinetic grasp release gravity burst | 暂不迁移。 |
| 117 | `zen_element` | resource/state | 禅雅塔当前元素。 | [zenyatta] initialize element<br>[zenyatta] cycle element on reload<br>[zenyatta] elemental primary hit<br>[zenyatta] elemental secondary skill<br>[zenyatta] clear elemental state on death<br>[zenyatta] clear elemental state after hero swap | 暂不迁移。 |
| 118 | `zen_reload_lock` | active/flag | 禅雅塔换弹切元素按键锁。 | [zenyatta] cycle element on reload<br>[zenyatta] clear elemental state on death<br>[zenyatta] clear elemental state after hero swap | 暂不迁移。 |
| 119 | `zen_hit_cd` | cooldown | 禅雅塔普攻元素效果节流。 | [zenyatta] elemental primary hit<br>[zenyatta] clear elemental state on death<br>[zenyatta] clear elemental state after hero swap | 后续可评估迁入数组。 |
| 120 | `zen_right_cd` | cooldown | 禅雅塔右键元素技能冷却。 | [zenyatta] elemental primary hit<br>[zenyatta] elemental secondary skill<br>[zenyatta] clear elemental state on death<br>[zenyatta] clear elemental state after hero swap | 后续可评估迁入数组。 |
| 121 | `zen_ult_cd` | cooldown | 禅雅塔圣光大招表现冷却。 | [zenyatta] elemental primary hit<br>[zenyatta] holy ult warning and strike<br>[zenyatta] clear elemental state on death<br>[zenyatta] clear elemental state after hero swap | 后续可评估迁入数组。 |
| 122 | `zen_skill_pos` | reference/position | 禅雅塔元素技能位置。 | [zenyatta] elemental secondary skill<br>[zenyatta] holy ult warning and strike<br>[zenyatta] clear elemental state on death<br>[zenyatta] clear elemental state after hero swap | 暂不迁移。 |
| 123 | `zen_fx` | effect/HUD handle | 禅雅塔磁暴/圣光效果句柄数组。 | [zenyatta] elemental secondary skill<br>[zenyatta] holy ult warning and strike<br>[zenyatta] clear elemental state on death<br>[zenyatta] clear elemental state after hero swap | 暂不迁移。 |
| 124 | `zen_slow_active` | active/flag | 禅雅塔冰元素减速目标状态。 | [zenyatta] elemental primary hit<br>[zenyatta] restore frost slow<br>[zenyatta] elemental secondary skill<br>[zenyatta] clear slow on target death or hero swap | 后续可评估迁入数组。 |
| 125 | `zen_slow_timer` | timer | 禅雅塔冰元素减速恢复线程锁。 | [zenyatta] elemental primary hit<br>[zenyatta] restore frost slow<br>[zenyatta] elemental secondary skill<br>[zenyatta] clear slow on target death or hero swap | 后续可评估迁入数组。 |
| 126 | `zen_slow_hero` | reference/position | 禅雅塔冰元素目标原英雄。 | [zenyatta] elemental primary hit<br>[zenyatta] restore frost slow<br>[zenyatta] elemental secondary skill<br>[zenyatta] clear slow on target death or hero swap | 暂不迁移。 |

## 已迁移进 `player_state` 的旧变量

| 旧槽位 | 旧变量 | 新索引 | 用途 |
| --- | --- | --- | --- |
| 27 | `roadhog_hook_melee_boost_ready` | `player_state[10]` | 路霸钩中后的下一次近战强化标记 |
| 28 | `lucio_was_airborne` | `player_state[11]` | 卢西奥落地边沿状态 |
| 29 | `lucio_landing_bounce_cooldown` | `player_state[12]` | 卢西奥落地冲击冷却/防连锁 |
| 30 | `sojourn_slide_bump_cooldown` | `player_state[13]` | 索杰恩滑铲创飞冷却 |
| 31 | `illari_sunburn_cooldown` | `player_state[14]` | 旧版伊拉锐晒黑触发冷却，当前废弃 |
| 33 | `illari_burst_cooldown` | `player_state[15]` | 旧版伊拉锐爆发弹开冷却，当前废弃 |
| 34 | `freya_launch_circle_cooldown` | `player_state[16]` | 芙蕾娅飞天法阵冷却 |
| 35 | `ana_sleep_fx_active` | `player_state[17]` | 安娜睡眠标记已创建标记 |
| 36 | `ana_sleep_fx_handle` | `player_state[18]` | 安娜睡眠标记效果句柄 |
| 37 | `illari_sunburn_pop_cooldown` | `player_state[19]` | 旧版伊拉锐晒黑二次弹飞短冷却，当前废弃 |
| 44 | `baptiste_fake_drug_cooldown` | `player_state[20]` | 巴蒂假药注射触发冷却 |
| 59 | `ability_guide_hud_created` | `player_state[0]` | 技能说明 HUD 创建标记 |
| 60 | `ability_guide_hud_id` | `player_state[1]` | 技能说明 HUD id |
| 62 | `ability_guide_toggle_locked` | `player_state[2]` | 技能说明互动键边沿锁 |
| 80 | `brigitte_blink_cooldown` | `player_state[3]` | 布丽吉塔盾击瞬移冷却 |
| 81 | `brigitte_blink_target` | `player_state[4]` | 布丽吉塔盾击瞬移临时目标 |
| 97 | `ramattra_core_destroy_target` | `player_state[8]` | 摧毁痛苦核心的临时目标 |
| 113 | `disabled_secondary_fire` | `player_state[9]` | 死神/温斯顿右键禁用状态 |
| 127 | `zen_chain_target` | `player_state[7]` | 禅雅塔雷元素普攻临时连锁目标 |
| 9 | `brigitte_counter_cd` | `player_state[5]` | 布丽吉塔盾反攻击者短冷却 |
| 10 | `brigitte_counter_target` | `player_state[6]` | 布丽吉塔盾反临时目标 |
| 50 | `torb_parts` | `player_state[21]` | 托比昂零件数量 |
| 51 | `torb_mod_ready` | `player_state[22]` | 托比昂非法改装就绪标记 |
| 52 | `torb_mod_active` | `player_state[23]` | 托比昂非法改装运行状态 |
| 53 | `torb_mod_roll` | `player_state[24]` | 托比昂非法改装随机结果 |
| 54 | `torb_mod_cooldown` | `player_state[25]` | 托比昂非法改装触发冷却 |
| 55 | `torb_parts_hud_created` | `player_state[26]` | 托比昂零件 HUD 创建标记 |
| 56 | `torb_parts_hud_id` | `player_state[27]` | 托比昂零件 HUD id |
| 71 | `torb_mod_status_hud_created` | `player_state[28]` | 托比昂改装状态 HUD 创建标记 |
| 72 | `torb_mod_status_hud_id` | `player_state[29]` | 托比昂改装状态 HUD id |
| 65 | `bastion_scrap` | `player_state[30]` | 堡垒废铁数量，死亡保留、换英雄清零 |
| 66 | `bastion_scrap_gain_cooldown` | `player_state[31]` | 堡垒废铁获取节流 |
| 67 | `bastion_mod_active` | `player_state[32]` | 堡垒非法改装运行状态 |
| 68 | `bastion_mod_roll` | `player_state[33]` | 堡垒非法改装随机结果 |
| 69 | `bastion_scrap_hud_created` | `player_state[34]` | 堡垒废铁 HUD 创建标记 |
| 70 | `bastion_scrap_hud_id` | `player_state[35]` | 堡垒废铁 HUD id |
| 73 | `bastion_mod_status_hud_created` | `player_state[36]` | 堡垒改装状态 HUD 创建标记 |
| 74 | `bastion_mod_status_hud_id` | `player_state[37]` | 堡垒改装状态 HUD id |

## 直接新增在 `player_state` 的变量

| 新索引 | 名称 | 用途 |
| --- | --- | --- |
| `player_state[38]` | `hanzo_arrow_rain_active` | 半藏箭雨令运行/冷却锁 |
| `player_state[39]` | `hanzo_arrow_rain_pos` | 半藏箭雨令中心位置 |
| `player_state[40]` | `hanzo_arrow_rain_fx` | 半藏箭雨令预警法阵和光柱效果句柄数组 |
| `player_state[41]` | `hanzo_arrow_rain_targets` | 半藏箭雨每次 tick 的临时目标数组 |
| `player_state[42]` | `hanzo_extra_jump_count` | 半藏额外踏空跳计数 |
| `player_state[43]` | `hanzo_extra_jump_lock` | 半藏额外踏空跳按键边沿锁 |
| `player_state[44]` | `hanzo_arrow_rain_tick` | 半藏箭雨令 tick 计数 |
| `player_state[45]` | `orisa_judgment_energy` | 奥丽莎自身裁决能量层数，0 到 7；每层 +2% 移速，最高 +14% |
| `player_state[46]` | `orisa_judgment_gain_cd` | 奥丽莎裁决能量获取节流 |
| `player_state[47]` | `orisa_judgment_hud_created` | 奥丽莎裁决能量 HUD 创建标记 |
| `player_state[48]` | `orisa_judgment_hud_id` | 奥丽莎裁决能量 HUD id |
| `player_state[49]` | `orisa_judgment_spent` | 奥丽莎本次标枪释放裁决消耗层数缓存 |
| `player_state[50]` | `mei_frost_stacks` | 目标当前寒气层数，0 到 3 |
| `player_state[51]` | `mei_frost_token` | 寒气增加版本号，用于重置衰减等待 |
| `player_state[52]` | `mei_frost_decay_active` | 寒气衰减线程锁 |
| `player_state[53]` | `mei_frost_slow_active` | 小美寒气减速恢复流程状态 |
| `player_state[54]` | `mei_frost_slow_token` | 减速恢复版本号，避免旧恢复覆盖新减速 |
| `player_state[55]` | `mei_frost_original_hero` | 目标获得寒气时的英雄，用于换英雄清理 |
| `player_state[56]` | `mei_aura_active` | 小美技能 1 寒气圈运行状态 |
| `player_state[57]` | `mei_aura_fx` | 小美寒气圈持续特效句柄数组 |
| `player_state[58]` | `mei_iceburst_cd` | 小美技能 2 冰爆内置冷却锁 |
| `player_state[59]` | `mei_melee_hit_cd` | 近战叠寒气短节流，防同一次近战重复加层 |
| `player_state[60]` | `mei_frost_decay_snapshot` | 衰减线程记录的寒气 token 快照 |
| `player_state[61]` | `mei_aura_stack_cd` | 寒气圈对同一目标的 2 秒叠层节流 |
| `player_state[62]` | `mei_iceburst_pos` | 小美本次冰爆陷阱位置 |
| `player_state[63]` | `mei_iceburst_fx` | 小美冰爆预警特效句柄数组 |
| `player_state[64]` | `mei_frost_slow_snapshot` | 减速恢复线程记录的 slow token 快照 |
| `player_state[65]` | `mei_frost_source` | 最近给目标叠加寒气的小美玩家引用，用于来源死亡/换英雄清理 |
| `player_state[66]` | `illari_solar_power` | 伊拉锐太阳之力层数，0 到 3 |
| `player_state[67]` | `illari_solar_hud_created` | 伊拉锐太阳之力 HUD 创建标记 |
| `player_state[68]` | `illari_solar_hud_id` | 伊拉锐太阳之力 HUD id |
| `player_state[69]` | `illari_last_melee_target` | 伊拉锐最近一次近战命中的目标 |
| `player_state[70]` | `illari_sun_active` | 伊拉锐小太阳存在状态 |
| `player_state[71]` | `illari_sun_pos` | 伊拉锐小太阳空中位置 |
| `player_state[72]` | `illari_sun_fx` | 伊拉锐太阳本体、光环、光柱和蓄力特效句柄数组 |
| `player_state[73]` | `illari_sun_target` | 伊拉锐小太阳当前点名目标 |
| `player_state[74]` | `illari_sun_mark_fx` | 点名目标光柱、光环和光束句柄数组 |
| `player_state[75]` | `illari_sun_tick` | 小太阳 0.5 秒灼烧 tick 计数 |
| `player_state[76]` | `illari_sun_casting` | 右键召唤蓄力锁 |
| `player_state[77]` | `illari_sun_target_hero` | 点名目标当时英雄，用于换英雄清理 |
| `player_state[78]` | `illari_marked_by_sun` | 目标被哪名伊拉锐的小太阳点名 |
| `player_state[79]` | `illari_reserved` | 预留占位，当前未使用 |
| `player_state[80]` | `illari_melee_gain_cd` | 近战获得太阳之力短节流 |
| `player_state[81]` | `lifeweaver_ball_created` | 生命之梭园艺球是否已创建 |
| `player_state[82]` | `lifeweaver_ball_pos` | 园艺球当前位置 |
| `player_state[83]` | `lifeweaver_ball_fx` | 园艺球废铁球弹道效果、光环、弱化光柱效果句柄数组 |
| `player_state[84]` | `lifeweaver_ball_state` | 园艺球状态：0 跟随，1 击出，2 拉回，3 大招 |
| `player_state[85]` | `lifeweaver_ball_dir` | 园艺球移动方向或临时拉回方向 |
| `player_state[86]` | `lifeweaver_ball_tick` | 园艺球击出移动 tick 计数 |
| `player_state[87]` | `lifeweaver_hit_lock` | 近战击球流程锁 |
| `player_state[88]` | `lifeweaver_pull_lock` | 技能 2 拉回流程锁 |
| `player_state[89]` | `lifeweaver_ult_lock` | 大招天降花盆流程锁 |
| `player_state[90]` | `lifeweaver_ult_pos` | 天降花盆预警/砸地位置 |
| `player_state[91]` | `lifeweaver_ult_fx` | 天降花盆预警效果句柄数组 |
| `player_state[92]` | `lifeweaver_pull_beam` | 拉回园艺球光束句柄 |
| `player_state[93]` | `lifeweaver_ball_dummy` | 承载园艺球实体物理的隐藏生命之梭 dummy |
| `player_state[94]` | `lifeweaver_ball_spin_tick` | 园艺球飞行视觉刷新朝向节拍 |
| `player_state[95]` | `lifeweaver_ball_hit_cd` | 被园艺球命中的目标短防重复判定 |

## 疑似旧逻辑残留但未删除

| 变量 | 原因 | 处理 |
| --- | --- | --- |
| `Kiriko_Skill` | 在雾子法阵中只设真/假，当前没有作为触发条件防重入。 | 保留，避免改变旧技能流程；后续可迁入数组或直接删。 |
| `genji_dash_reset_cooldown` | 当前只在源氏清理规则中设假，没有触发条件读取。 | 保留为疑似旧过热逻辑残留。 |
| `genji_overheat_active` | 当前只在源氏清理规则中设假，没有触发条件读取。 | 保留为疑似旧过热逻辑残留。 |

## 可继续数组化的候选

- 源氏疯狗窗口：`genji_ult_window_*` 可以整组迁移，但涉及 HUD、计时、死亡/换英雄清理，暂缓。
- 禅雅塔：`zen_*` 中部分 cooldown/临时位置可迁移，但右键和大招共享持续特效数组，本轮只迁移了临时连锁目标。
- 特效句柄数组：`freya_launch_circle_effects`、`ramattra_core_effects`、`sigma_black_hole_effects`、`reaper_*_fx`、`zen_fx`、`winston_barrier_fx` 可逐步迁到专用 `player_effects` 数组；本轮为降低风险未新增第二个数组。

## 暂时不能安全迁移

- 温斯顿抱摔：`winston_grapple_*` 跨抓取者和目标互相引用，清理路径多，暂缓。
- 拉玛刹超重：`ramattra_ow_*` 跨攻击者和目标，涉及速度/引力恢复，暂缓。
- 西格玛小黑洞：`sigma_black_hole_*` 涉及位置、持续效果、循环 tick 和目标累计伤害，暂缓。
- 死神亡魂锚点/追猎：`reaper_*` 涉及持续锚点、计时和猎场效果，暂缓。
- 士兵 76：`Y`、`Z` 是旧默认变量并与体型恢复强相关，本轮不动。
