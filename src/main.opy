#Player variables

playervar Kiriko_Skill 26
playervar player_state 27
playervar illari_sunburn_active 32
playervar freya_launch_circle_effects 38
playervar genji_dash_reset_cooldown 39
playervar genji_overheat_active 40
playervar baptiste_mirror_active 41
playervar baptiste_mirror_roll 42
playervar baptiste_mirror_target_active 43
playervar baptiste_drug_target_active 45
playervar baptiste_fake_drug_roll 46
playervar genji_ult_window_active 47
playervar genji_ult_window_timer 48
playervar genji_ult_window_token 49
playervar genji_ult_window_hud_created 57
playervar genji_ult_window_hud_id 58
playervar soldier_resize_cooldown 61
playervar tracer_auto_recall_state 63
playervar tracer_debt_active 64
playervar winston_grapple_active 75
playervar winston_grapple_target 76
playervar winston_grapple_lock 77
playervar winston_grapple_carrier 78
playervar winston_grapple_original_hero 79
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
playervar winston_barrier_active 4
playervar winston_barrier_pos 5
playervar winston_barrier_fx 6
playervar winston_zap_cd 7
playervar winston_zap_fx 8


#Only remove the following directive if the gamemode does not use tricks such as A+0, A*0, "am" == "**", etc which would otherwise be optimized out.
#!optimizeStrict
#!extension projectiles


rule "[state] initialize player state array":
    @Event eachPlayer
    @Condition len(eventPlayer.player_state) < 96

    eventPlayer.player_state = [false, null, false, false, null, false, null, null, null, false, false, false, false, false, false, false, false, false, null, false, false, 0, false, false, 0, false, false, null, false, null, 0, false, false, 0, false, null, false, null, false, null, [], [], 0, false, 0, 0, false, false, null, 0, 0, 0, false, false, 0, null, false, [], false, false, 0, false, null, [], 0, null, 0, false, null, null, false, null, [], null, [], 0, false, null, null, null, false, false, null, [], 0, null, 0, false, false, false, null, [], false, null, null, null, false]


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
    @Condition eventPlayer.player_state[17] == false

    eventPlayer.player_state[17] = true
    eventPlayer.setAbilityCooldown(Button.ABILITY_1, 50)
    eventPlayer.setAbilityCooldown(Button.ABILITY_2, 50)
    eventPlayer.setUltCharge(20)
    createEffect(getAllPlayers(), Effect.BAD_AURA, Color.ROSE, eventPlayer, 2.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_state[18] = getLastCreatedEntity()
    smallMessage(eventPlayer, "你被睡了")
    waitUntil(eventPlayer.hasStatus(Status.ASLEEP) == false, 99999)
    destroyEffect(eventPlayer.player_state[18])
    eventPlayer.player_state[18] = null
    eventPlayer.player_state[17] = false


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
    @Condition eventPlayer.player_state[2] == false
    @Condition eventPlayer.player_state[0] == false

    eventPlayer.player_state[2] = true
    eventPlayer.player_state[0] = true
    if eventPlayer.getHero() == Hero.SOLDIER:
        hudSubtext(eventPlayer, "士兵76：蚁人体型\n左键变大，右键变小，共 11 档\n最大 32，最小 0.01\n变大后伤害逐档降低，变小后移速逐档提高，音调随体型变化", HudPosition.ACTUALLY_LEFT, -998, Color.YELLOW, HudReeval.VISIBILITY_AND_STRING)
    elif eventPlayer.getHero() == Hero.MERCY:
        hudSubtext(eventPlayer, "天使：复活甲\n每条命一次复活甲\n受到致命伤时回血到 60，震开周围敌人，并短暂无敌\n复活甲破碎后本条命不再触发", HudPosition.ACTUALLY_LEFT, -998, Color.YELLOW, HudReeval.VISIBILITY_AND_STRING)
    elif eventPlayer.getHero() == Hero.BAPTISTE:
        hudSubtext(eventPlayer, "巴蒂：哈哈镜与假药\n大招触发哈哈镜，附近玩家随机极大、极小、变脆或变硬\n造成伤害有概率让目标获得短暂假药副作用", HudPosition.ACTUALLY_LEFT, -998, Color.YELLOW, HudReeval.VISIBILITY_AND_STRING)
    elif eventPlayer.getHero() == Hero.GENJI:
        hudSubtext(eventPlayer, "源氏：疯狗龙刃窗口\n平时 Shift 被锁\n击杀开启 8 秒疯狗时间，自动开大并解锁 Shift\n续杀刷新时间，结束后沉睡 5 秒", HudPosition.ACTUALLY_LEFT, -998, Color.GREEN, HudReeval.VISIBILITY_AND_STRING)
    elif eventPlayer.getHero() == Hero.HANZO:
        hudSubtext(eventPlayer, "半藏：箭雨令\n按技能 1 在准星前方地面生成预警法阵\n0.7 秒后落箭，持续 2.5 秒\n范围内其他玩家受到小额持续伤害和减速\n空中可额外踏空多段跳", HudPosition.ACTUALLY_LEFT, -998, Color.YELLOW, HudReeval.VISIBILITY_AND_STRING)
    elif eventPlayer.getHero() == Hero.ORISA:
        hudSubtext(eventPlayer, "奥丽莎：强固裁决\n命中敌人积累裁决能量，最多 7 层\n技能 1 期间命中稳定获得，平时命中有概率获得\n右键低伤害标枪会消耗全部能量打出裁决\n层数越高，减速、冷却惩罚和回血越强", HudPosition.ACTUALLY_LEFT, -998, Color.GREEN, HudReeval.VISIBILITY_AND_STRING)
    elif eventPlayer.getHero() == Hero.TORBJORN:
        hudSubtext(eventPlayer, "托比昂：非法改装\n参与击杀获得零件，3 个零件后按 E 触发随机改装\n可能变巨型、迷你、防爆，也可能改装失败\n死亡或换英雄清空零件和改装", HudPosition.ACTUALLY_LEFT, -998, Color.YELLOW, HudReeval.VISIBILITY_AND_STRING)
    elif eventPlayer.getHero() == Hero.MEI:
        hudSubtext(eventPlayer, "小美：寒气掌控\n近战和冰爆会叠寒气，满 3 层短暂冰冻并减速\n技能 1 开启 4 秒近身寒气圈\n技能 2 在准星位置生成延迟冰爆陷阱", HudPosition.ACTUALLY_LEFT, -998, Color.AQUA, HudReeval.VISIBILITY_AND_STRING)
    elif eventPlayer.getHero() == Hero.ROADHOG:
        hudSubtext(eventPlayer, "路霸：钩中改造\n钩中敌人会让目标缩小 3 秒\n目标移速提高但受到击退增加\n路霸下一次近战会附加强击退", HudPosition.ACTUALLY_LEFT, -998, Color.YELLOW, HudReeval.VISIBILITY_AND_STRING)
    elif eventPlayer.getHero() == Hero.LUCIO:
        hudSubtext(eventPlayer, "卢西奥：落地冲击\n从空中落地时弹起附近其他玩家\n不会弹起自己，并获得短暂加速\n带冷却，避免连续触发", HudPosition.ACTUALLY_LEFT, -998, Color.GREEN, HudReeval.VISIBILITY_AND_STRING)
    elif eventPlayer.getHero() == Hero.SOJOURN:
        hudSubtext(eventPlayer, "索杰恩：滑铲创飞\n滑铲靠近玩家时造成 20 伤害、击倒并铲飞\n索杰恩自己不受影响\n有短冷却，避免滑铲期间连续触发", HudPosition.ACTUALLY_LEFT, -998, Color.BLUE, HudReeval.VISIBILITY_AND_STRING)
    elif eventPlayer.getHero() == Hero.ILLARI:
        hudSubtext(eventPlayer, "伊拉锐：召唤太阳\n近战命中积攒太阳之力，最多 3 层\n满 3 层后右键蓄力召唤小太阳\n太阳会点名敌人，视野内持续灼烧，躲掩体可规避", HudPosition.ACTUALLY_LEFT, -998, Color.YELLOW, HudReeval.VISIBILITY_AND_STRING)
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
        hudSubtext(eventPlayer, "温斯顿：抱摔与电蚊香屏障\n技能1跳跃正面贴近玩家时抓住 1 人\n落地击倒目标但不造成伤害\n放屏障后形成带电区域，其他玩家进入会短暂麻痹并被电弧标记", HudPosition.ACTUALLY_LEFT, -998, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
    elif eventPlayer.getHero() == Hero.BRIGITTE:
        hudSubtext(eventPlayer, "布丽吉塔：盾击瞬移与盾反\n举盾攻击远处目标可传送到目标附近并短暂眩晕\n举盾被近战命中时触发盾反，短暂眩晕攻击者\n两个效果都不造成伤害", HudPosition.ACTUALLY_LEFT, -998, Color.YELLOW, HudReeval.VISIBILITY_AND_STRING)
    elif eventPlayer.getHero() == Hero.LIFEWEAVER:
        hudSubtext(eventPlayer, "生命之梭：园艺保龄球\n拥有跟随自己的园艺球\n近战打出园艺球撞人，技能 2 拉回\n大招预警后召唤天降花盆", HudPosition.ACTUALLY_LEFT, -998, Color.GREEN, HudReeval.VISIBILITY_AND_STRING)
    else:
        hudSubtext(eventPlayer, "通用规则\n所有角色拥有二段跳\n击杀会回血\n被入侵会变大并持续扣血\n被睡会进入冷却惩罚并显示醒目标记", HudPosition.ACTUALLY_LEFT, -998, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
    eventPlayer.player_state[1] = getLastCreatedText()


rule "[hud] close current hero ability guide on interact":
    @Event eachPlayer
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition eventPlayer.player_state[2] == false
    @Condition eventPlayer.player_state[0] == true

    eventPlayer.player_state[2] = true
    destroyHudText(eventPlayer.player_state[1])
    eventPlayer.player_state[0] = false
    eventPlayer.player_state[1] = null


rule "[hud] unlock ability guide toggle":
    @Event eachPlayer
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == false
    @Condition eventPlayer.player_state[2] == true

    eventPlayer.player_state[2] = false


rule "[hud] clear current hero ability guide on death":
    @Event eachPlayer
    @Condition eventPlayer.player_state[0] == true
    @Condition eventPlayer.isDead() == true

    destroyHudText(eventPlayer.player_state[1])
    eventPlayer.player_state[0] = false
    eventPlayer.player_state[1] = null
    eventPlayer.player_state[2] = false


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
    @Condition eventPlayer.player_state[34] == false

    eventPlayer.player_state[34] = true
    hudHeader(eventPlayer, "废铁：{}/6".format(eventPlayer.player_state[30]), HudPosition.RIGHT, -800, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING)
    eventPlayer.player_state[35] = getLastCreatedText()


rule "[bastion] gain scrap on damage":
    @Event playerDealtDamage
    @Hero bastion
    @Condition eventPlayer.isAlive() == true
    @Condition eventDamage > 0
    @Condition eventPlayer.player_state[30] < 6
    @Condition eventPlayer.player_state[31] == false
    @Condition eventPlayer.player_state[32] == false

    eventPlayer.player_state[31] = true
    eventPlayer.player_state[30] += 1
    if eventPlayer.player_state[30] >= 6:
        eventPlayer.player_state[30] = 6
        bigMessage(eventPlayer, "非法改装启动")
    else:
        smallMessage(eventPlayer, "废铁：{}/6".format(eventPlayer.player_state[30]))
    wait(0.45)
    eventPlayer.player_state[31] = false


rule "[bastion] activate scrap modification":
    @Event eachPlayer
    @Hero bastion
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.player_state[30] >= 6
    @Condition eventPlayer.player_state[32] == false

    eventPlayer.player_state[32] = true
    eventPlayer.player_state[30] = 0
    eventPlayer.player_state[33] = random.randint(1, 4)
    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.ORANGE, eventPlayer, 3)
    if eventPlayer.player_state[33] == 1:
        eventPlayer.setDamageDealt(125)
        eventPlayer.setDamageReceived(125)
        eventPlayer.player_state[36] = true
        hudHeader(eventPlayer, "当前改装：破甲机枪", HudPosition.RIGHT, -799, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING)
        eventPlayer.player_state[37] = getLastCreatedText()
        playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, Color.ORANGE, eventPlayer, 3)
        bigMessage(eventPlayer, "非法改装：破甲机枪")
        wait(6)
        if eventPlayer.player_state[32] == true and eventPlayer.getHero() == Hero.BASTION:
            eventPlayer.setDamageDealt(100)
            eventPlayer.setDamageReceived(100)
            if eventPlayer.player_state[36] == true:
                destroyHudText(eventPlayer.player_state[37])
            eventPlayer.player_state[36] = false
            eventPlayer.player_state[37] = null
            eventPlayer.player_state[32] = false
    elif eventPlayer.player_state[33] == 2:
        eventPlayer.startScalingSize(1.2)
        eventPlayer.setDamageReceived(70)
        eventPlayer.setMoveSpeed(55)
        eventPlayer.player_state[36] = true
        hudHeader(eventPlayer, "当前改装：铁皮乌龟", HudPosition.RIGHT, -799, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
        eventPlayer.player_state[37] = getLastCreatedText()
        playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.WHITE, eventPlayer, 3)
        bigMessage(eventPlayer, "非法改装：铁皮乌龟")
        wait(6)
        if eventPlayer.player_state[32] == true and eventPlayer.getHero() == Hero.BASTION:
            eventPlayer.stopScalingSize()
            eventPlayer.setDamageReceived(100)
            eventPlayer.setMoveSpeed(100)
            if eventPlayer.player_state[36] == true:
                destroyHudText(eventPlayer.player_state[37])
            eventPlayer.player_state[36] = false
            eventPlayer.player_state[37] = null
            eventPlayer.player_state[32] = false
    elif eventPlayer.player_state[33] == 3:
        eventPlayer.startScalingSize(0.65)
        eventPlayer.setMoveSpeed(135)
        eventPlayer.setDamageDealt(75)
        eventPlayer.setKnockbackReceived(160)
        eventPlayer.player_state[36] = true
        hudHeader(eventPlayer, "当前改装：迷你履带", HudPosition.RIGHT, -799, Color.BLUE, HudReeval.VISIBILITY_AND_STRING)
        eventPlayer.player_state[37] = getLastCreatedText()
        playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.BLUE, eventPlayer, 2.5)
        bigMessage(eventPlayer, "非法改装：迷你履带")
        wait(6)
        if eventPlayer.player_state[32] == true and eventPlayer.getHero() == Hero.BASTION:
            eventPlayer.stopScalingSize()
            eventPlayer.setMoveSpeed(100)
            eventPlayer.setDamageDealt(100)
            eventPlayer.setKnockbackReceived(100)
            if eventPlayer.player_state[36] == true:
                destroyHudText(eventPlayer.player_state[37])
            eventPlayer.player_state[36] = false
            eventPlayer.player_state[37] = null
            eventPlayer.player_state[32] = false
    else:
        eventPlayer.startScalingSize(1.5)
        eventPlayer.setMoveSpeed(60)
        eventPlayer.setDamageReceived(130)
        eventPlayer.setStatusEffect(null, Status.KNOCKED_DOWN, 0.75)
        eventPlayer.player_state[36] = true
        hudHeader(eventPlayer, "当前改装：废铁爆仓", HudPosition.RIGHT, -799, Color.RED, HudReeval.VISIBILITY_AND_STRING)
        eventPlayer.player_state[37] = getLastCreatedText()
        playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, Color.RED, eventPlayer, 3)
        bigMessage(eventPlayer, "非法改装失败：废铁爆仓")
        wait(2)
        if eventPlayer.player_state[32] == true and eventPlayer.getHero() == Hero.BASTION:
            eventPlayer.stopScalingSize()
            eventPlayer.setMoveSpeed(100)
            eventPlayer.setDamageReceived(100)
            if eventPlayer.player_state[36] == true:
                destroyHudText(eventPlayer.player_state[37])
            eventPlayer.player_state[36] = false
            eventPlayer.player_state[37] = null
            eventPlayer.player_state[32] = false


rule "[bastion] clear modification on death keep scrap":
    @Event playerDied
    @Hero bastion

    eventPlayer.player_state[32] = false
    eventPlayer.player_state[31] = false
    eventPlayer.player_state[33] = 0
    if eventPlayer.player_state[36] == true:
        destroyHudText(eventPlayer.player_state[37])
    eventPlayer.player_state[36] = false
    eventPlayer.player_state[37] = null
    eventPlayer.stopScalingSize()
    eventPlayer.setMoveSpeed(100)
    eventPlayer.setDamageDealt(100)
    eventPlayer.setDamageReceived(100)
    eventPlayer.setKnockbackReceived(100)


rule "[bastion] clear scrap after hero swap":
    @Event eachPlayer
    @Condition eventPlayer.getHero() != Hero.BASTION
    @Condition eventPlayer.player_state[30] > 0 or eventPlayer.player_state[31] == true or eventPlayer.player_state[32] == true or eventPlayer.player_state[34] == true or eventPlayer.player_state[36] == true

    if eventPlayer.player_state[34] == true:
        destroyHudText(eventPlayer.player_state[35])
    if eventPlayer.player_state[36] == true:
        destroyHudText(eventPlayer.player_state[37])
    eventPlayer.player_state[30] = 0
    eventPlayer.player_state[31] = false
    eventPlayer.player_state[32] = false
    eventPlayer.player_state[33] = 0
    eventPlayer.player_state[34] = false
    eventPlayer.player_state[35] = null
    eventPlayer.player_state[36] = false
    eventPlayer.player_state[37] = null
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

    eventPlayer.player_state[8] = sorted(getPlayersOnHero(Hero.RAMATTRA, Team.ALL).filter(lambda player: player.ramattra_core_active == true and player != eventPlayer and distance(eventPlayer, player.ramattra_core_position) <= 3.2 and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())), key=lambda player: distance(eventPlayer, player.ramattra_core_position))[0]
    if len(eventPlayer.player_state[8].ramattra_core_effects) > 0:
        destroyEffect(eventPlayer.player_state[8].ramattra_core_effects[0])
    if len(eventPlayer.player_state[8].ramattra_core_effects) > 1:
        destroyEffect(eventPlayer.player_state[8].ramattra_core_effects[1])
    playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, Color.PURPLE, eventPlayer.player_state[8].ramattra_core_position, 3)
    smallMessage(eventPlayer, "摧毁痛苦核心")
    smallMessage(eventPlayer.player_state[8], "痛苦核心被摧毁")
    eventPlayer.player_state[8].ramattra_core_active = false
    eventPlayer.player_state[8].ramattra_core_position = null
    eventPlayer.player_state[8].ramattra_core_effects = []
    eventPlayer.player_state[8] = null


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
    createEffect(getAllPlayers(), Effect.BAD_AURA, Color.BLACK, eventPlayer.sigma_black_hole_position, 8, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.sigma_black_hole_effects.append(getLastCreatedEntity())
    createEffect(getAllPlayers(), Effect.GOOD_AURA, Color.PURPLE, eventPlayer.sigma_black_hole_position, 6.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.sigma_black_hole_effects.append(getLastCreatedEntity())
    createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Color.BLUE, eventPlayer.sigma_black_hole_position, 7, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.sigma_black_hole_effects.append(getLastCreatedEntity())
    playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, Color.PURPLE, eventPlayer.sigma_black_hole_position, 2.5)
    bigMessage(eventPlayer, "小黑洞展开")
    while eventPlayer.sigma_black_hole_active == true and eventPlayer.isAlive() == true and eventPlayer.getHero() == Hero.SIGMA and eventPlayer.sigma_black_hole_tick < 6:
        getPlayersInRadius(eventPlayer.sigma_black_hole_position, 8, Team.ALL).filter(lambda player: player != eventPlayer and player.isAlive() == true).applyImpulse(directionTowards(getPlayersInRadius(eventPlayer.sigma_black_hole_position, 8, Team.ALL).filter(lambda player: player != eventPlayer and player.isAlive() == true).getPosition(), eventPlayer.sigma_black_hole_position), 7, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
        if len(getPlayersInRadius(eventPlayer.sigma_black_hole_position, 2.2, Team.ALL).filter(lambda player: player != eventPlayer and player.isAlive() == true and player.sigma_black_hole_damage_taken < 40)) > 0:
            damage(getPlayersInRadius(eventPlayer.sigma_black_hole_position, 2.2, Team.ALL).filter(lambda player: player != eventPlayer and player.isAlive() == true and player.sigma_black_hole_damage_taken < 40), eventPlayer, 5)
            getPlayersInRadius(eventPlayer.sigma_black_hole_position, 2.2, Team.ALL).filter(lambda player: player != eventPlayer and player.isAlive() == true and player.sigma_black_hole_damage_taken < 40).sigma_black_hole_damage_taken += 5
        wait(0.5)
        eventPlayer.sigma_black_hole_tick += 1
    if eventPlayer.sigma_black_hole_active == true:
        if len(eventPlayer.sigma_black_hole_effects) > 0:
            destroyEffect(eventPlayer.sigma_black_hole_effects[0])
        if len(eventPlayer.sigma_black_hole_effects) > 1:
            destroyEffect(eventPlayer.sigma_black_hole_effects[1])
        if len(eventPlayer.sigma_black_hole_effects) > 2:
            destroyEffect(eventPlayer.sigma_black_hole_effects[2])
        playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, Color.PURPLE, eventPlayer.sigma_black_hole_position, 6)
        playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.BLUE, eventPlayer.sigma_black_hole_position, 4)
        getPlayersInRadius(eventPlayer.sigma_black_hole_position, 8, Team.ALL).filter(lambda player: player != eventPlayer and player.isAlive() == true).applyImpulse(directionTowards(eventPlayer.sigma_black_hole_position, getPlayersInRadius(eventPlayer.sigma_black_hole_position, 8, Team.ALL).filter(lambda player: player != eventPlayer and player.isAlive() == true).getPosition()), 16, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
        damage(getPlayersInRadius(eventPlayer.sigma_black_hole_position, 8, Team.ALL).filter(lambda player: player != eventPlayer and player.isAlive() == true), eventPlayer, 10)
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
        if len(eventPlayer.sigma_black_hole_effects) > 2:
            destroyEffect(eventPlayer.sigma_black_hole_effects[2])
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
        if len(eventPlayer.sigma_black_hole_effects) > 2:
            destroyEffect(eventPlayer.sigma_black_hole_effects[2])
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
    @Condition eventPlayer.player_state[9] == false

    eventPlayer.disallowButton(Button.SECONDARY_FIRE)
    eventPlayer.player_state[9] = true


rule "[winston] disable secondary fire":
    @Event eachPlayer
    @Hero winston
    @Condition eventPlayer.player_state[9] == false

    eventPlayer.disallowButton(Button.SECONDARY_FIRE)
    eventPlayer.player_state[9] = true


rule "[reaper and winston] restore secondary fire after hero swap":
    @Event eachPlayer
    @Condition eventPlayer.getHero() != Hero.REAPER
    @Condition eventPlayer.getHero() != Hero.WINSTON
    @Condition eventPlayer.player_state[9] == true

    eventPlayer.allowButton(Button.SECONDARY_FIRE)
    eventPlayer.player_state[9] = false


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
            eventPlayer.player_state[7] = sorted(getPlayersInRadius(victim.getPosition(), 3, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != victim and player != eventPlayer and player.isAlive() == true), key=lambda player: distance(victim, player))[0]
            damage(eventPlayer.player_state[7], eventPlayer, 4)
            playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.AQUA, eventPlayer.player_state[7], 1)
            eventPlayer.player_state[7] = null
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
    eventPlayer.player_state[7] = null


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
    eventPlayer.player_state[7] = null


rule "[zenyatta] clear slow on target death or hero swap":
    @Event eachPlayer
    @Condition eventPlayer.zen_slow_active == true or eventPlayer.zen_slow_timer == true
    @Condition eventPlayer.isDead() == true or (eventPlayer.zen_slow_hero != null and eventPlayer.getHero() != eventPlayer.zen_slow_hero)

    eventPlayer.setMoveSpeed(100)
    eventPlayer.zen_slow_active = false
    eventPlayer.zen_slow_timer = false
    eventPlayer.zen_slow_hero = null


rule "[hanzo] arrow rain command":
    @Event eachPlayer
    @Hero hanzo
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isUsingAbility1() == true
    @Condition eventPlayer.player_state[38] == false

    eventPlayer.player_state[38] = true
    eventPlayer.player_state[39] = nearestWalkablePosition(eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * 12)
    eventPlayer.player_state[40] = []
    eventPlayer.player_state[41] = []
    eventPlayer.player_state[44] = 0
    eventPlayer.setAbilityCooldown(Button.ABILITY_1, 8)
    createEffect(getAllPlayers(), Effect.GOOD_AURA, Color.YELLOW, eventPlayer.player_state[39], 5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_state[40].append(getLastCreatedEntity())
    createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Color.WHITE, eventPlayer.player_state[39], 5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_state[40].append(getLastCreatedEntity())
    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.YELLOW, eventPlayer.player_state[39], 5)
    smallMessage(eventPlayer, "箭雨令")
    wait(0.7)
    while eventPlayer.player_state[38] == true and eventPlayer.getHero() == Hero.HANZO and eventPlayer.player_state[44] < 5:
        eventPlayer.player_state[41] = getPlayersInRadius(eventPlayer.player_state[39], 5, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true)
        eventPlayer.player_state[41].setMoveSpeed(85)
        damage(eventPlayer.player_state[41], eventPlayer, 5)
        playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.WHITE, eventPlayer.player_state[39], 3)
        wait(0.25)
        eventPlayer.player_state[41].setMoveSpeed(100)
        eventPlayer.player_state[41] = []
        wait(0.25)
        eventPlayer.player_state[44] += 1
    if len(eventPlayer.player_state[40]) > 0:
        destroyEffect(eventPlayer.player_state[40][0])
    if len(eventPlayer.player_state[40]) > 1:
        destroyEffect(eventPlayer.player_state[40][1])
    eventPlayer.player_state[38] = false
    eventPlayer.player_state[39] = null
    eventPlayer.player_state[40] = []
    eventPlayer.player_state[41] = []
    eventPlayer.player_state[44] = 0


rule "[hanzo] extra air jump":
    @Event eachPlayer
    @Hero hanzo
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isInAir() == true
    @Condition eventPlayer.A == 0
    @Condition eventPlayer.isHoldingButton(Button.JUMP) == true
    @Condition eventPlayer.player_state[43] == false
    @Condition eventPlayer.player_state[42] < 4

    eventPlayer.player_state[43] = true
    eventPlayer.player_state[42] += 1
    eventPlayer.applyImpulse(Vector.UP, 10, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.WHITE, eventPlayer, 2)


rule "[hanzo] unlock extra air jump button":
    @Event eachPlayer
    @Hero hanzo
    @Condition eventPlayer.player_state[43] == true
    @Condition eventPlayer.isHoldingButton(Button.JUMP) == false

    eventPlayer.player_state[43] = false


rule "[hanzo] clear arrow rain and jumps":
    @Event eachPlayer
    @Condition eventPlayer.getHero() != Hero.HANZO or eventPlayer.isDead() == true
    @Condition eventPlayer.player_state[38] == true or eventPlayer.player_state[39] != null or len(eventPlayer.player_state[40]) > 0 or len(eventPlayer.player_state[41]) > 0 or eventPlayer.player_state[42] > 0 or eventPlayer.player_state[43] == true or eventPlayer.player_state[44] > 0

    if len(eventPlayer.player_state[40]) > 0:
        destroyEffect(eventPlayer.player_state[40][0])
    if len(eventPlayer.player_state[40]) > 1:
        destroyEffect(eventPlayer.player_state[40][1])
    eventPlayer.player_state[41].setMoveSpeed(100)
    eventPlayer.player_state[38] = false
    eventPlayer.player_state[39] = null
    eventPlayer.player_state[40] = []
    eventPlayer.player_state[41] = []
    eventPlayer.player_state[42] = 0
    eventPlayer.player_state[43] = false
    eventPlayer.player_state[44] = 0


rule "[hanzo] clear extra air jumps on landing":
    @Event eachPlayer
    @Hero hanzo
    @Condition eventPlayer.isOnGround() == true
    @Condition eventPlayer.player_state[42] > 0 or eventPlayer.player_state[43] == true

    eventPlayer.player_state[42] = 0
    eventPlayer.player_state[43] = false


rule "[orisa] create judgment energy hud":
    @Event eachPlayer
    @Hero orisa
    @Condition eventPlayer.player_state[47] == false

    eventPlayer.player_state[47] = true
    hudHeader(eventPlayer, "裁决能量：{}/7".format(eventPlayer.player_state[45]), HudPosition.RIGHT, -820, Color.GREEN, HudReeval.VISIBILITY_AND_STRING)
    eventPlayer.player_state[48] = getLastCreatedText()


rule "[orisa] gain judgment energy on hit":
    @Event playerDealtDamage
    @Hero orisa
    @Condition eventPlayer.isAlive() == true
    @Condition victim != eventPlayer
    @Condition eventDamage > 0
    @Condition eventAbility != Button.PRIMARY_FIRE
    @Condition eventAbility != Button.SECONDARY_FIRE
    @Condition eventPlayer.player_state[45] < 7
    @Condition eventPlayer.player_state[46] == false

    eventPlayer.player_state[46] = true
    if eventPlayer.isUsingAbility1() == true or random.randint(1, 100) <= 30:
        eventPlayer.player_state[45] += 1
        if eventPlayer.player_state[45] >= 7:
            eventPlayer.player_state[45] = 7
            bigMessage(eventPlayer, "裁决已满")
            playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.GREEN, eventPlayer, 2.5)
        else:
            smallMessage(eventPlayer, "裁决能量：{}/7".format(eventPlayer.player_state[45]))
            playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.YELLOW, eventPlayer, 1.4)
        eventPlayer.setMoveSpeed(100 + eventPlayer.player_state[45] * 2)
    wait(0.7)
    eventPlayer.player_state[46] = false


rule "[orisa] apply judgment energy move speed":
    @Event eachPlayer
    @Hero orisa
    @Condition eventPlayer.isAlive() == true

    eventPlayer.setMoveSpeed(100 + eventPlayer.player_state[45] * 2)
    wait(0.25)
    if ruleCondition:
        loop()


rule "[orisa] javelin damage cap":
    @Event playerDealtDamage
    @Hero orisa
    @Condition eventAbility == Button.SECONDARY_FIRE
    @Condition eventDamage > 25

    heal(victim, null, eventDamage - 25)


rule "[orisa] javelin releases judgment energy":
    @Event playerDealtDamage
    @Hero orisa
    @Condition eventPlayer.isAlive() == true
    @Condition eventAbility == Button.SECONDARY_FIRE
    @Condition eventPlayer.player_state[45] > 0

    eventPlayer.player_state[49] = eventPlayer.player_state[45]
    eventPlayer.player_state[45] = 0
    eventPlayer.setMoveSpeed(100)
    smallMessage(eventPlayer, "释放裁决：{}层".format(eventPlayer.player_state[49]))
    smallMessage(victim, "你被裁决")
    if eventPlayer.player_state[49] >= 7:
        victim.setMoveSpeed(45)
        if victim.getAbilityCooldown(Button.ABILITY_1) < 6:
            victim.setAbilityCooldown(Button.ABILITY_1, 6)
        if victim.getAbilityCooldown(Button.ABILITY_2) < 6:
            victim.setAbilityCooldown(Button.ABILITY_2, 6)
        if eventPlayer.getAbilityCooldown(Button.ABILITY_1) > 0:
            eventPlayer.setAbilityCooldown(Button.ABILITY_1, 0)
        heal(eventPlayer, null, 45)
        playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.GREEN, victim, 4)
        playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.YELLOW, eventPlayer, 3)
        bigMessage(eventPlayer, "满裁决")
        wait(1.5)
    elif eventPlayer.player_state[49] >= 5:
        victim.setMoveSpeed(55)
        if victim.getAbilityCooldown(Button.ABILITY_1) < 4.5:
            victim.setAbilityCooldown(Button.ABILITY_1, 4.5)
        if victim.getAbilityCooldown(Button.ABILITY_2) < 4.5:
            victim.setAbilityCooldown(Button.ABILITY_2, 4.5)
        if eventPlayer.getAbilityCooldown(Button.ABILITY_1) > 2:
            eventPlayer.setAbilityCooldown(Button.ABILITY_1, 2)
        heal(eventPlayer, null, 30)
        playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.GREEN, victim, 3)
        bigMessage(eventPlayer, "重裁决")
        wait(1.25)
    elif eventPlayer.player_state[49] >= 3:
        victim.setMoveSpeed(70)
        if victim.getAbilityCooldown(Button.ABILITY_1) < 3:
            victim.setAbilityCooldown(Button.ABILITY_1, 3)
        if victim.getAbilityCooldown(Button.ABILITY_2) < 3:
            victim.setAbilityCooldown(Button.ABILITY_2, 3)
        if eventPlayer.getAbilityCooldown(Button.ABILITY_1) > 4:
            eventPlayer.setAbilityCooldown(Button.ABILITY_1, 4)
        heal(eventPlayer, null, 20)
        playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.YELLOW, victim, 2.4)
        smallMessage(eventPlayer, "中裁决")
        wait(1)
    else:
        victim.setMoveSpeed(85)
        if victim.getAbilityCooldown(Button.ABILITY_1) < 1.5:
            victim.setAbilityCooldown(Button.ABILITY_1, 1.5)
        if victim.getAbilityCooldown(Button.ABILITY_2) < 1.5:
            victim.setAbilityCooldown(Button.ABILITY_2, 1.5)
        if eventPlayer.getAbilityCooldown(Button.ABILITY_1) > 6:
            eventPlayer.setAbilityCooldown(Button.ABILITY_1, 6)
        heal(eventPlayer, null, 10)
        playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.YELLOW, victim, 1.8)
        smallMessage(eventPlayer, "轻裁决")
        wait(0.8)
    victim.setMoveSpeed(100)
    eventPlayer.player_state[49] = 0


rule "[orisa] clear judgment temp state on death":
    @Event playerDied
    @Hero orisa

    eventPlayer.player_state[46] = false
    eventPlayer.player_state[49] = 0


rule "[orisa] clear judgment energy after hero swap":
    @Event eachPlayer
    @Condition eventPlayer.getHero() != Hero.ORISA
    @Condition eventPlayer.player_state[45] > 0 or eventPlayer.player_state[46] == true or eventPlayer.player_state[47] == true or eventPlayer.player_state[49] > 0

    if eventPlayer.player_state[47] == true:
        destroyHudText(eventPlayer.player_state[48])
    eventPlayer.player_state[45] = 0
    eventPlayer.player_state[46] = false
    eventPlayer.player_state[47] = false
    eventPlayer.player_state[48] = null
    eventPlayer.player_state[49] = 0
    eventPlayer.setMoveSpeed(100)


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


rule "[mei] melee adds frost stack":
    @Event playerDealtDamage
    @Hero mei
    @Condition eventPlayer.isAlive() == true
    @Condition victim.isAlive() == true
    @Condition victim != eventPlayer
    @Condition eventAbility == Button.MELEE
    @Condition eventDamage > 0
    @Condition getCurrentGamemode() == Gamemode.FFA or victim.getTeam() != eventPlayer.getTeam()
    @Condition victim.player_state[50] < 3
    @Condition victim.player_state[59] == false

    victim.player_state[59] = true
    victim.player_state[50] += 1
    victim.player_state[51] += 1
    victim.player_state[55] = victim.getHero()
    victim.player_state[65] = eventPlayer
    if victim.player_state[50] >= 3:
        victim.player_state[50] = 3
    smallMessage(eventPlayer, "寒气 {}/3".format(victim.player_state[50]))
    smallMessage(victim, "寒气 {}/3".format(victim.player_state[50]))
    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.AQUA, victim, 1.2)
    wait(0.35)
    victim.player_state[59] = false


rule "[mei] iceburst trap":
    @Event eachPlayer
    @Hero mei
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isUsingAbility2() == true
    @Condition eventPlayer.player_state[58] == false

    eventPlayer.player_state[58] = true
    eventPlayer.player_state[62] = nearestWalkablePosition(eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * 12)
    eventPlayer.setAbilityCooldown(Button.ABILITY_2, 8)
    createEffect(getAllPlayers(), Effect.GOOD_AURA, Color.AQUA, eventPlayer.player_state[62], 3.2, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_state[63].append(getLastCreatedEntity())
    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.AQUA, eventPlayer.player_state[62], 2)
    wait(0.65)
    playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, Color.AQUA, eventPlayer.player_state[62], 3.2)
    damage(getPlayersInRadius(eventPlayer.player_state[62], 3.2, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())), eventPlayer, 8)
    getPlayersInRadius(eventPlayer.player_state[62], 3.2, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).player_state[50] += 2
    getPlayersInRadius(eventPlayer.player_state[62], 3.2, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).player_state[51] += 1
    getPlayersInRadius(eventPlayer.player_state[62], 3.2, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).player_state[55] = getPlayersInRadius(eventPlayer.player_state[62], 3.2, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).getHero()
    getPlayersInRadius(eventPlayer.player_state[62], 3.2, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).player_state[65] = eventPlayer
    getPlayersInRadius(eventPlayer.player_state[62], 3.2, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).setMoveSpeed(75)
    getPlayersInRadius(eventPlayer.player_state[62], 3.2, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).player_state[53] = true
    getPlayersInRadius(eventPlayer.player_state[62], 3.2, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).player_state[54] += 1
    smallMessage(getPlayersInRadius(eventPlayer.player_state[62], 3.2, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())), "寒气 +2")
    wait(0.8)
    if len(eventPlayer.player_state[63]) > 0:
        destroyEffect(eventPlayer.player_state[63][0])
    eventPlayer.player_state[62] = null
    eventPlayer.player_state[63] = []
    wait(7.2)
    eventPlayer.player_state[58] = false


rule "[mei] frost aura":
    @Event eachPlayer
    @Hero mei
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isUsingAbility1() == true
    @Condition eventPlayer.player_state[56] == false

    eventPlayer.player_state[56] = true
    eventPlayer.setAbilityCooldown(Button.ABILITY_1, 8)
    createEffect(getAllPlayers(), Effect.CLOUD, Color.AQUA, eventPlayer, 3.8, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_state[57].append(getLastCreatedEntity())
    createEffect(getAllPlayers(), Effect.GOOD_AURA, Color.AQUA, eventPlayer, 3.8, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_state[57].append(getLastCreatedEntity())
    smallMessage(eventPlayer, "寒气圈展开")
    wait(4)
    if len(eventPlayer.player_state[57]) > 0:
        destroyEffect(eventPlayer.player_state[57][0])
    if len(eventPlayer.player_state[57]) > 1:
        destroyEffect(eventPlayer.player_state[57][1])
    eventPlayer.player_state[57] = []
    eventPlayer.player_state[56] = false


rule "[mei] frost aura adds stack":
    @Event eachPlayer
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.player_state[61] == false
    @Condition len(getPlayersOnHero(Hero.MEI, Team.ALL).filter(lambda player: player != eventPlayer and player.isAlive() == true and player.player_state[56] == true and distance(eventPlayer, player) <= 3.8 and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam()))) > 0
    @Condition eventPlayer.player_state[50] < 3

    eventPlayer.player_state[61] = true
    eventPlayer.player_state[50] += 1
    eventPlayer.player_state[51] += 1
    eventPlayer.player_state[55] = eventPlayer.getHero()
    eventPlayer.player_state[65] = sorted(getPlayersOnHero(Hero.MEI, Team.ALL).filter(lambda player: player != eventPlayer and player.isAlive() == true and player.player_state[56] == true and distance(eventPlayer, player) <= 3.8 and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())), key=lambda player: distance(eventPlayer, player))[0]
    if eventPlayer.player_state[50] >= 3:
        eventPlayer.player_state[50] = 3
    smallMessage(eventPlayer, "寒气 {}/3".format(eventPlayer.player_state[50]))
    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.AQUA, eventPlayer, 1)
    wait(2)
    eventPlayer.player_state[61] = false


rule "[mei] full frost freezes target":
    @Event eachPlayer
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.player_state[50] >= 3

    eventPlayer.player_state[50] = 0
    eventPlayer.player_state[51] += 1
    eventPlayer.player_state[55] = eventPlayer.getHero()
    bigMessage(eventPlayer, "寒气爆发")
    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.AQUA, eventPlayer, 2.5)
    playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, Color.WHITE, eventPlayer, 2)
    eventPlayer.setStatusEffect(null, Status.FROZEN, 0.6)
    wait(0.6)
    if eventPlayer.isAlive() == true and eventPlayer.getHero() == eventPlayer.player_state[55]:
        eventPlayer.setMoveSpeed(65)
        eventPlayer.player_state[53] = true
        eventPlayer.player_state[54] += 1


rule "[mei] restore frost slow":
    @Event eachPlayer
    @Condition eventPlayer.player_state[53] == true
    @Condition eventPlayer.player_state[64] != eventPlayer.player_state[54]

    eventPlayer.player_state[64] = eventPlayer.player_state[54]
    wait(2)
    if eventPlayer.player_state[53] == true and eventPlayer.player_state[64] == eventPlayer.player_state[54] and eventPlayer.isAlive() == true and eventPlayer.getHero() == eventPlayer.player_state[55]:
        eventPlayer.setMoveSpeed(100)
    if eventPlayer.player_state[64] == eventPlayer.player_state[54]:
        eventPlayer.player_state[53] = false


rule "[mei] frost stack decay":
    @Event eachPlayer
    @Condition eventPlayer.player_state[50] > 0
    @Condition eventPlayer.player_state[52] == false

    eventPlayer.player_state[52] = true
    eventPlayer.player_state[60] = eventPlayer.player_state[51]
    waitUntil(eventPlayer.player_state[60] != eventPlayer.player_state[51] or eventPlayer.isDead() == true or eventPlayer.getHero() != eventPlayer.player_state[55], 3)
    while eventPlayer.player_state[50] > 0 and eventPlayer.player_state[60] == eventPlayer.player_state[51] and eventPlayer.isAlive() == true and eventPlayer.getHero() == eventPlayer.player_state[55]:
        wait(2)
        if eventPlayer.player_state[50] > 0 and eventPlayer.player_state[60] == eventPlayer.player_state[51] and eventPlayer.isAlive() == true and eventPlayer.getHero() == eventPlayer.player_state[55]:
            eventPlayer.player_state[50] -= 1
            smallMessage(eventPlayer, "寒气消退：{}/3".format(eventPlayer.player_state[50]))
    eventPlayer.player_state[52] = false


rule "[mei] clear frost target state":
    @Event eachPlayer
    @Condition eventPlayer.isDead() == true or eventPlayer.getHero() != eventPlayer.player_state[55]
    @Condition eventPlayer.player_state[50] > 0 or eventPlayer.player_state[52] == true or eventPlayer.player_state[53] == true or eventPlayer.player_state[59] == true or eventPlayer.player_state[61] == true

    eventPlayer.player_state[50] = 0
    eventPlayer.player_state[51] += 1
    eventPlayer.player_state[52] = false
    eventPlayer.player_state[53] = false
    eventPlayer.player_state[54] += 1
    eventPlayer.player_state[55] = null
    eventPlayer.player_state[65] = null
    eventPlayer.player_state[59] = false
    eventPlayer.player_state[60] = 0
    eventPlayer.player_state[61] = false
    eventPlayer.player_state[64] = 0
    eventPlayer.setMoveSpeed(100)
    eventPlayer.clearStatusEffect(Status.FROZEN)


rule "[mei] clear frost when source mei leaves":
    @Event eachPlayer
    @Condition eventPlayer.player_state[65] != null
    @Condition eventPlayer.player_state[65].isDead() == true or eventPlayer.player_state[65].getHero() != Hero.MEI
    @Condition eventPlayer.player_state[50] > 0 or eventPlayer.player_state[52] == true or eventPlayer.player_state[53] == true or eventPlayer.player_state[59] == true or eventPlayer.player_state[61] == true

    eventPlayer.player_state[50] = 0
    eventPlayer.player_state[51] += 1
    eventPlayer.player_state[52] = false
    eventPlayer.player_state[53] = false
    eventPlayer.player_state[54] += 1
    eventPlayer.player_state[55] = null
    eventPlayer.player_state[59] = false
    eventPlayer.player_state[60] = 0
    eventPlayer.player_state[61] = false
    eventPlayer.player_state[64] = 0
    eventPlayer.player_state[65] = null
    eventPlayer.setMoveSpeed(100)
    eventPlayer.clearStatusEffect(Status.FROZEN)


rule "[mei] clear frost aura after death or hero swap":
    @Event eachPlayer
    @Condition eventPlayer.getHero() != Hero.MEI or eventPlayer.isDead() == true
    @Condition eventPlayer.player_state[56] == true or len(eventPlayer.player_state[57]) > 0 or eventPlayer.player_state[58] == true or eventPlayer.player_state[62] != null or len(eventPlayer.player_state[63]) > 0

    if len(eventPlayer.player_state[57]) > 0:
        destroyEffect(eventPlayer.player_state[57][0])
    if len(eventPlayer.player_state[57]) > 1:
        destroyEffect(eventPlayer.player_state[57][1])
    if len(eventPlayer.player_state[63]) > 0:
        destroyEffect(eventPlayer.player_state[63][0])
    eventPlayer.player_state[56] = false
    eventPlayer.player_state[57] = []
    eventPlayer.player_state[58] = false
    eventPlayer.player_state[62] = null
    eventPlayer.player_state[63] = []


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
    @Condition eventPlayer.player_state[20] == false
    @Condition victim.baptiste_drug_target_active == false

    if random.randint(1, 100) <= 18:
        eventPlayer.player_state[20] = true
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
        eventPlayer.player_state[20] = false


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
    @Condition eventPlayer.player_state[26] == false

    eventPlayer.player_state[26] = true
    hudHeader(eventPlayer, "托比昂零件：{}/3".format(eventPlayer.player_state[21]), HudPosition.RIGHT, -850, Color.YELLOW, HudReeval.VISIBILITY_AND_STRING)
    eventPlayer.player_state[27] = getLastCreatedText()


rule "[torbjorn] gain parts on elimination":
    @Event playerEarnedElimination
    @Hero torbjorn
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.player_state[23] == false

    if eventPlayer.player_state[21] < 3:
        eventPlayer.player_state[21] += 1
    if eventPlayer.player_state[21] >= 3:
        eventPlayer.player_state[21] = 3
        eventPlayer.player_state[22] = true
        smallMessage(eventPlayer, "非法改装就绪")
    else:
        smallMessage(eventPlayer, "获得零件：{}/3".format(eventPlayer.player_state[21]))
    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.YELLOW, eventPlayer, 1.5)


rule "[torbjorn] activate illegal modification":
    @Event eachPlayer
    @Hero torbjorn
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.player_state[21] >= 3
    @Condition eventPlayer.player_state[23] == false
    @Condition eventPlayer.player_state[25] == false
    @Condition eventPlayer.isUsingAbility2() == true

    eventPlayer.player_state[23] = true
    eventPlayer.player_state[22] = false
    eventPlayer.player_state[25] = true
    eventPlayer.player_state[21] = 0
    eventPlayer.player_state[24] = random.randint(1, 4)
    smallMessage(eventPlayer, "非法改装启动！")
    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.ORANGE, eventPlayer, 3)
    if eventPlayer.player_state[24] == 1:
        eventPlayer.startScalingSize(1.6)
        eventPlayer.setDamageDealt(120)
        eventPlayer.setMoveSpeed(80)
        eventPlayer.setKnockbackReceived(130)
        eventPlayer.player_state[28] = true
        hudHeader(eventPlayer, "当前改装：巨型模块", HudPosition.RIGHT, -849, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING)
        eventPlayer.player_state[29] = getLastCreatedText()
        playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.ORANGE, eventPlayer, 3)
        bigMessage(eventPlayer, "非法改装：巨型模块")
        wait(1)
        eventPlayer.player_state[25] = false
    elif eventPlayer.player_state[24] == 2:
        eventPlayer.startScalingSize(0.65)
        eventPlayer.setMoveSpeed(140)
        eventPlayer.setDamageDealt(70)
        eventPlayer.setKnockbackReceived(160)
        eventPlayer.player_state[28] = true
        hudHeader(eventPlayer, "当前改装：迷你模块", HudPosition.RIGHT, -849, Color.BLUE, HudReeval.VISIBILITY_AND_STRING)
        eventPlayer.player_state[29] = getLastCreatedText()
        playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.BLUE, eventPlayer, 2)
        bigMessage(eventPlayer, "非法改装：迷你模块")
        wait(1)
        eventPlayer.player_state[25] = false
    elif eventPlayer.player_state[24] == 3:
        eventPlayer.startScalingSize(1.25)
        eventPlayer.setDamageReceived(70)
        eventPlayer.setMoveSpeed(75)
        eventPlayer.setDamageDealt(80)
        eventPlayer.setKnockbackReceived(70)
        eventPlayer.player_state[28] = true
        hudHeader(eventPlayer, "当前改装：防爆模块", HudPosition.RIGHT, -849, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
        eventPlayer.player_state[29] = getLastCreatedText()
        playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.WHITE, eventPlayer, 2.5)
        bigMessage(eventPlayer, "非法改装：防爆模块")
        wait(1)
        eventPlayer.player_state[25] = false
    else:
        eventPlayer.startScalingSize(1.8)
        eventPlayer.setMoveSpeed(60)
        eventPlayer.setDamageReceived(130)
        eventPlayer.setStatusEffect(null, Status.KNOCKED_DOWN, 0.75)
        eventPlayer.player_state[28] = true
        hudHeader(eventPlayer, "当前改装：失败改装", HudPosition.RIGHT, -849, Color.RED, HudReeval.VISIBILITY_AND_STRING)
        eventPlayer.player_state[29] = getLastCreatedText()
        playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, Color.RED, eventPlayer, 3)
        bigMessage(eventPlayer, "非法改装失败！")
        wait(2)
        eventPlayer.stopScalingSize()
        eventPlayer.setMoveSpeed(100)
        eventPlayer.setDamageDealt(100)
        eventPlayer.setDamageReceived(100)
        eventPlayer.setKnockbackReceived(100)
        if eventPlayer.player_state[28] == true:
            destroyHudText(eventPlayer.player_state[29])
        eventPlayer.player_state[28] = false
        eventPlayer.player_state[29] = null
        eventPlayer.player_state[23] = false
        wait(1)
        eventPlayer.player_state[25] = false


rule "[torbjorn] clear illegal modification on death":
    @Event playerDied
    @Hero torbjorn

    eventPlayer.player_state[21] = 0
    eventPlayer.player_state[22] = false
    eventPlayer.player_state[23] = false
    eventPlayer.player_state[24] = 0
    eventPlayer.player_state[25] = false
    if eventPlayer.player_state[28] == true:
        destroyHudText(eventPlayer.player_state[29])
    eventPlayer.player_state[28] = false
    eventPlayer.player_state[29] = null
    eventPlayer.stopScalingSize()
    eventPlayer.setMoveSpeed(100)
    eventPlayer.setDamageDealt(100)
    eventPlayer.setDamageReceived(100)
    eventPlayer.setKnockbackReceived(100)


rule "[torbjorn] clear illegal modification after hero swap":
    @Event eachPlayer
    @Condition eventPlayer.getHero() != Hero.TORBJORN
    @Condition eventPlayer.player_state[21] > 0 or eventPlayer.player_state[22] == true or eventPlayer.player_state[23] == true or eventPlayer.player_state[25] == true or eventPlayer.player_state[26] == true or eventPlayer.player_state[28] == true

    if eventPlayer.player_state[26] == true:
        destroyHudText(eventPlayer.player_state[27])
    if eventPlayer.player_state[28] == true:
        destroyHudText(eventPlayer.player_state[29])
    eventPlayer.player_state[21] = 0
    eventPlayer.player_state[22] = false
    eventPlayer.player_state[23] = false
    eventPlayer.player_state[24] = 0
    eventPlayer.player_state[25] = false
    eventPlayer.player_state[26] = false
    eventPlayer.player_state[27] = null
    eventPlayer.player_state[28] = false
    eventPlayer.player_state[29] = null
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
    eventPlayer.player_state[10] = true
    smallMessage(eventPlayer, "钩中目标：下一次近战击退增强")
    wait(3)
    victim.stopScalingSize()
    victim.setMoveSpeed(100)
    victim.setKnockbackReceived(100)


rule "[roadhog] consume boosted melee knockback":
    @Event playerDealtDamage
    @Hero roadhog
    @Condition eventPlayer.player_state[10] == true
    @Condition eventPlayer.isMeleeing() == true

    eventPlayer.player_state[10] = false
    victim.applyImpulse(directionTowards(eventPlayer.getPosition(), victim.getPosition()), 25, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
    smallMessage(eventPlayer, "强化近战击退触发")


rule "[lucio] remember airborne state":
    @Event eachPlayer
    @Hero lucio
    @Condition eventPlayer.isInAir() == true
    @Condition eventPlayer.player_state[12] == false

    eventPlayer.player_state[11] = true


rule "[lucio] landing bounce":
    @Event eachPlayer
    @Hero lucio
    @Condition eventPlayer.player_state[11] == true
    @Condition eventPlayer.isInAir() == false
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.player_state[12] == false

    eventPlayer.player_state[11] = false
    eventPlayer.player_state[12] = true
    getPlayersInRadius(eventPlayer.getPosition(), 8, Team.ALL).filter(lambda player: player != eventPlayer).player_state[12] = true
    getPlayersInRadius(eventPlayer.getPosition(), 8, Team.ALL).filter(lambda player: player != eventPlayer).applyImpulse(Vector.UP, 12, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
    eventPlayer.setMoveSpeed(140)
    smallMessage(eventPlayer, "落地冲击")
    wait(1.5)
    eventPlayer.setMoveSpeed(100)


rule "[lucio] clear landing bounce cooldown":
    @Event eachPlayer
    @Hero lucio
    @Condition eventPlayer.player_state[12] == true

    wait(1)
    eventPlayer.player_state[12] = false


rule "[sojourn] power slide launches nearby players":
    @Event eachPlayer
    @Hero sojourn
    @Condition eventPlayer.isUsingAbility1() == true
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.player_state[13] == false
    @Condition len(getPlayersInRadius(eventPlayer.getPosition(), 2.6, Team.ALL).filter(lambda player: player != eventPlayer)) > 0

    eventPlayer.player_state[13] = true
    damage(getPlayersInRadius(eventPlayer.getPosition(), 2.6, Team.ALL).filter(lambda player: player != eventPlayer), eventPlayer, 20)
    getPlayersInRadius(eventPlayer.getPosition(), 2.6, Team.ALL).filter(lambda player: player != eventPlayer).setStatusEffect(eventPlayer, Status.KNOCKED_DOWN, 1.25)
    getPlayersInRadius(eventPlayer.getPosition(), 2.6, Team.ALL).filter(lambda player: player != eventPlayer).applyImpulse(directionTowards(eventPlayer.getPosition(), getPlayersInRadius(eventPlayer.getPosition(), 2.6, Team.ALL).filter(lambda player: player != eventPlayer).getPosition()), 18, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.BLUE, eventPlayer, 2.6)
    smallMessage(eventPlayer, "滑铲创飞！")
    wait(0.8)
    eventPlayer.player_state[13] = false


rule "[brigitte] shield bash blink stun":
    @Event eachPlayer
    @Hero brigitte
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.player_state[3] == false
    @Condition eventPlayer.isFiringSecondaryFire() == true
    @Condition eventPlayer.isFiringPrimaryFire() == true
    @Condition len(getLivingPlayers(Team.ALL).filter(lambda player: player != eventPlayer and player.isAlive() == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam()) and eventPlayer.isInViewAngle(player.getPosition(), 60) == true and distance(eventPlayer, player) > 12 and distance(eventPlayer, player) <= 25 and isInLoS(eventPlayer, player, BarrierLos.PASS_THROUGH_BARRIERS) == true)) > 0

    eventPlayer.player_state[4] = sorted(getLivingPlayers(Team.ALL).filter(lambda player: player != eventPlayer and player.isAlive() == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam()) and eventPlayer.isInViewAngle(player.getPosition(), 60) == true and distance(eventPlayer, player) > 12 and distance(eventPlayer, player) <= 25 and isInLoS(eventPlayer, player, BarrierLos.PASS_THROUGH_BARRIERS) == true), key=lambda player: angleBetweenVectors(eventPlayer.getFacingDirection(), player.getPosition() - eventPlayer.getEyePosition()))[0]
    if distance(nearestWalkablePosition(eventPlayer.player_state[4].getPosition() + directionTowards(eventPlayer.player_state[4].getPosition(), eventPlayer.getPosition()) * 2.2), eventPlayer.player_state[4]) <= 4:
        eventPlayer.player_state[3] = true
        eventPlayer.cancelPrimaryAction()
        playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.YELLOW, eventPlayer.getEyePosition(), 1.5)
        eventPlayer.teleport(nearestWalkablePosition(eventPlayer.player_state[4].getPosition() + directionTowards(eventPlayer.player_state[4].getPosition(), eventPlayer.getPosition()) * 2.2))
        playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.YELLOW, eventPlayer, 2)
        eventPlayer.player_state[4].setStatusEffect(eventPlayer, Status.STUNNED, 0.5)
        smallMessage(eventPlayer, "盾击瞬移")
        wait(4)
        eventPlayer.player_state[3] = false
    eventPlayer.player_state[4] = null


rule "[brigitte] shield counter melee attackers":
    @Event eachPlayer
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isMeleeing() == true
    @Condition eventPlayer.player_state[5] == false
    @Condition len(getLivingPlayers(Team.ALL).filter(lambda player: player != eventPlayer and player.getHero() == Hero.BRIGITTE and player.isAlive() == true and player.isFiringSecondaryFire() == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam()) and distance(eventPlayer, player) <= 3.2 and eventPlayer.isInViewAngle(player.getPosition(), 70) == true and player.isInViewAngle(eventPlayer.getPosition(), 100) == true and isInLoS(eventPlayer, player, BarrierLos.PASS_THROUGH_BARRIERS) == true)) > 0

    eventPlayer.player_state[5] = true
    eventPlayer.player_state[6] = sorted(getLivingPlayers(Team.ALL).filter(lambda player: player != eventPlayer and player.getHero() == Hero.BRIGITTE and player.isAlive() == true and player.isFiringSecondaryFire() == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam()) and distance(eventPlayer, player) <= 3.2 and eventPlayer.isInViewAngle(player.getPosition(), 70) == true and player.isInViewAngle(eventPlayer.getPosition(), 100) == true and isInLoS(eventPlayer, player, BarrierLos.PASS_THROUGH_BARRIERS) == true), key=lambda player: distance(eventPlayer, player))[0]
    eventPlayer.setStatusEffect(eventPlayer.player_state[6], Status.STUNNED, 0.35)
    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.YELLOW, eventPlayer.player_state[6].getEyePosition(), 1.6)
    smallMessage(eventPlayer.player_state[6], "盾反成功")
    smallMessage(eventPlayer, "被盾反")
    eventPlayer.player_state[6] = null
    wait(1)
    eventPlayer.player_state[5] = false


rule "[brigitte] clear shield bash blink on death":
    @Event playerDied
    @Hero brigitte

    eventPlayer.player_state[3] = false
    eventPlayer.player_state[4] = null


rule "[brigitte] clear shield bash blink after hero swap":
    @Event eachPlayer
    @Condition eventPlayer.getHero() != Hero.BRIGITTE
    @Condition eventPlayer.player_state[3] == true or eventPlayer.player_state[4] != null

    eventPlayer.player_state[3] = false
    eventPlayer.player_state[4] = null


rule "[brigitte] clear shield counter attacker state":
    @Event eachPlayer
    @Condition eventPlayer.player_state[5] == true or eventPlayer.player_state[6] != null
    @Condition eventPlayer.isDead() == true

    eventPlayer.player_state[5] = false
    eventPlayer.player_state[6] = null


rule "[winston] electric barrier field":
    @Event eachPlayer
    @Hero winston
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isUsingAbility2() == true
    @Condition eventPlayer.winston_barrier_active == false

    eventPlayer.winston_barrier_active = true
    eventPlayer.winston_barrier_pos = eventPlayer.getPosition()
    eventPlayer.winston_barrier_fx = []
    createEffect(getAllPlayers(), Effect.GOOD_AURA, Color.BLUE, eventPlayer.winston_barrier_pos, 5.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.winston_barrier_fx.append(getLastCreatedEntity())
    createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Color.AQUA, eventPlayer.winston_barrier_pos, 5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.winston_barrier_fx.append(getLastCreatedEntity())
    smallMessage(eventPlayer, "电蚊香屏障展开")
    wait(7.5)
    if len(eventPlayer.winston_barrier_fx) > 0:
        destroyEffect(eventPlayer.winston_barrier_fx[0])
    if len(eventPlayer.winston_barrier_fx) > 1:
        destroyEffect(eventPlayer.winston_barrier_fx[1])
    eventPlayer.winston_barrier_active = false
    eventPlayer.winston_barrier_pos = null
    eventPlayer.winston_barrier_fx = []


rule "[winston] electric barrier zaps nearby players":
    @Event eachPlayer
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.winston_zap_cd == false
    @Condition len(getLivingPlayers(Team.ALL).filter(lambda player: player != eventPlayer and player.getHero() == Hero.WINSTON and player.isAlive() == true and player.winston_barrier_active == true and player.winston_barrier_pos != null and distance(eventPlayer.getPosition(), player.winston_barrier_pos) <= 5.5)) > 0

    eventPlayer.winston_zap_cd = true
    eventPlayer.winston_zap_fx = null
    createBeam(getAllPlayers(), Beam.GOOD, sorted(getLivingPlayers(Team.ALL).filter(lambda player: player != eventPlayer and player.getHero() == Hero.WINSTON and player.isAlive() == true and player.winston_barrier_active == true and player.winston_barrier_pos != null and distance(eventPlayer.getPosition(), player.winston_barrier_pos) <= 5.5), key=lambda player: distance(eventPlayer.getPosition(), player.winston_barrier_pos))[0].winston_barrier_pos, eventPlayer, Color.AQUA, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.winston_zap_fx = getLastCreatedEntity()
    eventPlayer.setStatusEffect(sorted(getLivingPlayers(Team.ALL).filter(lambda player: player != eventPlayer and player.getHero() == Hero.WINSTON and player.isAlive() == true and player.winston_barrier_active == true and player.winston_barrier_pos != null and distance(eventPlayer.getPosition(), player.winston_barrier_pos) <= 5.5), key=lambda player: distance(eventPlayer.getPosition(), player.winston_barrier_pos))[0], Status.STUNNED, 0.25)
    eventPlayer.setMoveSpeed(70)
    damage(eventPlayer, sorted(getLivingPlayers(Team.ALL).filter(lambda player: player != eventPlayer and player.getHero() == Hero.WINSTON and player.isAlive() == true and player.winston_barrier_active == true and player.winston_barrier_pos != null and distance(eventPlayer.getPosition(), player.winston_barrier_pos) <= 5.5), key=lambda player: distance(eventPlayer.getPosition(), player.winston_barrier_pos))[0], 5)
    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.AQUA, eventPlayer, 1.2)
    wait(0.25)
    if eventPlayer.winston_zap_fx != null:
        destroyEffect(eventPlayer.winston_zap_fx)
    eventPlayer.winston_zap_fx = null
    wait(0.75)
    eventPlayer.clearStatusEffect(Status.STUNNED)
    eventPlayer.setMoveSpeed(100)
    eventPlayer.winston_zap_cd = false


rule "[winston] clear electric barrier on death":
    @Event playerDied
    @Hero winston

    if eventPlayer.winston_barrier_active == true:
        if len(eventPlayer.winston_barrier_fx) > 0:
            destroyEffect(eventPlayer.winston_barrier_fx[0])
        if len(eventPlayer.winston_barrier_fx) > 1:
            destroyEffect(eventPlayer.winston_barrier_fx[1])
    eventPlayer.winston_barrier_active = false
    eventPlayer.winston_barrier_pos = null
    eventPlayer.winston_barrier_fx = []


rule "[winston] clear electric barrier after hero swap":
    @Event eachPlayer
    @Condition eventPlayer.getHero() != Hero.WINSTON
    @Condition eventPlayer.winston_barrier_active == true or eventPlayer.winston_barrier_pos != null

    if eventPlayer.winston_barrier_active == true:
        if len(eventPlayer.winston_barrier_fx) > 0:
            destroyEffect(eventPlayer.winston_barrier_fx[0])
        if len(eventPlayer.winston_barrier_fx) > 1:
            destroyEffect(eventPlayer.winston_barrier_fx[1])
    eventPlayer.winston_barrier_active = false
    eventPlayer.winston_barrier_pos = null
    eventPlayer.winston_barrier_fx = []


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


rule "[illari] create solar power hud":
    @Event eachPlayer
    @Hero illari
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.player_state[67] == false

    eventPlayer.player_state[67] = true
    hudHeader(eventPlayer, "太阳之力：{}/3".format(eventPlayer.player_state[66]), HudPosition.RIGHT, -810, Color.YELLOW, HudReeval.VISIBILITY_AND_STRING)
    eventPlayer.player_state[68] = getLastCreatedText()


rule "[illari] suppress ranged weapon damage":
    @Event playerDealtDamage
    @Hero illari
    @Condition eventAbility == Button.PRIMARY_FIRE or eventAbility == Button.SECONDARY_FIRE
    @Condition eventDamage > 0

    heal(victim, null, eventDamage)


rule "[illari] gain solar power on melee":
    @Event playerDealtDamage
    @Hero illari
    @Condition eventPlayer.isAlive() == true
    @Condition victim != eventPlayer
    @Condition eventAbility == Button.MELEE
    @Condition eventDamage > 0
    @Condition getCurrentGamemode() == Gamemode.FFA or victim.getTeam() != eventPlayer.getTeam()
    @Condition eventPlayer.player_state[80] == false

    eventPlayer.player_state[80] = true
    eventPlayer.player_state[69] = victim
    if eventPlayer.player_state[66] < 3:
        eventPlayer.player_state[66] += 1
    if eventPlayer.player_state[66] >= 3:
        eventPlayer.player_state[66] = 3
        bigMessage(eventPlayer, "太阳之力已满，按右键召唤小太阳")
        playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.YELLOW, eventPlayer, 2.5)
    else:
        smallMessage(eventPlayer, "太阳之力：{}/3".format(eventPlayer.player_state[66]))
        playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.ORANGE, eventPlayer, 1.5)
    wait(0.35)
    eventPlayer.player_state[80] = false


rule "[illari] summon mini sun":
    @Event eachPlayer
    @Hero illari
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isHoldingButton(Button.SECONDARY_FIRE) == true
    @Condition eventPlayer.player_state[66] >= 3
    @Condition eventPlayer.player_state[70] == false
    @Condition eventPlayer.player_state[76] == false

    eventPlayer.player_state[76] = true
    eventPlayer.player_state[71] = eventPlayer.getPosition() + Vector.UP * 4.5
    createEffect(getAllPlayers(), Effect.GOOD_AURA, Color.ORANGE, eventPlayer, 4, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_state[72].append(getLastCreatedEntity())
    createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Color.YELLOW, eventPlayer, 4, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_state[72].append(getLastCreatedEntity())
    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.YELLOW, eventPlayer, 3)
    smallMessage(eventPlayer, "召唤太阳蓄力")
    wait(0.7)
    if eventPlayer.isAlive() == true and eventPlayer.getHero() == Hero.ILLARI:
        eventPlayer.player_state[66] = 0
        eventPlayer.player_state[70] = true
        eventPlayer.player_state[75] = 0
        playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.ORANGE, eventPlayer.player_state[71], 4)
        createEffect(getAllPlayers(), Effect.GOOD_AURA, Color.ORANGE, eventPlayer.player_state[71], 2.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
        eventPlayer.player_state[72].append(getLastCreatedEntity())
        createEffect(getAllPlayers(), Effect.BAD_AURA, Color.ORANGE, eventPlayer.player_state[71], 4.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
        eventPlayer.player_state[72].append(getLastCreatedEntity())
        createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Color.YELLOW, eventPlayer.player_state[71], 3.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
        eventPlayer.player_state[72].append(getLastCreatedEntity())
        if eventPlayer.player_state[69] != null and eventPlayer.player_state[69].isAlive() == true and (getCurrentGamemode() == Gamemode.FFA or eventPlayer.player_state[69].getTeam() != eventPlayer.getTeam()) and distance(eventPlayer.player_state[69], eventPlayer) <= 35:
            eventPlayer.player_state[73] = eventPlayer.player_state[69]
        elif len(getLivingPlayers(Team.ALL).filter(lambda player: player != eventPlayer and player.isAlive() == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam()) and distance(player, eventPlayer) <= 35)) > 0:
            eventPlayer.player_state[73] = sorted(getLivingPlayers(Team.ALL).filter(lambda player: player != eventPlayer and player.isAlive() == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam()) and distance(player, eventPlayer) <= 35), key=lambda player: distance(player, eventPlayer))[0]
        if eventPlayer.player_state[73] != null:
            eventPlayer.player_state[77] = eventPlayer.player_state[73].getHero()
            eventPlayer.player_state[73].player_state[78] = eventPlayer
            smallMessage(eventPlayer.player_state[73], "你被太阳点名了，快找掩体！")
            smallMessage(eventPlayer, "小太阳已锁定目标")
            createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Color.YELLOW, eventPlayer.player_state[73], 2, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
            eventPlayer.player_state[74].append(getLastCreatedEntity())
            createEffect(getAllPlayers(), Effect.GOOD_AURA, Color.ORANGE, eventPlayer.player_state[73], 1.6, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
            eventPlayer.player_state[74].append(getLastCreatedEntity())
            createBeam(getAllPlayers(), Beam.GOOD, eventPlayer.player_state[71], eventPlayer.player_state[73], Color.YELLOW, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
            eventPlayer.player_state[74].append(getLastCreatedEntity())
        else:
            smallMessage(eventPlayer, "小太阳未找到目标")
        while eventPlayer.player_state[70] == true and eventPlayer.isAlive() == true and eventPlayer.getHero() == Hero.ILLARI and eventPlayer.player_state[75] < 10:
            if eventPlayer.player_state[73] != null and eventPlayer.player_state[73].isAlive() == true and eventPlayer.player_state[73].getHero() == eventPlayer.player_state[77] and distance(eventPlayer.player_state[73], eventPlayer.player_state[71]) <= 35 and isInLoS(eventPlayer.player_state[71], eventPlayer.player_state[73], BarrierLos.PASS_THROUGH_BARRIERS) == true:
                damage(eventPlayer.player_state[73], eventPlayer, 6)
                playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.ORANGE, eventPlayer.player_state[73], 0.8)
            eventPlayer.player_state[75] += 1
            wait(0.5)
    if eventPlayer.player_state[73] != null and eventPlayer.player_state[73].player_state[78] == eventPlayer:
        eventPlayer.player_state[73].player_state[78] = null
    if len(eventPlayer.player_state[72]) > 0:
        destroyEffect(eventPlayer.player_state[72][0])
    if len(eventPlayer.player_state[72]) > 1:
        destroyEffect(eventPlayer.player_state[72][1])
    if len(eventPlayer.player_state[72]) > 2:
        destroyEffect(eventPlayer.player_state[72][2])
    if len(eventPlayer.player_state[72]) > 3:
        destroyEffect(eventPlayer.player_state[72][3])
    if len(eventPlayer.player_state[72]) > 4:
        destroyEffect(eventPlayer.player_state[72][4])
    if len(eventPlayer.player_state[74]) > 0:
        destroyEffect(eventPlayer.player_state[74][0])
    if len(eventPlayer.player_state[74]) > 1:
        destroyEffect(eventPlayer.player_state[74][1])
    if len(eventPlayer.player_state[74]) > 2:
        destroyEffect(eventPlayer.player_state[74][2])
    eventPlayer.player_state[70] = false
    eventPlayer.player_state[71] = null
    eventPlayer.player_state[72] = []
    eventPlayer.player_state[73] = null
    eventPlayer.player_state[74] = []
    eventPlayer.player_state[75] = 0
    eventPlayer.player_state[76] = false
    eventPlayer.player_state[77] = null


rule "[illari] clear solar mark target":
    @Event eachPlayer
    @Condition eventPlayer.player_state[78] != null
    @Condition eventPlayer.isDead() == true or eventPlayer.getHero() != eventPlayer.player_state[78].player_state[77] or eventPlayer.player_state[78].isAlive() == false or eventPlayer.player_state[78].getHero() != Hero.ILLARI or eventPlayer.player_state[78].player_state[70] == false

    eventPlayer.player_state[78] = null


rule "[illari] clear mini sun on death or hero swap":
    @Event eachPlayer
    @Condition eventPlayer.getHero() != Hero.ILLARI or eventPlayer.isDead() == true
    @Condition eventPlayer.player_state[66] > 0 or eventPlayer.player_state[67] == true or eventPlayer.player_state[70] == true or eventPlayer.player_state[76] == true or len(eventPlayer.player_state[72]) > 0 or len(eventPlayer.player_state[74]) > 0 or eventPlayer.player_state[69] != null

    if eventPlayer.player_state[67] == true:
        destroyHudText(eventPlayer.player_state[68])
    if eventPlayer.player_state[73] != null and eventPlayer.player_state[73].player_state[78] == eventPlayer:
        eventPlayer.player_state[73].player_state[78] = null
    if len(eventPlayer.player_state[72]) > 0:
        destroyEffect(eventPlayer.player_state[72][0])
    if len(eventPlayer.player_state[72]) > 1:
        destroyEffect(eventPlayer.player_state[72][1])
    if len(eventPlayer.player_state[72]) > 2:
        destroyEffect(eventPlayer.player_state[72][2])
    if len(eventPlayer.player_state[72]) > 3:
        destroyEffect(eventPlayer.player_state[72][3])
    if len(eventPlayer.player_state[72]) > 4:
        destroyEffect(eventPlayer.player_state[72][4])
    if len(eventPlayer.player_state[74]) > 0:
        destroyEffect(eventPlayer.player_state[74][0])
    if len(eventPlayer.player_state[74]) > 1:
        destroyEffect(eventPlayer.player_state[74][1])
    if len(eventPlayer.player_state[74]) > 2:
        destroyEffect(eventPlayer.player_state[74][2])
    eventPlayer.player_state[66] = 0
    eventPlayer.player_state[67] = false
    eventPlayer.player_state[68] = null
    eventPlayer.player_state[69] = null
    eventPlayer.player_state[70] = false
    eventPlayer.player_state[71] = null
    eventPlayer.player_state[72] = []
    eventPlayer.player_state[73] = null
    eventPlayer.player_state[74] = []
    eventPlayer.player_state[75] = 0
    eventPlayer.player_state[76] = false
    eventPlayer.player_state[77] = null
    eventPlayer.player_state[80] = false


rule "[lifeweaver] create garden bowling ball":
    @Event eachPlayer
    @Hero lifeweaver
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isDummy() == false
    @Condition eventPlayer.player_state[81] == false

    eventPlayer.player_state[81] = true
    eventPlayer.player_state[82] = eventPlayer.getPosition() + eventPlayer.getFacingDirection() * 1.8 + Vector.UP * 0.6
    eventPlayer.player_state[85] = eventPlayer.getFacingDirection()
    eventPlayer.player_state[83] = []
    eventPlayer.player_state[94] = 0
    createDummy(Hero.LIFEWEAVER, eventPlayer.getTeam(), -1, eventPlayer.player_state[82], eventPlayer.player_state[85])
    eventPlayer.player_state[93] = getLastCreatedEntity()
    eventPlayer.player_state[93].setInvisibility(Invis.ALL)
    eventPlayer.player_state[93].setMaxHealth(1000)
    eventPlayer.player_state[93].setMoveSpeed(50)
    eventPlayer.player_state[93].setDamageDealt(0)
    createProjectileEffect(getAllPlayers(), Projectile.ROADHOG_SCRAP_BALL, null, eventPlayer.player_state[82], eventPlayer.player_state[85], 0.65, ProjectileEffectReeval.VISIBILITY_POSITION_DIRECTION_AND_SIZE)
    eventPlayer.player_state[83].append(getLastCreatedEntity())
    createEffect(getAllPlayers(), Effect.GOOD_AURA, Color.GREEN, eventPlayer.player_state[82], 1.6, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_state[83].append(getLastCreatedEntity())
    createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Color.YELLOW, eventPlayer.player_state[82], 0.35, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_state[83].append(getLastCreatedEntity())
    smallMessage(eventPlayer, "园艺球已就位")


rule "[lifeweaver] garden ball follows owner":
    @Event eachPlayer
    @Hero lifeweaver
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isDummy() == false
    @Condition eventPlayer.player_state[81] == true
    @Condition eventPlayer.player_state[93] != null
    @Condition eventPlayer.player_state[84] == 0

    eventPlayer.player_state[82] = eventPlayer.getPosition() + eventPlayer.getFacingDirection() * 1.8 + Vector.UP * 0.6
    eventPlayer.player_state[85] = eventPlayer.getFacingDirection()
    eventPlayer.player_state[93].teleport(eventPlayer.player_state[82])
    eventPlayer.player_state[93].startFacing(eventPlayer.player_state[85], 1000, Relativity.TO_WORLD, FacingReeval.DIRECTION_AND_TURN_RATE)
    wait(0.1)
    if ruleCondition:
        loop()


rule "[lifeweaver] refresh garden ball visual":
    @Event eachPlayer
    @Hero lifeweaver
    @Condition eventPlayer.isDummy() == false
    @Condition eventPlayer.player_state[81] == true
    @Condition eventPlayer.player_state[93] != null
    @Condition len(eventPlayer.player_state[83]) > 0

    eventPlayer.player_state[82] = eventPlayer.player_state[93].getPosition() + Vector.UP * 0.7
    eventPlayer.player_state[94] = (eventPlayer.player_state[94] + 1) % 4
    destroyEffect(eventPlayer.player_state[83][0])
    if eventPlayer.player_state[84] == 1:
        if eventPlayer.player_state[94] == 0:
            createProjectileEffect(getAllPlayers(), Projectile.ROADHOG_SCRAP_BALL, null, eventPlayer.player_state[82], eventPlayer.player_state[85] + Vector.UP, 0.65, ProjectileEffectReeval.VISIBILITY_POSITION_DIRECTION_AND_SIZE)
        elif eventPlayer.player_state[94] == 1:
            createProjectileEffect(getAllPlayers(), Projectile.ROADHOG_SCRAP_BALL, null, eventPlayer.player_state[82], eventPlayer.player_state[85] + vect(1, 0, 0), 0.65, ProjectileEffectReeval.VISIBILITY_POSITION_DIRECTION_AND_SIZE)
        elif eventPlayer.player_state[94] == 2:
            createProjectileEffect(getAllPlayers(), Projectile.ROADHOG_SCRAP_BALL, null, eventPlayer.player_state[82], eventPlayer.player_state[85] + Vector.DOWN, 0.65, ProjectileEffectReeval.VISIBILITY_POSITION_DIRECTION_AND_SIZE)
        else:
            createProjectileEffect(getAllPlayers(), Projectile.ROADHOG_SCRAP_BALL, null, eventPlayer.player_state[82], eventPlayer.player_state[85] + vect(-1, 0, 0), 0.65, ProjectileEffectReeval.VISIBILITY_POSITION_DIRECTION_AND_SIZE)
    else:
        createProjectileEffect(getAllPlayers(), Projectile.ROADHOG_SCRAP_BALL, null, eventPlayer.player_state[82], eventPlayer.player_state[85], 0.65, ProjectileEffectReeval.VISIBILITY_POSITION_DIRECTION_AND_SIZE)
    eventPlayer.player_state[83][0] = getLastCreatedEntity()
    wait(0.08)
    if ruleCondition:
        loop()


rule "[lifeweaver] recover lost garden ball":
    @Event eachPlayer
    @Hero lifeweaver
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isDummy() == false
    @Condition eventPlayer.player_state[81] == true
    @Condition eventPlayer.player_state[93] != null
    @Condition distance(eventPlayer.player_state[82], eventPlayer) > 28

    eventPlayer.player_state[84] = 0
    eventPlayer.player_state[82] = eventPlayer.getPosition() + eventPlayer.getFacingDirection() * 1.8 + Vector.UP * 0.6
    eventPlayer.player_state[85] = eventPlayer.getFacingDirection()
    eventPlayer.player_state[93].teleport(eventPlayer.player_state[82])
    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.GREEN, eventPlayer.player_state[82], 2)
    smallMessage(eventPlayer, "园艺球回收")


rule "[lifeweaver] melee launches garden ball":
    @Event eachPlayer
    @Hero lifeweaver
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isDummy() == false
    @Condition eventPlayer.isMeleeing() == true
    @Condition eventPlayer.player_state[81] == true
    @Condition eventPlayer.player_state[93] != null
    @Condition eventPlayer.player_state[87] == false
    @Condition distance(eventPlayer, eventPlayer.player_state[93]) <= 5.5

    eventPlayer.player_state[87] = true
    eventPlayer.player_state[84] = 1
    eventPlayer.player_state[85] = eventPlayer.getFacingDirection()
    eventPlayer.player_state[86] = 0
    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.GREEN, eventPlayer.player_state[82], 2)
    smallMessage(eventPlayer, "园艺保龄球！")
    eventPlayer.player_state[93].startFacing(eventPlayer.player_state[85], 1000, Relativity.TO_WORLD, FacingReeval.DIRECTION_AND_TURN_RATE)
    eventPlayer.player_state[93].applyImpulse(eventPlayer.player_state[85] + Vector.UP * 0.18, 28, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
    while eventPlayer.player_state[84] == 1 and eventPlayer.isAlive() == true and eventPlayer.getHero() == Hero.LIFEWEAVER and eventPlayer.player_state[86] < 18:
        eventPlayer.player_state[82] = eventPlayer.player_state[93].getPosition() + Vector.UP * 0.7
        eventPlayer.player_state[85] = eventPlayer.player_state[93].getFacingDirection()
        if len(getPlayersInRadius(eventPlayer.player_state[82], 2.4, Team.ALL, LosCheck.OFF).filter(lambda player: player != eventPlayer and player != eventPlayer.player_state[93] and player.isAlive() == true and player.player_state[95] == false and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam()))) > 0:
            damage(getPlayersInRadius(eventPlayer.player_state[82], 2.4, Team.ALL, LosCheck.OFF).filter(lambda player: player != eventPlayer and player != eventPlayer.player_state[93] and player.isAlive() == true and player.player_state[95] == false and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())), eventPlayer, 24)
            getPlayersInRadius(eventPlayer.player_state[82], 2.4, Team.ALL, LosCheck.OFF).filter(lambda player: player != eventPlayer and player != eventPlayer.player_state[93] and player.isAlive() == true and player.player_state[95] == false and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).setStatusEffect(eventPlayer, Status.KNOCKED_DOWN, 0.55)
            getPlayersInRadius(eventPlayer.player_state[82], 2.4, Team.ALL, LosCheck.OFF).filter(lambda player: player != eventPlayer and player != eventPlayer.player_state[93] and player.isAlive() == true and player.player_state[95] == false and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).player_state[95] = true
            smallMessage(getPlayersInRadius(eventPlayer.player_state[82], 2.4, Team.ALL, LosCheck.OFF).filter(lambda player: player != eventPlayer and player != eventPlayer.player_state[93] and player.isAlive() == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())), "园艺保龄球命中")
            playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, Color.GREEN, eventPlayer.player_state[82], 2)
        eventPlayer.player_state[86] += 1
        wait(0.1)
    eventPlayer.player_state[84] = 0
    eventPlayer.player_state[86] = 0
    wait(0.35)
    eventPlayer.player_state[87] = false


rule "[lifeweaver] clear garden ball hit cooldown":
    @Event eachPlayer
    @Condition eventPlayer.player_state[95] == true

    wait(1.1)
    eventPlayer.player_state[95] = false


rule "[lifeweaver] pull garden ball back":
    @Event eachPlayer
    @Hero lifeweaver
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isDummy() == false
    @Condition eventPlayer.isUsingAbility2() == true
    @Condition eventPlayer.player_state[81] == true
    @Condition eventPlayer.player_state[93] != null
    @Condition eventPlayer.player_state[88] == false

    eventPlayer.player_state[88] = true
    eventPlayer.player_state[84] = 2
    smallMessage(eventPlayer, "拉回园艺球")
    createBeam(getAllPlayers(), Beam.GOOD, eventPlayer, eventPlayer.player_state[82], Color.GREEN, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_state[92] = getLastCreatedEntity()
    while eventPlayer.player_state[84] == 2 and eventPlayer.isAlive() == true and eventPlayer.getHero() == Hero.LIFEWEAVER and distance(eventPlayer.player_state[93], eventPlayer) > 2.4:
        eventPlayer.player_state[85] = directionTowards(eventPlayer.player_state[93].getPosition(), eventPlayer.getPosition() + Vector.UP * 0.6)
        eventPlayer.player_state[93].applyImpulse(eventPlayer.player_state[85], 9, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
        eventPlayer.player_state[82] = eventPlayer.player_state[93].getPosition() + Vector.UP * 0.7
        getPlayersInRadius(eventPlayer.player_state[82], 2.4, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player != eventPlayer.player_state[93] and player.isAlive() == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).applyImpulse(directionTowards(getPlayersInRadius(eventPlayer.player_state[82], 2.4, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player != eventPlayer.player_state[93] and player.isAlive() == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).getPosition(), eventPlayer.player_state[82]), 2, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
        wait(0.1)
    eventPlayer.player_state[82] = eventPlayer.getPosition() + eventPlayer.getFacingDirection() * 1.8 + Vector.UP * 0.6
    eventPlayer.player_state[85] = eventPlayer.getFacingDirection()
    eventPlayer.player_state[93].teleport(eventPlayer.player_state[82])
    eventPlayer.player_state[84] = 0
    if eventPlayer.player_state[92] != null:
        destroyEffect(eventPlayer.player_state[92])
    eventPlayer.player_state[92] = null
    wait(0.6)
    wait(2.4)
    eventPlayer.player_state[88] = false


rule "[lifeweaver] garden pot ultimate":
    @Event eachPlayer
    @Hero lifeweaver
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isDummy() == false
    @Condition eventPlayer.getUltCharge() == 100
    @Condition eventPlayer.isHoldingButton(Button.ULTIMATE) == true
    @Condition eventPlayer.player_state[89] == false
    @Condition eventPlayer.player_state[81] == true
    @Condition eventPlayer.player_state[93] != null

    eventPlayer.player_state[89] = true
    eventPlayer.player_state[84] = 3
    eventPlayer.player_state[90] = nearestWalkablePosition(eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * 12)
    eventPlayer.setUltCharge(0)
    createEffect(getAllPlayers(), Effect.GOOD_AURA, Color.GREEN, eventPlayer.player_state[90], 4, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_state[91].append(getLastCreatedEntity())
    createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Color.YELLOW, eventPlayer.player_state[90], 4, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_state[91].append(getLastCreatedEntity())
    smallMessage(eventPlayer, "天降花盆预警")
    wait(1)
    eventPlayer.player_state[82] = eventPlayer.player_state[90] + Vector.UP * 9
    eventPlayer.player_state[85] = Vector.DOWN
    eventPlayer.player_state[93].teleport(eventPlayer.player_state[82])
    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.GREEN, eventPlayer.player_state[90], 4)
    wait(0.25)
    eventPlayer.player_state[82] = eventPlayer.player_state[90]
    eventPlayer.player_state[93].teleport(eventPlayer.player_state[82])
    playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, Color.GREEN, eventPlayer.player_state[90], 4)
    damage(getPlayersInRadius(eventPlayer.player_state[90], 4, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player != eventPlayer.player_state[93] and player.isAlive() == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())), eventPlayer, 55)
    getPlayersInRadius(eventPlayer.player_state[90], 4, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player != eventPlayer.player_state[93] and player.isAlive() == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).setStatusEffect(eventPlayer, Status.KNOCKED_DOWN, 0.75)
    if len(eventPlayer.player_state[91]) > 0:
        destroyEffect(eventPlayer.player_state[91][0])
    if len(eventPlayer.player_state[91]) > 1:
        destroyEffect(eventPlayer.player_state[91][1])
    eventPlayer.player_state[91] = []
    eventPlayer.player_state[90] = null
    eventPlayer.player_state[84] = 0
    wait(2)
    eventPlayer.player_state[89] = false


rule "[lifeweaver] clear garden bowling ball after hero swap":
    @Event eachPlayer
    @Condition eventPlayer.getHero() != Hero.LIFEWEAVER
    @Condition eventPlayer.player_state[81] == true or len(eventPlayer.player_state[83]) > 0 or len(eventPlayer.player_state[91]) > 0 or eventPlayer.player_state[93] != null

    if len(eventPlayer.player_state[83]) > 0:
        destroyEffect(eventPlayer.player_state[83][0])
    if len(eventPlayer.player_state[83]) > 1:
        destroyEffect(eventPlayer.player_state[83][1])
    if len(eventPlayer.player_state[83]) > 2:
        destroyEffect(eventPlayer.player_state[83][2])
    if len(eventPlayer.player_state[83]) > 3:
        destroyEffect(eventPlayer.player_state[83][3])
    if len(eventPlayer.player_state[91]) > 0:
        destroyEffect(eventPlayer.player_state[91][0])
    if len(eventPlayer.player_state[91]) > 1:
        destroyEffect(eventPlayer.player_state[91][1])
    if eventPlayer.player_state[92] != null:
        destroyEffect(eventPlayer.player_state[92])
    if eventPlayer.player_state[93] != null:
        destroyDummy(eventPlayer.player_state[93].getTeam(), eventPlayer.player_state[93].getSlot())
    eventPlayer.player_state[81] = false
    eventPlayer.player_state[82] = null
    eventPlayer.player_state[83] = []
    eventPlayer.player_state[84] = 0
    eventPlayer.player_state[85] = null
    eventPlayer.player_state[86] = 0
    eventPlayer.player_state[87] = false
    eventPlayer.player_state[88] = false
    eventPlayer.player_state[89] = false
    eventPlayer.player_state[90] = null
    eventPlayer.player_state[91] = []
    eventPlayer.player_state[92] = null
    eventPlayer.player_state[93] = null
    eventPlayer.player_state[94] = null


rule "[freya] launch circle":
    @Event eachPlayer
    @Hero freja
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.player_state[16] == false
    @Condition eventPlayer.isUsingAbility2() == true

    eventPlayer.player_state[16] = true
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
    eventPlayer.player_state[16] = false
