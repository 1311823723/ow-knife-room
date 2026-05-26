#!mainFile "main.opy"

# 通用属性重置 — 将所有 Workshop 修改恢复到默认值
def resetPlayerAttributes():
    @Name "Reset Player Attributes"

    eventPlayer.stopScalingSize()
    eventPlayer.setMoveSpeed(DEFAULT_MOVE_SPEED)
    eventPlayer.setDamageDealt(DEFAULT_DAMAGE_DEALT)
    eventPlayer.setDamageReceived(DEFAULT_DAMAGE_RECEIVED)
    eventPlayer.setKnockbackReceived(DEFAULT_KNOCKBACK_RECEIVED)

# 属性重置（不含击退）
def resetPlayerAttributesNoKnockback():
    @Name "Reset Player Attributes No Knockback"

    eventPlayer.stopScalingSize()
    eventPlayer.setMoveSpeed(DEFAULT_MOVE_SPEED)
    eventPlayer.setDamageDealt(DEFAULT_DAMAGE_DEALT)
    eventPlayer.setDamageReceived(DEFAULT_DAMAGE_RECEIVED)

# 仅移速和承伤重置（用于不需要尺寸、伤害、击退的英雄）
def resetPlayerMoveAndReceived():
    @Name "Reset Player Move And Received"

    eventPlayer.setMoveSpeed(DEFAULT_MOVE_SPEED)
    eventPlayer.setDamageReceived(DEFAULT_DAMAGE_RECEIVED)

# 停止所有视觉修改
def resetPlayerVisuals():
    @Name "Reset Player Visuals"

    eventPlayer.stopScalingSize()
    eventPlayer.stopModifyingVoicelinePitch()
