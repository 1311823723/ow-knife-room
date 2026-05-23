# TODO

## 仓库与构建

- [ ] 恢复或确认 git 仓库
  - 目标：让当前目录能执行 `git status`、创建审计分支并提交。
  - 涉及文件：`.git/` 或项目根目录。
  - 风险等级：中。
  - 进游戏测试方法：不需要进游戏；确认 `git rev-parse --is-inside-work-tree` 返回 true。

- [ ] 创建审计分支 `audit/legacy-workshop-review`
  - 目标：在 git 仓库恢复且工作区状态明确后创建审计分支。
  - 涉及文件：git 分支。
  - 风险等级：低。
  - 进游戏测试方法：不需要进游戏；确认 `git branch --show-current`。

- [x] 确认 OverPy 编译方式
  - 目标：确定使用 `overpy`、`overpyc`、`opy` 还是项目内脚本构建。
  - 涉及文件：`package.json`、`pnpm-lock.yaml`、`SETUP.md`、`src/main.opy`、`src/smoke.opy`。
  - 风险等级：中。
  - 进游戏测试方法：运行 `corepack pnpm run build`，把 `dist/current-workshop.zh-cn.copy-paste.txt` 粘贴到 Workshop，确认能保存。

- [x] 准备干净的 legacy Workshop 纯文本
  - 目标：从当前可玩版本导出不带 RTF 包裹的 Workshop 文本，供 OverPy decompile 使用。
  - 涉及文件：`legacy/current-workshop.zh-cn.plain.txt`。
  - 风险等级：低。
  - 进游戏测试方法：把纯文本重新粘贴进 Workshop，确认与旧版表现一致。

## Phase 0：审计与保护

- [x] 制定 OverPy 命名规范
  - 目标：统一变量、规则、文件、子程序和宏命名方式，避免迁移时继续沿用 `A`、`规则 1` 这类不可维护命名。
  - 涉及文件：`docs/naming-conventions.md`、`docs/variable-map.md`。
  - 风险等级：低。
  - 进游戏测试方法：不需要进游戏；后续每个迁移模块按规范复查。

- [x] 制定刀战房 UI 分层规范
  - 目标：固定技能说明、资源 HUD、状态 HUD、大字关键事件和小字频繁反馈的使用边界，避免后续新增英雄时 UI 越堆越乱。
  - 涉及文件：`docs/ui-guidelines.md`、`docs/naming-conventions.md`、`docs/testing-checklist.md`。
  - 风险等级：低。
  - 进游戏测试方法：确认左侧只放入口和当前英雄说明，右侧资源/状态 HUD 不重叠，死亡/换英雄/状态结束后 HUD 会清理。

- [ ] 保存并保护旧版 Workshop 代码
  - 目标：确认 `legacy/current-workshop.zh-cn.txt` 作为原始可回退版本，不直接编辑。
  - 涉及文件：`legacy/current-workshop.zh-cn.txt`。
  - 风险等级：低。
  - 进游戏测试方法：把旧版代码原样粘贴进游戏，确认当前可玩版本仍可运行。

- [x] 建立变量映射文档
  - 目标：记录 `A`、`B`、`C`、`D`、`Y`、`Z`、`Kiriko_Skill` 的当前用途和生命周期。
  - 涉及文件：`docs/variable-map.md`。
  - 风险等级：低。
  - 进游戏测试方法：不需要进游戏；后续测试时按变量行为逐项核对。

- [x] 建立旧代码审计文档
  - 目标：列出旧规则、玩法模块、重复触发风险和高风险 bug。
  - 涉及文件：`docs/legacy-audit.md`。
  - 风险等级：低。
  - 进游戏测试方法：不需要进游戏；后续测试时验证文档中的风险是否复现。

## Phase 1：低风险结构修复

- [x] 修复 HUD 重复创建问题
  - 目标：移除常驻左侧大段 HUD，保留一条左上角简短入口提示，并改为按住互动键显示大字体多行技能说明。
  - 涉及文件：`src/main.opy`、`dist/current-workshop.zh-cn.copy-paste.txt`。
  - 风险等级：中。
  - 进游戏测试方法：进入房间等待 30 秒，确认左上角只保留一条“按住互动键查看技能说明”；按住互动键时出现大字体多行技能说明。

- [x] 重做小美寒气掌控
  - 目标：删除旧版造成伤害 20% 概率冰冻，改为近战、冰爆陷阱和技能 1 寒气圈叠加 3 层寒气。
  - 涉及文件：`src/main.opy`、`dist/current-workshop.zh-cn.copy-paste.txt`。
  - 风险等级：中。
  - 进游戏测试方法：小美近战叠 1 层，技能 2 延迟冰爆叠 2 层并低伤害减速，技能 1 寒气圈贴身每 2 秒叠 1 层；满 3 层短冻后减速并清零，离开后寒气会衰减。

- [x] 削弱源氏击杀刷新 Shift
  - 目标：保留击杀刷新 Shift 爽感，但加入 8 秒内置冷却和 4 秒过热惩罚，避免连续滚雪球。
  - 涉及文件：`src/main.opy`、`dist/current-workshop.zh-cn.copy-paste.txt`、`docs/variable-map.md`、`docs/testing-checklist.md`。
  - 风险等级：中。
  - 进游戏测试方法：源氏第一次击杀刷新 Shift；8 秒内第二次击杀只提示“龙刃过热中”；过热 4 秒内更脆，死亡或换英雄后状态清理。

- [x] 重构源氏疯狗龙刃窗口
  - 目标：删除旧击杀刷新 Shift 机制，改为击杀开启 8 秒窗口；窗口内解锁 Shift 和大招，续杀刷新，结束后沉睡。
  - 涉及文件：`src/main.opy`、`dist/current-workshop.zh-cn.copy-paste.txt`、`docs/variable-map.md`、`docs/testing-checklist.md`。
  - 风险等级：高。
  - 进游戏测试方法：源氏普通状态不能 Shift；击杀后 8 秒内可 Shift 和开大；续杀刷新窗口；自然结束后沉睡 5 秒；死亡或换英雄不残留。

- [x] 添加巴蒂斯特增幅矩阵哈哈镜
  - 目标：巴蒂斯特开大时让半径 8 米内玩家获得 6 秒随机体型、速度、伤害、承伤或击退变化。
  - 涉及文件：`src/main.opy`、`dist/current-workshop.zh-cn.copy-paste.txt`、`docs/variable-map.md`、`docs/testing-checklist.md`。
  - 风险等级：中。
  - 进游戏测试方法：巴蒂斯特满大按大招，确认范围内玩家获得一种哈哈镜效果，6 秒后全部恢复。

- [x] 添加巴蒂斯特假药注射
  - 目标：巴蒂斯特造成伤害时 18% 概率给目标添加 3 秒随机副作用，并有 4 秒内置冷却。
  - 涉及文件：`src/main.opy`、`dist/current-workshop.zh-cn.copy-paste.txt`、`docs/variable-map.md`、`docs/testing-checklist.md`。
  - 风险等级：中。
  - 进游戏测试方法：巴蒂斯特连续攻击目标，确认偶发假药提示和副作用；同一目标不叠加，4 秒内不连续触发。

- [x] 添加路霸钩中削弱和近战击退强化
  - 目标：路霸钩中敌人后，目标缩小 3 秒、移速提高、受到击退增加，并让路霸下一次近战附加更强击退。
  - 涉及文件：`src/main.opy`、`dist/current-workshop.zh-cn.copy-paste.txt`。
  - 风险等级：中。
  - 进游戏测试方法：路霸钩中敌人，确认目标 3 秒内变小且更容易被击退；随后近战命中时目标被额外推开。

- [x] 添加卢西奥落地冲击
  - 目标：卢西奥从空中落地时弹起半径内全部玩家，不分敌我，并让自己短暂加速。
  - 涉及文件：`src/main.opy`、`dist/current-workshop.zh-cn.copy-paste.txt`。
  - 风险等级：中。
  - 进游戏测试方法：卢西奥跳起后落地，确认周围玩家被向上弹起，卢西奥自己短暂加速。

- [x] 调整卢西奥落地冲击
  - 目标：范围调整为 8，排除卢西奥自己，并增加冷却避免落地循环触发。
  - 涉及文件：`src/main.opy`、`dist/current-workshop.zh-cn.copy-paste.txt`、`docs/testing-checklist.md`。
  - 风险等级：中。
  - 进游戏测试方法：卢西奥落地时确认只有附近其他玩家被弹起，自己不被弹起，且不会反复触发。

- [x] 添加索杰恩滑铲创飞
  - 目标：索杰恩滑铲靠近其他玩家时造成伤害、较长击倒和推开，并用冷却防止连续触发。
  - 涉及文件：`src/main.opy`、`dist/current-workshop.zh-cn.copy-paste.txt`、`docs/testing-checklist.md`。
  - 风险等级：中。
  - 进游戏测试方法：索杰恩滑铲经过玩家，确认目标受到 20 点伤害、被击倒并向外推开，索杰恩自己不受影响。

- [x] 添加伊拉锐晒黑和爆发弹开
  - 目标：伊拉锐伤害概率晒黑目标，技能 2 弹开附近其他玩家，并加入冷却与二次弹飞节流。
  - 涉及文件：`src/main.opy`、`dist/current-workshop.zh-cn.copy-paste.txt`、`docs/variable-map.md`、`docs/testing-checklist.md`。
  - 风险等级：中。
  - 进游戏测试方法：伊拉锐连续攻击观察 20% 左右晒黑概率；使用技能 2 确认弹开附近其他玩家，自己不被弹开。

- [x] 添加芙蕾娅飞天法阵
  - 目标：芙蕾娅使用 E 技能时生成法阵，短前摇后范围内玩家一起高飞，并清理效果。
  - 涉及文件：`src/main.opy`、`dist/current-workshop.zh-cn.copy-paste.txt`、`docs/variable-map.md`、`docs/testing-checklist.md`。
  - 风险等级：中。
  - 进游戏测试方法：芙蕾娅按 E 技能触发法阵，确认范围内玩家高飞、效果会消失、冷却期间不重复触发。

- [x] 添加安娜睡眠醒目标记
  - 目标：沉睡状态只创建一次醒目标记效果，并在醒来后清理。
  - 涉及文件：`src/main.opy`、`dist/current-workshop.zh-cn.copy-paste.txt`、`docs/variable-map.md`、`docs/testing-checklist.md`。
  - 风险等级：中。
  - 进游戏测试方法：安娜睡针命中后目标出现玫红光环，醒来后光环消失，沉睡期间不刷屏。

- [ ] 修复主机按住蹲下疯狂生成机器人问题
  - 目标：给主机生成机器人规则增加防连发或按键边沿。
  - 涉及文件：未来补丁文件或迁移后的 Workshop/OverPy 文件。
  - 风险等级：中。
  - 进游戏测试方法：主机按住蹲下 3 秒，只应生成 1 个或按设计节奏生成机器人；装填可移除机器人。

- [ ] 重命名重复的“二段跳”规则
  - 目标：把准备触发和执行触发两条规则区分开。
  - 涉及文件：未来补丁文件或迁移后的 Workshop/OverPy 文件。
  - 风险等级：低。
  - 进游戏测试方法：所有英雄仍然只有一次空中二段跳，落地后恢复。

- [ ] 删除或解释无意义的“规则 1”
  - 目标：处理只执行 `A += 0` 的占位规则；优先文档解释，确认后再删除。
  - 涉及文件：`docs/legacy-audit.md`、未来补丁文件。
  - 风险等级：低。
  - 进游戏测试方法：删除后测试所有英雄二段跳次数是否仍正常初始化。

## Phase 2：高风险 bug 修复

- [ ] 修复被入侵效果重复创建和清理问题
  - 目标：为每名玩家保存独立效果句柄，停止使用 `最后创建的实体` 清理。
  - 涉及文件：未来补丁文件或迁移后的 Workshop/OverPy 文件。
  - 风险等级：高。
  - 进游戏测试方法：两名玩家先后被黑影入侵，结束后各自光柱正确消失，不误删雾子/HUD/其他效果。

- [ ] 修复被入侵持续伤害重复叠加问题
  - 目标：避免被入侵期间持续伤害反复创建。
  - 涉及文件：未来补丁文件或迁移后的 Workshop/OverPy 文件。
  - 风险等级：高。
  - 进游戏测试方法：被入侵持续 5 秒，掉血速度稳定；多次入侵不会越来越快。

- [x] 修复被睡效果重复播放问题
  - 目标：沉睡惩罚只在进入沉睡状态时触发一次，或有明确防重复标记。
  - 涉及文件：`src/main.opy`、`dist/current-workshop.zh-cn.copy-paste.txt`。
  - 风险等级：中。
  - 进游戏测试方法：被睡眠时只出现一次明显效果，技能冷却和充能被正确设置。

- [ ] 重构士兵76初始化逻辑
  - 目标：把 `Y += 1` 改为真正初始化，例如 `Y = 1`、`Z = 100`，且只在合适时机触发。
  - 涉及文件：未来补丁文件或迁移后的 Workshop/OverPy 文件。
  - 风险等级：高。
  - 进游戏测试方法：选择士兵 76 后不操作 30 秒，体型不应自动越来越大。

- [ ] 重构士兵76变大/变小按键触发逻辑
  - 目标：左键/右键只按一次变化一次，避免按住连续倍增或缩小。
  - 涉及文件：未来补丁文件或迁移后的 Workshop/OverPy 文件。
  - 风险等级：高。
  - 进游戏测试方法：按住左键或右键 3 秒，体型只变化一次或按明确冷却节奏变化。

- [x] 重写天使复活甲逻辑
  - 目标：去掉危险 `While`，改为每条命一次复活甲；致命伤时回血、震开敌人并短暂无敌。
  - 涉及文件：`src/main.opy`、`dist/current-workshop.zh-cn.copy-paste.txt`。
  - 风险等级：高。
  - 进游戏测试方法：天使第一次承受致命伤时回血并震开敌人；第二次致命伤应正常阵亡。

- [ ] 重构雾子法阵 active flag 和效果清理
  - 目标：把 `Kiriko_Skill` 作为条件使用，防止技能 2 持续期间重复创建法阵；死亡/换英雄时清理 `D`。
  - 涉及文件：未来补丁文件或迁移后的 Workshop/OverPy 文件。
  - 风险等级：高。
  - 进游戏测试方法：雾子使用技能 2 时只出现一组法阵效果，5 秒后全部清理；连续使用不泄漏旧效果。

## Phase 3：迁移

- [ ] 迁移 HUD 到 OverPy
  - 目标：先迁移最简单、风险可控的 HUD 模块。
  - 涉及文件：`src/main.opy` 或后续模块文件。
  - 风险等级：中。
  - 进游戏测试方法：编译粘贴后 HUD 只出现一次且文本正确。

- [ ] 迁移二段跳到 OverPy
  - 目标：迁移全员二段跳并保持旧体验。
  - 涉及文件：`src/main.opy` 或后续模块文件。
  - 风险等级：中。
  - 进游戏测试方法：所有英雄落地后只有 1 次二段跳可用。
