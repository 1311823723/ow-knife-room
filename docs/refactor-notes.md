# 重构记录

## 2026-05-23 玩家变量数组化第一轮

### 项目形态

- 当前主源码是 `src/main.opy`，项目是 OverPy 项目。
- `dist/current-workshop.zh-cn.copy-paste.txt` 是由 OverPy 编译得到的中文 Workshop 文本。
- 本轮只维护 OverPy 源码，不直接手改旧版 `legacy/` 文本，避免两套冲突逻辑。

### 本次做了什么

- 新增 `player_state` 玩家状态数组，复用玩家变量槽 27。
- 新增 `[state] initialize player state array` 初始化规则，默认写入 21 个索引。
- 将 21 个旧独立玩家变量迁入 `player_state[0..20]`。
- 删除迁移后的旧 `playervar` 声明，显式玩家变量从 109 个降到 89 个。
- 保留现有 wait 型冷却行为，没有改成 `cooldown_until`，避免在未确认“当前时间”可靠写法前引入语法或手感风险。
- 重新编译 `dist/current-workshop.zh-cn.copy-paste.txt`，确认 OverPy 语法通过。

### 实际释放/合并

已迁移：

- HUD/通用 UI：`ability_guide_hud_created`、`ability_guide_hud_id`、`ability_guide_toggle_locked`
- 布丽吉塔：`brigitte_blink_cooldown`、`brigitte_blink_target`、`brigitte_counter_cd`、`brigitte_counter_target`
- 短 cooldown：`sojourn_slide_bump_cooldown`、`illari_sunburn_cooldown`、`illari_burst_cooldown`、`freya_launch_circle_cooldown`、`baptiste_fake_drug_cooldown`
- 临时/短状态：`roadhog_hook_melee_boost_ready`、`lucio_was_airborne`、`lucio_landing_bounce_cooldown`、`illari_sunburn_pop_cooldown`
- 临时引用：`zen_chain_target`、`ramattra_core_destroy_target`
- 通用按钮状态：`disabled_secondary_fire`
- 睡眠特效：`ana_sleep_fx_active`、`ana_sleep_fx_handle`

### 为什么这些变量优先迁移

这些变量大多是单规则或少量规则使用的短状态、临时目标、HUD id、短 cooldown，迁移后行为基本等价：只是从 `eventPlayer.foo` 改为 `eventPlayer.player_state[index]`，没有改变等待时间、触发条件、恢复属性或死亡/换英雄清理语义。

### 暂时没动的地方

- 托比昂和堡垒资源/HUD 组：适合下一轮整组迁移，但要保持托比昂死亡清零、堡垒死亡不清废铁的差异。
- 源氏疯狗窗口：涉及 HUD、计时、token、死亡和换英雄清理，暂缓。
- 温斯顿抱摔：跨玩家双向引用，暂缓。
- 拉玛刹超重和核心：跨攻击者/目标，属性恢复路径多，暂缓。
- 西格玛小黑洞和死神追猎：持续效果和位置状态复杂，暂缓。
- `Kiriko_Skill`、`genji_dash_reset_cooldown`、`genji_overheat_active` 疑似旧逻辑残留，但本轮只标记，不删除。

### 风险点

- `player_state` 是混合类型数组，索引含义必须以 `docs/state-index-map.md` 为准。
- 数组槽中的效果句柄和 HUD id 必须先销毁再清空。
- 索引 12 会被卢西奥写到附近其他玩家身上，用于防落地冲击连锁；这不是污染，是原 `lucio_landing_bounce_cooldown` 的等价迁移。
- 本轮没有改动 cooldown 计时模型，因此不会减少 wait 线程，但变量占用已经下降。
