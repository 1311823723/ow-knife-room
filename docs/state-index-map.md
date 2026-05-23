# 玩家状态数组索引表

源文件：`src/main.opy`。`player_state` 是新增的统一玩家状态数组，当前占用玩家变量槽 27。以后新增英雄技能优先评估写入这里或新建专用数组，不再随意追加独立 `playervar`。

初始化规则：`[state] initialize player state array` 会在 `len(eventPlayer.player_state) < 38` 时写入默认数组。

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

## 扩展约定

- 新技能新增状态前，先查本文件是否已有可复用槽。
- 长期持续效果优先考虑单独的 `player_effects` 数组，而不是继续追加 `*_fx` 独立变量。
- 跨玩家绑定状态必须写清“谁持有谁的引用”和死亡/换英雄清理路径。
- 如果某个资源明确要求死亡保留，例如当前堡垒废铁，不要迁入会在死亡通用清理中清零的槽。
- 暂不使用 `cooldown_until`，因为本项目还没有可靠的当前时间写法；短冷却仍保持原有 wait 行为。
