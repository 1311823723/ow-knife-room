#Player variables

playervar Kiriko_Skill 26
playervar roadhog_hook_melee_boost_ready 27
playervar lucio_was_airborne 28
playervar lucio_landing_bounce_cooldown 29
playervar sojourn_slide_bump_cooldown 30
playervar illari_sunburn_cooldown 31
playervar illari_sunburn_active 32
playervar illari_burst_cooldown 33
playervar freya_launch_circle_cooldown 34
playervar ana_sleep_fx_active 35
playervar ana_sleep_fx_handle 36
playervar illari_sunburn_pop_cooldown 37
playervar freya_launch_circle_effects 38
playervar genji_dash_reset_cooldown 39
playervar genji_overheat_active 40
playervar baptiste_mirror_active 41
playervar baptiste_mirror_roll 42
playervar baptiste_mirror_target_active 43
playervar baptiste_fake_drug_cooldown 44
playervar baptiste_drug_target_active 45
playervar baptiste_fake_drug_roll 46
playervar genji_ult_window_active 47
playervar genji_ult_window_timer 48
playervar genji_ult_window_token 49
playervar torb_parts 50
playervar torb_mod_ready 51
playervar torb_mod_active 52
playervar torb_mod_roll 53
playervar torb_mod_cooldown 54
playervar torb_parts_hud_created 55
playervar torb_parts_hud_id 56
playervar genji_ult_window_hud_created 57
playervar genji_ult_window_hud_id 58
playervar ability_guide_hud_created 59
playervar ability_guide_hud_id 60
playervar soldier_resize_cooldown 61
playervar ability_guide_toggle_locked 62
playervar tracer_auto_recall_state 63
playervar tracer_debt_active 64
playervar bastion_scrap 65
playervar bastion_scrap_gain_cooldown 66
playervar bastion_mod_active 67
playervar bastion_mod_roll 68
playervar bastion_scrap_hud_created 69
playervar bastion_scrap_hud_id 70
playervar torb_mod_status_hud_created 71
playervar torb_mod_status_hud_id 72
playervar bastion_mod_status_hud_created 73
playervar bastion_mod_status_hud_id 74
playervar winston_grapple_active 75
playervar winston_grapple_target 76
playervar winston_grapple_lock 77
playervar winston_grapple_carrier 78
playervar winston_grapple_original_hero 79
playervar brigitte_blink_cooldown 80
playervar brigitte_blink_target 81
playervar ramattra_ow_stacks 82
playervar ramattra_ow_window_active 83
playervar ramattra_ow_hit_cooldown 84
playervar ramattra_ow_compress_cooldown 85
playervar ramattra_ow_active 86
playervar ramattra_ow_original_hero 87
playervar ramattra_pain 88
playervar ramattra_pain_ready 89
playervar ramattra_pain_hud_created 90
playervar ramattra_pain_hud_id 91
playervar ramattra_pain_punch_cooldown 92
playervar ramattra_core_active 93
playervar ramattra_core_position 94
playervar ramattra_core_effects 95
playervar ramattra_core_cooldown 96
playervar ramattra_core_destroy_target 97
playervar ramattra_ow_source 98
playervar sigma_black_hole_active 99
playervar sigma_black_hole_cooldown 100
playervar sigma_black_hole_position 101
playervar sigma_black_hole_effects 102
playervar sigma_black_hole_tick 103
playervar sigma_black_hole_damage_taken 104
playervar reaper_anchor_active 105
playervar reaper_anchor_pos 106
playervar reaper_anchor_fx 107
playervar reaper_hunt_cd 108
playervar reaper_anchor_timer 109
playervar reaper_anchor_timer_on 110
playervar reaper_hunt_active 111
playervar reaper_hunt_fx 112
playervar disabled_secondary_fire 113
playervar sigma_grasp_was_active 114
playervar sigma_burst_cd 115
playervar sigma_burst_pos 116
playervar zen_element 117
playervar zen_reload_lock 118
playervar zen_hit_cd 119
playervar zen_right_cd 120
playervar zen_ult_cd 121
playervar zen_skill_pos 122
playervar zen_fx 123
playervar zen_slow_active 124
playervar zen_slow_timer 125
playervar zen_slow_hero 126
playervar zen_chain_target 127


#Only remove the following directive if the gamemode does not use tricks such as A+0, A*0, "am" == "**", etc which would otherwise be optimized out.
#!optimizeStrict


def applySoldierAntmanState():
    @Name "Apply Soldier Antman State"

    eventPlayer.startScalingSize(eventPlayer.Y)
    if eventPlayer.Y == 32:
        eventPlayer.Z = 70
        eventPlayer.setDamageDealt(70)
        eventPlayer.setMoveSpeed(100)
        eventPlayer.startModifyingVoicelinePitch(0.5)
    elif eventPlayer.Y == 16:
        eventPlayer.Z = 76
        eventPlayer.setDamageDealt(76)
        eventPlayer.setMoveSpeed(100)
        eventPlayer.startModifyingVoicelinePitch(0.6)
    elif eventPlayer.Y == 8:
        eventPlayer.Z = 82
        eventPlayer.setDamageDealt(82)
        eventPlayer.setMoveSpeed(100)
        eventPlayer.startModifyingVoicelinePitch(0.7)
    elif eventPlayer.Y == 4:
        eventPlayer.Z = 88
        eventPlayer.setDamageDealt(88)
        eventPlayer.setMoveSpeed(100)
        eventPlayer.startModifyingVoicelinePitch(0.8)
    elif eventPlayer.Y == 2:
        eventPlayer.Z = 94
        eventPlayer.setDamageDealt(94)
        eventPlayer.setMoveSpeed(100)
        eventPlayer.startModifyingVoicelinePitch(0.9)
    elif eventPlayer.Y == 0.75:
        eventPlayer.Z = 106
        eventPlayer.setDamageDealt(100)
        eventPlayer.setMoveSpeed(106)
        eventPlayer.startModifyingVoicelinePitch(1.1)
    elif eventPlayer.Y == 0.5:
        eventPlayer.Z = 112
        eventPlayer.setDamageDealt(100)
        eventPlayer.setMoveSpeed(112)
        eventPlayer.startModifyingVoicelinePitch(1.2)
    elif eventPlayer.Y == 0.25:
        eventPlayer.Z = 118
        eventPlayer.setDamageDealt(100)
        eventPlayer.setMoveSpeed(118)
        eventPlayer.startModifyingVoicelinePitch(1.3)
    elif eventPlayer.Y == 0.1:
        eventPlayer.Z = 124
        eventPlayer.setDamageDealt(100)
        eventPlayer.setMoveSpeed(124)
        eventPlayer.startModifyingVoicelinePitch(1.4)
    elif eventPlayer.Y == 0.01:
        eventPlayer.Z = 130
        eventPlayer.setDamageDealt(100)
        eventPlayer.setMoveSpeed(130)
        eventPlayer.startModifyingVoicelinePitch(1.5)
    else:
        eventPlayer.Y = 1
        eventPlayer.Z = 100
        eventPlayer.stopScalingSize()
        eventPlayer.setDamageDealt(100)
        eventPlayer.setMoveSpeed(100)
        eventPlayer.stopModifyingVoicelinePitch()


rule "规则 1":
    @Event eachPlayer

    eventPlayer.A += 0


rule "二段跳":
    @Event eachPlayer
    @Condition eventPlayer.getAltitude() > 0.8
    @Condition eventPlayer.isHoldingButton(Button.JUMP) == false
    @Condition eventPlayer.A > 0

    eventPlayer.B = true


rule "规则 3":
    @Event eachPlayer
    @Condition eventPlayer.A == 0

    eventPlayer.B = false


rule "二段跳":
    @Event eachPlayer
    @Condition eventPlayer.B == true
    @Condition eventPlayer.isHoldingButton(Button.JUMP) == true

    eventPlayer.applyImpulse(Vector.UP, 10, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
    eventPlayer.A--


rule "规则 5":
    @Event eachPlayer
    @Condition eventPlayer.isInAir() != true

    eventPlayer.A = 1
    eventPlayer.B = false


rule "规则 7":
    @Condition hostPlayer.isHoldingButton(Button.CROUCH) == true

    createDummy(getAllHeroes(), getOppositeTeam(Team.ALL), -1, hostPlayer)


rule "被入侵":
    @Event eachPlayer
    @Condition eventPlayer.hasStatus(Status.HACKED) == true

    eventPlayer.startScalingSize(2.5)
    eventPlayer.startDamageOverTime(getPlayersOnHero(Hero.SOMBRA, Team.ALL), 3, 5)
    createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Color.ROSE, eventPlayer, 3, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)


rule "被入侵回归":
    @Event eachPlayer
    @Condition eventPlayer.hasStatus(Status.HACKED) == false

    eventPlayer.stopScalingSize()
    destroyEffect(getLastCreatedEntity())


rule "击败回血":
    @Event playerDealtFinalBlow

    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.ROSE, getLastHealingModification(), 1)
    bigMessage(eventPlayer, "造成击杀，恢复体力")
    eventPlayer.startHealingOverTime(eventPlayer, 3, 10)


rule "被睡冷却":
    @Event eachPlayer
    @Condition eventPlayer.hasStatus(Status.ASLEEP) == true
    @Condition eventPlayer.ana_sleep_fx_active == false

    eventPlayer.ana_sleep_fx_active = true
    eventPlayer.setAbilityCooldown(Button.ABILITY_1, 50)
    eventPlayer.setAbilityCooldown(Button.ABILITY_2, 50)
    eventPlayer.setUltCharge(20)
    createEffect(getAllPlayers(), Effect.BAD_AURA, Color.ROSE, eventPlayer, 2.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.ana_sleep_fx_handle = getLastCreatedEntity()
    smallMessage(eventPlayer, "你被睡了")
    waitUntil(eventPlayer.hasStatus(Status.ASLEEP) == false, 99999)
    destroyEffect(eventPlayer.ana_sleep_fx_handle)
    eventPlayer.ana_sleep_fx_handle = null
    eventPlayer.ana_sleep_fx_active = false


rule "[soldier] initialize antman state":
    @Event eachPlayer
    @Hero soldier
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.Y == 0

    eventPlayer.Y = 1
    eventPlayer.Z = 100
    eventPlayer.soldier_resize_cooldown = false
    applySoldierAntmanState()


rule "[soldier] grow one antman step":
    @Event eachPlayer
    @Hero soldier
    @Condition eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) == true
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.soldier_resize_cooldown == false
    @Condition eventPlayer.Y < 32

    eventPlayer.soldier_resize_cooldown = true
    if eventPlayer.Y < 0.1:
        eventPlayer.Y = 0.1
    elif eventPlayer.Y < 0.25:
        eventPlayer.Y = 0.25
    elif eventPlayer.Y < 0.5:
        eventPlayer.Y = 0.5
    elif eventPlayer.Y < 0.75:
        eventPlayer.Y = 0.75
    elif eventPlayer.Y < 1:
        eventPlayer.Y = 1
    elif eventPlayer.Y < 2:
        eventPlayer.Y = 2
    elif eventPlayer.Y < 4:
        eventPlayer.Y = 4
    elif eventPlayer.Y < 8:
        eventPlayer.Y = 8
    elif eventPlayer.Y < 16:
        eventPlayer.Y = 16
    else:
        eventPlayer.Y = 32
    applySoldierAntmanState()
    smallMessage(eventPlayer, "体型档位：{}".format(eventPlayer.Y))
    wait(0.25)
    eventPlayer.soldier_resize_cooldown = false


rule "[soldier] shrink one antman step":
    @Event eachPlayer
    @Hero soldier
    @Condition eventPlayer.isHoldingButton(Button.SECONDARY_FIRE) == true
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.soldier_resize_cooldown == false
    @Condition eventPlayer.Y > 0.01

    eventPlayer.soldier_resize_cooldown = true
    if eventPlayer.Y > 16:
        eventPlayer.Y = 16
    elif eventPlayer.Y > 8:
        eventPlayer.Y = 8
    elif eventPlayer.Y > 4:
        eventPlayer.Y = 4
    elif eventPlayer.Y > 2:
        eventPlayer.Y = 2
    elif eventPlayer.Y > 1:
        eventPlayer.Y = 1
    elif eventPlayer.Y > 0.75:
        eventPlayer.Y = 0.75
    elif eventPlayer.Y > 0.5:
        eventPlayer.Y = 0.5
    elif eventPlayer.Y > 0.25:
        eventPlayer.Y = 0.25
    elif eventPlayer.Y > 0.1:
        eventPlayer.Y = 0.1
    else:
        eventPlayer.Y = 0.01
    applySoldierAntmanState()
    smallMessage(eventPlayer, "体型档位：{}".format(eventPlayer.Y))
    wait(0.25)
    eventPlayer.soldier_resize_cooldown = false


rule "规则 19":
    @Event eachPlayer
    @Condition eventPlayer.isDead() == true

    eventPlayer.stopScalingSize()


rule "[soldier] clear antman state on death":
    @Event playerDied
    @Hero soldier

    eventPlayer.Y = 0
    eventPlayer.Z = 0
    eventPlayer.soldier_resize_cooldown = false
    eventPlayer.stopScalingSize()
    eventPlayer.setDamageDealt(100)
    eventPlayer.setMoveSpeed(100)
    eventPlayer.stopModifyingVoicelinePitch()


rule "[soldier] clear antman state after hero swap":
    @Event eachPlayer
    @Condition eventPlayer.getHero() != Hero.SOLDIER
    @Condition eventPlayer.Y != 0 or eventPlayer.soldier_resize_cooldown == true

    eventPlayer.Y = 0
    eventPlayer.Z = 0
    eventPlayer.soldier_resize_cooldown = false
    eventPlayer.stopScalingSize()
    eventPlayer.setDamageDealt(100)
    eventPlayer.setMoveSpeed(100)
    eventPlayer.stopModifyingVoicelinePitch()


rule "移除机器人":
    @Condition hostPlayer.isHoldingButton(Button.RELOAD) == true

    destroyAllDummies()


rule "[hud] create ability guide prompt":
    hudHeader(getAllPlayers(), "按互动键打开/关闭当前英雄技能说明", HudPosition.ACTUALLY_LEFT, -999, Color.YELLOW, HudReeval.VISIBILITY_AND_STRING)


rule "[hud] open current hero ability guide on interact":
    @Event eachPlayer
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition eventPlayer.ability_guide_toggle_locked == false
    @Condition eventPlayer.ability_guide_hud_created == false

    eventPlayer.ability_guide_toggle_locked = true
    eventPlayer.ability_guide_hud_created = true
    if eventPlayer.getHero() == Hero.SOLDIER:
        hudSubtext(eventPlayer, "士兵76：蚁人体型\n左键变大，右键变小，共 11 档\n最大 32，最小 0.01\n变大后伤害逐档降低，变小后移速逐档提高，音调随体型变化", HudPosition.ACTUALLY_LEFT, -998, Color.YELLOW, HudReeval.VISIBILITY_AND_STRING)
    elif eventPlayer.getHero() == Hero.MERCY:
        hudSubtext(eventPlayer, "天使：复活甲\n每条命一次复活甲\n受到致命伤时回血到 60，震开周围敌人，并短暂无敌\n复活甲破碎后本条命不再触发", HudPosition.ACTUALLY_LEFT, -998, Color.YELLOW, HudReeval.VISIBILITY_AND_STRING)
    elif eventPlayer.getHero() == Hero.BAPTISTE:
        hudSubtext(eventPlayer, "巴蒂：哈哈镜与假药\n大招触发哈哈镜，附近玩家随机极大、极小、变脆或变硬\n造成伤害有概率让目标获得短暂假药副作用", HudPosition.ACTUALLY_LEFT, -998, Color.YELLOW, HudReeval.VISIBILITY_AND_STRING)
    elif eventPlayer.getHero() == Hero.GENJI:
        hudSubtext(eventPlayer, "源氏：疯狗龙刃窗口\n平时 Shift 被锁\n击杀开启 8 秒疯狗时间，自动开大并解锁 Shift\n续杀刷新时间，结束后沉睡 5 秒", HudPosition.ACTUALLY_LEFT, -998, Color.GREEN, HudReeval.VISIBILITY_AND_STRING)
    elif eventPlayer.getHero() == Hero.TORBJORN:
        hudSubtext(eventPlayer, "托比昂：非法改装\n参与击杀获得零件，3 个零件后按 E 触发随机改装\n可能变巨型、迷你、防爆，也可能改装失败\n死亡或换英雄清空零件和改装", HudPosition.ACTUALLY_LEFT, -998, Color.YELLOW, HudReeval.VISIBILITY_AND_STRING)
    elif eventPlayer.getHero() == Hero.MEI:
        hudSubtext(eventPlayer, "小美：冰冻拳\n造成伤害时有 20% 概率冰冻目标 1 秒\n概率按每次造成伤害独立判定", HudPosition.ACTUALLY_LEFT, -998, Color.AQUA, HudReeval.VISIBILITY_AND_STRING)
    elif eventPlayer.getHero() == Hero.ROADHOG:
        hudSubtext(eventPlayer, "路霸：钩中改造\n钩中敌人会让目标缩小 3 秒\n目标移速提高但受到击退增加\n路霸下一次近战会附加强击退", HudPosition.ACTUALLY_LEFT, -998, Color.YELLOW, HudReeval.VISIBILITY_AND_STRING)
    elif eventPlayer.getHero() == Hero.LUCIO:
        hudSubtext(eventPlayer, "卢西奥：落地冲击\n从空中落地时弹起附近其他玩家\n不会弹起自己，并获得短暂加速\n带冷却，避免连续触发", HudPosition.ACTUALLY_LEFT, -998, Color.GREEN, HudReeval.VISIBILITY_AND_STRING)
    elif eventPlayer.getHero() == Hero.SOJOURN:
        hudSubtext(eventPlayer, "索杰恩：滑铲创飞\n滑铲靠近玩家时造成 20 伤害、击倒并铲飞\n索杰恩自己不受影响\n有短冷却，避免滑铲期间连续触发", HudPosition.ACTUALLY_LEFT, -998, Color.BLUE, HudReeval.VISIBILITY_AND_STRING)
    elif eventPlayer.getHero() == Hero.ILLARI:
        hudSubtext(eventPlayer, "伊拉锐：晒黑与爆发\n造成伤害有概率晒黑目标，使其变大、变慢、更容易被击飞\n再次命中晒黑目标会小弹飞\n技能 2 会弹开附近玩家", HudPosition.ACTUALLY_LEFT, -998, Color.YELLOW, HudReeval.VISIBILITY_AND_STRING)
    elif eventPlayer.getHero() == Hero.FREJA:
        hudSubtext(eventPlayer, "芙蕾娅：飞天法阵\n按 E 生成法阵\n短暂前摇后，范围内玩家一起高高飞起\n带冷却并会清理特效", HudPosition.ACTUALLY_LEFT, -998, Color.AQUA, HudReeval.VISIBILITY_AND_STRING)
    elif eventPlayer.getHero() == Hero.ANA:
        hudSubtext(eventPlayer, "安娜：睡眠标记与激素控制\n睡针命中会给目标添加明显睡眠标记\n大招按下时可让视角附近目标沉睡", HudPosition.ACTUALLY_LEFT, -998, Color.PURPLE, HudReeval.VISIBILITY_AND_STRING)
    elif eventPlayer.getHero() == Hero.KIRIKO:
        hudSubtext(eventPlayer, "雾子：法阵击倒\n使用技能 2 时生成短暂法阵特效\n范围内玩家会被击倒\n法阵结束后自动清理效果", HudPosition.ACTUALLY_LEFT, -998, Color.VIOLET, HudReeval.VISIBILITY_AND_STRING)
    elif eventPlayer.getHero() == Hero.TRACER:
        hudSubtext(eventPlayer, "猎空：自动赖账回溯\n每条命一次自动回溯\n受到致命伤时自动重置并强制使用 E\n约 3 秒后还债，短暂变大、变慢并更脆", HudPosition.ACTUALLY_LEFT, -998, Color.BLUE, HudReeval.VISIBILITY_AND_STRING)
    elif eventPlayer.getHero() == Hero.REAPER:
        hudSubtext(eventPlayer, "死神：收魂追猎\n击杀后留下短暂亡魂锚点\n按 E 借魂传送追猎，并展开黑雾猎场\n右键技能关闭", HudPosition.ACTUALLY_LEFT, -998, Color.PURPLE, HudReeval.VISIBILITY_AND_STRING)
    elif eventPlayer.getHero() == Hero.ZENYATTA:
        hudSubtext(eventPlayer, "禅雅塔：三相念珠\n换弹键按火、冰、雷固定顺序切换元素\n普攻和右键附带弱化元素效果\n所有额外伤害单次不超过 10 点", HudPosition.ACTUALLY_LEFT, -998, Color.YELLOW, HudReeval.VISIBILITY_AND_STRING)
    elif eventPlayer.getHero() == Hero.BASTION:
        hudSubtext(eventPlayer, "堡垒：废铁非法改装\n造成有效伤害攒废铁，满 6 个自动随机改装\n死亡不掉废铁，换英雄清零\n改装结束后属性会恢复", HudPosition.ACTUALLY_LEFT, -998, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING)
    elif eventPlayer.getHero() == Hero.RAMATTRA:
        hudSubtext(eventPlayer, "拉玛刹：痛苦重力\n攻击施加超重，短时间叠满 3 层会重力压制\n技能 2 放置痛苦核心充能，敌人可近战摧毁\n痛苦满后下一次近战变为痛苦拳", HudPosition.ACTUALLY_LEFT, -998, Color.PURPLE, HudReeval.VISIBILITY_AND_STRING)
    elif eventPlayer.getHero() == Hero.SIGMA:
        hudSubtext(eventPlayer, "西格玛：小黑洞与重力震爆\n技能 1 在准星前方释放小黑洞，轻微吸引附近玩家\n动能俘获结束时，面前发生重力震爆\n近距离目标会被小幅推开、减速并受到少量伤害", HudPosition.ACTUALLY_LEFT, -998, Color.BLUE, HudReeval.VISIBILITY_AND_STRING)
    elif eventPlayer.getHero() == Hero.WINSTON:
        hudSubtext(eventPlayer, "温斯顿：跳跃撞人可抱摔\n技能1跳跃正面贴近玩家时抓住 1 人\n落地击倒目标但不造成伤害", HudPosition.ACTUALLY_LEFT, -998, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
    elif eventPlayer.getHero() == Hero.BRIGITTE:
        hudSubtext(eventPlayer, "布丽吉塔：举盾攻击远处目标可盾击瞬移\n传送到目标附近，只短暂眩晕\n不造成伤害", HudPosition.ACTUALLY_LEFT, -998, Color.YELLOW, HudReeval.VISIBILITY_AND_STRING)
    else:
        hudSubtext(eventPlayer, "通用规则\n所有角色拥有二段跳\n击杀会回血\n被入侵会变大并持续扣血\n被睡会进入冷却惩罚并显示醒目标记", HudPosition.ACTUALLY_LEFT, -998, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
    eventPlayer.ability_guide_hud_id = getLastCreatedText()


rule "[hud] close current hero ability guide on interact":
    @Event eachPlayer
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition eventPlayer.ability_guide_toggle_locked == false
    @Condition eventPlayer.ability_guide_hud_created == true

    eventPlayer.ability_guide_toggle_locked = true
    destroyHudText(eventPlayer.ability_guide_hud_id)
    eventPlayer.ability_guide_hud_created = false
    eventPlayer.ability_guide_hud_id = null


rule "[hud] unlock ability guide toggle":
    @Event eachPlayer
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == false
    @Condition eventPlayer.ability_guide_toggle_locked == true

    eventPlayer.ability_guide_toggle_locked = false


rule "[hud] clear current hero ability guide on death":
    @Event eachPlayer
    @Condition eventPlayer.ability_guide_hud_created == true
    @Condition eventPlayer.isDead() == true

    destroyHudText(eventPlayer.ability_guide_hud_id)
    eventPlayer.ability_guide_hud_created = false
    eventPlayer.ability_guide_hud_id = null
    eventPlayer.ability_guide_toggle_locked = false


rule "[mercy] grant revive armor on spawn":
    @Event eachPlayer
    @Hero mercy
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.C == 0

    eventPlayer.C = 1


rule "[mercy] revive armor breaks on lethal damage":
    @Event playerTookDamage
    @Hero mercy
    @Condition eventPlayer.C == 1
    @Condition eventPlayer.getHealth() - eventDamage <= 0

    eventPlayer.C = 2
    eventPlayer.resurrect()
    eventPlayer.setHealth(60)
    eventPlayer.setStatusEffect(eventPlayer, Status.INVINCIBLE, 1)
    getPlayersInRadius(eventPlayer.getPosition(), 4, Team.ALL).filter(lambda player: player != eventPlayer and player.getTeam() != eventPlayer.getTeam()).applyImpulse(directionTowards(eventPlayer.getPosition(), getPlayersInRadius(eventPlayer.getPosition(), 4, Team.ALL).filter(lambda player: player != eventPlayer and player.getTeam() != eventPlayer.getTeam()).getPosition()), 14, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.YELLOW, eventPlayer, 4)
    bigMessage(eventPlayer, "复活甲已破碎")


rule "[mercy] clear revive armor state on death":
    @Event playerDied
    @Hero mercy

    eventPlayer.C = 0


rule "[tracer] grant auto recall on spawn":
    @Event eachPlayer
    @Hero tracer
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.tracer_auto_recall_state == 0

    eventPlayer.tracer_auto_recall_state = 1
    eventPlayer.tracer_debt_active = false


rule "[tracer] auto recall on lethal damage":
    @Event playerTookDamage
    @Hero tracer
    @Condition eventPlayer.tracer_auto_recall_state == 1
    @Condition eventPlayer.getHealth() - eventDamage <= 0

    eventPlayer.tracer_auto_recall_state = 2
    eventPlayer.tracer_debt_active = false
    eventPlayer.resurrect()
    eventPlayer.setHealth(75)
    eventPlayer.setAbilityCooldown(Button.ABILITY_2, 0)
    eventPlayer.forceButtonPress(Button.ABILITY_2)
    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.BLUE, eventPlayer, 2.5)
    bigMessage(eventPlayer, "时间赖账成功")
    wait(3)
    if eventPlayer.isAlive() == true and eventPlayer.getHero() == Hero.TRACER and eventPlayer.tracer_auto_recall_state == 2:
        eventPlayer.tracer_debt_active = true
        eventPlayer.startScalingSize(1.25)
        eventPlayer.setMoveSpeed(85)
        eventPlayer.setDamageReceived(125)
        playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, Color.BLUE, eventPlayer, 2)
        bigMessage(eventPlayer, "时间债务到期")
        wait(4)
        if eventPlayer.tracer_debt_active == true:
            eventPlayer.stopScalingSize()
            eventPlayer.setMoveSpeed(100)
            eventPlayer.setDamageReceived(100)
            eventPlayer.tracer_debt_active = false


rule "[tracer] clear auto recall on death":
    @Event playerDied
    @Hero tracer

    eventPlayer.tracer_auto_recall_state = 0
    eventPlayer.tracer_debt_active = false
    eventPlayer.stopScalingSize()
    eventPlayer.setMoveSpeed(100)
    eventPlayer.setDamageReceived(100)


rule "[tracer] clear auto recall after hero swap":
    @Event eachPlayer
    @Condition eventPlayer.getHero() != Hero.TRACER
    @Condition eventPlayer.tracer_auto_recall_state != 0 or eventPlayer.tracer_debt_active == true

    eventPlayer.tracer_auto_recall_state = 0
    eventPlayer.tracer_debt_active = false
    eventPlayer.stopScalingSize()
    eventPlayer.setMoveSpeed(100)
    eventPlayer.setDamageReceived(100)


rule "[bastion] create scrap hud":
    @Event eachPlayer
    @Hero bastion
    @Condition eventPlayer.bastion_scrap_hud_created == false

    eventPlayer.bastion_scrap_hud_created = true
    hudHeader(eventPlayer, "废铁：{}/6".format(eventPlayer.bastion_scrap), HudPosition.RIGHT, -800, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING)
    eventPlayer.bastion_scrap_hud_id = getLastCreatedText()


rule "[bastion] gain scrap on damage":
    @Event playerDealtDamage
    @Hero bastion
    @Condition eventPlayer.isAlive() == true
    @Condition eventDamage > 0
    @Condition eventPlayer.bastion_scrap < 6
    @Condition eventPlayer.bastion_scrap_gain_cooldown == false
    @Condition eventPlayer.bastion_mod_active == false

    eventPlayer.bastion_scrap_gain_cooldown = true
    eventPlayer.bastion_scrap += 1
    if eventPlayer.bastion_scrap >= 6:
        eventPlayer.bastion_scrap = 6
        bigMessage(eventPlayer, "非法改装启动")
    else:
        smallMessage(eventPlayer, "废铁：{}/6".format(eventPlayer.bastion_scrap))
    wait(0.45)
    eventPlayer.bastion_scrap_gain_cooldown = false


rule "[bastion] activate scrap modification":
    @Event eachPlayer
    @Hero bastion
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.bastion_scrap >= 6
    @Condition eventPlayer.bastion_mod_active == false

    eventPlayer.bastion_mod_active = true
    eventPlayer.bastion_scrap = 0
    eventPlayer.bastion_mod_roll = random.randint(1, 4)
    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.ORANGE, eventPlayer, 3)
    if eventPlayer.bastion_mod_roll == 1:
        eventPlayer.setDamageDealt(125)
        eventPlayer.setDamageReceived(125)
        eventPlayer.bastion_mod_status_hud_created = true
        hudHeader(eventPlayer, "当前改装：破甲机枪", HudPosition.RIGHT, -799, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING)
        eventPlayer.bastion_mod_status_hud_id = getLastCreatedText()
        playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, Color.ORANGE, eventPlayer, 3)
        bigMessage(eventPlayer, "非法改装：破甲机枪")
        wait(6)
        if eventPlayer.bastion_mod_active == true and eventPlayer.getHero() == Hero.BASTION:
            eventPlayer.setDamageDealt(100)
            eventPlayer.setDamageReceived(100)
            if eventPlayer.bastion_mod_status_hud_created == true:
                destroyHudText(eventPlayer.bastion_mod_status_hud_id)
            eventPlayer.bastion_mod_status_hud_created = false
            eventPlayer.bastion_mod_status_hud_id = null
            eventPlayer.bastion_mod_active = false
    elif eventPlayer.bastion_mod_roll == 2:
        eventPlayer.startScalingSize(1.2)
        eventPlayer.setDamageReceived(70)
        eventPlayer.setMoveSpeed(55)
        eventPlayer.bastion_mod_status_hud_created = true
        hudHeader(eventPlayer, "当前改装：铁皮乌龟", HudPosition.RIGHT, -799, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
        eventPlayer.bastion_mod_status_hud_id = getLastCreatedText()
        playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.WHITE, eventPlayer, 3)
        bigMessage(eventPlayer, "非法改装：铁皮乌龟")
        wait(6)
        if eventPlayer.bastion_mod_active == true and eventPlayer.getHero() == Hero.BASTION:
            eventPlayer.stopScalingSize()
            eventPlayer.setDamageReceived(100)
            eventPlayer.setMoveSpeed(100)
            if eventPlayer.bastion_mod_status_hud_created == true:
                destroyHudText(eventPlayer.bastion_mod_status_hud_id)
            eventPlayer.bastion_mod_status_hud_created = false
            eventPlayer.bastion_mod_status_hud_id = null
            eventPlayer.bastion_mod_active = false
    elif eventPlayer.bastion_mod_roll == 3:
        eventPlayer.startScalingSize(0.65)
        eventPlayer.setMoveSpeed(135)
        eventPlayer.setDamageDealt(75)
        eventPlayer.setKnockbackReceived(160)
        eventPlayer.bastion_mod_status_hud_created = true
        hudHeader(eventPlayer, "当前改装：迷你履带", HudPosition.RIGHT, -799, Color.BLUE, HudReeval.VISIBILITY_AND_STRING)
        eventPlayer.bastion_mod_status_hud_id = getLastCreatedText()
        playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.BLUE, eventPlayer, 2.5)
        bigMessage(eventPlayer, "非法改装：迷你履带")
        wait(6)
        if eventPlayer.bastion_mod_active == true and eventPlayer.getHero() == Hero.BASTION:
            eventPlayer.stopScalingSize()
            eventPlayer.setMoveSpeed(100)
            eventPlayer.setDamageDealt(100)
            eventPlayer.setKnockbackReceived(100)
            if eventPlayer.bastion_mod_status_hud_created == true:
                destroyHudText(eventPlayer.bastion_mod_status_hud_id)
            eventPlayer.bastion_mod_status_hud_created = false
            eventPlayer.bastion_mod_status_hud_id = null
            eventPlayer.bastion_mod_active = false
    else:
        eventPlayer.startScalingSize(1.5)
        eventPlayer.setMoveSpeed(60)
        eventPlayer.setDamageReceived(130)
        eventPlayer.setStatusEffect(null, Status.KNOCKED_DOWN, 0.75)
        eventPlayer.bastion_mod_status_hud_created = true
        hudHeader(eventPlayer, "当前改装：废铁爆仓", HudPosition.RIGHT, -799, Color.RED, HudReeval.VISIBILITY_AND_STRING)
        eventPlayer.bastion_mod_status_hud_id = getLastCreatedText()
        playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, Color.RED, eventPlayer, 3)
        bigMessage(eventPlayer, "非法改装失败：废铁爆仓")
        wait(2)
        if eventPlayer.bastion_mod_active == true and eventPlayer.getHero() == Hero.BASTION:
            eventPlayer.stopScalingSize()
            eventPlayer.setMoveSpeed(100)
            eventPlayer.setDamageReceived(100)
            if eventPlayer.bastion_mod_status_hud_created == true:
                destroyHudText(eventPlayer.bastion_mod_status_hud_id)
            eventPlayer.bastion_mod_status_hud_created = false
            eventPlayer.bastion_mod_status_hud_id = null
            eventPlayer.bastion_mod_active = false


rule "[bastion] clear modification on death keep scrap":
    @Event playerDied
    @Hero bastion

    eventPlayer.bastion_mod_active = false
    eventPlayer.bastion_scrap_gain_cooldown = false
    eventPlayer.bastion_mod_roll = 0
    if eventPlayer.bastion_mod_status_hud_created == true:
        destroyHudText(eventPlayer.bastion_mod_status_hud_id)
    eventPlayer.bastion_mod_status_hud_created = false
    eventPlayer.bastion_mod_status_hud_id = null
    eventPlayer.stopScalingSize()
    eventPlayer.setMoveSpeed(100)
    eventPlayer.setDamageDealt(100)
    eventPlayer.setDamageReceived(100)
    eventPlayer.setKnockbackReceived(100)


rule "[bastion] clear scrap after hero swap":
    @Event eachPlayer
    @Condition eventPlayer.getHero() != Hero.BASTION
    @Condition eventPlayer.bastion_scrap > 0 or eventPlayer.bastion_scrap_gain_cooldown == true or eventPlayer.bastion_mod_active == true or eventPlayer.bastion_scrap_hud_created == true or eventPlayer.bastion_mod_status_hud_created == true

    if eventPlayer.bastion_scrap_hud_created == true:
        destroyHudText(eventPlayer.bastion_scrap_hud_id)
    if eventPlayer.bastion_mod_status_hud_created == true:
        destroyHudText(eventPlayer.bastion_mod_status_hud_id)
    eventPlayer.bastion_scrap = 0
    eventPlayer.bastion_scrap_gain_cooldown = false
    eventPlayer.bastion_mod_active = false
    eventPlayer.bastion_mod_roll = 0
    eventPlayer.bastion_scrap_hud_created = false
    eventPlayer.bastion_scrap_hud_id = null
    eventPlayer.bastion_mod_status_hud_created = false
    eventPlayer.bastion_mod_status_hud_id = null
    eventPlayer.stopScalingSize()
    eventPlayer.setMoveSpeed(100)
    eventPlayer.setDamageDealt(100)
    eventPlayer.setDamageReceived(100)
    eventPlayer.setKnockbackReceived(100)


rule "[ramattra] create pain hud":
    @Event eachPlayer
    @Hero ramattra
    @Condition eventPlayer.ramattra_pain_hud_created == false

    eventPlayer.ramattra_pain_hud_created = true
    hudHeader(eventPlayer, "痛苦：{}/100".format(eventPlayer.ramattra_pain), HudPosition.RIGHT, -750, Color.PURPLE, HudReeval.VISIBILITY_AND_STRING)
    eventPlayer.ramattra_pain_hud_id = getLastCreatedText()


rule "[ramattra] apply overweight on damage":
    @Event playerDealtDamage
    @Hero ramattra
    @Condition eventPlayer.isAlive() == true
    @Condition victim.isAlive() == true
    @Condition victim != eventPlayer
    @Condition eventDamage > 0
    @Condition victim.ramattra_ow_hit_cooldown == false

    victim.ramattra_ow_hit_cooldown = true
    victim.ramattra_ow_source = eventPlayer
    victim.ramattra_ow_original_hero = victim.getHero()
    victim.ramattra_ow_stacks += 1
    victim.ramattra_ow_active = true
    victim.setMoveSpeed(85)
    victim.setGravity(150)
    victim.applyImpulse(Vector.DOWN, 10, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
    playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, Color.PURPLE, victim, 1.5)
    smallMessage(victim, "超重：{}/3".format(victim.ramattra_ow_stacks))
    if eventPlayer.ramattra_pain < 100:
        eventPlayer.ramattra_pain += 6
    if eventPlayer.ramattra_pain >= 100:
        eventPlayer.ramattra_pain = 100
        if eventPlayer.ramattra_pain_ready == false:
            eventPlayer.ramattra_pain_ready = true
            bigMessage(eventPlayer, "痛苦已满")
    wait(0.65)
    victim.ramattra_ow_hit_cooldown = false


rule "[ramattra] overweight temporary slow cleanup":
    @Event eachPlayer
    @Condition eventPlayer.ramattra_ow_active == true

    wait(1.4)
    if eventPlayer.ramattra_ow_active == true:
        eventPlayer.setMoveSpeed(100)
        eventPlayer.setGravity(100)
        eventPlayer.ramattra_ow_active = false


rule "[ramattra] overweight stack window expires":
    @Event eachPlayer
    @Condition eventPlayer.ramattra_ow_stacks > 0
    @Condition eventPlayer.ramattra_ow_window_active == false

    eventPlayer.ramattra_ow_window_active = true
    wait(5)
    if eventPlayer.ramattra_ow_stacks > 0:
        eventPlayer.ramattra_ow_stacks = 0
        eventPlayer.ramattra_ow_active = false
        eventPlayer.setMoveSpeed(100)
        eventPlayer.setGravity(100)
    eventPlayer.ramattra_ow_window_active = false


rule "[ramattra] trigger gravity suppression at three stacks":
    @Event eachPlayer
    @Condition eventPlayer.ramattra_ow_stacks >= 3
    @Condition eventPlayer.ramattra_ow_compress_cooldown == false

    eventPlayer.ramattra_ow_compress_cooldown = true
    eventPlayer.ramattra_ow_stacks = 0
    eventPlayer.ramattra_ow_window_active = false
    eventPlayer.ramattra_ow_active = false
    eventPlayer.setMoveSpeed(100)
    eventPlayer.setGravity(100)
    playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, Color.PURPLE, eventPlayer, 3)
    eventPlayer.setStatusEffect(eventPlayer.ramattra_ow_source, Status.KNOCKED_DOWN, 0.85)
    smallMessage(eventPlayer, "重力压制")
    wait(1.2)
    eventPlayer.ramattra_ow_compress_cooldown = false


rule "[ramattra] pain punch on melee":
    @Event playerDealtDamage
    @Hero ramattra
    @Condition eventPlayer.isAlive() == true
    @Condition victim.isAlive() == true
    @Condition eventPlayer.isMeleeing() == true
    @Condition eventPlayer.ramattra_pain >= 100
    @Condition eventPlayer.ramattra_pain_punch_cooldown == false

    eventPlayer.ramattra_pain_punch_cooldown = true
    eventPlayer.ramattra_pain = 0
    eventPlayer.ramattra_pain_ready = false
    victim.ramattra_ow_source = eventPlayer
    victim.ramattra_ow_original_hero = victim.getHero()
    victim.ramattra_ow_stacks += 2
    victim.ramattra_ow_active = true
    victim.setMoveSpeed(85)
    victim.setGravity(150)
    victim.applyImpulse(Vector.DOWN, 14, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
    playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, Color.PURPLE, victim, 3.5)
    bigMessage(eventPlayer, "痛苦拳")
    smallMessage(victim, "痛苦拳：超重")
    wait(1)
    eventPlayer.ramattra_pain_punch_cooldown = false


rule "[ramattra] place pain core":
    @Event eachPlayer
    @Hero ramattra
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isUsingAbility2() == true
    @Condition eventPlayer.ramattra_core_active == false
    @Condition eventPlayer.ramattra_core_cooldown == false

    eventPlayer.ramattra_core_active = true
    eventPlayer.ramattra_core_cooldown = true
    eventPlayer.ramattra_core_position = eventPlayer.getPosition()
    eventPlayer.ramattra_core_effects = []
    createEffect(getAllPlayers(), Effect.GOOD_AURA, Color.PURPLE, eventPlayer.ramattra_core_position, 4, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.ramattra_core_effects.append(getLastCreatedEntity())
    createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Color.PURPLE, eventPlayer.ramattra_core_position, 4, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.ramattra_core_effects.append(getLastCreatedEntity())
    bigMessage(eventPlayer, "痛苦核心")
    wait(10)
    if eventPlayer.ramattra_core_active == true:
        if len(eventPlayer.ramattra_core_effects) > 0:
            destroyEffect(eventPlayer.ramattra_core_effects[0])
        if len(eventPlayer.ramattra_core_effects) > 1:
            destroyEffect(eventPlayer.ramattra_core_effects[1])
        playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.PURPLE, eventPlayer.ramattra_core_position, 3)
        eventPlayer.ramattra_core_active = false
        eventPlayer.ramattra_core_position = null
        eventPlayer.ramattra_core_effects = []
    wait(5)
    eventPlayer.ramattra_core_cooldown = false


rule "[ramattra] gain pain near core":
    @Event eachPlayer
    @Hero ramattra
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.ramattra_core_active == true
    @Condition eventPlayer.ramattra_pain < 100
    @Condition distance(eventPlayer, eventPlayer.ramattra_core_position) <= 5

    eventPlayer.ramattra_pain += 8
    if eventPlayer.ramattra_pain >= 100:
        eventPlayer.ramattra_pain = 100
        if eventPlayer.ramattra_pain_ready == false:
            eventPlayer.ramattra_pain_ready = true
            bigMessage(eventPlayer, "痛苦已满")
    wait(1)


rule "[ramattra] destroy pain core by melee":
    @Event eachPlayer
    @Condition eventPlayer.isMeleeing() == true
    @Condition len(getPlayersOnHero(Hero.RAMATTRA, Team.ALL).filter(lambda player: player.ramattra_core_active == true and player != eventPlayer and distance(eventPlayer, player.ramattra_core_position) <= 3.2 and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam()))) > 0

    eventPlayer.ramattra_core_destroy_target = sorted(getPlayersOnHero(Hero.RAMATTRA, Team.ALL).filter(lambda player: player.ramattra_core_active == true and player != eventPlayer and distance(eventPlayer, player.ramattra_core_position) <= 3.2 and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())), key=lambda player: distance(eventPlayer, player.ramattra_core_position))[0]
    if len(eventPlayer.ramattra_core_destroy_target.ramattra_core_effects) > 0:
        destroyEffect(eventPlayer.ramattra_core_destroy_target.ramattra_core_effects[0])
    if len(eventPlayer.ramattra_core_destroy_target.ramattra_core_effects) > 1:
        destroyEffect(eventPlayer.ramattra_core_destroy_target.ramattra_core_effects[1])
    playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, Color.PURPLE, eventPlayer.ramattra_core_destroy_target.ramattra_core_position, 3)
    smallMessage(eventPlayer, "摧毁痛苦核心")
    smallMessage(eventPlayer.ramattra_core_destroy_target, "痛苦核心被摧毁")
    eventPlayer.ramattra_core_destroy_target.ramattra_core_active = false
    eventPlayer.ramattra_core_destroy_target.ramattra_core_position = null
    eventPlayer.ramattra_core_destroy_target.ramattra_core_effects = []
    eventPlayer.ramattra_core_destroy_target = null


rule "[ramattra] clear pain gravity on death":
    @Event playerDied
    @Hero ramattra

    if eventPlayer.ramattra_pain_hud_created == true:
        destroyHudText(eventPlayer.ramattra_pain_hud_id)
    if eventPlayer.ramattra_core_active == true:
        if len(eventPlayer.ramattra_core_effects) > 0:
            destroyEffect(eventPlayer.ramattra_core_effects[0])
        if len(eventPlayer.ramattra_core_effects) > 1:
            destroyEffect(eventPlayer.ramattra_core_effects[1])
    eventPlayer.ramattra_pain = 0
    eventPlayer.ramattra_pain_ready = false
    eventPlayer.ramattra_pain_hud_created = false
    eventPlayer.ramattra_pain_hud_id = null
    eventPlayer.ramattra_pain_punch_cooldown = false
    eventPlayer.ramattra_core_active = false
    eventPlayer.ramattra_core_position = null
    eventPlayer.ramattra_core_effects = []
    eventPlayer.ramattra_core_cooldown = false


rule "[ramattra] clear pain gravity after hero swap":
    @Event eachPlayer
    @Condition eventPlayer.getHero() != Hero.RAMATTRA
    @Condition eventPlayer.ramattra_pain > 0 or eventPlayer.ramattra_pain_ready == true or eventPlayer.ramattra_pain_hud_created == true or eventPlayer.ramattra_pain_punch_cooldown == true or eventPlayer.ramattra_core_active == true or eventPlayer.ramattra_core_cooldown == true

    if eventPlayer.ramattra_pain_hud_created == true:
        destroyHudText(eventPlayer.ramattra_pain_hud_id)
    if eventPlayer.ramattra_core_active == true:
        if len(eventPlayer.ramattra_core_effects) > 0:
            destroyEffect(eventPlayer.ramattra_core_effects[0])
        if len(eventPlayer.ramattra_core_effects) > 1:
            destroyEffect(eventPlayer.ramattra_core_effects[1])
    eventPlayer.ramattra_pain = 0
    eventPlayer.ramattra_pain_ready = false
    eventPlayer.ramattra_pain_hud_created = false
    eventPlayer.ramattra_pain_hud_id = null
    eventPlayer.ramattra_pain_punch_cooldown = false
    eventPlayer.ramattra_core_active = false
    eventPlayer.ramattra_core_position = null
    eventPlayer.ramattra_core_effects = []
    eventPlayer.ramattra_core_cooldown = false


rule "[ramattra] clear overweight after target death or hero swap":
    @Event eachPlayer
    @Condition eventPlayer.ramattra_ow_stacks > 0 or eventPlayer.ramattra_ow_active == true or eventPlayer.ramattra_ow_hit_cooldown == true or eventPlayer.ramattra_ow_window_active == true or eventPlayer.ramattra_ow_compress_cooldown == true
    @Condition eventPlayer.isDead() == true or (eventPlayer.ramattra_ow_original_hero != null and eventPlayer.getHero() != eventPlayer.ramattra_ow_original_hero)

    eventPlayer.ramattra_ow_stacks = 0
    eventPlayer.ramattra_ow_window_active = false
    eventPlayer.ramattra_ow_hit_cooldown = false
    eventPlayer.ramattra_ow_compress_cooldown = false
    eventPlayer.ramattra_ow_active = false
    eventPlayer.ramattra_ow_original_hero = null
    eventPlayer.ramattra_ow_source = null
    eventPlayer.setMoveSpeed(100)
    eventPlayer.setGravity(100)


rule "[sigma] release small black hole":
    @Event eachPlayer
    @Hero sigma
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isUsingAbility1() == true
    @Condition eventPlayer.sigma_black_hole_active == false
    @Condition eventPlayer.sigma_black_hole_cooldown == false

    eventPlayer.sigma_black_hole_active = true
    eventPlayer.sigma_black_hole_cooldown = true
    eventPlayer.sigma_black_hole_tick = 0
    eventPlayer.sigma_black_hole_effects = []
    eventPlayer.sigma_black_hole_position = eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * 8
    if eventPlayer.sigma_black_hole_position != null:
        getPlayersInRadius(eventPlayer.sigma_black_hole_position, 8, Team.ALL).sigma_black_hole_damage_taken = 0
    createEffect(getAllPlayers(), Effect.GOOD_AURA, Color.PURPLE, eventPlayer.sigma_black_hole_position, 6, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.sigma_black_hole_effects.append(getLastCreatedEntity())
    createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Color.BLUE, eventPlayer.sigma_black_hole_position, 6, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.sigma_black_hole_effects.append(getLastCreatedEntity())
    bigMessage(eventPlayer, "小黑洞展开")
    while eventPlayer.sigma_black_hole_active == true and eventPlayer.isAlive() == true and eventPlayer.getHero() == Hero.SIGMA and eventPlayer.sigma_black_hole_tick < 6:
        getPlayersInRadius(eventPlayer.sigma_black_hole_position, 6, Team.ALL).filter(lambda player: player != eventPlayer and player.isAlive() == true).applyImpulse(directionTowards(getPlayersInRadius(eventPlayer.sigma_black_hole_position, 6, Team.ALL).filter(lambda player: player != eventPlayer and player.isAlive() == true).getPosition(), eventPlayer.sigma_black_hole_position), 4, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
        if len(getPlayersInRadius(eventPlayer.sigma_black_hole_position, 2, Team.ALL).filter(lambda player: player != eventPlayer and player.isAlive() == true and player.sigma_black_hole_damage_taken < 40)) > 0:
            damage(getPlayersInRadius(eventPlayer.sigma_black_hole_position, 2, Team.ALL).filter(lambda player: player != eventPlayer and player.isAlive() == true and player.sigma_black_hole_damage_taken < 40), eventPlayer, 5)
            getPlayersInRadius(eventPlayer.sigma_black_hole_position, 2, Team.ALL).filter(lambda player: player != eventPlayer and player.isAlive() == true and player.sigma_black_hole_damage_taken < 40).sigma_black_hole_damage_taken += 5
        wait(0.5)
        eventPlayer.sigma_black_hole_tick += 1
    if eventPlayer.sigma_black_hole_active == true:
        if len(eventPlayer.sigma_black_hole_effects) > 0:
            destroyEffect(eventPlayer.sigma_black_hole_effects[0])
        if len(eventPlayer.sigma_black_hole_effects) > 1:
            destroyEffect(eventPlayer.sigma_black_hole_effects[1])
        playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, Color.PURPLE, eventPlayer.sigma_black_hole_position, 4)
        getPlayersInRadius(eventPlayer.sigma_black_hole_position, 6, Team.ALL).filter(lambda player: player != eventPlayer and player.isAlive() == true).applyImpulse(directionTowards(eventPlayer.sigma_black_hole_position, getPlayersInRadius(eventPlayer.sigma_black_hole_position, 6, Team.ALL).filter(lambda player: player != eventPlayer and player.isAlive() == true).getPosition()), 14, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
        damage(getPlayersInRadius(eventPlayer.sigma_black_hole_position, 6, Team.ALL).filter(lambda player: player != eventPlayer and player.isAlive() == true), eventPlayer, 10)
    if eventPlayer.sigma_black_hole_position != null:
        getPlayersInRadius(eventPlayer.sigma_black_hole_position, 8, Team.ALL).sigma_black_hole_damage_taken = 0
    eventPlayer.sigma_black_hole_active = false
    eventPlayer.sigma_black_hole_position = null
    eventPlayer.sigma_black_hole_effects = []
    eventPlayer.sigma_black_hole_tick = 0
    wait(5)
    eventPlayer.sigma_black_hole_cooldown = false


rule "[sigma] clear small black hole on death":
    @Event playerDied
    @Hero sigma

    if eventPlayer.sigma_black_hole_active == true:
        if len(eventPlayer.sigma_black_hole_effects) > 0:
            destroyEffect(eventPlayer.sigma_black_hole_effects[0])
        if len(eventPlayer.sigma_black_hole_effects) > 1:
            destroyEffect(eventPlayer.sigma_black_hole_effects[1])
        if eventPlayer.sigma_black_hole_position != null:
            getPlayersInRadius(eventPlayer.sigma_black_hole_position, 8, Team.ALL).sigma_black_hole_damage_taken = 0
    eventPlayer.sigma_black_hole_active = false
    eventPlayer.sigma_black_hole_cooldown = false
    eventPlayer.sigma_black_hole_position = null
    eventPlayer.sigma_black_hole_effects = []
    eventPlayer.sigma_black_hole_tick = 0
    eventPlayer.sigma_grasp_was_active = false
    eventPlayer.sigma_burst_cd = false
    eventPlayer.sigma_burst_pos = null


rule "[sigma] clear small black hole after hero swap":
    @Event eachPlayer
    @Condition eventPlayer.getHero() != Hero.SIGMA
    @Condition eventPlayer.sigma_black_hole_active == true or eventPlayer.sigma_black_hole_cooldown == true or eventPlayer.sigma_grasp_was_active == true or eventPlayer.sigma_burst_cd == true

    if eventPlayer.sigma_black_hole_active == true:
        if len(eventPlayer.sigma_black_hole_effects) > 0:
            destroyEffect(eventPlayer.sigma_black_hole_effects[0])
        if len(eventPlayer.sigma_black_hole_effects) > 1:
            destroyEffect(eventPlayer.sigma_black_hole_effects[1])
        if eventPlayer.sigma_black_hole_position != null:
            getPlayersInRadius(eventPlayer.sigma_black_hole_position, 8, Team.ALL).sigma_black_hole_damage_taken = 0
    eventPlayer.sigma_black_hole_active = false
    eventPlayer.sigma_black_hole_cooldown = false
    eventPlayer.sigma_black_hole_position = null
    eventPlayer.sigma_black_hole_effects = []
    eventPlayer.sigma_black_hole_tick = 0
    eventPlayer.sigma_grasp_was_active = false
    eventPlayer.sigma_burst_cd = false
    eventPlayer.sigma_burst_pos = null


rule "[sigma] remember kinetic grasp active":
    @Event eachPlayer
    @Hero sigma
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isUsingAbility1() == true

    eventPlayer.sigma_grasp_was_active = true


rule "[sigma] kinetic grasp release gravity burst":
    @Event eachPlayer
    @Hero sigma
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isUsingAbility1() == false
    @Condition eventPlayer.sigma_grasp_was_active == true
    @Condition eventPlayer.sigma_burst_cd == false

    eventPlayer.sigma_grasp_was_active = false
    eventPlayer.sigma_burst_cd = true
    eventPlayer.sigma_burst_pos = eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * 3.5
    playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, Color.BLUE, eventPlayer.sigma_burst_pos, 3)
    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.PURPLE, eventPlayer.sigma_burst_pos, 2)
    getPlayersInRadius(eventPlayer.sigma_burst_pos, 4, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true).applyImpulse(directionTowards(eventPlayer.sigma_burst_pos, getPlayersInRadius(eventPlayer.sigma_burst_pos, 4, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true).getPosition()), 8, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
    damage(getPlayersInRadius(eventPlayer.sigma_burst_pos, 4, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true), eventPlayer, 12)
    getPlayersInRadius(eventPlayer.sigma_burst_pos, 4, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true).setMoveSpeed(85)
    wait(1)
    getPlayersInRadius(eventPlayer.sigma_burst_pos, 5, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true).setMoveSpeed(100)
    eventPlayer.sigma_burst_pos = null
    wait(0.8)
    eventPlayer.sigma_burst_cd = false


rule "[reaper] disable secondary fire":
    @Event eachPlayer
    @Hero reaper
    @Condition eventPlayer.disabled_secondary_fire == false

    eventPlayer.disallowButton(Button.SECONDARY_FIRE)
    eventPlayer.disabled_secondary_fire = true


rule "[winston] disable secondary fire":
    @Event eachPlayer
    @Hero winston
    @Condition eventPlayer.disabled_secondary_fire == false

    eventPlayer.disallowButton(Button.SECONDARY_FIRE)
    eventPlayer.disabled_secondary_fire = true


rule "[reaper and winston] restore secondary fire after hero swap":
    @Event eachPlayer
    @Condition eventPlayer.getHero() != Hero.REAPER
    @Condition eventPlayer.getHero() != Hero.WINSTON
    @Condition eventPlayer.disabled_secondary_fire == true

    eventPlayer.allowButton(Button.SECONDARY_FIRE)
    eventPlayer.disabled_secondary_fire = false


rule "[zenyatta] initialize element":
    @Event eachPlayer
    @Hero zenyatta
    @Condition eventPlayer.zen_element == 0

    eventPlayer.zen_element = 1
    smallMessage(eventPlayer, "当前元素：火")


rule "[zenyatta] cycle element on reload":
    @Event eachPlayer
    @Hero zenyatta
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isHoldingButton(Button.RELOAD) == true
    @Condition eventPlayer.zen_reload_lock == false

    eventPlayer.zen_reload_lock = true
    if eventPlayer.zen_element == 1:
        eventPlayer.zen_element = 2
        playEffect(eventPlayer, DynamicEffect.GOOD_EXPLOSION, Color.BLUE, eventPlayer, 1.5)
        smallMessage(eventPlayer, "当前元素：冰")
    elif eventPlayer.zen_element == 2:
        eventPlayer.zen_element = 3
        playEffect(eventPlayer, DynamicEffect.GOOD_EXPLOSION, Color.AQUA, eventPlayer, 1.5)
        smallMessage(eventPlayer, "当前元素：雷")
    else:
        eventPlayer.zen_element = 1
        playEffect(eventPlayer, DynamicEffect.GOOD_EXPLOSION, Color.ORANGE, eventPlayer, 1.5)
        smallMessage(eventPlayer, "当前元素：火")
    waitUntil(eventPlayer.isHoldingButton(Button.RELOAD) == false, 2)
    eventPlayer.zen_reload_lock = false


rule "[zenyatta] elemental primary hit":
    @Event playerDealtDamage
    @Hero zenyatta
    @Condition eventPlayer.isAlive() == true
    @Condition victim.isAlive() == true
    @Condition victim != eventPlayer
    @Condition eventDamage > 0
    @Condition eventPlayer.zen_hit_cd == false
    @Condition eventPlayer.zen_right_cd == false
    @Condition eventPlayer.zen_ult_cd == false

    eventPlayer.zen_hit_cd = true
    if eventPlayer.zen_element == 1:
        playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, Color.ORANGE, victim, 1.5)
        damage(victim, eventPlayer, 6)
    elif eventPlayer.zen_element == 2:
        playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.BLUE, victim, 1.5)
        damage(victim, eventPlayer, 4)
        if victim.zen_slow_active == false:
            victim.zen_slow_active = true
            victim.zen_slow_timer = true
            victim.zen_slow_hero = victim.getHero()
            victim.setMoveSpeed(80)
    else:
        playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.AQUA, victim, 1.5)
        damage(victim, eventPlayer, 5)
        if len(getPlayersInRadius(victim.getPosition(), 3, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != victim and player != eventPlayer and player.isAlive() == true)) > 0:
            eventPlayer.zen_chain_target = sorted(getPlayersInRadius(victim.getPosition(), 3, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != victim and player != eventPlayer and player.isAlive() == true), key=lambda player: distance(victim, player))[0]
            damage(eventPlayer.zen_chain_target, eventPlayer, 4)
            playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.AQUA, eventPlayer.zen_chain_target, 1)
            eventPlayer.zen_chain_target = null
    wait(0.22)
    eventPlayer.zen_hit_cd = false


rule "[zenyatta] restore frost slow":
    @Event eachPlayer
    @Condition eventPlayer.zen_slow_active == true
    @Condition eventPlayer.zen_slow_timer == true

    wait(1)
    if eventPlayer.zen_slow_active == true and eventPlayer.getHero() == eventPlayer.zen_slow_hero:
        eventPlayer.setMoveSpeed(100)
    eventPlayer.zen_slow_active = false
    eventPlayer.zen_slow_timer = false
    eventPlayer.zen_slow_hero = null


rule "[zenyatta] elemental secondary skill":
    @Event eachPlayer
    @Hero zenyatta
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isHoldingButton(Button.SECONDARY_FIRE) == true
    @Condition eventPlayer.zen_right_cd == false

    eventPlayer.zen_right_cd = true
    eventPlayer.zen_skill_pos = eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * 8
    if eventPlayer.zen_element == 1:
        playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, Color.ORANGE, eventPlayer.zen_skill_pos, 3)
        damage(getPlayersInRadius(eventPlayer.zen_skill_pos, 3.5, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true), eventPlayer, 8)
    elif eventPlayer.zen_element == 2:
        playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.BLUE, eventPlayer.zen_skill_pos, 3)
        damage(getPlayersInRadius(eventPlayer.zen_skill_pos, 3.5, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true), eventPlayer, 4)
        getPlayersInRadius(eventPlayer.zen_skill_pos, 3.5, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and player.zen_slow_active == false).zen_slow_active = true
        getPlayersInRadius(eventPlayer.zen_skill_pos, 3.5, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and player.zen_slow_timer == false).zen_slow_timer = true
        getPlayersInRadius(eventPlayer.zen_skill_pos, 3.5, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true).zen_slow_hero = getPlayersInRadius(eventPlayer.zen_skill_pos, 3.5, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true).getHero()
        getPlayersInRadius(eventPlayer.zen_skill_pos, 3.5, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true).setMoveSpeed(75)
    else:
        eventPlayer.zen_fx = []
        createEffect(getAllPlayers(), Effect.GOOD_AURA, Color.AQUA, eventPlayer.zen_skill_pos, 4, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
        eventPlayer.zen_fx.append(getLastCreatedEntity())
        createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Color.BLUE, eventPlayer.zen_skill_pos, 4, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
        eventPlayer.zen_fx.append(getLastCreatedEntity())
        createBeam(getAllPlayers(), Beam.GOOD, eventPlayer, eventPlayer.zen_skill_pos, Color.AQUA, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
        eventPlayer.zen_fx.append(getLastCreatedEntity())
        playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.AQUA, eventPlayer.zen_skill_pos, 2)
        damage(getPlayersInRadius(eventPlayer.zen_skill_pos, 4, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true), eventPlayer, 5)
        wait(0.6)
        playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.AQUA, eventPlayer.zen_skill_pos, 2)
        damage(getPlayersInRadius(eventPlayer.zen_skill_pos, 4, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true), eventPlayer, 5)
        wait(0.6)
        playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.AQUA, eventPlayer.zen_skill_pos, 2)
        damage(getPlayersInRadius(eventPlayer.zen_skill_pos, 4, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true), eventPlayer, 5)
        wait(0.6)
        if len(eventPlayer.zen_fx) > 0:
            destroyEffect(eventPlayer.zen_fx[0])
        if len(eventPlayer.zen_fx) > 1:
            destroyEffect(eventPlayer.zen_fx[1])
        if len(eventPlayer.zen_fx) > 2:
            destroyEffect(eventPlayer.zen_fx[2])
        eventPlayer.zen_fx = []
    eventPlayer.zen_skill_pos = null
    wait(1.2)
    eventPlayer.zen_right_cd = false


rule "[zenyatta] holy ult warning and strike":
    @Event eachPlayer
    @Hero zenyatta
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.getUltCharge() == 100
    @Condition eventPlayer.isHoldingButton(Button.ULTIMATE) == true
    @Condition eventPlayer.zen_ult_cd == false

    eventPlayer.zen_ult_cd = true
    eventPlayer.zen_skill_pos = eventPlayer.getPosition()
    eventPlayer.zen_fx = []
    createEffect(getAllPlayers(), Effect.GOOD_AURA, Color.YELLOW, eventPlayer.zen_skill_pos, 6, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.zen_fx.append(getLastCreatedEntity())
    createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Color.YELLOW, eventPlayer.zen_skill_pos, 6, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.zen_fx.append(getLastCreatedEntity())
    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.YELLOW, eventPlayer.zen_skill_pos, 6)
    wait(0.25)
    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.YELLOW, eventPlayer.zen_skill_pos, 6)
    wait(0.25)
    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.YELLOW, eventPlayer.zen_skill_pos, 6)
    wait(0.35)
    createBeam(getAllPlayers(), Beam.GOOD, eventPlayer.zen_skill_pos + Vector.UP * 18, eventPlayer.zen_skill_pos, Color.YELLOW, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.zen_fx.append(getLastCreatedEntity())
    createBeam(getAllPlayers(), Beam.GOOD, eventPlayer.zen_skill_pos + Vector.UP * 18, eventPlayer.zen_skill_pos, Color.YELLOW, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.zen_fx.append(getLastCreatedEntity())
    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.YELLOW, eventPlayer.zen_skill_pos, 6)
    damage(getPlayersInRadius(eventPlayer.zen_skill_pos, 6, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true), eventPlayer, 10)
    wait(0.2)
    if len(eventPlayer.zen_fx) > 0:
        destroyEffect(eventPlayer.zen_fx[0])
    if len(eventPlayer.zen_fx) > 1:
        destroyEffect(eventPlayer.zen_fx[1])
    if len(eventPlayer.zen_fx) > 2:
        destroyEffect(eventPlayer.zen_fx[2])
    if len(eventPlayer.zen_fx) > 3:
        destroyEffect(eventPlayer.zen_fx[3])
    if len(eventPlayer.zen_fx) > 2:
        destroyEffect(eventPlayer.zen_fx[2])
    if len(eventPlayer.zen_fx) > 3:
        destroyEffect(eventPlayer.zen_fx[3])
    eventPlayer.zen_fx = []
    eventPlayer.zen_skill_pos = null
    wait(3)
    eventPlayer.zen_ult_cd = false


rule "[zenyatta] clear elemental state on death":
    @Event playerDied
    @Hero zenyatta

    if len(eventPlayer.zen_fx) > 0:
        destroyEffect(eventPlayer.zen_fx[0])
    if len(eventPlayer.zen_fx) > 1:
        destroyEffect(eventPlayer.zen_fx[1])
    if len(eventPlayer.zen_fx) > 2:
        destroyEffect(eventPlayer.zen_fx[2])
    if len(eventPlayer.zen_fx) > 3:
        destroyEffect(eventPlayer.zen_fx[3])
    eventPlayer.zen_element = 0
    eventPlayer.zen_reload_lock = false
    eventPlayer.zen_hit_cd = false
    eventPlayer.zen_right_cd = false
    eventPlayer.zen_ult_cd = false
    eventPlayer.zen_skill_pos = null
    eventPlayer.zen_fx = []
    eventPlayer.zen_chain_target = null


rule "[zenyatta] clear elemental state after hero swap":
    @Event eachPlayer
    @Condition eventPlayer.getHero() != Hero.ZENYATTA
    @Condition eventPlayer.zen_element != 0 or eventPlayer.zen_reload_lock == true or eventPlayer.zen_hit_cd == true or eventPlayer.zen_right_cd == true or eventPlayer.zen_ult_cd == true

    if len(eventPlayer.zen_fx) > 0:
        destroyEffect(eventPlayer.zen_fx[0])
    if len(eventPlayer.zen_fx) > 1:
        destroyEffect(eventPlayer.zen_fx[1])
    eventPlayer.zen_element = 0
    eventPlayer.zen_reload_lock = false
    eventPlayer.zen_hit_cd = false
    eventPlayer.zen_right_cd = false
    eventPlayer.zen_ult_cd = false
    eventPlayer.zen_skill_pos = null
    eventPlayer.zen_fx = []
    eventPlayer.zen_chain_target = null


rule "[zenyatta] clear slow on target death or hero swap":
    @Event eachPlayer
    @Condition eventPlayer.zen_slow_active == true or eventPlayer.zen_slow_timer == true
    @Condition eventPlayer.isDead() == true or (eventPlayer.zen_slow_hero != null and eventPlayer.getHero() != eventPlayer.zen_slow_hero)

    eventPlayer.setMoveSpeed(100)
    eventPlayer.zen_slow_active = false
    eventPlayer.zen_slow_timer = false
    eventPlayer.zen_slow_hero = null


rule "[reaper] leave soul anchor on final blow":
    @Event playerDealtFinalBlow
    @Hero reaper
    @Condition eventPlayer.isAlive() == true

    if eventPlayer.reaper_anchor_active == true:
        if len(eventPlayer.reaper_anchor_fx) > 0:
            destroyEffect(eventPlayer.reaper_anchor_fx[0])
        if len(eventPlayer.reaper_anchor_fx) > 1:
            destroyEffect(eventPlayer.reaper_anchor_fx[1])
    eventPlayer.reaper_anchor_active = true
    eventPlayer.reaper_anchor_timer = 7
    eventPlayer.reaper_anchor_pos = victim.getPosition()
    eventPlayer.reaper_anchor_fx = []
    createEffect(getAllPlayers(), Effect.BAD_AURA, Color.BLACK, eventPlayer.reaper_anchor_pos, 3, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.reaper_anchor_fx.append(getLastCreatedEntity())
    createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Color.PURPLE, eventPlayer.reaper_anchor_pos, 3, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.reaper_anchor_fx.append(getLastCreatedEntity())
    playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, Color.BLACK, eventPlayer.reaper_anchor_pos, 2)
    smallMessage(eventPlayer, "亡魂锚点已生成，按 E 借魂追猎")


rule "[reaper] soul anchor timer":
    @Event eachPlayer
    @Hero reaper
    @Condition eventPlayer.reaper_anchor_active == true
    @Condition eventPlayer.reaper_anchor_timer > 0
    @Condition eventPlayer.reaper_anchor_timer_on == false

    eventPlayer.reaper_anchor_timer_on = true
    while eventPlayer.reaper_anchor_active == true and eventPlayer.reaper_anchor_timer > 0 and eventPlayer.isAlive() == true and eventPlayer.getHero() == Hero.REAPER:
        wait(1)
        eventPlayer.reaper_anchor_timer -= 1
    if eventPlayer.reaper_anchor_active == true and eventPlayer.reaper_anchor_timer <= 0:
        if len(eventPlayer.reaper_anchor_fx) > 0:
            destroyEffect(eventPlayer.reaper_anchor_fx[0])
        if len(eventPlayer.reaper_anchor_fx) > 1:
            destroyEffect(eventPlayer.reaper_anchor_fx[1])
        eventPlayer.reaper_anchor_active = false
        eventPlayer.reaper_anchor_pos = null
        eventPlayer.reaper_anchor_fx = []
        smallMessage(eventPlayer, "亡魂锚点消散")
    eventPlayer.reaper_anchor_timer = 0
    eventPlayer.reaper_anchor_timer_on = false


rule "[reaper] soul hunt to anchor":
    @Event eachPlayer
    @Hero reaper
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isUsingAbility2() == true
    @Condition eventPlayer.reaper_anchor_active == true
    @Condition eventPlayer.reaper_hunt_cd == false

    eventPlayer.reaper_hunt_cd = true
    eventPlayer.reaper_hunt_active = true
    eventPlayer.reaper_hunt_fx = []
    if len(eventPlayer.reaper_anchor_fx) > 0:
        destroyEffect(eventPlayer.reaper_anchor_fx[0])
    if len(eventPlayer.reaper_anchor_fx) > 1:
        destroyEffect(eventPlayer.reaper_anchor_fx[1])
    playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, Color.BLACK, eventPlayer, 2)
    eventPlayer.teleport(eventPlayer.reaper_anchor_pos)
    eventPlayer.reaper_anchor_active = false
    eventPlayer.reaper_anchor_timer = 0
    eventPlayer.reaper_anchor_timer_on = false
    eventPlayer.reaper_anchor_pos = null
    eventPlayer.reaper_anchor_fx = []
    playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, Color.PURPLE, eventPlayer, 4)
    createEffect(getAllPlayers(), Effect.BAD_AURA, Color.BLACK, eventPlayer, 5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.reaper_hunt_fx.append(getLastCreatedEntity())
    createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Color.PURPLE, eventPlayer, 5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.reaper_hunt_fx.append(getLastCreatedEntity())
    getPlayersInRadius(eventPlayer.getPosition(), 5, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true).setStatusEffect(eventPlayer, Status.HACKED, 1.25)
    eventPlayer.setStatusEffect(null, Status.INVINCIBLE, 0.6)
    eventPlayer.setMoveSpeed(115)
    bigMessage(eventPlayer, "借魂追猎")
    wait(2)
    if len(eventPlayer.reaper_hunt_fx) > 0:
        destroyEffect(eventPlayer.reaper_hunt_fx[0])
    if len(eventPlayer.reaper_hunt_fx) > 1:
        destroyEffect(eventPlayer.reaper_hunt_fx[1])
    eventPlayer.reaper_hunt_fx = []
    eventPlayer.setMoveSpeed(100)
    eventPlayer.reaper_hunt_active = false
    wait(4)
    eventPlayer.reaper_hunt_cd = false


rule "[reaper] clear soul hunt on death":
    @Event playerDied
    @Hero reaper

    if eventPlayer.reaper_anchor_active == true:
        if len(eventPlayer.reaper_anchor_fx) > 0:
            destroyEffect(eventPlayer.reaper_anchor_fx[0])
        if len(eventPlayer.reaper_anchor_fx) > 1:
            destroyEffect(eventPlayer.reaper_anchor_fx[1])
    if eventPlayer.reaper_hunt_active == true:
        if len(eventPlayer.reaper_hunt_fx) > 0:
            destroyEffect(eventPlayer.reaper_hunt_fx[0])
        if len(eventPlayer.reaper_hunt_fx) > 1:
            destroyEffect(eventPlayer.reaper_hunt_fx[1])
    eventPlayer.reaper_anchor_active = false
    eventPlayer.reaper_anchor_pos = null
    eventPlayer.reaper_anchor_fx = []
    eventPlayer.reaper_anchor_timer = 0
    eventPlayer.reaper_anchor_timer_on = false
    eventPlayer.reaper_hunt_cd = false
    eventPlayer.reaper_hunt_active = false
    eventPlayer.reaper_hunt_fx = []
    eventPlayer.setMoveSpeed(100)


rule "[reaper] clear soul hunt after hero swap":
    @Event eachPlayer
    @Condition eventPlayer.getHero() != Hero.REAPER
    @Condition eventPlayer.reaper_anchor_active == true or eventPlayer.reaper_hunt_active == true or eventPlayer.reaper_hunt_cd == true or eventPlayer.reaper_anchor_timer_on == true

    if eventPlayer.reaper_anchor_active == true:
        if len(eventPlayer.reaper_anchor_fx) > 0:
            destroyEffect(eventPlayer.reaper_anchor_fx[0])
        if len(eventPlayer.reaper_anchor_fx) > 1:
            destroyEffect(eventPlayer.reaper_anchor_fx[1])
    if eventPlayer.reaper_hunt_active == true:
        if len(eventPlayer.reaper_hunt_fx) > 0:
            destroyEffect(eventPlayer.reaper_hunt_fx[0])
        if len(eventPlayer.reaper_hunt_fx) > 1:
            destroyEffect(eventPlayer.reaper_hunt_fx[1])
    eventPlayer.reaper_anchor_active = false
    eventPlayer.reaper_anchor_pos = null
    eventPlayer.reaper_anchor_fx = []
    eventPlayer.reaper_anchor_timer = 0
    eventPlayer.reaper_anchor_timer_on = false
    eventPlayer.reaper_hunt_cd = false
    eventPlayer.reaper_hunt_active = false
    eventPlayer.reaper_hunt_fx = []
    eventPlayer.setMoveSpeed(100)


rule "弗让你飞起来":
    @Event eachPlayer
    @Hero freja
    #@Condition eventPlayer.isHoldingButton(Button.JUMP) == true
    @Disabled

    getPlayersInRadius(eventPlayer.getEyePosition(), 5, Team.ALL).setKnockbackReceived(100)


rule "76长时间变大":
    @Event eachPlayer
    @Hero soldier
    @Condition eventPlayer.Y >= 8
    @Disabled

    eventPlayer.startDamageOverTime(null, eventPlayer.isAlive(), 30)


rule "激素让我安全":
    @Event eachPlayer
    @Hero ana
    @Condition eventPlayer.getUltCharge() == 100
    @Condition eventPlayer.isHoldingButton(Button.ULTIMATE) == true

    getPlayersInRadius(vect(eventPlayer.getPlayersInViewAngle(Team.ALL, 45), 5, 5), 5, Team.ALL, LosCheck.SURFACES).setStatusEffect(null, Status.ASLEEP, 3)


rule "雾子法阵击倒":
    @Event eachPlayer
    @Hero kiriko
    @Condition eventPlayer.isUsingAbility2() == true

    eventPlayer.D = []
    createBeam(getAllPlayers(), Beam.GOOD, eventPlayer, eventPlayer, Color.ORANGE, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.D.append(getLastCreatedEntity())
    createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Color.VIOLET, eventPlayer, 7, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.D.append(getLastCreatedEntity())
    createEffect(getAllPlayers(), Effect.BAD_AURA, Color.BLACK, eventPlayer, 7, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.D.append(getLastCreatedEntity())
    eventPlayer.Kiriko_Skill = true
    getPlayersInRadius(getLivingPlayers(getOppositeTeam(Team.ALL)), 7, Team.ALL, LosCheck.SURFACES_AND_ALL_BARRIERS).setStatusEffect(eventPlayer, Status.KNOCKED_DOWN, 1)
    wait(5)
    eventPlayer.Kiriko_Skill = false
    destroyEffect(eventPlayer.D[0])
    destroyEffect(eventPlayer.D[1])
    destroyEffect(eventPlayer.D[2])
    eventPlayer.D = []


rule "[mei] freeze target on damage chance":
    @Event playerDealtDamage
    @Hero mei

    if random.randint(1, 100) <= 20:
        victim.setStatusEffect(eventPlayer, Status.FROZEN, 1)
        smallMessage(eventPlayer, "小美冰冻触发")


rule "[baptiste] mirror matrix trigger":
    @Event eachPlayer
    @Hero baptiste
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.baptiste_mirror_active == false
    @Condition eventPlayer.getUltCharge() == 100
    @Condition eventPlayer.isHoldingButton(Button.ULTIMATE) == true

    eventPlayer.baptiste_mirror_active = true
    eventPlayer.baptiste_mirror_roll = random.randint(1, 4)
    getPlayersInRadius(eventPlayer.getPosition(), 8, Team.ALL).filter(lambda player: player.baptiste_mirror_target_active == false).baptiste_mirror_roll = eventPlayer.baptiste_mirror_roll
    getPlayersInRadius(eventPlayer.getPosition(), 8, Team.ALL).filter(lambda player: player.baptiste_mirror_target_active == false).baptiste_mirror_target_active = true
    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.BLUE, eventPlayer, 8)
    smallMessage(eventPlayer, "增幅矩阵哈哈镜")
    wait(6)
    eventPlayer.baptiste_mirror_active = false


rule "[baptiste] mirror giant effect":
    @Event eachPlayer
    @Condition eventPlayer.baptiste_mirror_target_active == true
    @Condition eventPlayer.baptiste_mirror_roll == 1

    eventPlayer.startScalingSize(20)
    eventPlayer.setMoveSpeed(80)
    eventPlayer.setDamageDealt(115)
    eventPlayer.setKnockbackReceived(130)
    smallMessage(eventPlayer, "哈哈镜：巨人")
    wait(6)
    eventPlayer.stopScalingSize()
    eventPlayer.setMoveSpeed(100)
    eventPlayer.setDamageDealt(100)
    eventPlayer.setDamageReceived(100)
    eventPlayer.setKnockbackReceived(100)
    eventPlayer.baptiste_mirror_target_active = false


rule "[baptiste] mirror tiny effect":
    @Event eachPlayer
    @Condition eventPlayer.baptiste_mirror_target_active == true
    @Condition eventPlayer.baptiste_mirror_roll == 2

    eventPlayer.startScalingSize(0.01)
    eventPlayer.setMoveSpeed(130)
    eventPlayer.setDamageDealt(70)
    eventPlayer.setKnockbackReceived(160)
    smallMessage(eventPlayer, "哈哈镜：小人")
    wait(6)
    eventPlayer.stopScalingSize()
    eventPlayer.setMoveSpeed(100)
    eventPlayer.setDamageDealt(100)
    eventPlayer.setDamageReceived(100)
    eventPlayer.setKnockbackReceived(100)
    eventPlayer.baptiste_mirror_target_active = false


rule "[baptiste] mirror glass effect":
    @Event eachPlayer
    @Condition eventPlayer.baptiste_mirror_target_active == true
    @Condition eventPlayer.baptiste_mirror_roll == 3

    eventPlayer.startScalingSize(0.85)
    eventPlayer.setMoveSpeed(140)
    eventPlayer.setDamageDealt(110)
    eventPlayer.setDamageReceived(130)
    smallMessage(eventPlayer, "哈哈镜：玻璃人")
    wait(6)
    eventPlayer.stopScalingSize()
    eventPlayer.setMoveSpeed(100)
    eventPlayer.setDamageDealt(100)
    eventPlayer.setDamageReceived(100)
    eventPlayer.setKnockbackReceived(100)
    eventPlayer.baptiste_mirror_target_active = false


rule "[baptiste] mirror iron effect":
    @Event eachPlayer
    @Condition eventPlayer.baptiste_mirror_target_active == true
    @Condition eventPlayer.baptiste_mirror_roll == 4

    eventPlayer.startScalingSize(1.25)
    eventPlayer.setMoveSpeed(75)
    eventPlayer.setDamageDealt(75)
    eventPlayer.setDamageReceived(70)
    smallMessage(eventPlayer, "哈哈镜：铁块")
    wait(6)
    eventPlayer.stopScalingSize()
    eventPlayer.setMoveSpeed(100)
    eventPlayer.setDamageDealt(100)
    eventPlayer.setDamageReceived(100)
    eventPlayer.setKnockbackReceived(100)
    eventPlayer.baptiste_mirror_target_active = false


rule "[baptiste] clear mirror active on death":
    @Event playerDied
    @Hero baptiste

    eventPlayer.baptiste_mirror_active = false


rule "[baptiste] clear mirror active after hero swap":
    @Event eachPlayer
    @Condition eventPlayer.getHero() != Hero.BAPTISTE
    @Condition eventPlayer.baptiste_mirror_active == true

    eventPlayer.baptiste_mirror_active = false


rule "[baptiste] fake drug injection":
    @Event playerDealtDamage
    @Hero baptiste
    @Condition victim.isAlive() == true
    @Condition eventPlayer.baptiste_fake_drug_cooldown == false
    @Condition victim.baptiste_drug_target_active == false

    if random.randint(1, 100) <= 18:
        eventPlayer.baptiste_fake_drug_cooldown = true
        victim.baptiste_drug_target_active = true
        victim.baptiste_fake_drug_roll = random.randint(1, 4)
        playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, Color.YELLOW, victim, 1.5)
        smallMessage(eventPlayer, "假药注射成功")
        if victim.baptiste_fake_drug_roll == 1:
            victim.startScalingSize(1.35)
            victim.setMoveSpeed(85)
            victim.setKnockbackReceived(130)
            smallMessage(victim, "假药副作用：大头针")
        elif victim.baptiste_fake_drug_roll == 2:
            victim.startScalingSize(0.7)
            victim.setMoveSpeed(125)
            victim.setDamageDealt(75)
            victim.setKnockbackReceived(150)
            smallMessage(victim, "假药副作用：缩水针")
        elif victim.baptiste_fake_drug_roll == 3:
            victim.setMoveSpeed(135)
            victim.setDamageReceived(125)
            smallMessage(victim, "假药副作用：兴奋剂过量")
        else:
            victim.setMoveSpeed(70)
            victim.setDamageReceived(80)
            victim.setDamageDealt(80)
            smallMessage(victim, "假药副作用：镇定剂")
        wait(3)
        victim.stopScalingSize()
        victim.setMoveSpeed(100)
        victim.setDamageDealt(100)
        victim.setDamageReceived(100)
        victim.setKnockbackReceived(100)
        victim.baptiste_drug_target_active = false
        wait(1)
        eventPlayer.baptiste_fake_drug_cooldown = false


rule "[genji] lock swift strike outside blade window":
    @Event eachPlayer
    @Hero genji
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.genji_ult_window_active != true

    eventPlayer.setAbilityCooldown(Button.ABILITY_1, 999)


rule "[genji] start blade window on final blow":
    @Event playerDealtFinalBlow
    @Hero genji
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.genji_ult_window_active != true

    eventPlayer.genji_ult_window_token += 1
    eventPlayer.genji_ult_window_timer = 8
    eventPlayer.genji_ult_window_active = true
    eventPlayer.genji_ult_window_hud_created = true
    eventPlayer.setUltCharge(100)
    eventPlayer.setAbilityCooldown(Button.ABILITY_1, 0)
    eventPlayer.setDamageDealt(70)
    eventPlayer.forceButtonPress(Button.ULTIMATE)
    hudHeader(eventPlayer, "疯狗时间：{}秒".format(eventPlayer.genji_ult_window_timer), HudPosition.RIGHT, -900, Color.GREEN, HudReeval.VISIBILITY_AND_STRING)
    eventPlayer.genji_ult_window_hud_id = getLastCreatedText()
    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.GREEN, eventPlayer, 2)
    bigMessage(eventPlayer, "疯狗模式开启")
    while eventPlayer.genji_ult_window_active == true and eventPlayer.isAlive() == true and eventPlayer.getHero() == Hero.GENJI and eventPlayer.genji_ult_window_timer > 0:
        wait(1)
        eventPlayer.genji_ult_window_timer -= 1
    if eventPlayer.genji_ult_window_active == true and eventPlayer.isAlive() == true and eventPlayer.getHero() == Hero.GENJI and eventPlayer.genji_ult_window_timer <= 0:
        eventPlayer.genji_ult_window_active = false
        eventPlayer.genji_ult_window_timer = 0
        eventPlayer.setUltCharge(0)
        eventPlayer.setAbilityCooldown(Button.ABILITY_1, 999)
        eventPlayer.setDamageDealt(100)
        eventPlayer.setMoveSpeed(100)
        eventPlayer.setDamageReceived(100)
        eventPlayer.stopScalingSize()
        if eventPlayer.genji_ult_window_hud_created == true:
            destroyHudText(eventPlayer.genji_ult_window_hud_id)
        eventPlayer.genji_ult_window_hud_created = false
        eventPlayer.genji_ult_window_hud_id = null
        eventPlayer.setStatusEffect(null, Status.ASLEEP, 5)
        smallMessage(eventPlayer, "疯狗时间结束，源氏睡着了")


rule "[genji] refresh blade window on final blow":
    @Event playerDealtFinalBlow
    @Hero genji
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.genji_ult_window_active == true

    eventPlayer.genji_ult_window_token += 1
    eventPlayer.genji_ult_window_timer = 8
    eventPlayer.setUltCharge(100)
    eventPlayer.setAbilityCooldown(Button.ABILITY_1, 0)
    eventPlayer.setDamageDealt(70)
    eventPlayer.forceButtonPress(Button.ULTIMATE)
    smallMessage(eventPlayer, "疯狗时间刷新：8秒")


rule "[genji] blade damage cap during window":
    @Event playerDealtDamage
    @Hero genji
    @Condition eventPlayer.genji_ult_window_active == true
    @Condition eventAbility == Button.ULTIMATE
    @Condition eventDamage > 70

    heal(victim, null, eventDamage - 70)


rule "[genji] clear blade window on death":
    @Event playerDied
    @Hero genji

    eventPlayer.genji_ult_window_token += 1
    eventPlayer.genji_ult_window_active = false
    eventPlayer.genji_ult_window_timer = 0
    eventPlayer.genji_dash_reset_cooldown = false
    eventPlayer.genji_overheat_active = false
    if eventPlayer.genji_ult_window_hud_created == true:
        destroyHudText(eventPlayer.genji_ult_window_hud_id)
    eventPlayer.genji_ult_window_hud_created = false
    eventPlayer.genji_ult_window_hud_id = null
    eventPlayer.setUltCharge(0)
    eventPlayer.setDamageDealt(100)
    eventPlayer.setMoveSpeed(100)
    eventPlayer.setDamageReceived(100)
    eventPlayer.stopScalingSize()


rule "[genji] clear blade window after hero swap":
    @Event eachPlayer
    @Condition eventPlayer.getHero() != Hero.GENJI
    @Condition eventPlayer.genji_ult_window_active == true or eventPlayer.genji_ult_window_timer > 0 or eventPlayer.genji_dash_reset_cooldown == true or eventPlayer.genji_overheat_active == true

    eventPlayer.genji_ult_window_token += 1
    eventPlayer.genji_ult_window_active = false
    eventPlayer.genji_ult_window_timer = 0
    eventPlayer.genji_dash_reset_cooldown = false
    eventPlayer.genji_overheat_active = false
    if eventPlayer.genji_ult_window_hud_created == true:
        destroyHudText(eventPlayer.genji_ult_window_hud_id)
    eventPlayer.genji_ult_window_hud_created = false
    eventPlayer.genji_ult_window_hud_id = null
    eventPlayer.setUltCharge(0)
    eventPlayer.setDamageDealt(100)
    eventPlayer.setMoveSpeed(100)
    eventPlayer.setDamageReceived(100)
    eventPlayer.stopScalingSize()


rule "[genji] clear blade window after leaving alive window":
    @Event eachPlayer
    @Hero genji
    @Condition eventPlayer.isDead() == true
    @Condition eventPlayer.genji_ult_window_active == true

    eventPlayer.genji_ult_window_token += 1
    eventPlayer.genji_ult_window_active = false
    eventPlayer.genji_ult_window_timer = 0
    if eventPlayer.genji_ult_window_hud_created == true:
        destroyHudText(eventPlayer.genji_ult_window_hud_id)
    eventPlayer.genji_ult_window_hud_created = false
    eventPlayer.genji_ult_window_hud_id = null
    eventPlayer.setUltCharge(0)
    eventPlayer.setDamageDealt(100)
    eventPlayer.setMoveSpeed(100)
    eventPlayer.setDamageReceived(100)
    eventPlayer.stopScalingSize()


rule "[torbjorn] create parts hud":
    @Event eachPlayer
    @Hero torbjorn
    @Condition eventPlayer.torb_parts_hud_created == false

    eventPlayer.torb_parts_hud_created = true
    hudHeader(eventPlayer, "托比昂零件：{}/3".format(eventPlayer.torb_parts), HudPosition.RIGHT, -850, Color.YELLOW, HudReeval.VISIBILITY_AND_STRING)
    eventPlayer.torb_parts_hud_id = getLastCreatedText()


rule "[torbjorn] gain parts on elimination":
    @Event playerEarnedElimination
    @Hero torbjorn
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.torb_mod_active == false

    if eventPlayer.torb_parts < 3:
        eventPlayer.torb_parts += 1
    if eventPlayer.torb_parts >= 3:
        eventPlayer.torb_parts = 3
        eventPlayer.torb_mod_ready = true
        smallMessage(eventPlayer, "非法改装就绪")
    else:
        smallMessage(eventPlayer, "获得零件：{}/3".format(eventPlayer.torb_parts))
    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.YELLOW, eventPlayer, 1.5)


rule "[torbjorn] activate illegal modification":
    @Event eachPlayer
    @Hero torbjorn
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.torb_parts >= 3
    @Condition eventPlayer.torb_mod_active == false
    @Condition eventPlayer.torb_mod_cooldown == false
    @Condition eventPlayer.isUsingAbility2() == true

    eventPlayer.torb_mod_active = true
    eventPlayer.torb_mod_ready = false
    eventPlayer.torb_mod_cooldown = true
    eventPlayer.torb_parts = 0
    eventPlayer.torb_mod_roll = random.randint(1, 4)
    smallMessage(eventPlayer, "非法改装启动！")
    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.ORANGE, eventPlayer, 3)
    if eventPlayer.torb_mod_roll == 1:
        eventPlayer.startScalingSize(1.6)
        eventPlayer.setDamageDealt(120)
        eventPlayer.setMoveSpeed(80)
        eventPlayer.setKnockbackReceived(130)
        eventPlayer.torb_mod_status_hud_created = true
        hudHeader(eventPlayer, "当前改装：巨型模块", HudPosition.RIGHT, -849, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING)
        eventPlayer.torb_mod_status_hud_id = getLastCreatedText()
        playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.ORANGE, eventPlayer, 3)
        bigMessage(eventPlayer, "非法改装：巨型模块")
        wait(1)
        eventPlayer.torb_mod_cooldown = false
    elif eventPlayer.torb_mod_roll == 2:
        eventPlayer.startScalingSize(0.65)
        eventPlayer.setMoveSpeed(140)
        eventPlayer.setDamageDealt(70)
        eventPlayer.setKnockbackReceived(160)
        eventPlayer.torb_mod_status_hud_created = true
        hudHeader(eventPlayer, "当前改装：迷你模块", HudPosition.RIGHT, -849, Color.BLUE, HudReeval.VISIBILITY_AND_STRING)
        eventPlayer.torb_mod_status_hud_id = getLastCreatedText()
        playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.BLUE, eventPlayer, 2)
        bigMessage(eventPlayer, "非法改装：迷你模块")
        wait(1)
        eventPlayer.torb_mod_cooldown = false
    elif eventPlayer.torb_mod_roll == 3:
        eventPlayer.startScalingSize(1.25)
        eventPlayer.setDamageReceived(70)
        eventPlayer.setMoveSpeed(75)
        eventPlayer.setDamageDealt(80)
        eventPlayer.setKnockbackReceived(70)
        eventPlayer.torb_mod_status_hud_created = true
        hudHeader(eventPlayer, "当前改装：防爆模块", HudPosition.RIGHT, -849, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
        eventPlayer.torb_mod_status_hud_id = getLastCreatedText()
        playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.WHITE, eventPlayer, 2.5)
        bigMessage(eventPlayer, "非法改装：防爆模块")
        wait(1)
        eventPlayer.torb_mod_cooldown = false
    else:
        eventPlayer.startScalingSize(1.8)
        eventPlayer.setMoveSpeed(60)
        eventPlayer.setDamageReceived(130)
        eventPlayer.setStatusEffect(null, Status.KNOCKED_DOWN, 0.75)
        eventPlayer.torb_mod_status_hud_created = true
        hudHeader(eventPlayer, "当前改装：失败改装", HudPosition.RIGHT, -849, Color.RED, HudReeval.VISIBILITY_AND_STRING)
        eventPlayer.torb_mod_status_hud_id = getLastCreatedText()
        playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, Color.RED, eventPlayer, 3)
        bigMessage(eventPlayer, "非法改装失败！")
        wait(2)
        eventPlayer.stopScalingSize()
        eventPlayer.setMoveSpeed(100)
        eventPlayer.setDamageDealt(100)
        eventPlayer.setDamageReceived(100)
        eventPlayer.setKnockbackReceived(100)
        if eventPlayer.torb_mod_status_hud_created == true:
            destroyHudText(eventPlayer.torb_mod_status_hud_id)
        eventPlayer.torb_mod_status_hud_created = false
        eventPlayer.torb_mod_status_hud_id = null
        eventPlayer.torb_mod_active = false
        wait(1)
        eventPlayer.torb_mod_cooldown = false


rule "[torbjorn] clear illegal modification on death":
    @Event playerDied
    @Hero torbjorn

    eventPlayer.torb_parts = 0
    eventPlayer.torb_mod_ready = false
    eventPlayer.torb_mod_active = false
    eventPlayer.torb_mod_roll = 0
    eventPlayer.torb_mod_cooldown = false
    if eventPlayer.torb_mod_status_hud_created == true:
        destroyHudText(eventPlayer.torb_mod_status_hud_id)
    eventPlayer.torb_mod_status_hud_created = false
    eventPlayer.torb_mod_status_hud_id = null
    eventPlayer.stopScalingSize()
    eventPlayer.setMoveSpeed(100)
    eventPlayer.setDamageDealt(100)
    eventPlayer.setDamageReceived(100)
    eventPlayer.setKnockbackReceived(100)


rule "[torbjorn] clear illegal modification after hero swap":
    @Event eachPlayer
    @Condition eventPlayer.getHero() != Hero.TORBJORN
    @Condition eventPlayer.torb_parts > 0 or eventPlayer.torb_mod_ready == true or eventPlayer.torb_mod_active == true or eventPlayer.torb_mod_cooldown == true or eventPlayer.torb_parts_hud_created == true or eventPlayer.torb_mod_status_hud_created == true

    if eventPlayer.torb_parts_hud_created == true:
        destroyHudText(eventPlayer.torb_parts_hud_id)
    if eventPlayer.torb_mod_status_hud_created == true:
        destroyHudText(eventPlayer.torb_mod_status_hud_id)
    eventPlayer.torb_parts = 0
    eventPlayer.torb_mod_ready = false
    eventPlayer.torb_mod_active = false
    eventPlayer.torb_mod_roll = 0
    eventPlayer.torb_mod_cooldown = false
    eventPlayer.torb_parts_hud_created = false
    eventPlayer.torb_parts_hud_id = null
    eventPlayer.torb_mod_status_hud_created = false
    eventPlayer.torb_mod_status_hud_id = null
    eventPlayer.stopScalingSize()
    eventPlayer.setMoveSpeed(100)
    eventPlayer.setDamageDealt(100)
    eventPlayer.setDamageReceived(100)
    eventPlayer.setKnockbackReceived(100)


rule "[roadhog] hook weakens target":
    @Event playerDealtDamage
    @Hero roadhog
    @Condition eventAbility == Button.ABILITY_1

    victim.startScalingSize(0.5)
    victim.setMoveSpeed(140)
    victim.setKnockbackReceived(180)
    eventPlayer.roadhog_hook_melee_boost_ready = true
    smallMessage(eventPlayer, "钩中目标：下一次近战击退增强")
    wait(3)
    victim.stopScalingSize()
    victim.setMoveSpeed(100)
    victim.setKnockbackReceived(100)


rule "[roadhog] consume boosted melee knockback":
    @Event playerDealtDamage
    @Hero roadhog
    @Condition eventPlayer.roadhog_hook_melee_boost_ready == true
    @Condition eventPlayer.isMeleeing() == true

    eventPlayer.roadhog_hook_melee_boost_ready = false
    victim.applyImpulse(directionTowards(eventPlayer.getPosition(), victim.getPosition()), 25, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
    smallMessage(eventPlayer, "强化近战击退触发")


rule "[lucio] remember airborne state":
    @Event eachPlayer
    @Hero lucio
    @Condition eventPlayer.isInAir() == true
    @Condition eventPlayer.lucio_landing_bounce_cooldown == false

    eventPlayer.lucio_was_airborne = true


rule "[lucio] landing bounce":
    @Event eachPlayer
    @Hero lucio
    @Condition eventPlayer.lucio_was_airborne == true
    @Condition eventPlayer.isInAir() == false
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.lucio_landing_bounce_cooldown == false

    eventPlayer.lucio_was_airborne = false
    eventPlayer.lucio_landing_bounce_cooldown = true
    getPlayersInRadius(eventPlayer.getPosition(), 8, Team.ALL).filter(lambda player: player != eventPlayer).lucio_landing_bounce_cooldown = true
    getPlayersInRadius(eventPlayer.getPosition(), 8, Team.ALL).filter(lambda player: player != eventPlayer).applyImpulse(Vector.UP, 12, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
    eventPlayer.setMoveSpeed(140)
    smallMessage(eventPlayer, "落地冲击")
    wait(1.5)
    eventPlayer.setMoveSpeed(100)


rule "[lucio] clear landing bounce cooldown":
    @Event eachPlayer
    @Hero lucio
    @Condition eventPlayer.lucio_landing_bounce_cooldown == true

    wait(1)
    eventPlayer.lucio_landing_bounce_cooldown = false


rule "[sojourn] power slide launches nearby players":
    @Event eachPlayer
    @Hero sojourn
    @Condition eventPlayer.isUsingAbility1() == true
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.sojourn_slide_bump_cooldown == false
    @Condition len(getPlayersInRadius(eventPlayer.getPosition(), 2.6, Team.ALL).filter(lambda player: player != eventPlayer)) > 0

    eventPlayer.sojourn_slide_bump_cooldown = true
    damage(getPlayersInRadius(eventPlayer.getPosition(), 2.6, Team.ALL).filter(lambda player: player != eventPlayer), eventPlayer, 20)
    getPlayersInRadius(eventPlayer.getPosition(), 2.6, Team.ALL).filter(lambda player: player != eventPlayer).setStatusEffect(eventPlayer, Status.KNOCKED_DOWN, 1.25)
    getPlayersInRadius(eventPlayer.getPosition(), 2.6, Team.ALL).filter(lambda player: player != eventPlayer).applyImpulse(directionTowards(eventPlayer.getPosition(), getPlayersInRadius(eventPlayer.getPosition(), 2.6, Team.ALL).filter(lambda player: player != eventPlayer).getPosition()), 18, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.BLUE, eventPlayer, 2.6)
    smallMessage(eventPlayer, "滑铲创飞！")
    wait(0.8)
    eventPlayer.sojourn_slide_bump_cooldown = false


rule "[brigitte] shield bash blink stun":
    @Event eachPlayer
    @Hero brigitte
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.brigitte_blink_cooldown == false
    @Condition eventPlayer.isFiringSecondaryFire() == true
    @Condition eventPlayer.isFiringPrimaryFire() == true
    @Condition len(getLivingPlayers(Team.ALL).filter(lambda player: player != eventPlayer and player.isAlive() == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam()) and eventPlayer.isInViewAngle(player.getPosition(), 60) == true and distance(eventPlayer, player) > 12 and distance(eventPlayer, player) <= 25 and isInLoS(eventPlayer, player, BarrierLos.PASS_THROUGH_BARRIERS) == true)) > 0

    eventPlayer.brigitte_blink_target = sorted(getLivingPlayers(Team.ALL).filter(lambda player: player != eventPlayer and player.isAlive() == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam()) and eventPlayer.isInViewAngle(player.getPosition(), 60) == true and distance(eventPlayer, player) > 12 and distance(eventPlayer, player) <= 25 and isInLoS(eventPlayer, player, BarrierLos.PASS_THROUGH_BARRIERS) == true), key=lambda player: angleBetweenVectors(eventPlayer.getFacingDirection(), player.getPosition() - eventPlayer.getEyePosition()))[0]
    if distance(nearestWalkablePosition(eventPlayer.brigitte_blink_target.getPosition() + directionTowards(eventPlayer.brigitte_blink_target.getPosition(), eventPlayer.getPosition()) * 2.2), eventPlayer.brigitte_blink_target) <= 4:
        eventPlayer.brigitte_blink_cooldown = true
        eventPlayer.cancelPrimaryAction()
        playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.YELLOW, eventPlayer.getEyePosition(), 1.5)
        eventPlayer.teleport(nearestWalkablePosition(eventPlayer.brigitte_blink_target.getPosition() + directionTowards(eventPlayer.brigitte_blink_target.getPosition(), eventPlayer.getPosition()) * 2.2))
        playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.YELLOW, eventPlayer, 2)
        eventPlayer.brigitte_blink_target.setStatusEffect(eventPlayer, Status.STUNNED, 0.5)
        smallMessage(eventPlayer, "盾击瞬移")
        wait(4)
        eventPlayer.brigitte_blink_cooldown = false
    eventPlayer.brigitte_blink_target = null


rule "[brigitte] clear shield bash blink on death":
    @Event playerDied
    @Hero brigitte

    eventPlayer.brigitte_blink_cooldown = false
    eventPlayer.brigitte_blink_target = null


rule "[brigitte] clear shield bash blink after hero swap":
    @Event eachPlayer
    @Condition eventPlayer.getHero() != Hero.BRIGITTE
    @Condition eventPlayer.brigitte_blink_cooldown == true or eventPlayer.brigitte_blink_target != null

    eventPlayer.brigitte_blink_cooldown = false
    eventPlayer.brigitte_blink_target = null


rule "[winston] grapple slam on jump contact":
    @Event eachPlayer
    @Hero winston
    @Condition eventPlayer.isUsingAbility1() == true
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.winston_grapple_active == false
    @Condition eventPlayer.winston_grapple_lock == false
    @Condition len(getPlayersInRadius(eventPlayer.getPosition(), 2.8, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and eventPlayer.isInViewAngle(player.getPosition(), 70) == true and player.winston_grapple_carrier == null)) > 0

    eventPlayer.winston_grapple_lock = true
    eventPlayer.winston_grapple_active = true
    eventPlayer.winston_grapple_target = sorted(getPlayersInRadius(eventPlayer.getPosition(), 2.8, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and eventPlayer.isInViewAngle(player.getPosition(), 70) == true and player.winston_grapple_carrier == null), key=lambda player: distance(eventPlayer, player))[0]
    eventPlayer.winston_grapple_target.winston_grapple_carrier = eventPlayer
    eventPlayer.winston_grapple_target.winston_grapple_original_hero = eventPlayer.winston_grapple_target.getHero()
    eventPlayer.winston_grapple_target.attachTo(eventPlayer, vect(0, 1.15, 1.25))
    eventPlayer.winston_grapple_target.setStatusEffect(eventPlayer, Status.STUNNED, 10)
    eventPlayer.disallowButton(Button.PRIMARY_FIRE)
    eventPlayer.disallowButton(Button.MELEE)
    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.WHITE, eventPlayer.winston_grapple_target, 1.5)
    smallMessage(eventPlayer, "猩猩抱摔抓住目标")
    waitUntil(eventPlayer.isOnGround() == true or eventPlayer.isAlive() == false or eventPlayer.getHero() != Hero.WINSTON or eventPlayer.winston_grapple_target.isAlive() == false or eventPlayer.winston_grapple_target.winston_grapple_carrier != eventPlayer or eventPlayer.winston_grapple_target.getHero() != eventPlayer.winston_grapple_target.winston_grapple_original_hero, 3.5)
    if eventPlayer.winston_grapple_target != null and eventPlayer.winston_grapple_target.winston_grapple_carrier == eventPlayer:
        eventPlayer.winston_grapple_target.detach()
        eventPlayer.winston_grapple_target.clearStatusEffect(Status.STUNNED)
        if eventPlayer.isAlive() == true and eventPlayer.getHero() == Hero.WINSTON and eventPlayer.winston_grapple_target.isAlive() == true and eventPlayer.isOnGround() == true:
            playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, Color.WHITE, eventPlayer.getPosition(), 3)
            eventPlayer.winston_grapple_target.setStatusEffect(eventPlayer, Status.KNOCKED_DOWN, 1.15)
            smallMessage(eventPlayer.winston_grapple_target, "被猩猩抱摔击倒")
        eventPlayer.winston_grapple_target.winston_grapple_carrier = null
        eventPlayer.winston_grapple_target.winston_grapple_original_hero = null
    eventPlayer.winston_grapple_active = false
    eventPlayer.winston_grapple_target = null
    eventPlayer.allowButton(Button.PRIMARY_FIRE)
    eventPlayer.allowButton(Button.MELEE)
    waitUntil(eventPlayer.isUsingAbility1() == false, 2)
    wait(0.35)
    if eventPlayer.isAlive() == true and eventPlayer.getHero() == Hero.WINSTON:
        eventPlayer.winston_grapple_lock = false


rule "[winston] clear grapple on death":
    @Event playerDied
    @Hero winston

    if eventPlayer.winston_grapple_target != null and eventPlayer.winston_grapple_target.winston_grapple_carrier == eventPlayer:
        eventPlayer.winston_grapple_target.detach()
        eventPlayer.winston_grapple_target.clearStatusEffect(Status.STUNNED)
        eventPlayer.winston_grapple_target.clearStatusEffect(Status.KNOCKED_DOWN)
        eventPlayer.winston_grapple_target.winston_grapple_carrier = null
        eventPlayer.winston_grapple_target.winston_grapple_original_hero = null
    eventPlayer.winston_grapple_active = false
    eventPlayer.winston_grapple_target = null
    eventPlayer.winston_grapple_lock = false
    eventPlayer.allowButton(Button.PRIMARY_FIRE)
    eventPlayer.allowButton(Button.MELEE)


rule "[winston] clear grapple after hero swap":
    @Event eachPlayer
    @Condition eventPlayer.getHero() != Hero.WINSTON
    @Condition eventPlayer.winston_grapple_active == true or eventPlayer.winston_grapple_target != null or eventPlayer.winston_grapple_lock == true

    if eventPlayer.winston_grapple_target != null and eventPlayer.winston_grapple_target.winston_grapple_carrier == eventPlayer:
        eventPlayer.winston_grapple_target.detach()
        eventPlayer.winston_grapple_target.clearStatusEffect(Status.STUNNED)
        eventPlayer.winston_grapple_target.clearStatusEffect(Status.KNOCKED_DOWN)
        eventPlayer.winston_grapple_target.winston_grapple_carrier = null
        eventPlayer.winston_grapple_target.winston_grapple_original_hero = null
    eventPlayer.winston_grapple_active = false
    eventPlayer.winston_grapple_target = null
    eventPlayer.winston_grapple_lock = false
    eventPlayer.allowButton(Button.PRIMARY_FIRE)
    eventPlayer.allowButton(Button.MELEE)


rule "[winston] clear grappled target on death or hero swap":
    @Event eachPlayer
    @Condition eventPlayer.winston_grapple_carrier != null
    @Condition eventPlayer.isDead() == true or eventPlayer.getHero() != eventPlayer.winston_grapple_original_hero or eventPlayer.winston_grapple_carrier.isAlive() == false or eventPlayer.winston_grapple_carrier.getHero() != Hero.WINSTON

    eventPlayer.detach()
    eventPlayer.clearStatusEffect(Status.STUNNED)
    eventPlayer.clearStatusEffect(Status.KNOCKED_DOWN)
    eventPlayer.winston_grapple_carrier.winston_grapple_active = false
    eventPlayer.winston_grapple_carrier.winston_grapple_target = null
    eventPlayer.winston_grapple_carrier.winston_grapple_lock = false
    eventPlayer.winston_grapple_carrier.allowButton(Button.PRIMARY_FIRE)
    eventPlayer.winston_grapple_carrier.allowButton(Button.MELEE)
    eventPlayer.winston_grapple_carrier = null
    eventPlayer.winston_grapple_original_hero = null


rule "[illari] apply sunburn on damage":
    @Event playerDealtDamage
    @Hero illari
    @Condition victim.isAlive() == true
    @Condition eventPlayer.illari_sunburn_cooldown == false

    if random.randint(1, 100) <= 20:
        eventPlayer.illari_sunburn_cooldown = true
        victim.illari_sunburn_active = true
        victim.illari_sunburn_pop_cooldown = false
        victim.startScalingSize(1.4)
        victim.setMoveSpeed(85)
        victim.setKnockbackReceived(140)
        playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.YELLOW, victim, 2)
        smallMessage(eventPlayer, "太阳晒黑触发")
        wait(4)
        victim.stopScalingSize()
        victim.setMoveSpeed(100)
        victim.setKnockbackReceived(100)
        victim.illari_sunburn_active = false
        wait(2)
        eventPlayer.illari_sunburn_cooldown = false


rule "[illari] pop sunburned target on damage":
    @Event playerDealtDamage
    @Hero illari
    @Condition victim.illari_sunburn_active == true
    @Condition victim.illari_sunburn_pop_cooldown == false

    victim.illari_sunburn_pop_cooldown = true
    victim.applyImpulse(Vector.UP, 8, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
    wait(0.4)
    victim.illari_sunburn_pop_cooldown = false


rule "[illari] outburst knocks nearby players":
    @Event eachPlayer
    @Hero illari
    @Condition eventPlayer.isUsingAbility2() == true
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.illari_burst_cooldown == false

    eventPlayer.illari_burst_cooldown = true
    getPlayersInRadius(eventPlayer.getPosition(), 4, Team.ALL).filter(lambda player: player != eventPlayer).applyImpulse(directionTowards(eventPlayer.getPosition(), getPlayersInRadius(eventPlayer.getPosition(), 4, Team.ALL).filter(lambda player: player != eventPlayer).getPosition()), 16, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
    getPlayersInRadius(eventPlayer.getPosition(), 4, Team.ALL).filter(lambda player: player != eventPlayer and player.isInAir() == true).applyImpulse(Vector.UP, 8, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
    eventPlayer.setMoveSpeed(140)
    wait(1)
    eventPlayer.setMoveSpeed(80)
    wait(1)
    eventPlayer.setMoveSpeed(100)
    wait(3)
    eventPlayer.illari_burst_cooldown = false


rule "[freya] launch circle":
    @Event eachPlayer
    @Hero freja
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.freya_launch_circle_cooldown == false
    @Condition eventPlayer.isUsingAbility2() == true

    eventPlayer.freya_launch_circle_cooldown = true
    eventPlayer.freya_launch_circle_effects = []
    createEffect(getAllPlayers(), Effect.GOOD_AURA, Color.AQUA, eventPlayer, 6, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.freya_launch_circle_effects.append(getLastCreatedEntity())
    createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Color.WHITE, eventPlayer, 6, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.freya_launch_circle_effects.append(getLastCreatedEntity())
    wait(0.35)
    getPlayersInRadius(eventPlayer.getPosition(), 6, Team.ALL).applyImpulse(Vector.UP, 30, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.AQUA, eventPlayer, 6)
    wait(1)
    destroyEffect(eventPlayer.freya_launch_circle_effects[0])
    destroyEffect(eventPlayer.freya_launch_circle_effects[1])
    eventPlayer.freya_launch_circle_effects = []
    wait(3)
    eventPlayer.freya_launch_circle_cooldown = false
