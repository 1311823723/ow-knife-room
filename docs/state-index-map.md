# 玩家状态数组索引表

源文件：`src/main.opy`。`player_state` 是新增的统一玩家状态数组，当前占用玩家变量槽 27。以后新增英雄技能优先评估写入这里或新建专用数组，不再随意追加独立 `playervar`。

初始化规则：`[state] initialize player state array` 会在 `len(eventPlayer.player_state) < 50` 时写入默认数组。

| Index | 名称 | 所属 | 含义 | 默认值 | 清理时机 | 是否可复用 | 相关规则/文件 |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 0 | `ability_guide_hud_created` | 通用 HUD | 技能说明 HUD 是否已创建 | `false` | 打开技能说明设 true；关闭/死亡设 false | 可复用，但仅限技能说明系统 | [hud] open/close/clear current hero ability guide |
| 1 | `ability_guide_hud_id` | 通用 HUD | 技能说明 HUD 文本 ID | `null` | 创建后写入；关闭/死亡销毁后清空 | 可复用，但必须先 destroyHudText | [hud] open/close/clear current hero ability guide |
| 2 | `ability_guide_toggle_locked` | 通用 HUD | 互动键开关技能说明的边沿锁 | `false` | 按下互动键设 true；松开或死亡设 false | 可复用为通用按键锁，但不要和 HUD 同时共享 | [hud] open/close/unlock/clear current hero ability guide |
| 3 | `brigitte_blink_cooldown` | 布丽吉塔 | 盾击瞬移成功后的冷却锁 | `false` | 触发后设 true；4 秒后、死亡或换英雄设 false | 英雄槽，可换英雄清理后复用 | [brigitte] shield bash blink stun/clear |
| 4 | `brigitte_blink_target` | 布丽吉塔 | 盾击瞬移本次目标 | `null` | 触发时写入；流程结束、死亡或换英雄清空 | 临时引用槽，可复用 | [brigitte] shield bash blink stun/clear |
| 5 | `brigitte_counter_cd` | 布丽吉塔 | 攻击者被盾反后的短冷却 | `false` | 盾反触发时设 true；1 秒后或攻击者死亡设 false | 短 cooldown 槽，可复用 | [brigitte] shield counter melee attackers/clear |
| 6 | `brigitte_counter_target` | 布丽吉塔 | 盾反本次布丽吉塔目标 | `null` | 触发时写入；施加眩晕和提示后清空；攻击者死亡兜底清空 | 临时引用槽，可复用 | [brigitte] shield counter melee attackers/clear |
| 7 | `zen_chain_target` | 禅雅塔 | 雷元素普攻临时连锁目标 | `null` | 连锁结算时写入；伤害和特效后立即清空；死亡/换英雄兜底清空 | 临时引用槽，可复用 | [zenyatta] elemental primary hit/clear |
| 8 | `ramattra_core_destroy_target` | 拉玛刹/通用 | 摧毁痛苦核心时临时保存核心所属拉玛刹 | `null` | 近战摧毁核心时写入；核心状态清理后立即清空 | 临时引用槽，可复用 | [ramattra] destroy pain core by melee |
| 9 | `disabled_secondary_fire` | 通用按钮控制 | 死神/温斯顿右键是否已禁用 | `false` | 进入死神或温斯顿设 true；换到其他英雄恢复右键后设 false | 通用按钮状态槽，可复用前需确认英雄互斥 | [reaper]/[winston] disable secondary fire, restore secondary fire |
| 10 | `roadhog_hook_melee_boost_ready` | 路霸 | 钩中目标后下一次近战强化标记 | `false` | 钩中设 true；强化近战触发设 false | 英雄槽，可换英雄清理后复用 | [roadhog] hook weakens target/consume boosted melee knockback |
| 11 | `lucio_was_airborne` | 卢西奥 | 记录卢西奥曾经离地，用于落地边沿 | `false` | 空中且非冷却设 true；落地冲击触发设 false | 英雄槽，可复用 | [lucio] remember airborne state/landing bounce |
| 12 | `lucio_landing_bounce_cooldown` | 卢西奥/受影响玩家 | 落地冲击冷却和防连锁标记 | `false` | 落地冲击触发者及范围内玩家设 true；1 秒后设 false | 短 cooldown 槽，注意可被其他卢西奥写入 | [lucio] landing bounce/clear landing bounce cooldown |
| 13 | `sojourn_slide_bump_cooldown` | 索杰恩 | 滑铲创飞短冷却 | `false` | 滑铲触发设 true；0.8 秒后设 false | 英雄短 cooldown 槽，可复用 | [sojourn] power slide launches nearby players |
| 14 | `illari_sunburn_cooldown` | 伊拉锐 | 晒黑触发冷却 | `false` | 晒黑成功设 true；晒黑 4 秒加 2 秒后设 false | 英雄 cooldown 槽，可复用 | [illari] apply sunburn on damage |
| 15 | `illari_burst_cooldown` | 伊拉锐 | 爆发弹开冷却 | `false` | 技能 2 触发设 true；速度流程结束后设 false | 英雄 cooldown 槽，可复用 | [illari] outburst knocks nearby players |
| 16 | `freya_launch_circle_cooldown` | 芙蕾娅 | 飞天法阵冷却 | `false` | 技能 2 触发设 true；法阵和冷却结束后设 false | 英雄 cooldown 槽，可复用 | [freya] launch circle |
| 17 | `ana_sleep_fx_active` | 安娜/被睡目标 | 睡眠标记效果是否已创建 | `false` | 沉睡时设 true；醒来后设 false | 状态槽，可复用但要保留醒来清理 | 被睡冷却 |
| 18 | `ana_sleep_fx_handle` | 安娜/被睡目标 | 睡眠标记效果句柄 | `null` | 创建效果后写入；醒来后 destroyEffect 并清空 | 效果句柄槽，可复用前必须销毁 | 被睡冷却 |
| 19 | `illari_sunburn_pop_cooldown` | 伊拉锐/晒黑目标 | 晒黑二次命中弹飞短冷却 | `false` | 弹飞触发设 true；0.4 秒后设 false；新晒黑时设 false | 目标短 cooldown 槽，可复用 | [illari] apply/pop sunburned target on damage |
| 20 | `baptiste_fake_drug_cooldown` | 巴蒂斯特 | 假药注射触发冷却 | `false` | 成功触发假药设 true；目标恢复后再等 1 秒设 false | 英雄 cooldown 槽，可复用 | [baptiste] fake drug injection |
| 21 | `torb_parts` | 托比昂 | 零件数量，0 到 3 | `0` | 击杀增加；触发改装、死亡或换英雄设 0 | 英雄资源槽，可复用前必须确认死亡清零语义 | [torbjorn] create/gain/activate/clear illegal modification |
| 22 | `torb_mod_ready` | 托比昂 | 非法改装就绪标记 | `false` | 零件满设 true；触发、死亡或换英雄设 false | 英雄状态槽，可复用 | [torbjorn] gain/activate/clear illegal modification |
| 23 | `torb_mod_active` | 托比昂 | 非法改装运行状态 | `false` | 触发改装设 true；失败结束、死亡或换英雄设 false；成功改装按旧逻辑持续到死亡/换英雄 | 英雄状态槽，可复用 | [torbjorn] gain/activate/clear illegal modification |
| 24 | `torb_mod_roll` | 托比昂 | 非法改装随机结果 | `0` | 触发时写入 1-4；死亡或换英雄设 0 | roll 槽，可复用 | [torbjorn] activate/clear illegal modification |
| 25 | `torb_mod_cooldown` | 托比昂 | 非法改装触发冷却 | `false` | 触发设 true；成功分支约 1 秒后解除，失败分支约 3 秒后解除；死亡/换英雄清理 | 短 cooldown 槽，可复用 | [torbjorn] activate/clear illegal modification |
| 26 | `torb_parts_hud_created` | 托比昂 | 零件 HUD 是否已创建 | `false` | 进入托比昂创建；换英雄销毁后设 false | HUD 状态槽，可复用前必须销毁 HUD | [torbjorn] create parts hud/clear after hero swap |
| 27 | `torb_parts_hud_id` | 托比昂 | 零件 HUD 文本 ID | `null` | 创建后写入；换英雄 destroyHudText 后清空 | HUD id 槽，可复用前必须销毁 HUD | [torbjorn] create parts hud/clear after hero swap |
| 28 | `torb_mod_status_hud_created` | 托比昂 | 改装状态 HUD 是否已创建 | `false` | 触发改装设 true；失败结束、死亡或换英雄销毁后设 false | HUD 状态槽，可复用 | [torbjorn] activate/clear illegal modification |
| 29 | `torb_mod_status_hud_id` | 托比昂 | 改装状态 HUD 文本 ID | `null` | 创建后写入；失败结束、死亡或换英雄 destroyHudText 后清空 | HUD id 槽，可复用前必须销毁 HUD | [torbjorn] activate/clear illegal modification |
| 30 | `bastion_scrap` | 堡垒 | 废铁数量，0 到 6 | `0` | 造成伤害增加；触发改装清 0；死亡保留；换英雄清 0 | 英雄资源槽，注意死亡保留语义 | [bastion] create/gain/activate/clear scrap |
| 31 | `bastion_scrap_gain_cooldown` | 堡垒 | 废铁获取节流 | `false` | 获得废铁设 true；0.45 秒后、死亡或换英雄设 false | 短 cooldown 槽，可复用 | [bastion] gain scrap/clear |
| 32 | `bastion_mod_active` | 堡垒 | 非法改装运行状态 | `false` | 触发改装设 true；改装结束、死亡或换英雄设 false | 英雄状态槽，可复用 | [bastion] gain/activate/clear modification |
| 33 | `bastion_mod_roll` | 堡垒 | 非法改装随机结果 | `0` | 触发时写入 1-4；死亡或换英雄设 0 | roll 槽，可复用 | [bastion] activate/clear modification |
| 34 | `bastion_scrap_hud_created` | 堡垒 | 废铁 HUD 是否已创建 | `false` | 进入堡垒创建；换英雄销毁后设 false | HUD 状态槽，可复用前必须销毁 HUD | [bastion] create scrap hud/clear scrap after hero swap |
| 35 | `bastion_scrap_hud_id` | 堡垒 | 废铁 HUD 文本 ID | `null` | 创建后写入；换英雄 destroyHudText 后清空 | HUD id 槽，可复用前必须销毁 HUD | [bastion] create scrap hud/clear scrap after hero swap |
| 36 | `bastion_mod_status_hud_created` | 堡垒 | 改装状态 HUD 是否已创建 | `false` | 触发改装设 true；改装结束、死亡或换英雄销毁后设 false | HUD 状态槽，可复用 | [bastion] activate/clear modification |
| 37 | `bastion_mod_status_hud_id` | 堡垒 | 改装状态 HUD 文本 ID | `null` | 创建后写入；改装结束、死亡或换英雄 destroyHudText 后清空 | HUD id 槽，可复用前必须销毁 HUD | [bastion] activate/clear modification |
| 38 | `hanzo_arrow_rain_active` | 半藏 | 箭雨令运行/冷却锁 | `false` | 技能 1 触发设 true；箭雨结束、死亡或换英雄设 false | 英雄状态槽，可复用前必须确认箭雨结束 | [hanzo] arrow rain command/clear arrow rain and jumps |
| 39 | `hanzo_arrow_rain_pos` | 半藏 | 箭雨令中心位置 | `null` | 技能 1 触发时保存最近可行走位置；结束或清理时设空 | 位置槽，可复用 | [hanzo] arrow rain command/clear arrow rain and jumps |
| 40 | `hanzo_arrow_rain_fx` | 半藏 | 箭雨预警法阵/光柱效果句柄数组 | `[]` | 创建效果后写入；结束、死亡或换英雄 destroyEffect 后清空 | 效果句柄数组槽，可复用前必须销毁 | [hanzo] arrow rain command/clear arrow rain and jumps |
| 41 | `hanzo_arrow_rain_targets` | 半藏 | 本次箭雨 tick 被减速/伤害的目标数组 | `[]` | 每次 tick 写入；0.25 秒后恢复速度并清空；清理规则兜底恢复 | 临时目标数组槽，可复用 | [hanzo] arrow rain command/clear arrow rain and jumps |
| 42 | `hanzo_extra_jump_count` | 半藏 | 半藏额外踏空跳次数 | `0` | 每次额外踏空跳 +1；落地、死亡或换英雄清零 | 英雄计数槽，可复用 | [hanzo] extra air jump/clear arrow rain and jumps/clear extra air jumps on landing |
| 43 | `hanzo_extra_jump_lock` | 半藏 | 半藏额外踏空跳按键边沿锁 | `false` | 额外跳触发设 true；松开跳跃、落地、死亡或换英雄设 false | 按键锁槽，可复用 | [hanzo] extra air jump/unlock/clear extra air jumps on landing |
| 44 | `hanzo_arrow_rain_tick` | 半藏 | 箭雨令循环 tick 计数，5 次约 2.5 秒 | `0` | 箭雨开始设 0；每 tick +1；结束或清理时设 0 | 临时计数槽，可复用 | [hanzo] arrow rain command/clear arrow rain and jumps |
| 45 | `orisa_judgment_energy` | 奥丽莎 | 奥丽莎自身裁决能量层数，0 到 7，不挂在敌人身上 | `0` | 命中获得；右键标枪触发裁决后清 0；换英雄清 0；死亡保留 | 英雄资源槽，死亡保留语义不可随意复用 | [orisa] create/gain/release/clear judgment energy |
| 46 | `orisa_judgment_gain_cd` | 奥丽莎 | 裁决能量获取节流，避免高频命中瞬间刷满；主武器命中不参与获取 | `false` | 命中判定开始设 true；0.7 秒后或死亡/换英雄设 false | 短 cooldown 槽，可复用 | [orisa] gain judgment energy on hit/clear judgment temp state |
| 47 | `orisa_judgment_hud_created` | 奥丽莎 | 裁决能量 HUD 是否已创建 | `false` | 进入奥丽莎创建；换英雄销毁后设 false | HUD 状态槽，可复用前必须销毁 HUD | [orisa] create judgment energy hud/clear judgment energy after hero swap |
| 48 | `orisa_judgment_hud_id` | 奥丽莎 | 裁决能量 HUD 文本 ID | `null` | 创建后写入；换英雄 destroyHudText 后清空 | HUD id 槽，可复用前必须销毁 HUD | [orisa] create judgment energy hud/clear judgment energy after hero swap |
| 49 | `orisa_judgment_spent` | 奥丽莎 | 本次标枪释放裁决消耗的层数缓存 | `0` | 标枪命中时写入；裁决效果结束、死亡或换英雄设 0 | 临时数值槽，可复用 | [orisa] javelin releases judgment energy/clear judgment temp state |
| 50 | `mei_frost_stacks` | 小美/目标 | 目标当前寒气层数，0 到 3 | `0` | 小美近战、冰爆、寒气圈增加；满 3 层清零；死亡/换英雄清零 | 目标资源槽，可复用前需清理减速/冰冻 | [mei] melee/iceburst/aura/full frost/decay/clear |
| 51 | `mei_frost_token` | 小美/目标 | 寒气增加版本号，用于重置衰减等待 | `0` | 每次获得寒气或满层清零时递增；死亡/换英雄递增 | token 槽，可复用 | [mei] melee/iceburst/aura/full frost/decay/clear |
| 52 | `mei_frost_decay_active` | 小美/目标 | 寒气衰减线程是否运行 | `false` | 衰减规则开始设 true；结束、死亡或换英雄设 false | 线程锁槽，可复用 | [mei] frost stack decay/clear |
| 53 | `mei_frost_slow_active` | 小美/目标 | 目标是否处于小美寒气减速恢复流程 | `false` | 冰爆或满层后设 true；恢复、死亡或换英雄设 false | 减速状态槽，可复用前必须恢复速度 | [mei] iceburst/full frost/restore/clear |
| 54 | `mei_frost_slow_token` | 小美/目标 | 减速恢复版本号，避免旧恢复覆盖新减速 | `0` | 每次施加寒气减速时递增；清理时递增 | token 槽，可复用 | [mei] iceburst/full frost/restore/clear |
| 55 | `mei_frost_original_hero` | 小美/目标 | 目标获得寒气时的英雄，用于换英雄清理 | `null` | 获得寒气或减速时写入；清理后置空 | 英雄引用槽，可复用 | [mei] melee/iceburst/aura/full frost/decay/clear |
| 56 | `mei_aura_active` | 小美 | 技能 1 寒气圈是否运行 | `false` | 技能 1 触发设 true；4 秒后、死亡或换英雄设 false | 英雄状态槽，可复用 | [mei] frost aura/clear |
| 57 | `mei_aura_fx` | 小美 | 寒气圈持续特效句柄数组 | `[]` | 技能 1 创建；结束、死亡或换英雄 destroyEffect 后清空 | 效果数组槽，可复用前必须销毁 | [mei] frost aura/clear |
| 58 | `mei_iceburst_cd` | 小美 | 技能 2 冰爆内置冷却锁 | `false` | 冰爆触发设 true；流程和冷却结束、死亡或换英雄设 false | 冷却槽，可复用 | [mei] iceburst trap/clear |
| 59 | `mei_melee_hit_cd` | 小美/目标 | 近战叠寒气短节流，防同一次近战重复加层 | `false` | 近战叠层设 true；0.35 秒后或清理设 false | 短 cooldown 槽，可复用 | [mei] melee adds frost stack/clear |
| 60 | `mei_frost_decay_snapshot` | 小美/目标 | 衰减线程记录的寒气 token 快照 | `0` | 衰减开始写入；清理后置 0 | 临时数值槽，可复用 | [mei] frost stack decay/clear |
| 61 | `mei_aura_stack_cd` | 小美/目标 | 寒气圈对同一目标的 2 秒叠层节流 | `false` | 寒气圈叠层设 true；2 秒后或清理设 false | 短 cooldown 槽，可复用 | [mei] frost aura adds stack/clear |
| 62 | `mei_iceburst_pos` | 小美 | 本次冰爆陷阱位置 | `null` | 技能 2 触发写入；爆炸/清理后置空 | 位置槽，可复用 | [mei] iceburst trap/clear |
| 63 | `mei_iceburst_fx` | 小美 | 冰爆预警特效句柄数组 | `[]` | 预警创建；爆炸后、死亡或换英雄 destroyEffect 后清空 | 效果数组槽，可复用前必须销毁 | [mei] iceburst trap/clear |
| 64 | `mei_frost_slow_snapshot` | 小美/目标 | 减速恢复线程记录的 slow token 快照 | `0` | 恢复规则开始写入；清理后置 0 | 临时数值槽，可复用 | [mei] restore frost slow/clear |
| 65 | `mei_frost_source` | 小美/目标 | 最近给目标叠加寒气的小美玩家引用，用于来源死亡/换英雄清理 | `null` | 获得寒气时写入；目标清理或来源离开小美时置空 | 玩家引用槽，可复用 | [mei] melee/iceburst/aura/clear source |

## 扩展约定

- 新技能新增状态前，先查本文件是否已有可复用槽。
- 长期持续效果优先考虑单独的 `player_effects` 数组，而不是继续追加 `*_fx` 独立变量。
- 跨玩家绑定状态必须写清“谁持有谁的引用”和死亡/换英雄清理路径。
- 如果某个资源明确要求死亡保留，例如当前堡垒废铁，不要迁入会在死亡通用清理中清零的槽。
- 暂不使用 `cooldown_until`，因为本项目还没有可靠的当前时间写法；短冷却仍保持原有 wait 行为。
