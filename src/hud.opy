#!mainFile "main.opy"

# HUD 工具 — 资源 HUD 创建和销毁的标准模式
#
# 创建模式：
#   1. 守卫: @Condition eventPlayer.player_state[HUD_CREATED] == false
#   2. 设标记: eventPlayer.player_state[HUD_CREATED] = true
#   3. 创建: hudHeader(eventPlayer, 格式字符串, HudPosition.RIGHT, 槽位, 颜色, HudReeval.VISIBILITY_AND_STRING)
#   4. 存储: eventPlayer.player_state[HUD_ID] = getLastCreatedText()
#
# 销毁模式：
#   1. 检查标记: if eventPlayer.player_state[HUD_CREATED] == true:
#   2. 销毁: destroyHudText(eventPlayer.player_state[HUD_ID])
#   3. 重置: eventPlayer.player_state[HUD_CREATED] = false
#   4. 清空: eventPlayer.player_state[HUD_ID] = null
#
# 槽位分配规范见 docs/ui-guidelines.md
