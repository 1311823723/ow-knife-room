#!include "config.opy"
#!include "player_state.opy"
#!include "hud.opy"
#!include "safety.opy"
#!include "debug.opy"

#Player variables

playervar player_state 27
playervar freya_launch_circle_effects 38
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
#!optimizeForSizeAggressive
#!optimizeForSize


rule "[state] initialize player state array":
    @Event eachPlayer
    @Condition len(eventPlayer.player_state) < 338

    eventPlayer.player_state = [false, null, false, false, null, false, null, null, null, false, false, false, false, false, false, false, false, false, null, false, false, 0, false, false, 0, false, false, null, false, null, 0, false, false, 0, false, null, false, null, false, null, [], [], 0, false, 0, 0, false, false, null, 0, 0, 0, false, false, 0, null, false, [], false, false, 0, false, null, [], 0, null, 0, false, null, null, false, null, [], null, [], 0, false, null, null, null, false, false, null, [], 0, null, 0, false, false, false, null, [], false, null, null, null, false, 0, false, null, false, false, false, false, [], false, false, [], false, null, [], false, false, false, [], false, false, 0, -1, 0, false, null, false, false, false, null, null, [], 0, false, false, false, null, false, false, false, false, [], false, false, 0, false, null, false, null, null, false, [], 0, false, false, false, false, false, false, [], null, false, false, false, false, null, [], false, null, [], 0, false, false, null, null, false, [], false, false, null, [], 0, false, null, null, [], 0, null, false, null, [], false, false, null, null, 0, false, false, null, false, null, [], false, null, [], false, false, false, null, [], false, null, false, false, false, null, null, false, [], false, null, [], 0, false, null, null, false, false, false, false, false, [], false, false, false, 0, null, [], false, 0, 0, null, null, 0, false, null, [], 0, false, false, null, false, false, false, 0, false, null, false, null, null, [], false, null, [], 0, false, false, null, [], 0, false, false, false, false, false, 100, false, null, false, false, false, null, [], 0, false, 0, [], false, false, false, false, [], false, [], false, false, false, null, null, [], 0, false, false, false, false, false, false, null, [], false, false, false, null, null, false, false, null, null, 0, false, null, false, false, [], 0, false, null, false, null, false, false, false, false, 0, 0, false, false, false, 0, false, false, 0]


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


def grantAsheBountyFromTemp():
    @Name "Grant Ashe Bounty From Temp"

    if eventPlayer.player_state[PS_ASHE_BOUNTY_GAIN_TEMP] > 0:
        eventPlayer.player_state[PS_ASHE_BOUNTY] += eventPlayer.player_state[PS_ASHE_BOUNTY_GAIN_TEMP]
        if eventPlayer.getUltCharge() + eventPlayer.player_state[PS_ASHE_BOUNTY_GAIN_TEMP] >= 100:
            eventPlayer.setUltCharge(100)
        else:
            eventPlayer.setUltCharge(eventPlayer.getUltCharge() + eventPlayer.player_state[PS_ASHE_BOUNTY_GAIN_TEMP])
        eventPlayer.setMoveSpeed(118 if eventPlayer.player_state[PS_ASHE_BOUNTY] >= 100 else 115 if eventPlayer.player_state[PS_ASHE_BOUNTY] >= 70 else 110 if eventPlayer.player_state[PS_ASHE_BOUNTY] >= 40 else 105 if eventPlayer.player_state[PS_ASHE_BOUNTY] >= 20 else 100)
        if eventPlayer.player_state[PS_ASHE_BOUNTY] >= 100 and eventPlayer.player_state[PS_ASHE_HIGH_BOUNTY_PROMPTED] == false:
            eventPlayer.player_state[PS_ASHE_HIGH_BOUNTY_PROMPTED] = true
        eventPlayer.player_state[PS_ASHE_BOUNTY_GAIN_TEMP] = 0





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


rule "[host] spawn random hero bot on crouch":
    @Condition hostPlayer.isHoldingButton(Button.CROUCH) == true

    createDummy(getAllHeroes()[random.randint(0, len(getAllHeroes()) - 1)], getOppositeTeam(Team.ALL), -1, hostPlayer)
    wait(0.8)


rule "[host] clear all bots on reload":
    @Condition hostPlayer.isHoldingButton(Button.RELOAD) == true

    destroyAllDummies()
    wait(0.8)



rule "击败回血":
    @Event playerDealtFinalBlow

    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.ROSE, getLastHealingModification(), 1)
    bigMessage(eventPlayer, "造成击杀，恢复体力")
    eventPlayer.startHealingOverTime(eventPlayer, 3, 10)


rule "被睡冷却":
    @Event eachPlayer
    @Condition eventPlayer.hasStatus(Status.ASLEEP) == true
    @Condition eventPlayer.player_state[PS_ANA_SLEEP_FX_ACTIVE] == false

    eventPlayer.player_state[PS_ANA_SLEEP_FX_ACTIVE] = true
    eventPlayer.setAbilityCooldown(Button.ABILITY_1, 50)
    eventPlayer.setAbilityCooldown(Button.ABILITY_2, 50)
    eventPlayer.setUltCharge(20)
    createEffect(getAllPlayers(), Effect.BAD_AURA, Color.ROSE, eventPlayer, 2.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_state[PS_ANA_SLEEP_FX_HANDLE] = getLastCreatedEntity()
    smallMessage(eventPlayer, "你被睡了")
    waitUntil(eventPlayer.hasStatus(Status.ASLEEP) == false, 99999)
    destroyEffect(eventPlayer.player_state[PS_ANA_SLEEP_FX_HANDLE])
    eventPlayer.player_state[PS_ANA_SLEEP_FX_HANDLE] = null
    eventPlayer.player_state[PS_ANA_SLEEP_FX_ACTIVE] = false


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




rule "[hud] open current hero ability guide":
    @Event eachPlayer
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.player_state[PS_ABILITY_GUIDE_CREATED] == false or (eventPlayer.isHoldingButton(Button.INTERACT) == true and eventPlayer.player_state[PS_ABILITY_GUIDE_TOGGLE_LOCK] == false and eventPlayer.player_state[PS_ABILITY_GUIDE_CREATED] == null)

    if eventPlayer.isHoldingButton(Button.INTERACT) == true:
        eventPlayer.player_state[PS_ABILITY_GUIDE_TOGGLE_LOCK] = true
    eventPlayer.player_state[PS_ABILITY_GUIDE_CREATED] = true
    if eventPlayer.getHero() == Hero.SOLDIER:
        hudSubtext(eventPlayer, "士兵76：蚁人体型\n左键变大，右键变小，共 11 档\n越大越显眼且伤害降低，越小移速越快\n死亡或换英雄会恢复正常体型", HudPosition.ACTUALLY_LEFT, -998, Color.YELLOW, HudReeval.VISIBILITY_AND_STRING)
    elif eventPlayer.getHero() == Hero.MERCY:
        hudSubtext(eventPlayer, "天使：复活甲\n每条命有一次免死机会\n受到致命伤时复活到 60 血，短暂无敌并震开身边敌人\n触发后本条命不会再次生效", HudPosition.ACTUALLY_LEFT, -998, Color.YELLOW, HudReeval.VISIBILITY_AND_STRING)
    elif eventPlayer.getHero() == Hero.BAPTISTE:
        hudSubtext(eventPlayer, "巴蒂：哈哈镜与假药\n大招会让附近玩家随机变巨、变小、变脆或变硬\n造成伤害有概率给目标注射假药\n假药可能改变体型、移速或承伤，持续时间很短", HudPosition.ACTUALLY_LEFT, -998, Color.YELLOW, HudReeval.VISIBILITY_AND_STRING)
    elif eventPlayer.getHero() == Hero.GENJI:
        hudSubtext(eventPlayer, "源氏：疯狗龙刃窗口\n平时 Shift 不可用\n击杀开启 8 秒疯狗时间，自动开大并解锁 Shift\n疯狗时间内续杀会刷新倒计时，结束后会沉睡 5 秒", HudPosition.ACTUALLY_LEFT, -998, Color.GREEN, HudReeval.VISIBILITY_AND_STRING)
    elif eventPlayer.getHero() == Hero.HANZO:
        hudSubtext(eventPlayer, "半藏：箭雨令\n技能 1 在准星命中地面放置预警法阵\n短暂延迟后落箭，范围内敌人会持续受伤并减速\n空中可额外踏空跳，离开箭雨范围可规避伤害", HudPosition.ACTUALLY_LEFT, -998, Color.YELLOW, HudReeval.VISIBILITY_AND_STRING)
    elif eventPlayer.getHero() == Hero.ORISA:
        hudSubtext(eventPlayer, "奥丽莎：强固裁决\n命中敌人积累裁决能量，最多 7 层\n技能 1 期间命中稳定获得，平时命中有概率获得\n右键标枪会消耗全部能量裁决目标\n层数越高，减速、技能冷却惩罚和回血越强", HudPosition.ACTUALLY_LEFT, -998, Color.GREEN, HudReeval.VISIBILITY_AND_STRING)
    elif eventPlayer.getHero() == Hero.TORBJORN:
        hudSubtext(eventPlayer, "托比昂：非法改装\n参与击杀获得零件，攒满 3 个后按技能 2 改装\n随机获得巨型、迷你或防爆模块，也可能改装失败\n死亡或换英雄会清空零件和改装状态", HudPosition.ACTUALLY_LEFT, -998, Color.YELLOW, HudReeval.VISIBILITY_AND_STRING)
    elif eventPlayer.getHero() == Hero.MEI:
        hudSubtext(eventPlayer, "小美：寒气掌控\n近战和冰爆会给敌人叠寒气，3 层会短暂冰冻并减速\n技能 1 开启近身寒气圈，靠太近会被叠层\n技能 2 在准星位置放延迟冰爆，看到预警就快离开", HudPosition.ACTUALLY_LEFT, -998, Color.AQUA, HudReeval.VISIBILITY_AND_STRING)
    elif eventPlayer.getHero() == Hero.ROADHOG:
        hudSubtext(eventPlayer, "路霸：钩中改造\n技能 1 钩中敌人后，目标会缩小 3 秒\n缩小目标跑得更快，但更容易被击退\n路霸下一次近战会获得额外强击退", HudPosition.ACTUALLY_LEFT, -998, Color.YELLOW, HudReeval.VISIBILITY_AND_STRING)
    elif eventPlayer.getHero() == Hero.LUCIO:
        hudSubtext(eventPlayer, "卢西奥：落地冲击\n从空中落地会弹起附近其他玩家\n自己不会被弹起，并会获得短暂加速\n效果有短冷却，远离落点可躲开", HudPosition.ACTUALLY_LEFT, -998, Color.GREEN, HudReeval.VISIBILITY_AND_STRING)
    elif eventPlayer.getHero() == Hero.SOJOURN:
        hudSubtext(eventPlayer, "索杰恩：滑铲撞墙\n技能 1 滑铲贴近玩家会把目标向前铲飞\n如果目标很快撞墙停住，会受到额外伤害并被较久眩晕\n离墙远一点或横向躲开，可以避免撞墙惩罚", HudPosition.ACTUALLY_LEFT, -998, Color.BLUE, HudReeval.VISIBILITY_AND_STRING)
    elif eventPlayer.getHero() == Hero.ILLARI:
        hudSubtext(eventPlayer, "伊拉锐：召唤太阳\n近战命中积攒太阳之力，最多 3 层\n满 3 层后按住右键蓄力，松开召唤小太阳\n小太阳会点名视野内敌人并持续灼烧，躲掩体可断线", HudPosition.ACTUALLY_LEFT, -998, Color.YELLOW, HudReeval.VISIBILITY_AND_STRING)
    elif eventPlayer.getHero() == Hero.ASHE:
        hudSubtext(eventPlayer, "艾什：死锁悬赏套索\n炸药保留爆燃但总火伤被压低\n左键套索准星附近敌人并拉到面前，套中会涨赏金\n命中、炸药和击杀都会涨赏金并给大招充能\n赏金越高移速和套索冷却越强；100+ 后 HUD 显示高额悬赏，击杀她可领奖励", HudPosition.ACTUALLY_LEFT, -998, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING)
    elif eventPlayer.getHero() == Hero.FREJA:
        hudSubtext(eventPlayer, "芙蕾雅：瓦尔基里猎场\n技能 2 在脚下放飞天法阵，敌人被抛起后必须落到圈外\n落回圈内会受到伤害并被击倒\n技能 1 在准星命中地面放禁飞区，范围内敌人不能跳并会被压回地面", HudPosition.ACTUALLY_LEFT, -998, Color.AQUA, HudReeval.VISIBILITY_AND_STRING)
    elif eventPlayer.getHero() == Hero.WUYANG:
        hudSubtext(eventPlayer, "无漾：浪潮救生员\n近战、冲浪撞人和救生圈追击会积累潮汐值\n技能 1 向前冲浪撞人，满潮时变成有预警的巨浪拍岸\n技能 2 套住准星附近敌人并明显拉向自己，近战命中可拖回岸边", HudPosition.ACTUALLY_LEFT, -998, Color.AQUA, HudReeval.VISIBILITY_AND_STRING)
    elif eventPlayer.getHero() == Hero.DOMINA:
        hudSubtext(eventPlayer, "金驭：费斯卡裁定场\n近战、阵列撞墙和水晶爆能会积累裁定值\n右键放分段屏障棋盘，敌人靠近会被减速，撞上会被裁定\n技能 2 放爆能水晶，充能后低伤爆开并回复金驭\n裁定满 100 后右键变全景牢笼，有预警，可逃离", HudPosition.ACTUALLY_LEFT, -998, Color.YELLOW, HudReeval.VISIBILITY_AND_STRING)
    elif eventPlayer.getHero() == Hero.EMRE:
        hudSubtext(eventPlayer, "埃姆雷：残存人性\n人性开局和复活为 100，使用技能和击杀会降低\n技能 1 开虹吸冲击枪窗口，近身命中可回血但继续消耗人性\n技能 2 丢赛博手雷，低伤击退减速并消耗人性\n吃血包和一段时间没造成伤害会恢复；人性到 0 会自爆", HudPosition.ACTUALLY_LEFT, -998, Color.BLUE, HudReeval.VISIBILITY_AND_STRING)
    elif eventPlayer.getHero() == Hero.ANRAN:
        hudSubtext(eventPlayer, "安燃：朱雀步法\n原版高频火伤关闭，只保留近身步法玩法\n技能 1 燎步短冲，贴近敌人会低伤推开\n技能 2 收焰架势可抵消近战并借火，下一次近战会把敌人踢飞", HudPosition.ACTUALLY_LEFT, -998, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING)
    elif eventPlayer.getHero() == Hero.ANA:
        hudSubtext(eventPlayer, "安娜：睡眠标记与激素控制\n睡针命中会给目标添加醒目的睡眠标记\n大招充满后按大招，可让准星附近目标沉睡\n被睡者会进入技能冷却惩罚，保持距离和视角外可规避", HudPosition.ACTUALLY_LEFT, -998, Color.PURPLE, HudReeval.VISIBILITY_AND_STRING)
    elif eventPlayer.getHero() == Hero.KIRIKO:
        hudSubtext(eventPlayer, "雾子：稻荷神社\n近战和有效瞬移积攒香火，满值会强化下一次铃\n瞬移会在起点和终点留下狐火鸟居，友方短暂无敌，敌人误入会被拉回减速\n铃会给自己和附近队友御守挡死；净化负面状态会对附近敌人狐火反噬", HudPosition.ACTUALLY_LEFT, -998, Color.VIOLET, HudReeval.VISIBILITY_AND_STRING)
    elif eventPlayer.getHero() == Hero.MIZUKI:
        hudSubtext(eventPlayer, "瑞希：纸刃伏笔\n技能 1 留下纸人窗口，近战命中会让纸人向目标发出剑气\n剑气造成低伤并减速目标，同时瑞希短暂加速\n有纸人时技能 2 命中会触发纸刃爆发，并让瑞希闪到目标背后", HudPosition.ACTUALLY_LEFT, -998, Color.VIOLET, HudReeval.VISIBILITY_AND_STRING)
    elif eventPlayer.getHero() == Hero.CASSIDY:
        hudSubtext(eventPlayer, "卡西迪：午时赌徒\n近战、绊马索命中和完美翻滚都会攒赌注\n翻滚会留下绊马索，翻滚时挨打可触发短暂无敌并额外下注\n赌注满 10 后下一次翻滚开启午时赌局，限时近战命中即可获胜", HudPosition.ACTUALLY_LEFT, -998, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING)
    elif eventPlayer.getHero() == Hero.JUNKRAT:
        hudSubtext(eventPlayer, "狂鼠：废土爆破秀\n技能 1 投出定时地雷，落地后自动爆炸并低伤击飞\n技能 2 放夹子悬赏区，踩中会被短暂减速\n近战命中、地雷炸到人或夹子抓到人会攒火药\n火药满 3 后，下次近战或技能会改为大爆破；预警圈外可躲开", HudPosition.ACTUALLY_LEFT, -998, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING)
    elif eventPlayer.getHero() == Hero.JUNO:
        hudSubtext(eventPlayer, "朱诺：低轨道弹弓\n技能 1 短暂锁定后向前上方弹射，飞行中撞人会造成小伤害和击退\n技能 2 在脚下生成反重力泡泡，圈内玩家重力降低，离圈会恢复\n空中按跳或蹲可向前漂移；近战会把目标向前推送\n致命伤会触发一次环月逃逸，随后短暂变慢并更脆", HudPosition.ACTUALLY_LEFT, -998, Color.BLUE, HudReeval.VISIBILITY_AND_STRING)
    elif eventPlayer.getHero() == Hero.PHARAH:
        hudSubtext(eventPlayer, "法老之鹰：天隼俯冲\n技能 1 进入 5 秒俯冲预备，不会立刻俯冲\n预备期间按左键，会朝准星位置高速俯冲\n近战和俯冲命中会积累鹰势，满 3 层后俯冲更快并恢复技能冷却\n俯冲打空会眩晕 3 秒", HudPosition.ACTUALLY_LEFT, -998, Color.BLUE, HudReeval.VISIBILITY_AND_STRING)
    elif eventPlayer.getHero() == Hero.WRECKING_BALL:
        hudSubtext(eventPlayer, "破坏球：爆杆台球\n强制保持球形态，左键按住原地架杆蓄力\n蓄力瞄准线会跟随当前视野，松开后直线爆冲\n蓄力越久伤害和速度越高，满力打空会空杆犯规\n撞墙会库边反弹，首个命中目标会变目标球，撞到别人可连环进球", HudPosition.ACTUALLY_LEFT, -998, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING)
    elif eventPlayer.getHero() == Hero.TRACER:
        hudSubtext(eventPlayer, "猎空：自动赖账回溯\n每条命一次自动免死\n受到致命伤时复活到低血量，并强制触发回溯\n约 3 秒后时间债务到期，短暂变大、变慢且更容易受伤", HudPosition.ACTUALLY_LEFT, -998, Color.BLUE, HudReeval.VISIBILITY_AND_STRING)
    elif eventPlayer.getHero() == Hero.REAPER:
        hudSubtext(eventPlayer, "死神：收魂追猎\n击杀后在目标位置留下短暂亡魂锚点\n按技能 2 可借魂传送到锚点附近，并展开黑雾猎场\n右键被关闭；锚点会消散，死亡或换英雄会清理", HudPosition.ACTUALLY_LEFT, -998, Color.PURPLE, HudReeval.VISIBILITY_AND_STRING)
    elif eventPlayer.getHero() == Hero.ZENYATTA:
        hudSubtext(eventPlayer, "禅雅塔：三相念珠\n换弹键按火、冰、雷顺序切换元素\n普攻会附带当前元素的轻量效果\n右键释放元素技能；大招满时可触发圣光打击\n额外伤害很低，主要靠减速、燃烧和控制创造机会", HudPosition.ACTUALLY_LEFT, -998, Color.YELLOW, HudReeval.VISIBILITY_AND_STRING)
    elif eventPlayer.getHero() == Hero.BASTION:
        hudSubtext(eventPlayer, "堡垒：废铁非法改装\n造成有效伤害攒废铁，满 6 个自动随机改装\n可能获得破甲、铁皮、迷你履带，也可能废铁爆仓\n死亡保留废铁但清理改装，换英雄会清零", HudPosition.ACTUALLY_LEFT, -998, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING)
    elif eventPlayer.getHero() == Hero.RAMATTRA:
        hudSubtext(eventPlayer, "拉玛刹：痛苦重力\n攻击敌人会施加超重，短时间叠满 3 层会触发重力压制\n技能 2 放置痛苦核心为自己充能，敌人可近战摧毁\n痛苦满后下一次近战变痛苦拳，命中会附加超重", HudPosition.ACTUALLY_LEFT, -998, Color.PURPLE, HudReeval.VISIBILITY_AND_STRING)
    elif eventPlayer.getHero() == Hero.SIGMA:
        hudSubtext(eventPlayer, "西格玛：小黑洞与重力震爆\n技能 1 在面前准星方向展开小黑洞，持续吸引附近玩家\n使用动能俘获后，结束时会在面前触发重力震爆\n震爆会推开、减速并伤害近距离目标", HudPosition.ACTUALLY_LEFT, -998, Color.BLUE, HudReeval.VISIBILITY_AND_STRING)
    elif eventPlayer.getHero() == Hero.WINSTON:
        hudSubtext(eventPlayer, "温斯顿：抱摔与电蚊香屏障\n技能 1 跳跃时正面贴近玩家会抓住 1 人\n落地会击倒被抱摔目标，但不造成伤害\n放屏障会形成带电区域，其他玩家进入会短暂麻痹并被电弧标记", HudPosition.ACTUALLY_LEFT, -998, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
    elif eventPlayer.getHero() == Hero.REINHARDT:
        hudSubtext(eventPlayer, "莱因哈特：荣耀骑士审判\n正面迎击、近战命中和宣战可积累荣耀\n荣耀越高越强，满 100 后下一击触发天罚落锤\n举盾宣战能持续充能；天罚有预警，离开落点可躲", HudPosition.ACTUALLY_LEFT, -998, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING)
    elif eventPlayer.getHero() == Hero.BRIGITTE:
        hudSubtext(eventPlayer, "布丽吉塔：盾击瞬移与盾反\n举盾攻击远处目标，会传送到目标附近并短暂眩晕\n举盾时被近战命中会盾反，短暂眩晕攻击者\n两个效果都不造成伤害，并且各自有冷却", HudPosition.ACTUALLY_LEFT, -998, Color.YELLOW, HudReeval.VISIBILITY_AND_STRING)
    elif eventPlayer.getHero() == Hero.LIFEWEAVER:
        hudSubtext(eventPlayer, "生命之梭：园艺保龄球\n身边会生成跟随自己的园艺球\n近战把园艺球打出去，撞到敌人会造成打击效果\n技能 2 拉回园艺球；大招会在预警后召唤天降花盆", HudPosition.ACTUALLY_LEFT, -998, Color.GREEN, HudReeval.VISIBILITY_AND_STRING)
    else:
        hudSubtext(eventPlayer, "通用规则\n所有角色拥有二段跳\n击杀会持续回血\n被入侵会变大并持续扣血\n被睡会进入技能冷却惩罚，并显示醒目的睡眠标记", HudPosition.ACTUALLY_LEFT, -998, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
    eventPlayer.player_state[PS_ABILITY_GUIDE_ID] = getLastCreatedText()


rule "[hud] close current hero ability guide on interact":
    @Event eachPlayer
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition eventPlayer.player_state[PS_ABILITY_GUIDE_TOGGLE_LOCK] == false
    @Condition eventPlayer.player_state[PS_ABILITY_GUIDE_CREATED] == true

    eventPlayer.player_state[PS_ABILITY_GUIDE_TOGGLE_LOCK] = true
    destroyHudText(eventPlayer.player_state[PS_ABILITY_GUIDE_ID])
    eventPlayer.player_state[PS_ABILITY_GUIDE_CREATED] = null
    eventPlayer.player_state[PS_ABILITY_GUIDE_ID] = null


rule "[hud] unlock ability guide toggle":
    @Event eachPlayer
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == false
    @Condition eventPlayer.player_state[PS_ABILITY_GUIDE_TOGGLE_LOCK] == true

    eventPlayer.player_state[PS_ABILITY_GUIDE_TOGGLE_LOCK] = false


rule "[hud] clear current hero ability guide on death":
    @Event eachPlayer
    @Condition eventPlayer.player_state[PS_ABILITY_GUIDE_CREATED] == true
    @Condition eventPlayer.isDead() == true

    destroyHudText(eventPlayer.player_state[PS_ABILITY_GUIDE_ID])
    eventPlayer.player_state[PS_ABILITY_GUIDE_CREATED] = false
    eventPlayer.player_state[PS_ABILITY_GUIDE_ID] = null
    eventPlayer.player_state[PS_ABILITY_GUIDE_TOGGLE_LOCK] = false


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
    @Condition eventPlayer.player_state[PS_BASTION_SCRAP_HUD_CREATED] == false

    eventPlayer.player_state[PS_BASTION_SCRAP_HUD_CREATED] = true
    hudHeader(eventPlayer, "废铁：{}/6".format(eventPlayer.player_state[PS_BASTION_SCRAP]), HudPosition.RIGHT, -800, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING)
    eventPlayer.player_state[PS_BASTION_SCRAP_HUD_ID] = getLastCreatedText()


rule "[bastion] gain scrap on damage":
    @Event playerDealtDamage
    @Hero bastion
    @Condition eventPlayer.isAlive() == true
    @Condition eventDamage > 0
    @Condition eventPlayer.player_state[PS_BASTION_SCRAP] < 6
    @Condition eventPlayer.player_state[PS_BASTION_SCRAP_GAIN_CD] == false
    @Condition eventPlayer.player_state[PS_BASTION_MOD_ACTIVE] == false

    eventPlayer.player_state[PS_BASTION_SCRAP_GAIN_CD] = true
    eventPlayer.player_state[PS_BASTION_SCRAP] += 1
    if eventPlayer.player_state[PS_BASTION_SCRAP] >= 6:
        eventPlayer.player_state[PS_BASTION_SCRAP] = 6
        bigMessage(eventPlayer, "非法改装启动")
    else:
        smallMessage(eventPlayer, "废铁：{}/6".format(eventPlayer.player_state[PS_BASTION_SCRAP]))
    wait(0.45)
    eventPlayer.player_state[PS_BASTION_SCRAP_GAIN_CD] = false


rule "[bastion] activate scrap modification":
    @Event eachPlayer
    @Hero bastion
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.player_state[PS_BASTION_SCRAP] >= 6
    @Condition eventPlayer.player_state[PS_BASTION_MOD_ACTIVE] == false

    eventPlayer.player_state[PS_BASTION_MOD_ACTIVE] = true
    eventPlayer.player_state[PS_BASTION_SCRAP] = 0
    eventPlayer.player_state[PS_BASTION_MOD_ROLL] = random.randint(1, 4)
    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.ORANGE, eventPlayer, 3)
    if eventPlayer.player_state[PS_BASTION_MOD_ROLL] == 1:
        eventPlayer.setDamageDealt(125)
        eventPlayer.setDamageReceived(125)
        eventPlayer.player_state[PS_BASTION_MOD_HUD_CREATED] = true
        hudHeader(eventPlayer, "当前改装：破甲机枪", HudPosition.RIGHT, -799, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING)
        eventPlayer.player_state[PS_BASTION_MOD_HUD_ID] = getLastCreatedText()
        playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, Color.ORANGE, eventPlayer, 3)
        bigMessage(eventPlayer, "非法改装：破甲机枪")
        wait(6)
        if eventPlayer.player_state[PS_BASTION_MOD_ACTIVE] == true and eventPlayer.getHero() == Hero.BASTION:
            eventPlayer.setDamageDealt(100)
            eventPlayer.setDamageReceived(100)
            if eventPlayer.player_state[PS_BASTION_MOD_HUD_CREATED] == true:
                destroyHudText(eventPlayer.player_state[PS_BASTION_MOD_HUD_ID])
            eventPlayer.player_state[PS_BASTION_MOD_HUD_CREATED] = false
            eventPlayer.player_state[PS_BASTION_MOD_HUD_ID] = null
            eventPlayer.player_state[PS_BASTION_MOD_ACTIVE] = false
    elif eventPlayer.player_state[PS_BASTION_MOD_ROLL] == 2:
        eventPlayer.startScalingSize(1.2)
        eventPlayer.setDamageReceived(70)
        eventPlayer.setMoveSpeed(55)
        eventPlayer.player_state[PS_BASTION_MOD_HUD_CREATED] = true
        hudHeader(eventPlayer, "当前改装：铁皮乌龟", HudPosition.RIGHT, -799, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
        eventPlayer.player_state[PS_BASTION_MOD_HUD_ID] = getLastCreatedText()
        playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.WHITE, eventPlayer, 3)
        bigMessage(eventPlayer, "非法改装：铁皮乌龟")
        wait(6)
        if eventPlayer.player_state[PS_BASTION_MOD_ACTIVE] == true and eventPlayer.getHero() == Hero.BASTION:
            eventPlayer.stopScalingSize()
            eventPlayer.setDamageReceived(100)
            eventPlayer.setMoveSpeed(100)
            if eventPlayer.player_state[PS_BASTION_MOD_HUD_CREATED] == true:
                destroyHudText(eventPlayer.player_state[PS_BASTION_MOD_HUD_ID])
            eventPlayer.player_state[PS_BASTION_MOD_HUD_CREATED] = false
            eventPlayer.player_state[PS_BASTION_MOD_HUD_ID] = null
            eventPlayer.player_state[PS_BASTION_MOD_ACTIVE] = false
    elif eventPlayer.player_state[PS_BASTION_MOD_ROLL] == 3:
        eventPlayer.startScalingSize(0.65)
        eventPlayer.setMoveSpeed(135)
        eventPlayer.setDamageDealt(75)
        eventPlayer.setKnockbackReceived(160)
        eventPlayer.player_state[PS_BASTION_MOD_HUD_CREATED] = true
        hudHeader(eventPlayer, "当前改装：迷你履带", HudPosition.RIGHT, -799, Color.BLUE, HudReeval.VISIBILITY_AND_STRING)
        eventPlayer.player_state[PS_BASTION_MOD_HUD_ID] = getLastCreatedText()
        playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.BLUE, eventPlayer, 2.5)
        bigMessage(eventPlayer, "非法改装：迷你履带")
        wait(6)
        if eventPlayer.player_state[PS_BASTION_MOD_ACTIVE] == true and eventPlayer.getHero() == Hero.BASTION:
            eventPlayer.stopScalingSize()
            eventPlayer.setMoveSpeed(100)
            eventPlayer.setDamageDealt(100)
            eventPlayer.setKnockbackReceived(100)
            if eventPlayer.player_state[PS_BASTION_MOD_HUD_CREATED] == true:
                destroyHudText(eventPlayer.player_state[PS_BASTION_MOD_HUD_ID])
            eventPlayer.player_state[PS_BASTION_MOD_HUD_CREATED] = false
            eventPlayer.player_state[PS_BASTION_MOD_HUD_ID] = null
            eventPlayer.player_state[PS_BASTION_MOD_ACTIVE] = false
    else:
        eventPlayer.startScalingSize(1.5)
        eventPlayer.setMoveSpeed(60)
        eventPlayer.setDamageReceived(130)
        eventPlayer.setStatusEffect(null, Status.KNOCKED_DOWN, 0.75)
        eventPlayer.player_state[PS_BASTION_MOD_HUD_CREATED] = true
        hudHeader(eventPlayer, "当前改装：废铁爆仓", HudPosition.RIGHT, -799, Color.RED, HudReeval.VISIBILITY_AND_STRING)
        eventPlayer.player_state[PS_BASTION_MOD_HUD_ID] = getLastCreatedText()
        playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, Color.RED, eventPlayer, 3)
        bigMessage(eventPlayer, "非法改装失败：废铁爆仓")
        wait(2)
        if eventPlayer.player_state[PS_BASTION_MOD_ACTIVE] == true and eventPlayer.getHero() == Hero.BASTION:
            eventPlayer.stopScalingSize()
            eventPlayer.setMoveSpeed(100)
            eventPlayer.setDamageReceived(100)
            if eventPlayer.player_state[PS_BASTION_MOD_HUD_CREATED] == true:
                destroyHudText(eventPlayer.player_state[PS_BASTION_MOD_HUD_ID])
            eventPlayer.player_state[PS_BASTION_MOD_HUD_CREATED] = false
            eventPlayer.player_state[PS_BASTION_MOD_HUD_ID] = null
            eventPlayer.player_state[PS_BASTION_MOD_ACTIVE] = false


rule "[bastion] clear modification on death keep scrap":
    @Event playerDied
    @Hero bastion

    eventPlayer.player_state[PS_BASTION_MOD_ACTIVE] = false
    eventPlayer.player_state[PS_BASTION_SCRAP_GAIN_CD] = false
    eventPlayer.player_state[PS_BASTION_MOD_ROLL] = 0
    if eventPlayer.player_state[PS_BASTION_MOD_HUD_CREATED] == true:
        destroyHudText(eventPlayer.player_state[PS_BASTION_MOD_HUD_ID])
    eventPlayer.player_state[PS_BASTION_MOD_HUD_CREATED] = false
    eventPlayer.player_state[PS_BASTION_MOD_HUD_ID] = null
    resetPlayerAttributes()


rule "[bastion] clear scrap after hero swap":
    @Event eachPlayer
    @Condition eventPlayer.getHero() != Hero.BASTION
    @Condition eventPlayer.player_state[PS_BASTION_SCRAP] > 0 or eventPlayer.player_state[PS_BASTION_SCRAP_GAIN_CD] == true or eventPlayer.player_state[PS_BASTION_MOD_ACTIVE] == true or eventPlayer.player_state[PS_BASTION_SCRAP_HUD_CREATED] == true or eventPlayer.player_state[PS_BASTION_MOD_HUD_CREATED] == true

    if eventPlayer.player_state[PS_BASTION_SCRAP_HUD_CREATED] == true:
        destroyHudText(eventPlayer.player_state[PS_BASTION_SCRAP_HUD_ID])
    if eventPlayer.player_state[PS_BASTION_MOD_HUD_CREATED] == true:
        destroyHudText(eventPlayer.player_state[PS_BASTION_MOD_HUD_ID])
    eventPlayer.player_state[PS_BASTION_SCRAP] = 0
    eventPlayer.player_state[PS_BASTION_SCRAP_GAIN_CD] = false
    eventPlayer.player_state[PS_BASTION_MOD_ACTIVE] = false
    eventPlayer.player_state[PS_BASTION_MOD_ROLL] = 0
    eventPlayer.player_state[PS_BASTION_SCRAP_HUD_CREATED] = false
    eventPlayer.player_state[PS_BASTION_SCRAP_HUD_ID] = null
    eventPlayer.player_state[PS_BASTION_MOD_HUD_CREATED] = false
    eventPlayer.player_state[PS_BASTION_MOD_HUD_ID] = null
    resetPlayerAttributes()


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

    eventPlayer.player_state[PS_RAMATTRA_CORE_DESTROY_TARGET] = sorted(getPlayersOnHero(Hero.RAMATTRA, Team.ALL).filter(lambda player: player.ramattra_core_active == true and player != eventPlayer and distance(eventPlayer, player.ramattra_core_position) <= 3.2 and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())), key=lambda player: distance(eventPlayer, player.ramattra_core_position))[0]
    if len(eventPlayer.player_state[PS_RAMATTRA_CORE_DESTROY_TARGET].ramattra_core_effects) > 0:
        destroyEffect(eventPlayer.player_state[PS_RAMATTRA_CORE_DESTROY_TARGET].ramattra_core_effects[0])
    if len(eventPlayer.player_state[PS_RAMATTRA_CORE_DESTROY_TARGET].ramattra_core_effects) > 1:
        destroyEffect(eventPlayer.player_state[PS_RAMATTRA_CORE_DESTROY_TARGET].ramattra_core_effects[1])
    playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, Color.PURPLE, eventPlayer.player_state[PS_RAMATTRA_CORE_DESTROY_TARGET].ramattra_core_position, 3)
    smallMessage(eventPlayer, "摧毁痛苦核心")
    smallMessage(eventPlayer.player_state[PS_RAMATTRA_CORE_DESTROY_TARGET], "痛苦核心被摧毁")
    eventPlayer.player_state[PS_RAMATTRA_CORE_DESTROY_TARGET].ramattra_core_active = false
    eventPlayer.player_state[PS_RAMATTRA_CORE_DESTROY_TARGET].ramattra_core_position = null
    eventPlayer.player_state[PS_RAMATTRA_CORE_DESTROY_TARGET].ramattra_core_effects = []
    eventPlayer.player_state[PS_RAMATTRA_CORE_DESTROY_TARGET] = null


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
    eventPlayer.sigma_black_hole_position = eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * 7
    if eventPlayer.sigma_black_hole_position != null:
        getPlayersInRadius(eventPlayer.sigma_black_hole_position, 8, Team.ALL).sigma_black_hole_damage_taken = 0
    createEffect(getAllPlayers(), Effect.BAD_AURA, Color.BLACK, eventPlayer.sigma_black_hole_position, 8, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.sigma_black_hole_effects.append(getLastCreatedEntity())
    createEffect(getAllPlayers(), Effect.GOOD_AURA, Color.PURPLE, eventPlayer.sigma_black_hole_position, 6.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.sigma_black_hole_effects.append(getLastCreatedEntity())
    createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Color.BLUE, eventPlayer.sigma_black_hole_position, 7, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.sigma_black_hole_effects.append(getLastCreatedEntity())
    createProjectileEffect(getAllPlayers(), Projectile.SIGMA_HYPERSPHERE, null, eventPlayer.sigma_black_hole_position, Vector.UP, 1.3, ProjectileEffectReeval.VISIBILITY_POSITION_DIRECTION_AND_SIZE)
    eventPlayer.sigma_black_hole_effects.append(getLastCreatedEntity())
    playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, Color.PURPLE, eventPlayer.sigma_black_hole_position, 2.5)
    bigMessage(eventPlayer, "小黑洞展开")
    while eventPlayer.sigma_black_hole_active == true and eventPlayer.isAlive() == true and eventPlayer.getHero() == Hero.SIGMA and eventPlayer.sigma_black_hole_tick < 12:
        getPlayersInRadius(eventPlayer.sigma_black_hole_position, 8.5, Team.ALL).filter(lambda player: player != eventPlayer and player.isAlive() == true).applyImpulse(directionTowards(getPlayersInRadius(eventPlayer.sigma_black_hole_position, 8.5, Team.ALL).filter(lambda player: player != eventPlayer and player.isAlive() == true).getPosition(), eventPlayer.sigma_black_hole_position), 18, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
        getPlayersInRadius(eventPlayer.sigma_black_hole_position, 4, Team.ALL).filter(lambda player: player != eventPlayer and player.isAlive() == true).setStatusEffect(eventPlayer, Status.ROOTED, 0.18)
        if len(getPlayersInRadius(eventPlayer.sigma_black_hole_position, 2.6, Team.ALL).filter(lambda player: player != eventPlayer and player.isAlive() == true and player.sigma_black_hole_damage_taken < 36)) > 0:
            damage(getPlayersInRadius(eventPlayer.sigma_black_hole_position, 2.6, Team.ALL).filter(lambda player: player != eventPlayer and player.isAlive() == true and player.sigma_black_hole_damage_taken < 36), eventPlayer, 3)
            getPlayersInRadius(eventPlayer.sigma_black_hole_position, 2.6, Team.ALL).filter(lambda player: player != eventPlayer and player.isAlive() == true and player.sigma_black_hole_damage_taken < 36).sigma_black_hole_damage_taken += 3
        wait(0.25)
        eventPlayer.sigma_black_hole_tick += 1
    if eventPlayer.sigma_black_hole_active == true:
        if len(eventPlayer.sigma_black_hole_effects) > 0:
            destroyEffect(eventPlayer.sigma_black_hole_effects[0])
        if len(eventPlayer.sigma_black_hole_effects) > 1:
            destroyEffect(eventPlayer.sigma_black_hole_effects[1])
        if len(eventPlayer.sigma_black_hole_effects) > 2:
            destroyEffect(eventPlayer.sigma_black_hole_effects[2])
        if len(eventPlayer.sigma_black_hole_effects) > 3:
            destroyEffect(eventPlayer.sigma_black_hole_effects[3])
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
        if len(eventPlayer.sigma_black_hole_effects) > 3:
            destroyEffect(eventPlayer.sigma_black_hole_effects[3])
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
        if len(eventPlayer.sigma_black_hole_effects) > 3:
            destroyEffect(eventPlayer.sigma_black_hole_effects[3])
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
    @Condition eventPlayer.player_state[PS_DISABLED_SECONDARY_FIRE] == false

    eventPlayer.disallowButton(Button.SECONDARY_FIRE)
    eventPlayer.player_state[PS_DISABLED_SECONDARY_FIRE] = true


rule "[winston] disable secondary fire":
    @Event eachPlayer
    @Hero winston
    @Condition eventPlayer.player_state[PS_DISABLED_SECONDARY_FIRE] == false

    eventPlayer.disallowButton(Button.SECONDARY_FIRE)
    eventPlayer.player_state[PS_DISABLED_SECONDARY_FIRE] = true


rule "[reaper and winston] restore secondary fire after hero swap":
    @Event eachPlayer
    @Condition eventPlayer.getHero() != Hero.REAPER
    @Condition eventPlayer.getHero() != Hero.WINSTON
    @Condition eventPlayer.player_state[PS_DISABLED_SECONDARY_FIRE] == true

    eventPlayer.allowButton(Button.SECONDARY_FIRE)
    eventPlayer.player_state[PS_DISABLED_SECONDARY_FIRE] = false


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
            eventPlayer.player_state[PS_ZEN_CHAIN_TARGET] = sorted(getPlayersInRadius(victim.getPosition(), 3, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != victim and player != eventPlayer and player.isAlive() == true), key=lambda player: distance(victim, player))[0]
            damage(eventPlayer.player_state[PS_ZEN_CHAIN_TARGET], eventPlayer, 4)
            playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.AQUA, eventPlayer.player_state[PS_ZEN_CHAIN_TARGET], 1)
            eventPlayer.player_state[PS_ZEN_CHAIN_TARGET] = null
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
    eventPlayer.zen_skill_pos = raycast(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * 40, getAllPlayers(), getAllPlayers(), false).getHitPosition() + Vector.UP * 0.8
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
        createProjectileEffect(getAllPlayers(), Projectile.MOIRA_DAMAGE_ORB, null, eventPlayer.zen_skill_pos, Vector.UP, 0.85, ProjectileEffectReeval.VISIBILITY_POSITION_DIRECTION_AND_SIZE)
        eventPlayer.zen_fx.append(getLastCreatedEntity())
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
        if len(eventPlayer.zen_fx) > 3:
            destroyEffect(eventPlayer.zen_fx[3])
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
    eventPlayer.zen_skill_pos = nearestWalkablePosition(raycast(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * 45, getAllPlayers(), getAllPlayers(), false).getHitPosition())
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
    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.YELLOW, eventPlayer.zen_skill_pos, 6)
    damage(getPlayersInRadius(eventPlayer.zen_skill_pos, 6, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true), eventPlayer, 10)
    wait(0.2)
    if len(eventPlayer.zen_fx) > 0:
        destroyEffect(eventPlayer.zen_fx[0])
    if len(eventPlayer.zen_fx) > 1:
        destroyEffect(eventPlayer.zen_fx[1])
    if len(eventPlayer.zen_fx) > 2:
        destroyEffect(eventPlayer.zen_fx[2])
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
    eventPlayer.player_state[PS_ZEN_CHAIN_TARGET] = null


rule "[zenyatta] clear elemental state after hero swap":
    @Event eachPlayer
    @Condition eventPlayer.getHero() != Hero.ZENYATTA
    @Condition eventPlayer.zen_element != 0 or eventPlayer.zen_reload_lock == true or eventPlayer.zen_hit_cd == true or eventPlayer.zen_right_cd == true or eventPlayer.zen_ult_cd == true

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
    eventPlayer.player_state[PS_ZEN_CHAIN_TARGET] = null


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
    @Condition eventPlayer.player_state[PS_HANZO_ARROW_RAIN_ACTIVE] == false

    eventPlayer.player_state[PS_HANZO_ARROW_RAIN_ACTIVE] = true
    eventPlayer.player_state[PS_HANZO_ARROW_RAIN_POS] = nearestWalkablePosition(raycast(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * 45, getAllPlayers(), getAllPlayers(), false).getHitPosition())
    eventPlayer.player_state[PS_HANZO_ARROW_RAIN_FX] = []
    eventPlayer.player_state[PS_HANZO_ARROW_RAIN_TARGETS] = []
    eventPlayer.player_state[PS_HANZO_ARROW_RAIN_TICK] = 0
    eventPlayer.setAbilityCooldown(Button.ABILITY_1, 8)
    createEffect(getAllPlayers(), Effect.GOOD_AURA, Color.YELLOW, eventPlayer.player_state[PS_HANZO_ARROW_RAIN_POS], 5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_state[PS_HANZO_ARROW_RAIN_FX].append(getLastCreatedEntity())
    createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Color.WHITE, eventPlayer.player_state[PS_HANZO_ARROW_RAIN_POS], 5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_state[PS_HANZO_ARROW_RAIN_FX].append(getLastCreatedEntity())
    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.YELLOW, eventPlayer.player_state[PS_HANZO_ARROW_RAIN_POS], 5)
    smallMessage(eventPlayer, "箭雨令")
    wait(0.7)
    while eventPlayer.player_state[PS_HANZO_ARROW_RAIN_ACTIVE] == true and eventPlayer.getHero() == Hero.HANZO and eventPlayer.player_state[PS_HANZO_ARROW_RAIN_TICK] < 5:
        eventPlayer.player_state[PS_HANZO_ARROW_RAIN_TARGETS] = getPlayersInRadius(eventPlayer.player_state[PS_HANZO_ARROW_RAIN_POS], 5, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true)
        eventPlayer.player_state[PS_HANZO_ARROW_RAIN_TARGETS].setMoveSpeed(85)
        damage(eventPlayer.player_state[PS_HANZO_ARROW_RAIN_TARGETS], eventPlayer, 5)
        playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.WHITE, eventPlayer.player_state[PS_HANZO_ARROW_RAIN_POS], 3)
        wait(0.25)
        eventPlayer.player_state[PS_HANZO_ARROW_RAIN_TARGETS].setMoveSpeed(100)
        eventPlayer.player_state[PS_HANZO_ARROW_RAIN_TARGETS] = []
        wait(0.25)
        eventPlayer.player_state[PS_HANZO_ARROW_RAIN_TICK] += 1
    if len(eventPlayer.player_state[PS_HANZO_ARROW_RAIN_FX]) > 0:
        destroyEffect(eventPlayer.player_state[PS_HANZO_ARROW_RAIN_FX][0])
    if len(eventPlayer.player_state[PS_HANZO_ARROW_RAIN_FX]) > 1:
        destroyEffect(eventPlayer.player_state[PS_HANZO_ARROW_RAIN_FX][1])
    eventPlayer.player_state[PS_HANZO_ARROW_RAIN_ACTIVE] = false
    eventPlayer.player_state[PS_HANZO_ARROW_RAIN_POS] = null
    eventPlayer.player_state[PS_HANZO_ARROW_RAIN_FX] = []
    eventPlayer.player_state[PS_HANZO_ARROW_RAIN_TARGETS] = []
    eventPlayer.player_state[PS_HANZO_ARROW_RAIN_TICK] = 0


rule "[hanzo] extra air jump":
    @Event eachPlayer
    @Hero hanzo
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isInAir() == true
    @Condition eventPlayer.A == 0
    @Condition eventPlayer.isHoldingButton(Button.JUMP) == true
    @Condition eventPlayer.player_state[PS_HANZO_EXTRA_JUMP_LOCK] == false
    @Condition eventPlayer.player_state[PS_HANZO_EXTRA_JUMP_COUNT] < 4

    eventPlayer.player_state[PS_HANZO_EXTRA_JUMP_LOCK] = true
    eventPlayer.player_state[PS_HANZO_EXTRA_JUMP_COUNT] += 1
    eventPlayer.applyImpulse(Vector.UP, 10, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.WHITE, eventPlayer, 2)


rule "[hanzo] unlock extra air jump button":
    @Event eachPlayer
    @Hero hanzo
    @Condition eventPlayer.player_state[PS_HANZO_EXTRA_JUMP_LOCK] == true
    @Condition eventPlayer.isHoldingButton(Button.JUMP) == false

    eventPlayer.player_state[PS_HANZO_EXTRA_JUMP_LOCK] = false


rule "[hanzo] clear arrow rain and jumps":
    @Event eachPlayer
    @Condition eventPlayer.getHero() != Hero.HANZO or eventPlayer.isDead() == true
    @Condition eventPlayer.player_state[PS_HANZO_ARROW_RAIN_ACTIVE] == true or eventPlayer.player_state[PS_HANZO_ARROW_RAIN_POS] != null or len(eventPlayer.player_state[PS_HANZO_ARROW_RAIN_FX]) > 0 or len(eventPlayer.player_state[PS_HANZO_ARROW_RAIN_TARGETS]) > 0 or eventPlayer.player_state[PS_HANZO_EXTRA_JUMP_COUNT] > 0 or eventPlayer.player_state[PS_HANZO_EXTRA_JUMP_LOCK] == true or eventPlayer.player_state[PS_HANZO_ARROW_RAIN_TICK] > 0

    if len(eventPlayer.player_state[PS_HANZO_ARROW_RAIN_FX]) > 0:
        destroyEffect(eventPlayer.player_state[PS_HANZO_ARROW_RAIN_FX][0])
    if len(eventPlayer.player_state[PS_HANZO_ARROW_RAIN_FX]) > 1:
        destroyEffect(eventPlayer.player_state[PS_HANZO_ARROW_RAIN_FX][1])
    eventPlayer.player_state[PS_HANZO_ARROW_RAIN_TARGETS].setMoveSpeed(100)
    eventPlayer.player_state[PS_HANZO_ARROW_RAIN_ACTIVE] = false
    eventPlayer.player_state[PS_HANZO_ARROW_RAIN_POS] = null
    eventPlayer.player_state[PS_HANZO_ARROW_RAIN_FX] = []
    eventPlayer.player_state[PS_HANZO_ARROW_RAIN_TARGETS] = []
    eventPlayer.player_state[PS_HANZO_EXTRA_JUMP_COUNT] = 0
    eventPlayer.player_state[PS_HANZO_EXTRA_JUMP_LOCK] = false
    eventPlayer.player_state[PS_HANZO_ARROW_RAIN_TICK] = 0


rule "[hanzo] clear extra air jumps on landing":
    @Event eachPlayer
    @Hero hanzo
    @Condition eventPlayer.isOnGround() == true
    @Condition eventPlayer.player_state[PS_HANZO_EXTRA_JUMP_COUNT] > 0 or eventPlayer.player_state[PS_HANZO_EXTRA_JUMP_LOCK] == true

    eventPlayer.player_state[PS_HANZO_EXTRA_JUMP_COUNT] = 0
    eventPlayer.player_state[PS_HANZO_EXTRA_JUMP_LOCK] = false


rule "[orisa] create judgment energy hud":
    @Event eachPlayer
    @Hero orisa
    @Condition eventPlayer.player_state[PS_ORISA_JUDGMENT_HUD_CREATED] == false

    eventPlayer.player_state[PS_ORISA_JUDGMENT_HUD_CREATED] = true
    hudHeader(eventPlayer, "裁决能量：{}/7".format(eventPlayer.player_state[PS_ORISA_JUDGMENT_ENERGY]), HudPosition.RIGHT, -820, Color.GREEN, HudReeval.VISIBILITY_AND_STRING)
    eventPlayer.player_state[PS_ORISA_JUDGMENT_HUD_ID] = getLastCreatedText()


rule "[orisa] gain judgment energy on hit":
    @Event playerDealtDamage
    @Hero orisa
    @Condition eventPlayer.isAlive() == true
    @Condition victim != eventPlayer
    @Condition eventDamage > 0
    @Condition eventAbility != Button.PRIMARY_FIRE
    @Condition eventAbility != Button.SECONDARY_FIRE
    @Condition eventPlayer.player_state[PS_ORISA_JUDGMENT_ENERGY] < 7
    @Condition eventPlayer.player_state[PS_ORISA_JUDGMENT_GAIN_CD] == false

    eventPlayer.player_state[PS_ORISA_JUDGMENT_GAIN_CD] = true
    if eventPlayer.isUsingAbility1() == true or random.randint(1, 100) <= 30:
        eventPlayer.player_state[PS_ORISA_JUDGMENT_ENERGY] += 1
        if eventPlayer.player_state[PS_ORISA_JUDGMENT_ENERGY] >= 7:
            eventPlayer.player_state[PS_ORISA_JUDGMENT_ENERGY] = 7
            bigMessage(eventPlayer, "裁决已满")
            playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.GREEN, eventPlayer, 2.5)
        else:
            smallMessage(eventPlayer, "裁决能量：{}/7".format(eventPlayer.player_state[PS_ORISA_JUDGMENT_ENERGY]))
            playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.YELLOW, eventPlayer, 1.4)
        eventPlayer.setMoveSpeed(100 + eventPlayer.player_state[PS_ORISA_JUDGMENT_ENERGY] * 2)
    wait(0.7)
    eventPlayer.player_state[PS_ORISA_JUDGMENT_GAIN_CD] = false


rule "[orisa] apply judgment energy move speed":
    @Event eachPlayer
    @Hero orisa
    @Condition eventPlayer.isAlive() == true

    eventPlayer.setMoveSpeed(100 + eventPlayer.player_state[PS_ORISA_JUDGMENT_ENERGY] * 2)
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
    @Condition eventPlayer.player_state[PS_ORISA_JUDGMENT_ENERGY] > 0

    eventPlayer.player_state[PS_ORISA_JUDGMENT_SPENT] = eventPlayer.player_state[PS_ORISA_JUDGMENT_ENERGY]
    eventPlayer.player_state[PS_ORISA_JUDGMENT_ENERGY] = 0
    eventPlayer.setMoveSpeed(100)
    smallMessage(eventPlayer, "释放裁决：{}层".format(eventPlayer.player_state[PS_ORISA_JUDGMENT_SPENT]))
    smallMessage(victim, "你被裁决")
    if eventPlayer.player_state[PS_ORISA_JUDGMENT_SPENT] >= 7:
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
    elif eventPlayer.player_state[PS_ORISA_JUDGMENT_SPENT] >= 5:
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
    elif eventPlayer.player_state[PS_ORISA_JUDGMENT_SPENT] >= 3:
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
    eventPlayer.player_state[PS_ORISA_JUDGMENT_SPENT] = 0


rule "[orisa] clear judgment temp state on death":
    @Event playerDied
    @Hero orisa

    eventPlayer.player_state[PS_ORISA_JUDGMENT_GAIN_CD] = false
    eventPlayer.player_state[PS_ORISA_JUDGMENT_SPENT] = 0


rule "[orisa] clear judgment energy after hero swap":
    @Event eachPlayer
    @Condition eventPlayer.getHero() != Hero.ORISA
    @Condition eventPlayer.player_state[PS_ORISA_JUDGMENT_ENERGY] > 0 or eventPlayer.player_state[PS_ORISA_JUDGMENT_GAIN_CD] == true or eventPlayer.player_state[PS_ORISA_JUDGMENT_HUD_CREATED] == true or eventPlayer.player_state[PS_ORISA_JUDGMENT_SPENT] > 0

    if eventPlayer.player_state[PS_ORISA_JUDGMENT_HUD_CREATED] == true:
        destroyHudText(eventPlayer.player_state[PS_ORISA_JUDGMENT_HUD_ID])
    eventPlayer.player_state[PS_ORISA_JUDGMENT_ENERGY] = 0
    eventPlayer.player_state[PS_ORISA_JUDGMENT_GAIN_CD] = false
    eventPlayer.player_state[PS_ORISA_JUDGMENT_HUD_CREATED] = false
    eventPlayer.player_state[PS_ORISA_JUDGMENT_HUD_ID] = null
    eventPlayer.player_state[PS_ORISA_JUDGMENT_SPENT] = 0
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




rule "[kiriko] create incense hud":
    @Event eachPlayer
    @Hero kiriko
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.player_state[PS_KIRIKO_INCENSE_HUD_CREATED] == false

    eventPlayer.player_state[PS_KIRIKO_INCENSE_HUD_CREATED] = true
    hudHeader(eventPlayer, "香火：{}/100".format(eventPlayer.player_state[PS_KIRIKO_INCENSE]), HudPosition.RIGHT, -840, Color.VIOLET, HudReeval.VISIBILITY_AND_STRING)
    eventPlayer.player_state[PS_KIRIKO_INCENSE_HUD_ID] = getLastCreatedText()


rule "[kiriko] incense full prompt":
    @Event eachPlayer
    @Hero kiriko
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.player_state[PS_KIRIKO_INCENSE] >= 100
    @Condition eventPlayer.player_state[PS_KIRIKO_INCENSE_FULL_PROMPTED] == false

    eventPlayer.player_state[PS_KIRIKO_INCENSE] = 100
    eventPlayer.player_state[PS_KIRIKO_INCENSE_FULL_PROMPTED] = true
    bigMessage(eventPlayer, "稻荷赦令就绪")
    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.YELLOW, eventPlayer, 2)


rule "[kiriko] melee gains incense":
    @Event playerDealtDamage
    @Hero kiriko
    @Condition victim != eventPlayer
    @Condition eventDamage > 0
    @Condition eventAbility == Button.MELEE
    @Condition eventPlayer.player_state[PS_KIRIKO_INCENSE] < 100
    @Condition eventPlayer.player_state[PS_KIRIKO_MELEE_INCENSE_CD] == false

    eventPlayer.player_state[PS_KIRIKO_MELEE_INCENSE_CD] = true
    eventPlayer.player_state[PS_KIRIKO_INCENSE] += 8
    if eventPlayer.player_state[PS_KIRIKO_INCENSE] > 100:
        eventPlayer.player_state[PS_KIRIKO_INCENSE] = 100
    smallMessage(eventPlayer, "香火 +8")
    wait(0.5)
    eventPlayer.player_state[PS_KIRIKO_MELEE_INCENSE_CD] = false


rule "[kiriko] swift step leaves foxfire torii":
    @Event eachPlayer
    @Hero kiriko
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isUsingAbility1() == true
    @Condition eventPlayer.player_state[PS_KIRIKO_SWIFT_STEP_LOCK] == false

    eventPlayer.player_state[PS_KIRIKO_SWIFT_STEP_LOCK] = true
    eventPlayer.player_state[PS_KIRIKO_TORII_START_POS] = nearestWalkablePosition(eventPlayer.getPosition())
    wait(0.3)
    if eventPlayer.isAlive() == true and eventPlayer.getHero() == Hero.KIRIKO:
        eventPlayer.player_state[PS_KIRIKO_TORII_END_POS] = nearestWalkablePosition(eventPlayer.getPosition())
        if distance(eventPlayer.player_state[PS_KIRIKO_TORII_START_POS], eventPlayer.player_state[PS_KIRIKO_TORII_END_POS]) > 1.5:
            eventPlayer.player_state[PS_KIRIKO_INCENSE] += 15
            if eventPlayer.player_state[PS_KIRIKO_INCENSE] > 100:
                eventPlayer.player_state[PS_KIRIKO_INCENSE] = 100
            eventPlayer.player_state[PS_KIRIKO_INCENSE_FULL_PROMPTED] = false
            eventPlayer.player_state[PS_KIRIKO_TORII_ACTIVE] = true
            eventPlayer.player_state[PS_KIRIKO_TORII_FX] = []
            eventPlayer.player_state[PS_KIRIKO_TORII_TICK] = 0
            createEffect(getAllPlayers(), Effect.GOOD_AURA, Color.ORANGE, eventPlayer.player_state[PS_KIRIKO_TORII_START_POS], 2.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
            eventPlayer.player_state[PS_KIRIKO_TORII_FX].append(getLastCreatedEntity())
            createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Color.YELLOW, eventPlayer.player_state[PS_KIRIKO_TORII_START_POS], 2.2, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
            eventPlayer.player_state[PS_KIRIKO_TORII_FX].append(getLastCreatedEntity())
            createEffect(getAllPlayers(), Effect.GOOD_AURA, Color.ORANGE, eventPlayer.player_state[PS_KIRIKO_TORII_END_POS], 2.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
            eventPlayer.player_state[PS_KIRIKO_TORII_FX].append(getLastCreatedEntity())
            createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Color.YELLOW, eventPlayer.player_state[PS_KIRIKO_TORII_END_POS], 2.2, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
            eventPlayer.player_state[PS_KIRIKO_TORII_FX].append(getLastCreatedEntity())
            smallMessage(eventPlayer, "狐火鸟居")
            while eventPlayer.player_state[PS_KIRIKO_TORII_ACTIVE] == true and eventPlayer.getHero() == Hero.KIRIKO and eventPlayer.player_state[PS_KIRIKO_TORII_TICK] < 16:
                eventPlayer.player_state[PS_SHARED_TEMP_TARGETS_A] = getPlayersInRadius(eventPlayer.player_state[PS_KIRIKO_TORII_START_POS], 2.6, Team.ALL, LosCheck.SURFACES).filter(lambda player: player.isAlive() == true and player.player_state[PS_KIRIKO_TORII_TRIGGERED] == false and (player == eventPlayer or (getCurrentGamemode() != Gamemode.FFA and player.getTeam() == eventPlayer.getTeam())))
                eventPlayer.player_state[PS_SHARED_TEMP_TARGETS_B] = getPlayersInRadius(eventPlayer.player_state[PS_KIRIKO_TORII_START_POS], 2.6, Team.ALL, LosCheck.SURFACES).filter(lambda player: player.isAlive() == true and player.player_state[PS_KIRIKO_TORII_TRIGGERED] == false and player != eventPlayer and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam()))
                eventPlayer.player_state[PS_SHARED_TEMP_TARGETS_A].setStatusEffect(eventPlayer, Status.INVINCIBLE, 0.45)
                eventPlayer.player_state[PS_SHARED_TEMP_TARGETS_B].player_state[PS_KIRIKO_TORII_ENEMY_MISSTEP] = true
                eventPlayer.player_state[PS_SHARED_TEMP_TARGETS_B].teleport(eventPlayer.player_state[PS_KIRIKO_TORII_START_POS] + eventPlayer.getFacingDirection() * -1.5)
                eventPlayer.player_state[PS_SHARED_TEMP_TARGETS_B].setMoveSpeed(70)
                eventPlayer.player_state[PS_SHARED_TEMP_TARGETS_A].player_state[PS_KIRIKO_TORII_TRIGGERED] = true
                eventPlayer.player_state[PS_SHARED_TEMP_TARGETS_B].player_state[PS_KIRIKO_TORII_TRIGGERED] = true
                eventPlayer.player_state[PS_SHARED_TEMP_TARGETS_A] = getPlayersInRadius(eventPlayer.player_state[PS_KIRIKO_TORII_END_POS], 2.6, Team.ALL, LosCheck.SURFACES).filter(lambda player: player.isAlive() == true and player.player_state[PS_KIRIKO_TORII_TRIGGERED] == false and (player == eventPlayer or (getCurrentGamemode() != Gamemode.FFA and player.getTeam() == eventPlayer.getTeam())))
                eventPlayer.player_state[PS_SHARED_TEMP_TARGETS_B] = getPlayersInRadius(eventPlayer.player_state[PS_KIRIKO_TORII_END_POS], 2.6, Team.ALL, LosCheck.SURFACES).filter(lambda player: player.isAlive() == true and player.player_state[PS_KIRIKO_TORII_TRIGGERED] == false and player != eventPlayer and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam()))
                eventPlayer.player_state[PS_SHARED_TEMP_TARGETS_A].setStatusEffect(eventPlayer, Status.INVINCIBLE, 0.45)
                eventPlayer.player_state[PS_SHARED_TEMP_TARGETS_B].player_state[PS_KIRIKO_TORII_ENEMY_MISSTEP] = true
                eventPlayer.player_state[PS_SHARED_TEMP_TARGETS_B].teleport(eventPlayer.player_state[PS_KIRIKO_TORII_START_POS] + eventPlayer.getFacingDirection() * -1.5)
                eventPlayer.player_state[PS_SHARED_TEMP_TARGETS_B].setMoveSpeed(70)
                eventPlayer.player_state[PS_SHARED_TEMP_TARGETS_A].player_state[PS_KIRIKO_TORII_TRIGGERED] = true
                eventPlayer.player_state[PS_SHARED_TEMP_TARGETS_B].player_state[PS_KIRIKO_TORII_TRIGGERED] = true
                eventPlayer.player_state[PS_KIRIKO_TORII_TICK] += 1
                wait(0.25)
            if len(eventPlayer.player_state[PS_KIRIKO_TORII_FX]) > 0:
                destroyEffect(eventPlayer.player_state[PS_KIRIKO_TORII_FX][0])
            if len(eventPlayer.player_state[PS_KIRIKO_TORII_FX]) > 1:
                destroyEffect(eventPlayer.player_state[PS_KIRIKO_TORII_FX][1])
            if len(eventPlayer.player_state[PS_KIRIKO_TORII_FX]) > 2:
                destroyEffect(eventPlayer.player_state[PS_KIRIKO_TORII_FX][2])
            if len(eventPlayer.player_state[PS_KIRIKO_TORII_FX]) > 3:
                destroyEffect(eventPlayer.player_state[PS_KIRIKO_TORII_FX][3])
            eventPlayer.player_state[PS_KIRIKO_TORII_ACTIVE] = false
            eventPlayer.player_state[PS_KIRIKO_TORII_START_POS] = null
            eventPlayer.player_state[PS_KIRIKO_TORII_END_POS] = null
            eventPlayer.player_state[PS_KIRIKO_TORII_FX] = []
            eventPlayer.player_state[PS_KIRIKO_TORII_TICK] = 0
    wait(1.2)
    eventPlayer.player_state[PS_KIRIKO_SWIFT_STEP_LOCK] = false


rule "[kiriko] clear torii trigger cooldown":
    @Event eachPlayer
    @Condition eventPlayer.player_state[PS_KIRIKO_TORII_TRIGGERED] == true

    if eventPlayer.player_state[PS_KIRIKO_TORII_ENEMY_MISSTEP] == true:
        smallMessage(eventPlayer, "误入神社")
    wait(1.2)
    if eventPlayer.player_state[PS_KIRIKO_TORII_ENEMY_MISSTEP] == true:
        eventPlayer.setMoveSpeed(100)
        eventPlayer.player_state[PS_KIRIKO_TORII_ENEMY_MISSTEP] = false
    eventPlayer.player_state[PS_KIRIKO_TORII_TRIGGERED] = false


rule "[kiriko] suzu grants omamori and backlash":
    @Event eachPlayer
    @Hero kiriko
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isUsingAbility2() == true
    @Condition eventPlayer.player_state[PS_KIRIKO_SUZU_LOCK] == false

    eventPlayer.player_state[PS_KIRIKO_SUZU_LOCK] = true
    eventPlayer.player_state[PS_KIRIKO_SUZU_EMPOWERED] = eventPlayer.player_state[PS_KIRIKO_INCENSE] >= 100
    if eventPlayer.player_state[PS_KIRIKO_SUZU_EMPOWERED] == true:
        eventPlayer.player_state[PS_KIRIKO_INCENSE] = 0
        eventPlayer.player_state[PS_KIRIKO_INCENSE_FULL_PROMPTED] = false
        bigMessage(eventPlayer, "稻荷赦令")
    else:
        eventPlayer.player_state[PS_KIRIKO_INCENSE] += 12
        if eventPlayer.player_state[PS_KIRIKO_INCENSE] > 100:
            eventPlayer.player_state[PS_KIRIKO_INCENSE] = 100
        smallMessage(eventPlayer, "香火 +12")
    eventPlayer.player_state[PS_KIRIKO_BACKLASH_DEBUFF] = eventPlayer.hasStatus(Status.HACKED) == true or eventPlayer.hasStatus(Status.ASLEEP) == true or eventPlayer.hasStatus(Status.KNOCKED_DOWN) == true or eventPlayer.hasStatus(Status.ROOTED) == true or eventPlayer.hasStatus(Status.STUNNED) == true or eventPlayer.hasStatus(Status.FROZEN) == true
    eventPlayer.clearStatusEffect(Status.HACKED)
    eventPlayer.clearStatusEffect(Status.ASLEEP)
    eventPlayer.clearStatusEffect(Status.KNOCKED_DOWN)
    eventPlayer.clearStatusEffect(Status.ROOTED)
    eventPlayer.clearStatusEffect(Status.STUNNED)
    eventPlayer.clearStatusEffect(Status.FROZEN)
    if eventPlayer.player_state[PS_KIRIKO_OMAMORI_ACTIVE] == false and eventPlayer.player_state[PS_KIRIKO_OMAMORI_BROKEN] == false:
        eventPlayer.player_state[PS_KIRIKO_OMAMORI_ACTIVE] = true
        eventPlayer.player_state[PS_KIRIKO_OMAMORI_TARGET] = eventPlayer
        eventPlayer.player_state[PS_KIRIKO_OMAMORI_FX] = eventPlayer.player_state[PS_KIRIKO_SUZU_EMPOWERED]
        eventPlayer.player_state[PS_KIRIKO_OMAMORI_BROKEN] = true
        playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.YELLOW, eventPlayer, 1.6)
        smallMessage(eventPlayer, "御守加护")
    if len(sorted(getLivingPlayers(Team.ALL).filter(lambda player: player != eventPlayer and player.isAlive() == true and distance(player, eventPlayer) <= 8 and getCurrentGamemode() != Gamemode.FFA and player.getTeam() == eventPlayer.getTeam() and player.player_state[PS_KIRIKO_OMAMORI_ACTIVE] == false and player.player_state[PS_KIRIKO_OMAMORI_BROKEN] == false), key=lambda player: player.getHealth())) > 0:
        eventPlayer.player_state[PS_KIRIKO_INCENSE_PRE_CHECK] = sorted(getLivingPlayers(Team.ALL).filter(lambda player: player != eventPlayer and player.isAlive() == true and distance(player, eventPlayer) <= 8 and getCurrentGamemode() != Gamemode.FFA and player.getTeam() == eventPlayer.getTeam() and player.player_state[PS_KIRIKO_OMAMORI_ACTIVE] == false and player.player_state[PS_KIRIKO_OMAMORI_BROKEN] == false), key=lambda player: player.getHealth())[0]
        eventPlayer.player_state[PS_KIRIKO_BACKLASH_DEBUFF] = eventPlayer.player_state[PS_KIRIKO_BACKLASH_DEBUFF] or eventPlayer.player_state[PS_KIRIKO_INCENSE_PRE_CHECK].hasStatus(Status.HACKED) == true or eventPlayer.player_state[PS_KIRIKO_INCENSE_PRE_CHECK].hasStatus(Status.ASLEEP) == true or eventPlayer.player_state[PS_KIRIKO_INCENSE_PRE_CHECK].hasStatus(Status.KNOCKED_DOWN) == true or eventPlayer.player_state[PS_KIRIKO_INCENSE_PRE_CHECK].hasStatus(Status.ROOTED) == true or eventPlayer.player_state[PS_KIRIKO_INCENSE_PRE_CHECK].hasStatus(Status.STUNNED) == true or eventPlayer.player_state[PS_KIRIKO_INCENSE_PRE_CHECK].hasStatus(Status.FROZEN) == true
        eventPlayer.player_state[PS_KIRIKO_INCENSE_PRE_CHECK].clearStatusEffect(Status.HACKED)
        eventPlayer.player_state[PS_KIRIKO_INCENSE_PRE_CHECK].clearStatusEffect(Status.ASLEEP)
        eventPlayer.player_state[PS_KIRIKO_INCENSE_PRE_CHECK].clearStatusEffect(Status.KNOCKED_DOWN)
        eventPlayer.player_state[PS_KIRIKO_INCENSE_PRE_CHECK].clearStatusEffect(Status.ROOTED)
        eventPlayer.player_state[PS_KIRIKO_INCENSE_PRE_CHECK].clearStatusEffect(Status.STUNNED)
        eventPlayer.player_state[PS_KIRIKO_INCENSE_PRE_CHECK].clearStatusEffect(Status.FROZEN)
        eventPlayer.player_state[PS_KIRIKO_INCENSE_PRE_CHECK].player_state[PS_KIRIKO_OMAMORI_ACTIVE] = true
        eventPlayer.player_state[PS_KIRIKO_INCENSE_PRE_CHECK].player_state[PS_KIRIKO_OMAMORI_TARGET] = eventPlayer
        eventPlayer.player_state[PS_KIRIKO_INCENSE_PRE_CHECK].player_state[PS_KIRIKO_OMAMORI_FX] = eventPlayer.player_state[PS_KIRIKO_SUZU_EMPOWERED]
        eventPlayer.player_state[PS_KIRIKO_INCENSE_PRE_CHECK].player_state[PS_KIRIKO_OMAMORI_BROKEN] = true
        playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.YELLOW, eventPlayer.player_state[PS_KIRIKO_INCENSE_PRE_CHECK], 1.6)
        smallMessage(eventPlayer.player_state[PS_KIRIKO_INCENSE_PRE_CHECK], "御守加护")
        eventPlayer.player_state[PS_KIRIKO_INCENSE_PRE_CHECK] = null
    if eventPlayer.player_state[PS_KIRIKO_BACKLASH_DEBUFF] == true:
        eventPlayer.player_state[PS_KIRIKO_INCENSE] += 18 if eventPlayer.player_state[PS_KIRIKO_SUZU_EMPOWERED] == false else 0
        if eventPlayer.player_state[PS_KIRIKO_INCENSE] > 100:
            eventPlayer.player_state[PS_KIRIKO_INCENSE] = 100
        playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.ORANGE, eventPlayer, 2.4 if eventPlayer.player_state[PS_KIRIKO_SUZU_EMPOWERED] == true else 1.8)
        eventPlayer.player_state[PS_KIRIKO_INCENSE_PRE_CHECK] = getPlayersInRadius(eventPlayer.getPosition(), 8 if eventPlayer.player_state[PS_KIRIKO_SUZU_EMPOWERED] == true else 6, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and player.player_state[PS_KIRIKO_OMAMORI_COOLDOWN] == false and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam()))
        eventPlayer.player_state[PS_KIRIKO_INCENSE_PRE_CHECK].setMoveSpeed(70 if eventPlayer.player_state[PS_KIRIKO_SUZU_EMPOWERED] == true else 80)
        eventPlayer.player_state[PS_KIRIKO_INCENSE_PRE_CHECK].setAbilityCooldown(Button.ABILITY_1, 2.5 if eventPlayer.player_state[PS_KIRIKO_SUZU_EMPOWERED] == true else 1.5)
        damage(eventPlayer.player_state[PS_KIRIKO_INCENSE_PRE_CHECK], eventPlayer, 8 if eventPlayer.player_state[PS_KIRIKO_SUZU_EMPOWERED] == true else 4)
        eventPlayer.player_state[PS_KIRIKO_INCENSE_PRE_CHECK].player_state[PS_KIRIKO_OMAMORI_COOLDOWN] = true
        smallMessage(eventPlayer, "净化反噬")
    eventPlayer.player_state[PS_KIRIKO_BACKLASH_DEBUFF] = false
    eventPlayer.player_state[PS_KIRIKO_INCENSE_PRE_CHECK] = null
    wait(0.8)
    eventPlayer.player_state[PS_KIRIKO_SUZU_LOCK] = false


rule "[kiriko] clear backlash cooldown":
    @Event eachPlayer
    @Condition eventPlayer.player_state[PS_KIRIKO_OMAMORI_COOLDOWN] == true

    smallMessage(eventPlayer, "狐火反噬")
    wait(1.4)
    eventPlayer.setMoveSpeed(100)
    eventPlayer.player_state[PS_KIRIKO_OMAMORI_COOLDOWN] = false


rule "[kiriko] omamori blocks fatal damage":
    @Event playerTookDamage
    @Condition eventPlayer.player_state[PS_KIRIKO_OMAMORI_ACTIVE] == true
    @Condition eventPlayer.getHealth() - eventDamage <= 0

    eventPlayer.player_state[PS_KIRIKO_OMAMORI_ACTIVE] = false
    eventPlayer.player_state[PS_KIRIKO_OMAMORI_BROKEN] = true
    eventPlayer.resurrect()
    eventPlayer.setHealth(60 if eventPlayer.player_state[PS_KIRIKO_OMAMORI_FX] == true else 45)
    eventPlayer.setStatusEffect(eventPlayer.player_state[PS_KIRIKO_OMAMORI_TARGET], Status.INVINCIBLE, 0.7)
    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.YELLOW, eventPlayer, 2)
    smallMessage(eventPlayer, "御守破碎")
    if eventPlayer.player_state[PS_KIRIKO_OMAMORI_TARGET] != null:
        smallMessage(eventPlayer.player_state[PS_KIRIKO_OMAMORI_TARGET], "御守借命成功")
        if eventPlayer.player_state[PS_KIRIKO_OMAMORI_TARGET].getHero() == Hero.KIRIKO:
            eventPlayer.player_state[PS_KIRIKO_OMAMORI_TARGET].player_state[PS_KIRIKO_INCENSE] += 15
            if eventPlayer.player_state[PS_KIRIKO_OMAMORI_TARGET].player_state[PS_KIRIKO_INCENSE] > 100:
                eventPlayer.player_state[PS_KIRIKO_OMAMORI_TARGET].player_state[PS_KIRIKO_INCENSE] = 100
            eventPlayer.player_state[PS_KIRIKO_OMAMORI_TARGET].setMoveSpeed(90)
    eventPlayer.player_state[PS_KIRIKO_OMAMORI_TARGET] = null
    eventPlayer.player_state[PS_KIRIKO_OMAMORI_FX] = false
    wait(2)
    if eventPlayer.isAlive() == true:
        eventPlayer.setMoveSpeed(100)
    wait(8)
    eventPlayer.player_state[PS_KIRIKO_OMAMORI_BROKEN] = false


rule "[kiriko] omamori expires":
    @Event eachPlayer
    @Condition eventPlayer.player_state[PS_KIRIKO_OMAMORI_ACTIVE] == true

    wait(8 if eventPlayer.player_state[PS_KIRIKO_OMAMORI_FX] == true else 6)
    if eventPlayer.player_state[PS_KIRIKO_OMAMORI_ACTIVE] == true:
        eventPlayer.player_state[PS_KIRIKO_OMAMORI_ACTIVE] = false
        eventPlayer.player_state[PS_KIRIKO_OMAMORI_TARGET] = null
        eventPlayer.player_state[PS_KIRIKO_OMAMORI_FX] = false
        wait(4)
        eventPlayer.player_state[PS_KIRIKO_OMAMORI_BROKEN] = false


rule "[kiriko] clear ownerless omamori":
    @Event eachPlayer
    @Condition eventPlayer.player_state[PS_KIRIKO_OMAMORI_ACTIVE] == true
    @Condition eventPlayer.player_state[PS_KIRIKO_OMAMORI_TARGET] == null or eventPlayer.player_state[PS_KIRIKO_OMAMORI_TARGET].getHero() != Hero.KIRIKO

    eventPlayer.player_state[PS_KIRIKO_OMAMORI_ACTIVE] = false
    eventPlayer.player_state[PS_KIRIKO_OMAMORI_TARGET] = null
    eventPlayer.player_state[PS_KIRIKO_OMAMORI_FX] = false
    wait(4)
    eventPlayer.player_state[PS_KIRIKO_OMAMORI_BROKEN] = false


rule "[kiriko] clear omamori on death":
    @Event playerDied
    @Condition eventPlayer.player_state[PS_KIRIKO_OMAMORI_ACTIVE] == true

    eventPlayer.player_state[PS_KIRIKO_OMAMORI_ACTIVE] = false
    eventPlayer.player_state[PS_KIRIKO_OMAMORI_TARGET] = null
    eventPlayer.player_state[PS_KIRIKO_OMAMORI_FX] = false
    wait(4)
    eventPlayer.player_state[PS_KIRIKO_OMAMORI_BROKEN] = false


rule "[kiriko] clear incense state on hero swap":
    @Event eachPlayer
    @Condition eventPlayer.getHero() != Hero.KIRIKO
    @Condition eventPlayer.player_state[PS_KIRIKO_INCENSE] > 0 or eventPlayer.player_state[PS_KIRIKO_INCENSE_HUD_CREATED] == true or eventPlayer.player_state[PS_KIRIKO_INCENSE_FULL_PROMPTED] == true or eventPlayer.player_state[PS_KIRIKO_SWIFT_STEP_LOCK] == true or eventPlayer.player_state[PS_KIRIKO_TORII_ACTIVE] == true or eventPlayer.player_state[PS_KIRIKO_SUZU_LOCK] == true

    if eventPlayer.player_state[PS_KIRIKO_INCENSE_HUD_CREATED] == true:
        destroyHudText(eventPlayer.player_state[PS_KIRIKO_INCENSE_HUD_ID])
    if len(eventPlayer.player_state[PS_KIRIKO_TORII_FX]) > 0:
        destroyEffect(eventPlayer.player_state[PS_KIRIKO_TORII_FX][0])
    if len(eventPlayer.player_state[PS_KIRIKO_TORII_FX]) > 1:
        destroyEffect(eventPlayer.player_state[PS_KIRIKO_TORII_FX][1])
    if len(eventPlayer.player_state[PS_KIRIKO_TORII_FX]) > 2:
        destroyEffect(eventPlayer.player_state[PS_KIRIKO_TORII_FX][2])
    if len(eventPlayer.player_state[PS_KIRIKO_TORII_FX]) > 3:
        destroyEffect(eventPlayer.player_state[PS_KIRIKO_TORII_FX][3])
    eventPlayer.player_state[PS_KIRIKO_INCENSE] = 0
    eventPlayer.player_state[PS_KIRIKO_INCENSE_HUD_CREATED] = false
    eventPlayer.player_state[PS_KIRIKO_INCENSE_HUD_ID] = null
    eventPlayer.player_state[PS_KIRIKO_INCENSE_FULL_PROMPTED] = false
    eventPlayer.player_state[PS_KIRIKO_SWIFT_STEP_LOCK] = false
    eventPlayer.player_state[PS_KIRIKO_TORII_ACTIVE] = false
    eventPlayer.player_state[PS_KIRIKO_TORII_START_POS] = null
    eventPlayer.player_state[PS_KIRIKO_TORII_END_POS] = null
    eventPlayer.player_state[PS_KIRIKO_TORII_FX] = []
    eventPlayer.player_state[PS_KIRIKO_TORII_TICK] = 0
    eventPlayer.player_state[PS_KIRIKO_SUZU_LOCK] = false
    eventPlayer.player_state[PS_KIRIKO_SUZU_EMPOWERED] = false
    eventPlayer.player_state[PS_KIRIKO_OMAMORI_ACTIVE] = false
    eventPlayer.player_state[PS_KIRIKO_OMAMORI_TARGET] = null
    eventPlayer.player_state[PS_KIRIKO_OMAMORI_FX] = false
    eventPlayer.player_state[PS_KIRIKO_OMAMORI_BROKEN] = false
    eventPlayer.player_state[PS_KIRIKO_BACKLASH_DEBUFF] = false
    eventPlayer.player_state[PS_KIRIKO_MELEE_INCENSE_CD] = false
    eventPlayer.player_state[PS_KIRIKO_INCENSE_PRE_CHECK] = null
    eventPlayer.player_state[PS_KIRIKO_TORII_ENEMY_MISSTEP] = false


rule "[cassidy] create wager hud":
    @Event eachPlayer
    @Hero cassidy
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.player_state[PS_CASSIDY_WAGER_HUD_CREATED] == false

    eventPlayer.player_state[PS_CASSIDY_WAGER_HUD_CREATED] = true
    hudHeader(eventPlayer, "赌注：{}/10".format(eventPlayer.player_state[PS_CASSIDY_WAGER]), HudPosition.RIGHT, -845, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING)
    eventPlayer.player_state[PS_CASSIDY_WAGER_HUD_ID] = getLastCreatedText()


rule "[cassidy] wager ready prompt":
    @Event eachPlayer
    @Hero cassidy
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.player_state[PS_CASSIDY_WAGER] >= 10
    @Condition eventPlayer.player_state[PS_CASSIDY_WAGER_READY_PROMPTED] == false

    eventPlayer.player_state[PS_CASSIDY_WAGER] = 10
    eventPlayer.player_state[PS_CASSIDY_WAGER_READY_PROMPTED] = true
    bigMessage(eventPlayer, "午时赌局就绪")
    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.ORANGE, eventPlayer, 1.8)


rule "[cassidy] roll creates tripline and window":
    @Event eachPlayer
    @Hero cassidy
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isUsingAbility1() == true
    @Condition eventPlayer.player_state[PS_CASSIDY_ROLL_LOCK] == false

    eventPlayer.player_state[PS_CASSIDY_ROLL_LOCK] = true
    eventPlayer.player_state[PS_CASSIDY_PERFECT_ROLL_TRIGGERED] = false
    eventPlayer.player_state[PS_CASSIDY_ROLL_START_POS] = nearestWalkablePosition(eventPlayer.getPosition())
    eventPlayer.player_state[PS_CASSIDY_PERFECT_ROLL_WINDOW] = true
    eventPlayer.setDamageReceived(35)
    if eventPlayer.player_state[PS_CASSIDY_WAGER] >= 10 and eventPlayer.player_state[PS_CASSIDY_DUEL_ACTIVE] == false:
        eventPlayer.player_state[PS_CASSIDY_WAGER] = 0
        eventPlayer.player_state[PS_CASSIDY_WAGER_READY_PROMPTED] = false
        eventPlayer.player_state[PS_CASSIDY_DUEL_ACTIVE] = true
        eventPlayer.player_state[PS_CASSIDY_DUEL_FAILED] = false
        eventPlayer.player_state[PS_CASSIDY_DUEL_TARGET_HIT] = []
        bigMessage(getAllPlayers(), "午时赌局")
        createEffect(getAllPlayers(), Effect.BAD_AURA, Color.ORANGE, eventPlayer, 5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
        eventPlayer.player_state[PS_CASSIDY_DUEL_TARGET_HIT].append(getLastCreatedEntity())
        createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Color.YELLOW, eventPlayer, 4, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
        eventPlayer.player_state[PS_CASSIDY_DUEL_TARGET_HIT].append(getLastCreatedEntity())
    wait(0.45)
    eventPlayer.player_state[PS_CASSIDY_PERFECT_ROLL_WINDOW] = false
    if eventPlayer.getHero() == Hero.CASSIDY:
        eventPlayer.setDamageReceived(100)
    eventPlayer.player_state[PS_CASSIDY_TRIPLINE_END_POS] = nearestWalkablePosition(eventPlayer.getPosition())
    eventPlayer.player_state[PS_CASSIDY_ROLL_END_LANDED] = true
    if distance(eventPlayer.player_state[PS_CASSIDY_ROLL_START_POS], eventPlayer.player_state[PS_CASSIDY_TRIPLINE_END_POS]) > 0.8:
        eventPlayer.player_state[PS_CASSIDY_TRIPLINE_ACTIVE] = true
        eventPlayer.player_state[PS_CASSIDY_TRIPLINE_FX] = []
        eventPlayer.player_state[PS_CASSIDY_TRIPLINE_TICK] = 0
        eventPlayer.player_state[PS_CASSIDY_TRIPLINE_BOUNTY_GAINED] = false
        createBeam(getAllPlayers(), Beam.BAD, eventPlayer.player_state[PS_CASSIDY_ROLL_START_POS] + Vector.UP * 0.15, eventPlayer.player_state[PS_CASSIDY_TRIPLINE_END_POS] + Vector.UP * 0.15, Color.ORANGE, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
        eventPlayer.player_state[PS_CASSIDY_TRIPLINE_FX].append(getLastCreatedEntity())
        createEffect(getAllPlayers(), Effect.BAD_AURA, Color.ORANGE, eventPlayer.player_state[PS_CASSIDY_TRIPLINE_END_POS], 2.2, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
        eventPlayer.player_state[PS_CASSIDY_TRIPLINE_FX].append(getLastCreatedEntity())
        createEffect(getAllPlayers(), Effect.GOOD_AURA, Color.YELLOW, (eventPlayer.player_state[PS_CASSIDY_ROLL_START_POS] + eventPlayer.player_state[PS_CASSIDY_TRIPLINE_END_POS]) / 2, 1.8, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
        eventPlayer.player_state[PS_CASSIDY_TRIPLINE_FX].append(getLastCreatedEntity())
        while eventPlayer.player_state[PS_CASSIDY_TRIPLINE_ACTIVE] == true and eventPlayer.getHero() == Hero.CASSIDY and eventPlayer.player_state[PS_CASSIDY_TRIPLINE_TICK] < 8:
            eventPlayer.player_state[PS_CASSIDY_TRIPLINE_TARGETS_A] = getPlayersInRadius(eventPlayer.player_state[PS_CASSIDY_TRIPLINE_END_POS], 2.4, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and player.player_state[PS_CASSIDY_TRIPLINE_TARGET_CD] == false and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam()))
            eventPlayer.player_state[PS_CASSIDY_TRIPLINE_TARGETS_B] = getPlayersInRadius((eventPlayer.player_state[PS_CASSIDY_ROLL_START_POS] + eventPlayer.player_state[PS_CASSIDY_TRIPLINE_END_POS]) / 2, 2.1, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and player.player_state[PS_CASSIDY_TRIPLINE_TARGET_CD] == false and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam()))
            if len(eventPlayer.player_state[PS_CASSIDY_TRIPLINE_TARGETS_A]) > 0 or len(eventPlayer.player_state[PS_CASSIDY_TRIPLINE_TARGETS_B]) > 0:
                eventPlayer.player_state[PS_CASSIDY_TRIPLINE_TARGETS_A].setMoveSpeed(65)
                eventPlayer.player_state[PS_CASSIDY_TRIPLINE_TARGETS_B].setMoveSpeed(65)
                eventPlayer.player_state[PS_CASSIDY_TRIPLINE_TARGETS_A].player_state[PS_CASSIDY_TRIPLINE_TARGET_CD] = true
                eventPlayer.player_state[PS_CASSIDY_TRIPLINE_TARGETS_B].player_state[PS_CASSIDY_TRIPLINE_TARGET_CD] = true
                if eventPlayer.player_state[PS_CASSIDY_TRIPLINE_BOUNTY_GAINED] == false:
                    eventPlayer.player_state[PS_CASSIDY_TRIPLINE_BOUNTY_GAINED] = true
                    eventPlayer.player_state[PS_CASSIDY_WAGER] += 2
                    if eventPlayer.player_state[PS_CASSIDY_WAGER] > 10:
                        eventPlayer.player_state[PS_CASSIDY_WAGER] = 10
                    if eventPlayer.player_state[PS_CASSIDY_WAGER] < 10:
                        eventPlayer.player_state[PS_CASSIDY_WAGER_READY_PROMPTED] = false
                    smallMessage(eventPlayer, "绊马索命中：赌注 +2")
                playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, Color.ORANGE, eventPlayer.player_state[PS_CASSIDY_TRIPLINE_END_POS], 1.6)
            eventPlayer.player_state[PS_CASSIDY_TRIPLINE_TICK] += 1
            wait(0.25)
        if len(eventPlayer.player_state[PS_CASSIDY_TRIPLINE_FX]) > 0:
            destroyEffect(eventPlayer.player_state[PS_CASSIDY_TRIPLINE_FX][0])
        if len(eventPlayer.player_state[PS_CASSIDY_TRIPLINE_FX]) > 1:
            destroyEffect(eventPlayer.player_state[PS_CASSIDY_TRIPLINE_FX][1])
        if len(eventPlayer.player_state[PS_CASSIDY_TRIPLINE_FX]) > 2:
            destroyEffect(eventPlayer.player_state[PS_CASSIDY_TRIPLINE_FX][2])
        eventPlayer.player_state[PS_CASSIDY_TRIPLINE_ACTIVE] = false
        eventPlayer.player_state[PS_CASSIDY_TRIPLINE_FX] = []
        eventPlayer.player_state[PS_CASSIDY_TRIPLINE_BOUNTY_GAINED] = false
    wait(0.6)
    eventPlayer.player_state[PS_CASSIDY_ROLL_END_LANDED] = false
    if eventPlayer.player_state[PS_CASSIDY_DUEL_ACTIVE] == true and eventPlayer.player_state[PS_CASSIDY_DUEL_FAILED] == false:
        smallMessage(eventPlayer, "赌局失败")
        eventPlayer.setMoveSpeed(80)
        wait(1)
        if eventPlayer.getHero() == Hero.CASSIDY:
            eventPlayer.setMoveSpeed(100)
    if len(eventPlayer.player_state[PS_CASSIDY_DUEL_TARGET_HIT]) > 0:
        destroyEffect(eventPlayer.player_state[PS_CASSIDY_DUEL_TARGET_HIT][0])
    if len(eventPlayer.player_state[PS_CASSIDY_DUEL_TARGET_HIT]) > 1:
        destroyEffect(eventPlayer.player_state[PS_CASSIDY_DUEL_TARGET_HIT][1])
    eventPlayer.player_state[PS_CASSIDY_DUEL_ACTIVE] = false
    eventPlayer.player_state[PS_CASSIDY_DUEL_FAILED] = false
    eventPlayer.player_state[PS_CASSIDY_DUEL_TARGET_HIT] = []
    eventPlayer.player_state[PS_CASSIDY_ROLL_START_POS] = null
    eventPlayer.player_state[PS_CASSIDY_TRIPLINE_END_POS] = null
    wait(0.5)
    eventPlayer.player_state[PS_CASSIDY_ROLL_LOCK] = false


rule "[cassidy] perfect roll on damage":
    @Event playerTookDamage
    @Hero cassidy
    @Condition eventPlayer.player_state[PS_CASSIDY_PERFECT_ROLL_WINDOW] == true
    @Condition eventPlayer.player_state[PS_CASSIDY_PERFECT_ROLL_TRIGGERED] == false
    @Condition eventDamage > 0

    eventPlayer.player_state[PS_CASSIDY_PERFECT_ROLL_TRIGGERED] = true
    eventPlayer.player_state[PS_CASSIDY_WAGER] += 3
    if eventPlayer.player_state[PS_CASSIDY_WAGER] > 10:
        eventPlayer.player_state[PS_CASSIDY_WAGER] = 10
    if eventPlayer.player_state[PS_CASSIDY_WAGER] < 10:
        eventPlayer.player_state[PS_CASSIDY_WAGER_READY_PROMPTED] = false
    eventPlayer.setStatusEffect(eventPlayer, Status.INVINCIBLE, 0.35)
    smallMessage(eventPlayer, "完美翻滚")
    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.ORANGE, eventPlayer, 1.5)


rule "[cassidy] melee wager and duel hit":
    @Event playerDealtDamage
    @Hero cassidy
    @Condition victim != eventPlayer
    @Condition eventDamage > 0
    @Condition eventAbility == Button.MELEE
    @Condition eventPlayer.player_state[PS_CASSIDY_HIT_FROM_ROLL] == false

    eventPlayer.player_state[PS_CASSIDY_HIT_FROM_ROLL] = true
    if eventPlayer.player_state[PS_CASSIDY_DUEL_ACTIVE] == true:
        eventPlayer.player_state[PS_CASSIDY_DUEL_FAILED] = true
        eventPlayer.player_state[PS_CASSIDY_DUEL_ACTIVE] = false
        damage(victim, eventPlayer, 45)
        victim.setStatusEffect(eventPlayer, Status.KNOCKED_DOWN, 0.55)
        eventPlayer.startHealingOverTime(eventPlayer, 1.5, 25)
        eventPlayer.setMoveSpeed(120)
        bigMessage(eventPlayer, "赌局获胜")
        smallMessage(victim, "赌局败北")
        playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, Color.ORANGE, victim, 2.2)
        wait(1)
        if eventPlayer.getHero() == Hero.CASSIDY:
            eventPlayer.setMoveSpeed(100)
    else:
        eventPlayer.player_state[PS_CASSIDY_WAGER] += 2 if eventPlayer.player_state[PS_CASSIDY_ROLL_END_LANDED] == true else 1
        if eventPlayer.player_state[PS_CASSIDY_WAGER] > 10:
            eventPlayer.player_state[PS_CASSIDY_WAGER] = 10
        if eventPlayer.player_state[PS_CASSIDY_WAGER] < 10:
            eventPlayer.player_state[PS_CASSIDY_WAGER_READY_PROMPTED] = false
        smallMessage(eventPlayer, "赌注 +{}".format(2 if eventPlayer.player_state[PS_CASSIDY_ROLL_END_LANDED] == true else 1))
    wait(0.25)
    eventPlayer.player_state[PS_CASSIDY_HIT_FROM_ROLL] = false


rule "[cassidy] clear tripline target cooldown":
    @Event eachPlayer
    @Condition eventPlayer.player_state[PS_CASSIDY_TRIPLINE_TARGET_CD] == true

    smallMessage(eventPlayer, "踩到绊马索")
    wait(1)
    eventPlayer.setMoveSpeed(100)
    eventPlayer.player_state[PS_CASSIDY_TRIPLINE_TARGET_CD] = false


rule "[cassidy] clear temporary states on death":
    @Event playerDied
    @Hero cassidy

    if len(eventPlayer.player_state[PS_CASSIDY_TRIPLINE_FX]) > 0:
        destroyEffect(eventPlayer.player_state[PS_CASSIDY_TRIPLINE_FX][0])
    if len(eventPlayer.player_state[PS_CASSIDY_TRIPLINE_FX]) > 1:
        destroyEffect(eventPlayer.player_state[PS_CASSIDY_TRIPLINE_FX][1])
    if len(eventPlayer.player_state[PS_CASSIDY_TRIPLINE_FX]) > 2:
        destroyEffect(eventPlayer.player_state[PS_CASSIDY_TRIPLINE_FX][2])
    if len(eventPlayer.player_state[PS_CASSIDY_DUEL_TARGET_HIT]) > 0:
        destroyEffect(eventPlayer.player_state[PS_CASSIDY_DUEL_TARGET_HIT][0])
    if len(eventPlayer.player_state[PS_CASSIDY_DUEL_TARGET_HIT]) > 1:
        destroyEffect(eventPlayer.player_state[PS_CASSIDY_DUEL_TARGET_HIT][1])
    eventPlayer.player_state[PS_CASSIDY_ROLL_LOCK] = false
    eventPlayer.player_state[PS_CASSIDY_ROLL_START_POS] = null
    eventPlayer.player_state[PS_CASSIDY_TRIPLINE_END_POS] = null
    eventPlayer.player_state[PS_CASSIDY_TRIPLINE_ACTIVE] = false
    eventPlayer.player_state[PS_CASSIDY_TRIPLINE_FX] = []
    eventPlayer.player_state[PS_CASSIDY_TRIPLINE_TICK] = 0
    eventPlayer.player_state[PS_CASSIDY_PERFECT_ROLL_WINDOW] = false
    eventPlayer.player_state[PS_CASSIDY_PERFECT_ROLL_TRIGGERED] = false
    eventPlayer.player_state[PS_CASSIDY_ROLL_END_LANDED] = false
    eventPlayer.player_state[PS_CASSIDY_HIT_FROM_ROLL] = false
    eventPlayer.player_state[PS_CASSIDY_DUEL_ACTIVE] = false
    eventPlayer.player_state[PS_CASSIDY_DUEL_FAILED] = false
    eventPlayer.player_state[PS_CASSIDY_DUEL_TARGET_HIT] = []
    eventPlayer.player_state[PS_CASSIDY_TRIPLINE_BOUNTY_GAINED] = false
    eventPlayer.setMoveSpeed(100)
    eventPlayer.setDamageReceived(100)


rule "[cassidy] clear all state after hero swap":
    @Event eachPlayer
    @Condition eventPlayer.getHero() != Hero.CASSIDY
    @Condition eventPlayer.player_state[PS_CASSIDY_WAGER] > 0 or eventPlayer.player_state[PS_CASSIDY_WAGER_HUD_CREATED] == true or eventPlayer.player_state[PS_CASSIDY_WAGER_READY_PROMPTED] == true or eventPlayer.player_state[PS_CASSIDY_ROLL_LOCK] == true or eventPlayer.player_state[PS_CASSIDY_TRIPLINE_ACTIVE] == true or eventPlayer.player_state[PS_CASSIDY_PERFECT_ROLL_WINDOW] == true or eventPlayer.player_state[PS_CASSIDY_ROLL_END_LANDED] == true or eventPlayer.player_state[PS_CASSIDY_DUEL_ACTIVE] == true or len(eventPlayer.player_state[PS_CASSIDY_TRIPLINE_FX]) > 0 or len(eventPlayer.player_state[PS_CASSIDY_DUEL_TARGET_HIT]) > 0

    if eventPlayer.player_state[PS_CASSIDY_WAGER_HUD_CREATED] == true:
        destroyHudText(eventPlayer.player_state[PS_CASSIDY_WAGER_HUD_ID])
    if len(eventPlayer.player_state[PS_CASSIDY_TRIPLINE_FX]) > 0:
        destroyEffect(eventPlayer.player_state[PS_CASSIDY_TRIPLINE_FX][0])
    if len(eventPlayer.player_state[PS_CASSIDY_TRIPLINE_FX]) > 1:
        destroyEffect(eventPlayer.player_state[PS_CASSIDY_TRIPLINE_FX][1])
    if len(eventPlayer.player_state[PS_CASSIDY_TRIPLINE_FX]) > 2:
        destroyEffect(eventPlayer.player_state[PS_CASSIDY_TRIPLINE_FX][2])
    if len(eventPlayer.player_state[PS_CASSIDY_DUEL_TARGET_HIT]) > 0:
        destroyEffect(eventPlayer.player_state[PS_CASSIDY_DUEL_TARGET_HIT][0])
    if len(eventPlayer.player_state[PS_CASSIDY_DUEL_TARGET_HIT]) > 1:
        destroyEffect(eventPlayer.player_state[PS_CASSIDY_DUEL_TARGET_HIT][1])
    eventPlayer.player_state[PS_CASSIDY_WAGER] = 0
    eventPlayer.player_state[PS_CASSIDY_WAGER_HUD_CREATED] = false
    eventPlayer.player_state[PS_CASSIDY_WAGER_HUD_ID] = null
    eventPlayer.player_state[PS_CASSIDY_WAGER_READY_PROMPTED] = false
    eventPlayer.player_state[PS_CASSIDY_ROLL_LOCK] = false
    eventPlayer.player_state[PS_CASSIDY_ROLL_START_POS] = null
    eventPlayer.player_state[PS_CASSIDY_TRIPLINE_END_POS] = null
    eventPlayer.player_state[PS_CASSIDY_TRIPLINE_ACTIVE] = false
    eventPlayer.player_state[PS_CASSIDY_TRIPLINE_FX] = []
    eventPlayer.player_state[PS_CASSIDY_TRIPLINE_TICK] = 0
    eventPlayer.player_state[PS_CASSIDY_PERFECT_ROLL_WINDOW] = false
    eventPlayer.player_state[PS_CASSIDY_PERFECT_ROLL_TRIGGERED] = false
    eventPlayer.player_state[PS_CASSIDY_ROLL_END_LANDED] = false
    eventPlayer.player_state[PS_CASSIDY_HIT_FROM_ROLL] = false
    eventPlayer.player_state[PS_CASSIDY_DUEL_ACTIVE] = false
    eventPlayer.player_state[PS_CASSIDY_DUEL_FAILED] = false
    eventPlayer.player_state[PS_CASSIDY_DUEL_TARGET_HIT] = []
    eventPlayer.player_state[PS_CASSIDY_TRIPLINE_BOUNTY_GAINED] = false
    eventPlayer.setMoveSpeed(100)
    eventPlayer.setDamageReceived(100)


rule "[mei] melee adds frost stack":
    @Event playerDealtDamage
    @Hero mei
    @Condition eventPlayer.isAlive() == true
    @Condition victim.isAlive() == true
    @Condition victim != eventPlayer
    @Condition eventAbility == Button.MELEE
    @Condition eventDamage > 0
    @Condition getCurrentGamemode() == Gamemode.FFA or victim.getTeam() != eventPlayer.getTeam()
    @Condition victim.player_state[PS_MEI_FROST_STACKS] < 3
    @Condition victim.player_state[PS_MEI_MELEE_HIT_CD] == false

    victim.player_state[PS_MEI_MELEE_HIT_CD] = true
    victim.player_state[PS_MEI_FROST_STACKS] += 1
    victim.player_state[PS_MEI_FROST_TOKEN] += 1
    victim.player_state[PS_MEI_FROST_ORIGINAL_HERO] = victim.getHero()
    victim.player_state[PS_MEI_FROST_SOURCE] = eventPlayer
    if victim.player_state[PS_MEI_FROST_STACKS] >= 3:
        victim.player_state[PS_MEI_FROST_STACKS] = 3
    smallMessage(eventPlayer, "寒气 {}/3".format(victim.player_state[PS_MEI_FROST_STACKS]))
    smallMessage(victim, "寒气 {}/3".format(victim.player_state[PS_MEI_FROST_STACKS]))
    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.AQUA, victim, 1.2)
    wait(0.35)
    victim.player_state[PS_MEI_MELEE_HIT_CD] = false


rule "[mei] iceburst trap":
    @Event eachPlayer
    @Hero mei
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isUsingAbility2() == true
    @Condition eventPlayer.player_state[PS_MEI_ICEBURST_CD] == false

    eventPlayer.player_state[PS_MEI_ICEBURST_CD] = true
    eventPlayer.player_state[PS_MEI_ICEBURST_POS] = nearestWalkablePosition(raycast(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * 40, getAllPlayers(), getAllPlayers(), false).getHitPosition())
    eventPlayer.setAbilityCooldown(Button.ABILITY_2, 8)
    createEffect(getAllPlayers(), Effect.GOOD_AURA, Color.AQUA, eventPlayer.player_state[PS_MEI_ICEBURST_POS], 3.2, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_state[PS_MEI_ICEBURST_FX].append(getLastCreatedEntity())
    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.AQUA, eventPlayer.player_state[PS_MEI_ICEBURST_POS], 2)
    wait(0.65)
    playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, Color.AQUA, eventPlayer.player_state[PS_MEI_ICEBURST_POS], 3.2)
    eventPlayer.player_state[PS_SHARED_TEMP_TARGETS_A] = getPlayersInRadius(eventPlayer.player_state[PS_MEI_ICEBURST_POS], 3.2, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam()))
    damage(eventPlayer.player_state[PS_SHARED_TEMP_TARGETS_A], eventPlayer, 8)
    eventPlayer.player_state[PS_SHARED_TEMP_TARGETS_A].player_state[PS_MEI_FROST_STACKS] += 2
    eventPlayer.player_state[PS_SHARED_TEMP_TARGETS_A].player_state[PS_MEI_FROST_TOKEN] += 1
    eventPlayer.player_state[PS_SHARED_TEMP_TARGETS_A].player_state[PS_MEI_FROST_ORIGINAL_HERO] = eventPlayer.player_state[PS_SHARED_TEMP_TARGETS_A].getHero()
    eventPlayer.player_state[PS_SHARED_TEMP_TARGETS_A].player_state[PS_MEI_FROST_SOURCE] = eventPlayer
    eventPlayer.player_state[PS_SHARED_TEMP_TARGETS_A].setMoveSpeed(75)
    eventPlayer.player_state[PS_SHARED_TEMP_TARGETS_A].player_state[PS_MEI_FROST_SLOW_ACTIVE] = true
    eventPlayer.player_state[PS_SHARED_TEMP_TARGETS_A].player_state[PS_MEI_FROST_SLOW_TOKEN] += 1
    smallMessage(eventPlayer.player_state[PS_SHARED_TEMP_TARGETS_A], "寒气 +2")
    wait(0.8)
    if len(eventPlayer.player_state[PS_MEI_ICEBURST_FX]) > 0:
        destroyEffect(eventPlayer.player_state[PS_MEI_ICEBURST_FX][0])
    eventPlayer.player_state[PS_MEI_ICEBURST_POS] = null
    eventPlayer.player_state[PS_MEI_ICEBURST_FX] = []
    wait(7.2)
    eventPlayer.player_state[PS_MEI_ICEBURST_CD] = false


rule "[mei] frost aura":
    @Event eachPlayer
    @Hero mei
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isUsingAbility1() == true
    @Condition eventPlayer.player_state[PS_MEI_AURA_ACTIVE] == false

    eventPlayer.player_state[PS_MEI_AURA_ACTIVE] = true
    eventPlayer.setAbilityCooldown(Button.ABILITY_1, 8)
    createEffect(getAllPlayers(), Effect.CLOUD, Color.AQUA, eventPlayer, 3.8, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_state[PS_MEI_AURA_FX].append(getLastCreatedEntity())
    createEffect(getAllPlayers(), Effect.GOOD_AURA, Color.AQUA, eventPlayer, 3.8, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_state[PS_MEI_AURA_FX].append(getLastCreatedEntity())
    smallMessage(eventPlayer, "寒气圈展开")
    wait(4)
    if len(eventPlayer.player_state[PS_MEI_AURA_FX]) > 0:
        destroyEffect(eventPlayer.player_state[PS_MEI_AURA_FX][0])
    if len(eventPlayer.player_state[PS_MEI_AURA_FX]) > 1:
        destroyEffect(eventPlayer.player_state[PS_MEI_AURA_FX][1])
    eventPlayer.player_state[PS_MEI_AURA_FX] = []
    eventPlayer.player_state[PS_MEI_AURA_ACTIVE] = false


rule "[mei] frost aura adds stack":
    @Event eachPlayer
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.player_state[PS_MEI_AURA_STACK_CD] == false
    @Condition len(getPlayersOnHero(Hero.MEI, Team.ALL).filter(lambda player: player != eventPlayer and player.isAlive() == true and player.player_state[PS_MEI_AURA_ACTIVE] == true and distance(eventPlayer, player) <= 3.8 and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam()))) > 0
    @Condition eventPlayer.player_state[PS_MEI_FROST_STACKS] < 3

    eventPlayer.player_state[PS_MEI_AURA_STACK_CD] = true
    eventPlayer.player_state[PS_MEI_FROST_STACKS] += 1
    eventPlayer.player_state[PS_MEI_FROST_TOKEN] += 1
    eventPlayer.player_state[PS_MEI_FROST_ORIGINAL_HERO] = eventPlayer.getHero()
    eventPlayer.player_state[PS_MEI_FROST_SOURCE] = sorted(getPlayersOnHero(Hero.MEI, Team.ALL).filter(lambda player: player != eventPlayer and player.isAlive() == true and player.player_state[PS_MEI_AURA_ACTIVE] == true and distance(eventPlayer, player) <= 3.8 and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())), key=lambda player: distance(eventPlayer, player))[0]
    if eventPlayer.player_state[PS_MEI_FROST_STACKS] >= 3:
        eventPlayer.player_state[PS_MEI_FROST_STACKS] = 3
    smallMessage(eventPlayer, "寒气 {}/3".format(eventPlayer.player_state[PS_MEI_FROST_STACKS]))
    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.AQUA, eventPlayer, 1)
    wait(2)
    eventPlayer.player_state[PS_MEI_AURA_STACK_CD] = false


rule "[mei] full frost freezes target":
    @Event eachPlayer
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.player_state[PS_MEI_FROST_STACKS] >= 3

    eventPlayer.player_state[PS_MEI_FROST_STACKS] = 0
    eventPlayer.player_state[PS_MEI_FROST_TOKEN] += 1
    eventPlayer.player_state[PS_MEI_FROST_ORIGINAL_HERO] = eventPlayer.getHero()
    bigMessage(eventPlayer, "寒气爆发")
    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.AQUA, eventPlayer, 2.5)
    playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, Color.WHITE, eventPlayer, 2)
    eventPlayer.setStatusEffect(null, Status.FROZEN, 0.6)
    wait(0.6)
    if eventPlayer.isAlive() == true and eventPlayer.getHero() == eventPlayer.player_state[PS_MEI_FROST_ORIGINAL_HERO]:
        eventPlayer.setMoveSpeed(65)
        eventPlayer.player_state[PS_MEI_FROST_SLOW_ACTIVE] = true
        eventPlayer.player_state[PS_MEI_FROST_SLOW_TOKEN] += 1


rule "[mei] restore frost slow":
    @Event eachPlayer
    @Condition eventPlayer.player_state[PS_MEI_FROST_SLOW_ACTIVE] == true
    @Condition eventPlayer.player_state[PS_MEI_FROST_SLOW_SNAPSHOT] != eventPlayer.player_state[PS_MEI_FROST_SLOW_TOKEN]

    eventPlayer.player_state[PS_MEI_FROST_SLOW_SNAPSHOT] = eventPlayer.player_state[PS_MEI_FROST_SLOW_TOKEN]
    wait(2)
    if eventPlayer.player_state[PS_MEI_FROST_SLOW_ACTIVE] == true and eventPlayer.player_state[PS_MEI_FROST_SLOW_SNAPSHOT] == eventPlayer.player_state[PS_MEI_FROST_SLOW_TOKEN] and eventPlayer.isAlive() == true and eventPlayer.getHero() == eventPlayer.player_state[PS_MEI_FROST_ORIGINAL_HERO]:
        eventPlayer.setMoveSpeed(100)
    if eventPlayer.player_state[PS_MEI_FROST_SLOW_SNAPSHOT] == eventPlayer.player_state[PS_MEI_FROST_SLOW_TOKEN]:
        eventPlayer.player_state[PS_MEI_FROST_SLOW_ACTIVE] = false


rule "[mei] frost stack decay":
    @Event eachPlayer
    @Condition eventPlayer.player_state[PS_MEI_FROST_STACKS] > 0
    @Condition eventPlayer.player_state[PS_MEI_FROST_DECAY_ACTIVE] == false

    eventPlayer.player_state[PS_MEI_FROST_DECAY_ACTIVE] = true
    eventPlayer.player_state[PS_MEI_FROST_DECAY_SNAPSHOT] = eventPlayer.player_state[PS_MEI_FROST_TOKEN]
    waitUntil(eventPlayer.player_state[PS_MEI_FROST_DECAY_SNAPSHOT] != eventPlayer.player_state[PS_MEI_FROST_TOKEN] or eventPlayer.isDead() == true or eventPlayer.getHero() != eventPlayer.player_state[PS_MEI_FROST_ORIGINAL_HERO], 3)
    while eventPlayer.player_state[PS_MEI_FROST_STACKS] > 0 and eventPlayer.player_state[PS_MEI_FROST_DECAY_SNAPSHOT] == eventPlayer.player_state[PS_MEI_FROST_TOKEN] and eventPlayer.isAlive() == true and eventPlayer.getHero() == eventPlayer.player_state[PS_MEI_FROST_ORIGINAL_HERO]:
        wait(2)
        if eventPlayer.player_state[PS_MEI_FROST_STACKS] > 0 and eventPlayer.player_state[PS_MEI_FROST_DECAY_SNAPSHOT] == eventPlayer.player_state[PS_MEI_FROST_TOKEN] and eventPlayer.isAlive() == true and eventPlayer.getHero() == eventPlayer.player_state[PS_MEI_FROST_ORIGINAL_HERO]:
            eventPlayer.player_state[PS_MEI_FROST_STACKS] -= 1
            smallMessage(eventPlayer, "寒气消退：{}/3".format(eventPlayer.player_state[PS_MEI_FROST_STACKS]))
    eventPlayer.player_state[PS_MEI_FROST_DECAY_ACTIVE] = false


rule "[mei] clear frost target state":
    @Event eachPlayer
    @Condition eventPlayer.isDead() == true or eventPlayer.getHero() != eventPlayer.player_state[PS_MEI_FROST_ORIGINAL_HERO]
    @Condition eventPlayer.player_state[PS_MEI_FROST_STACKS] > 0 or eventPlayer.player_state[PS_MEI_FROST_DECAY_ACTIVE] == true or eventPlayer.player_state[PS_MEI_FROST_SLOW_ACTIVE] == true or eventPlayer.player_state[PS_MEI_MELEE_HIT_CD] == true or eventPlayer.player_state[PS_MEI_AURA_STACK_CD] == true

    eventPlayer.player_state[PS_MEI_FROST_STACKS] = 0
    eventPlayer.player_state[PS_MEI_FROST_TOKEN] += 1
    eventPlayer.player_state[PS_MEI_FROST_DECAY_ACTIVE] = false
    eventPlayer.player_state[PS_MEI_FROST_SLOW_ACTIVE] = false
    eventPlayer.player_state[PS_MEI_FROST_SLOW_TOKEN] += 1
    eventPlayer.player_state[PS_MEI_FROST_ORIGINAL_HERO] = null
    eventPlayer.player_state[PS_MEI_FROST_SOURCE] = null
    eventPlayer.player_state[PS_MEI_MELEE_HIT_CD] = false
    eventPlayer.player_state[PS_MEI_FROST_DECAY_SNAPSHOT] = 0
    eventPlayer.player_state[PS_MEI_AURA_STACK_CD] = false
    eventPlayer.player_state[PS_MEI_FROST_SLOW_SNAPSHOT] = 0
    eventPlayer.setMoveSpeed(100)
    eventPlayer.clearStatusEffect(Status.FROZEN)


rule "[mei] clear frost when source mei leaves":
    @Event eachPlayer
    @Condition eventPlayer.player_state[PS_MEI_FROST_SOURCE] != null
    @Condition eventPlayer.player_state[PS_MEI_FROST_SOURCE].isDead() == true or eventPlayer.player_state[PS_MEI_FROST_SOURCE].getHero() != Hero.MEI
    @Condition eventPlayer.player_state[PS_MEI_FROST_STACKS] > 0 or eventPlayer.player_state[PS_MEI_FROST_DECAY_ACTIVE] == true or eventPlayer.player_state[PS_MEI_FROST_SLOW_ACTIVE] == true or eventPlayer.player_state[PS_MEI_MELEE_HIT_CD] == true or eventPlayer.player_state[PS_MEI_AURA_STACK_CD] == true

    eventPlayer.player_state[PS_MEI_FROST_STACKS] = 0
    eventPlayer.player_state[PS_MEI_FROST_TOKEN] += 1
    eventPlayer.player_state[PS_MEI_FROST_DECAY_ACTIVE] = false
    eventPlayer.player_state[PS_MEI_FROST_SLOW_ACTIVE] = false
    eventPlayer.player_state[PS_MEI_FROST_SLOW_TOKEN] += 1
    eventPlayer.player_state[PS_MEI_FROST_ORIGINAL_HERO] = null
    eventPlayer.player_state[PS_MEI_MELEE_HIT_CD] = false
    eventPlayer.player_state[PS_MEI_FROST_DECAY_SNAPSHOT] = 0
    eventPlayer.player_state[PS_MEI_AURA_STACK_CD] = false
    eventPlayer.player_state[PS_MEI_FROST_SLOW_SNAPSHOT] = 0
    eventPlayer.player_state[PS_MEI_FROST_SOURCE] = null
    eventPlayer.setMoveSpeed(100)
    eventPlayer.clearStatusEffect(Status.FROZEN)


rule "[mei] clear frost aura after death or hero swap":
    @Event eachPlayer
    @Condition eventPlayer.getHero() != Hero.MEI or eventPlayer.isDead() == true
    @Condition eventPlayer.player_state[PS_MEI_AURA_ACTIVE] == true or len(eventPlayer.player_state[PS_MEI_AURA_FX]) > 0 or eventPlayer.player_state[PS_MEI_ICEBURST_CD] == true or eventPlayer.player_state[PS_MEI_ICEBURST_POS] != null or len(eventPlayer.player_state[PS_MEI_ICEBURST_FX]) > 0

    if len(eventPlayer.player_state[PS_MEI_AURA_FX]) > 0:
        destroyEffect(eventPlayer.player_state[PS_MEI_AURA_FX][0])
    if len(eventPlayer.player_state[PS_MEI_AURA_FX]) > 1:
        destroyEffect(eventPlayer.player_state[PS_MEI_AURA_FX][1])
    if len(eventPlayer.player_state[PS_MEI_ICEBURST_FX]) > 0:
        destroyEffect(eventPlayer.player_state[PS_MEI_ICEBURST_FX][0])
    eventPlayer.player_state[PS_MEI_AURA_ACTIVE] = false
    eventPlayer.player_state[PS_MEI_AURA_FX] = []
    eventPlayer.player_state[PS_MEI_ICEBURST_CD] = false
    eventPlayer.player_state[PS_MEI_ICEBURST_POS] = null
    eventPlayer.player_state[PS_MEI_ICEBURST_FX] = []


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
    resetPlayerAttributes()
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
    resetPlayerAttributes()
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
    resetPlayerAttributes()
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
    resetPlayerAttributes()
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
    @Condition eventPlayer.player_state[PS_BAPTISTE_FAKE_DRUG_CD] == false
    @Condition victim.baptiste_drug_target_active == false

    if random.randint(1, 100) <= 18:
        eventPlayer.player_state[PS_BAPTISTE_FAKE_DRUG_CD] = true
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
        eventPlayer.player_state[PS_BAPTISTE_FAKE_DRUG_CD] = false


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
    @Condition eventPlayer.genji_ult_window_active == true or eventPlayer.genji_ult_window_timer > 0

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
    @Condition eventPlayer.player_state[PS_TORB_PARTS_HUD_CREATED] == false

    eventPlayer.player_state[PS_TORB_PARTS_HUD_CREATED] = true
    hudHeader(eventPlayer, "托比昂零件：{}/3".format(eventPlayer.player_state[PS_TORB_PARTS]), HudPosition.RIGHT, -850, Color.YELLOW, HudReeval.VISIBILITY_AND_STRING)
    eventPlayer.player_state[PS_TORB_PARTS_HUD_ID] = getLastCreatedText()


rule "[torbjorn] gain parts on elimination":
    @Event playerEarnedElimination
    @Hero torbjorn
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.player_state[PS_TORB_MOD_ACTIVE] == false

    if eventPlayer.player_state[PS_TORB_PARTS] < 3:
        eventPlayer.player_state[PS_TORB_PARTS] += 1
    if eventPlayer.player_state[PS_TORB_PARTS] >= 3:
        eventPlayer.player_state[PS_TORB_PARTS] = 3
        eventPlayer.player_state[PS_TORB_MOD_READY] = true
        smallMessage(eventPlayer, "非法改装就绪")
    else:
        smallMessage(eventPlayer, "获得零件：{}/3".format(eventPlayer.player_state[PS_TORB_PARTS]))
    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.YELLOW, eventPlayer, 1.5)


rule "[torbjorn] activate illegal modification":
    @Event eachPlayer
    @Hero torbjorn
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.player_state[PS_TORB_PARTS] >= 3
    @Condition eventPlayer.player_state[PS_TORB_MOD_ACTIVE] == false
    @Condition eventPlayer.player_state[PS_TORB_MOD_COOLDOWN] == false
    @Condition eventPlayer.isUsingAbility2() == true

    eventPlayer.player_state[PS_TORB_MOD_ACTIVE] = true
    eventPlayer.player_state[PS_TORB_MOD_READY] = false
    eventPlayer.player_state[PS_TORB_MOD_COOLDOWN] = true
    eventPlayer.player_state[PS_TORB_PARTS] = 0
    eventPlayer.player_state[PS_TORB_MOD_ROLL] = random.randint(1, 4)
    smallMessage(eventPlayer, "非法改装启动！")
    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.ORANGE, eventPlayer, 3)
    if eventPlayer.player_state[PS_TORB_MOD_ROLL] == 1:
        eventPlayer.startScalingSize(1.6)
        eventPlayer.setDamageDealt(120)
        eventPlayer.setMoveSpeed(80)
        eventPlayer.setKnockbackReceived(130)
        eventPlayer.player_state[PS_TORB_MOD_HUD_CREATED] = true
        hudHeader(eventPlayer, "当前改装：巨型模块", HudPosition.RIGHT, -849, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING)
        eventPlayer.player_state[PS_TORB_MOD_HUD_ID] = getLastCreatedText()
        playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.ORANGE, eventPlayer, 3)
        bigMessage(eventPlayer, "非法改装：巨型模块")
        wait(1)
        eventPlayer.player_state[PS_TORB_MOD_COOLDOWN] = false
    elif eventPlayer.player_state[PS_TORB_MOD_ROLL] == 2:
        eventPlayer.startScalingSize(0.65)
        eventPlayer.setMoveSpeed(140)
        eventPlayer.setDamageDealt(70)
        eventPlayer.setKnockbackReceived(160)
        eventPlayer.player_state[PS_TORB_MOD_HUD_CREATED] = true
        hudHeader(eventPlayer, "当前改装：迷你模块", HudPosition.RIGHT, -849, Color.BLUE, HudReeval.VISIBILITY_AND_STRING)
        eventPlayer.player_state[PS_TORB_MOD_HUD_ID] = getLastCreatedText()
        playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.BLUE, eventPlayer, 2)
        bigMessage(eventPlayer, "非法改装：迷你模块")
        wait(1)
        eventPlayer.player_state[PS_TORB_MOD_COOLDOWN] = false
    elif eventPlayer.player_state[PS_TORB_MOD_ROLL] == 3:
        eventPlayer.startScalingSize(1.25)
        eventPlayer.setDamageReceived(70)
        eventPlayer.setMoveSpeed(75)
        eventPlayer.setDamageDealt(80)
        eventPlayer.setKnockbackReceived(70)
        eventPlayer.player_state[PS_TORB_MOD_HUD_CREATED] = true
        hudHeader(eventPlayer, "当前改装：防爆模块", HudPosition.RIGHT, -849, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
        eventPlayer.player_state[PS_TORB_MOD_HUD_ID] = getLastCreatedText()
        playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.WHITE, eventPlayer, 2.5)
        bigMessage(eventPlayer, "非法改装：防爆模块")
        wait(1)
        eventPlayer.player_state[PS_TORB_MOD_COOLDOWN] = false
    else:
        eventPlayer.startScalingSize(1.8)
        eventPlayer.setMoveSpeed(60)
        eventPlayer.setDamageReceived(130)
        eventPlayer.setStatusEffect(null, Status.KNOCKED_DOWN, 0.75)
        eventPlayer.player_state[PS_TORB_MOD_HUD_CREATED] = true
        hudHeader(eventPlayer, "当前改装：失败改装", HudPosition.RIGHT, -849, Color.RED, HudReeval.VISIBILITY_AND_STRING)
        eventPlayer.player_state[PS_TORB_MOD_HUD_ID] = getLastCreatedText()
        playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, Color.RED, eventPlayer, 3)
        bigMessage(eventPlayer, "非法改装失败！")
        wait(2)
        eventPlayer.stopScalingSize()
        eventPlayer.setMoveSpeed(100)
        eventPlayer.setDamageDealt(100)
        eventPlayer.setDamageReceived(100)
        eventPlayer.setKnockbackReceived(100)
        if eventPlayer.player_state[PS_TORB_MOD_HUD_CREATED] == true:
            destroyHudText(eventPlayer.player_state[PS_TORB_MOD_HUD_ID])
        eventPlayer.player_state[PS_TORB_MOD_HUD_CREATED] = false
        eventPlayer.player_state[PS_TORB_MOD_HUD_ID] = null
        eventPlayer.player_state[PS_TORB_MOD_ACTIVE] = false
        wait(1)
        eventPlayer.player_state[PS_TORB_MOD_COOLDOWN] = false


rule "[torbjorn] clear illegal modification on death":
    @Event playerDied
    @Hero torbjorn

    eventPlayer.player_state[PS_TORB_PARTS] = 0
    eventPlayer.player_state[PS_TORB_MOD_READY] = false
    eventPlayer.player_state[PS_TORB_MOD_ACTIVE] = false
    eventPlayer.player_state[PS_TORB_MOD_ROLL] = 0
    eventPlayer.player_state[PS_TORB_MOD_COOLDOWN] = false
    if eventPlayer.player_state[PS_TORB_MOD_HUD_CREATED] == true:
        destroyHudText(eventPlayer.player_state[PS_TORB_MOD_HUD_ID])
    eventPlayer.player_state[PS_TORB_MOD_HUD_CREATED] = false
    eventPlayer.player_state[PS_TORB_MOD_HUD_ID] = null
    resetPlayerAttributes()


rule "[torbjorn] clear illegal modification after hero swap":
    @Event eachPlayer
    @Condition eventPlayer.getHero() != Hero.TORBJORN
    @Condition eventPlayer.player_state[PS_TORB_PARTS] > 0 or eventPlayer.player_state[PS_TORB_MOD_READY] == true or eventPlayer.player_state[PS_TORB_MOD_ACTIVE] == true or eventPlayer.player_state[PS_TORB_MOD_COOLDOWN] == true or eventPlayer.player_state[PS_TORB_PARTS_HUD_CREATED] == true or eventPlayer.player_state[PS_TORB_MOD_HUD_CREATED] == true

    if eventPlayer.player_state[PS_TORB_PARTS_HUD_CREATED] == true:
        destroyHudText(eventPlayer.player_state[PS_TORB_PARTS_HUD_ID])
    if eventPlayer.player_state[PS_TORB_MOD_HUD_CREATED] == true:
        destroyHudText(eventPlayer.player_state[PS_TORB_MOD_HUD_ID])
    eventPlayer.player_state[PS_TORB_PARTS] = 0
    eventPlayer.player_state[PS_TORB_MOD_READY] = false
    eventPlayer.player_state[PS_TORB_MOD_ACTIVE] = false
    eventPlayer.player_state[PS_TORB_MOD_ROLL] = 0
    eventPlayer.player_state[PS_TORB_MOD_COOLDOWN] = false
    eventPlayer.player_state[PS_TORB_PARTS_HUD_CREATED] = false
    eventPlayer.player_state[PS_TORB_PARTS_HUD_ID] = null
    eventPlayer.player_state[PS_TORB_MOD_HUD_CREATED] = false
    eventPlayer.player_state[PS_TORB_MOD_HUD_ID] = null
    resetPlayerAttributes()


rule "[roadhog] hook weakens target":
    @Event playerDealtDamage
    @Hero roadhog
    @Condition eventAbility == Button.ABILITY_1

    victim.startScalingSize(0.5)
    victim.setMoveSpeed(140)
    victim.setKnockbackReceived(180)
    eventPlayer.player_state[PS_ROADHOG_HOOK_MELEE_BOOST] = true
    smallMessage(eventPlayer, "钩中目标：下一次近战击退增强")
    wait(3)
    victim.stopScalingSize()
    victim.setMoveSpeed(100)
    victim.setKnockbackReceived(100)


rule "[roadhog] consume boosted melee knockback":
    @Event playerDealtDamage
    @Hero roadhog
    @Condition eventPlayer.player_state[PS_ROADHOG_HOOK_MELEE_BOOST] == true
    @Condition eventPlayer.isMeleeing() == true

    eventPlayer.player_state[PS_ROADHOG_HOOK_MELEE_BOOST] = false
    victim.applyImpulse(directionTowards(eventPlayer.getPosition(), victim.getPosition()), 25, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
    smallMessage(eventPlayer, "强化近战击退触发")


rule "[lucio] remember airborne state":
    @Event eachPlayer
    @Hero lucio
    @Condition eventPlayer.isInAir() == true
    @Condition eventPlayer.player_state[PS_LUCIO_LANDING_BOUNCE_CD] == false

    eventPlayer.player_state[PS_LUCIO_WAS_AIRBORNE] = true


rule "[lucio] landing bounce":
    @Event eachPlayer
    @Hero lucio
    @Condition eventPlayer.player_state[PS_LUCIO_WAS_AIRBORNE] == true
    @Condition eventPlayer.isInAir() == false
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.player_state[PS_LUCIO_LANDING_BOUNCE_CD] == false

    eventPlayer.player_state[PS_LUCIO_WAS_AIRBORNE] = false
    eventPlayer.player_state[PS_LUCIO_LANDING_BOUNCE_CD] = true
    getPlayersInRadius(eventPlayer.getPosition(), 8, Team.ALL).filter(lambda player: player != eventPlayer).player_state[PS_LUCIO_LANDING_BOUNCE_CD] = true
    getPlayersInRadius(eventPlayer.getPosition(), 8, Team.ALL).filter(lambda player: player != eventPlayer).applyImpulse(Vector.UP, 12, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
    eventPlayer.setMoveSpeed(140)
    smallMessage(eventPlayer, "落地冲击")
    wait(1.5)
    eventPlayer.setMoveSpeed(100)


rule "[lucio] clear landing bounce cooldown":
    @Event eachPlayer
    @Hero lucio
    @Condition eventPlayer.player_state[PS_LUCIO_LANDING_BOUNCE_CD] == true

    wait(1)
    eventPlayer.player_state[PS_LUCIO_LANDING_BOUNCE_CD] = false


rule "[sojourn] power slide launches nearby players":
    @Event eachPlayer
    @Hero sojourn
    @Condition eventPlayer.isUsingAbility1() == true
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.player_state[PS_SOJOURN_SLIDE_BUMP_CD] == false
    @Condition len(getPlayersInRadius(eventPlayer.getPosition(), 2.8, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and player.player_state[PS_SOJOURN_SLIDE_SLAM_PENDING] == false and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam()))) > 0

    eventPlayer.player_state[PS_SOJOURN_SLIDE_BUMP_CD] = true
    getPlayersInRadius(eventPlayer.getPosition(), 2.8, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and player.player_state[PS_SOJOURN_SLIDE_SLAM_PENDING] == false and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).player_state[PS_SOJOURN_SLIDE_SLAM_PENDING] = true
    getPlayersInRadius(eventPlayer.getPosition(), 2.8, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and player.player_state[PS_SOJOURN_SLIDE_SLAM_PENDING] == true and player.player_state[PS_SOJOURN_SLIDE_SLAM_SOURCE] == false and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).player_state[PS_SOJOURN_SLIDE_SLAM_SOURCE] = eventPlayer
    getPlayersInRadius(eventPlayer.getPosition(), 2.8, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and player.player_state[PS_SOJOURN_SLIDE_SLAM_PENDING] == true and player.player_state[PS_SOJOURN_SLIDE_SLAM_START_POS] == false and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).player_state[PS_SOJOURN_SLIDE_SLAM_START_POS] = getPlayersInRadius(eventPlayer.getPosition(), 2.8, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and player.player_state[PS_SOJOURN_SLIDE_SLAM_PENDING] == true and player.player_state[PS_SOJOURN_SLIDE_SLAM_START_POS] == false and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).getPosition()
    damage(getPlayersInRadius(eventPlayer.getPosition(), 2.8, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and player.player_state[PS_SOJOURN_SLIDE_SLAM_PENDING] == true and player.player_state[PS_SOJOURN_SLIDE_SLAM_SOURCE] == eventPlayer and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())), eventPlayer, 14)
    getPlayersInRadius(eventPlayer.getPosition(), 2.8, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and player.player_state[PS_SOJOURN_SLIDE_SLAM_PENDING] == true and player.player_state[PS_SOJOURN_SLIDE_SLAM_SOURCE] == eventPlayer and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).setStatusEffect(eventPlayer, Status.KNOCKED_DOWN, 0.35)
    getPlayersInRadius(eventPlayer.getPosition(), 2.8, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and player.player_state[PS_SOJOURN_SLIDE_SLAM_PENDING] == true and player.player_state[PS_SOJOURN_SLIDE_SLAM_SOURCE] == eventPlayer and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).applyImpulse(eventPlayer.getFacingDirection() + Vector.UP * 0.12, 30, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.BLUE, eventPlayer, 2.8)
    smallMessage(eventPlayer, "滑铲创飞！")
    wait(0.8)
    eventPlayer.player_state[PS_SOJOURN_SLIDE_BUMP_CD] = false


rule "[sojourn] resolve slide wall slam":
    @Event eachPlayer
    @Condition eventPlayer.player_state[PS_SOJOURN_SLIDE_SLAM_PENDING] == true

    wait(0.45)
    if eventPlayer.isAlive() == true and eventPlayer.player_state[PS_SOJOURN_SLIDE_SLAM_SOURCE] != false and eventPlayer.player_state[PS_SOJOURN_SLIDE_SLAM_START_POS] != false:
        if distance(eventPlayer.getPosition(), eventPlayer.player_state[PS_SOJOURN_SLIDE_SLAM_START_POS]) < 3.2:
            damage(eventPlayer, eventPlayer.player_state[PS_SOJOURN_SLIDE_SLAM_SOURCE], 26)
            eventPlayer.setStatusEffect(eventPlayer.player_state[PS_SOJOURN_SLIDE_SLAM_SOURCE], Status.STUNNED, 1.35)
            playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, Color.BLUE, eventPlayer, 2.2)
            smallMessage(eventPlayer, "撞墙眩晕")
            smallMessage(eventPlayer.player_state[PS_SOJOURN_SLIDE_SLAM_SOURCE], "滑铲撞墙！")
        else:
            smallMessage(eventPlayer, "被铲飞")
    wait(0.25)
    eventPlayer.player_state[PS_SOJOURN_SLIDE_SLAM_PENDING] = false
    eventPlayer.player_state[PS_SOJOURN_SLIDE_SLAM_START_POS] = false
    eventPlayer.player_state[PS_SOJOURN_SLIDE_SLAM_SOURCE] = false


rule "[brigitte] shield bash blink stun":
    @Event eachPlayer
    @Hero brigitte
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.player_state[PS_BRIGITTE_BLINK_COOLDOWN] == false
    @Condition eventPlayer.isFiringSecondaryFire() == true
    @Condition eventPlayer.isFiringPrimaryFire() == true
    @Condition len(getLivingPlayers(Team.ALL).filter(lambda player: player != eventPlayer and player.isAlive() == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam()) and eventPlayer.isInViewAngle(player.getPosition(), 60) == true and distance(eventPlayer, player) > 12 and distance(eventPlayer, player) <= 25 and isInLoS(eventPlayer, player, BarrierLos.PASS_THROUGH_BARRIERS) == true)) > 0

    eventPlayer.player_state[PS_BRIGITTE_BLINK_TARGET] = sorted(getLivingPlayers(Team.ALL).filter(lambda player: player != eventPlayer and player.isAlive() == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam()) and eventPlayer.isInViewAngle(player.getPosition(), 60) == true and distance(eventPlayer, player) > 12 and distance(eventPlayer, player) <= 25 and isInLoS(eventPlayer, player, BarrierLos.PASS_THROUGH_BARRIERS) == true), key=lambda player: angleBetweenVectors(eventPlayer.getFacingDirection(), player.getPosition() - eventPlayer.getEyePosition()))[0]
    if distance(nearestWalkablePosition(eventPlayer.player_state[PS_BRIGITTE_BLINK_TARGET].getPosition() + directionTowards(eventPlayer.player_state[PS_BRIGITTE_BLINK_TARGET].getPosition(), eventPlayer.getPosition()) * 2.2), eventPlayer.player_state[PS_BRIGITTE_BLINK_TARGET]) <= 4:
        eventPlayer.player_state[PS_BRIGITTE_BLINK_COOLDOWN] = true
        eventPlayer.cancelPrimaryAction()
        playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.YELLOW, eventPlayer.getEyePosition(), 1.5)
        eventPlayer.teleport(nearestWalkablePosition(eventPlayer.player_state[PS_BRIGITTE_BLINK_TARGET].getPosition() + directionTowards(eventPlayer.player_state[PS_BRIGITTE_BLINK_TARGET].getPosition(), eventPlayer.getPosition()) * 2.2))
        playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.YELLOW, eventPlayer, 2)
        eventPlayer.player_state[PS_BRIGITTE_BLINK_TARGET].setStatusEffect(eventPlayer, Status.STUNNED, 0.5)
        smallMessage(eventPlayer, "盾击瞬移")
        wait(4)
        eventPlayer.player_state[PS_BRIGITTE_BLINK_COOLDOWN] = false
    eventPlayer.player_state[PS_BRIGITTE_BLINK_TARGET] = null


rule "[brigitte] shield counter melee attackers":
    @Event eachPlayer
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isMeleeing() == true
    @Condition eventPlayer.player_state[PS_BRIGITTE_COUNTER_CD] == false
    @Condition len(getLivingPlayers(Team.ALL).filter(lambda player: player != eventPlayer and player.getHero() == Hero.BRIGITTE and player.isAlive() == true and player.isFiringSecondaryFire() == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam()) and distance(eventPlayer, player) <= 3.2 and eventPlayer.isInViewAngle(player.getPosition(), 70) == true and player.isInViewAngle(eventPlayer.getPosition(), 100) == true and isInLoS(eventPlayer, player, BarrierLos.PASS_THROUGH_BARRIERS) == true)) > 0

    eventPlayer.player_state[PS_BRIGITTE_COUNTER_CD] = true
    eventPlayer.player_state[PS_BRIGITTE_COUNTER_TARGET] = sorted(getLivingPlayers(Team.ALL).filter(lambda player: player != eventPlayer and player.getHero() == Hero.BRIGITTE and player.isAlive() == true and player.isFiringSecondaryFire() == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam()) and distance(eventPlayer, player) <= 3.2 and eventPlayer.isInViewAngle(player.getPosition(), 70) == true and player.isInViewAngle(eventPlayer.getPosition(), 100) == true and isInLoS(eventPlayer, player, BarrierLos.PASS_THROUGH_BARRIERS) == true), key=lambda player: distance(eventPlayer, player))[0]
    eventPlayer.setStatusEffect(eventPlayer.player_state[PS_BRIGITTE_COUNTER_TARGET], Status.STUNNED, 0.35)
    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.YELLOW, eventPlayer.player_state[PS_BRIGITTE_COUNTER_TARGET].getEyePosition(), 1.6)
    smallMessage(eventPlayer.player_state[PS_BRIGITTE_COUNTER_TARGET], "盾反成功")
    smallMessage(eventPlayer, "被盾反")
    eventPlayer.player_state[PS_BRIGITTE_COUNTER_TARGET] = null
    wait(1)
    eventPlayer.player_state[PS_BRIGITTE_COUNTER_CD] = false


rule "[brigitte] clear shield bash blink on death":
    @Event playerDied
    @Hero brigitte

    eventPlayer.player_state[PS_BRIGITTE_BLINK_COOLDOWN] = false
    eventPlayer.player_state[PS_BRIGITTE_BLINK_TARGET] = null


rule "[brigitte] clear shield bash blink after hero swap":
    @Event eachPlayer
    @Condition eventPlayer.getHero() != Hero.BRIGITTE
    @Condition eventPlayer.player_state[PS_BRIGITTE_BLINK_COOLDOWN] == true or eventPlayer.player_state[PS_BRIGITTE_BLINK_TARGET] != null

    eventPlayer.player_state[PS_BRIGITTE_BLINK_COOLDOWN] = false
    eventPlayer.player_state[PS_BRIGITTE_BLINK_TARGET] = null


rule "[brigitte] clear shield counter attacker state":
    @Event eachPlayer
    @Condition eventPlayer.player_state[PS_BRIGITTE_COUNTER_CD] == true or eventPlayer.player_state[PS_BRIGITTE_COUNTER_TARGET] != null
    @Condition eventPlayer.isDead() == true

    eventPlayer.player_state[PS_BRIGITTE_COUNTER_CD] = false
    eventPlayer.player_state[PS_BRIGITTE_COUNTER_TARGET] = null


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
    @Condition eventPlayer.player_state[PS_ILLARI_SOLAR_HUD_CREATED] == false

    eventPlayer.player_state[PS_ILLARI_SOLAR_HUD_CREATED] = true
    hudHeader(eventPlayer, "太阳之力：{}/3".format(eventPlayer.player_state[PS_ILLARI_SOLAR_POWER]), HudPosition.RIGHT, -810, Color.YELLOW, HudReeval.VISIBILITY_AND_STRING)
    eventPlayer.player_state[PS_ILLARI_SOLAR_HUD_ID] = getLastCreatedText()


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
    @Condition eventPlayer.player_state[PS_ILLARI_MELEE_GAIN_CD] == false

    eventPlayer.player_state[PS_ILLARI_MELEE_GAIN_CD] = true
    eventPlayer.player_state[PS_ILLARI_LAST_MELEE_TARGET] = victim
    if eventPlayer.player_state[PS_ILLARI_SOLAR_POWER] < 3:
        eventPlayer.player_state[PS_ILLARI_SOLAR_POWER] += 1
    if eventPlayer.player_state[PS_ILLARI_SOLAR_POWER] >= 3:
        eventPlayer.player_state[PS_ILLARI_SOLAR_POWER] = 3
        bigMessage(eventPlayer, "太阳之力已满，按右键召唤小太阳")
        playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.YELLOW, eventPlayer, 2.5)
    else:
        smallMessage(eventPlayer, "太阳之力：{}/3".format(eventPlayer.player_state[PS_ILLARI_SOLAR_POWER]))
        playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.ORANGE, eventPlayer, 1.5)
    wait(0.35)
    eventPlayer.player_state[PS_ILLARI_MELEE_GAIN_CD] = false


rule "[illari] summon mini sun":
    @Event eachPlayer
    @Hero illari
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isHoldingButton(Button.SECONDARY_FIRE) == true
    @Condition eventPlayer.player_state[PS_ILLARI_SOLAR_POWER] >= 3
    @Condition eventPlayer.player_state[PS_ILLARI_SUN_ACTIVE] == false
    @Condition eventPlayer.player_state[PS_ILLARI_SUN_CASTING] == false

    eventPlayer.player_state[PS_ILLARI_SUN_CASTING] = true
    eventPlayer.player_state[PS_ILLARI_SUN_POS] = eventPlayer.getPosition() + Vector.UP * 4.5
    createEffect(getAllPlayers(), Effect.GOOD_AURA, Color.ORANGE, eventPlayer, 4, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_state[PS_ILLARI_SUN_FX].append(getLastCreatedEntity())
    createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Color.YELLOW, eventPlayer, 4, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_state[PS_ILLARI_SUN_FX].append(getLastCreatedEntity())
    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.YELLOW, eventPlayer, 3)
    smallMessage(eventPlayer, "召唤太阳蓄力")
    wait(0.7)
    if eventPlayer.isAlive() == true and eventPlayer.getHero() == Hero.ILLARI:
        eventPlayer.player_state[PS_ILLARI_SOLAR_POWER] = 0
        eventPlayer.player_state[PS_ILLARI_SUN_ACTIVE] = true
        eventPlayer.player_state[PS_ILLARI_SUN_TICK] = 0
        playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.ORANGE, eventPlayer.player_state[PS_ILLARI_SUN_POS], 4)
        createEffect(getAllPlayers(), Effect.GOOD_AURA, Color.ORANGE, eventPlayer.player_state[PS_ILLARI_SUN_POS], 2.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
        eventPlayer.player_state[PS_ILLARI_SUN_FX].append(getLastCreatedEntity())
        createEffect(getAllPlayers(), Effect.BAD_AURA, Color.ORANGE, eventPlayer.player_state[PS_ILLARI_SUN_POS], 4.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
        eventPlayer.player_state[PS_ILLARI_SUN_FX].append(getLastCreatedEntity())
        createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Color.YELLOW, eventPlayer.player_state[PS_ILLARI_SUN_POS], 3.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
        eventPlayer.player_state[PS_ILLARI_SUN_FX].append(getLastCreatedEntity())
        if eventPlayer.player_state[PS_ILLARI_LAST_MELEE_TARGET] != null and eventPlayer.player_state[PS_ILLARI_LAST_MELEE_TARGET].isAlive() == true and (getCurrentGamemode() == Gamemode.FFA or eventPlayer.player_state[PS_ILLARI_LAST_MELEE_TARGET].getTeam() != eventPlayer.getTeam()) and distance(eventPlayer.player_state[PS_ILLARI_LAST_MELEE_TARGET], eventPlayer) <= 35:
            eventPlayer.player_state[PS_ILLARI_SUN_TARGET] = eventPlayer.player_state[PS_ILLARI_LAST_MELEE_TARGET]
        elif len(getLivingPlayers(Team.ALL).filter(lambda player: player != eventPlayer and player.isAlive() == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam()) and distance(player, eventPlayer) <= 35)) > 0:
            eventPlayer.player_state[PS_ILLARI_SUN_TARGET] = sorted(getLivingPlayers(Team.ALL).filter(lambda player: player != eventPlayer and player.isAlive() == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam()) and distance(player, eventPlayer) <= 35), key=lambda player: distance(player, eventPlayer))[0]
        if eventPlayer.player_state[PS_ILLARI_SUN_TARGET] != null:
            eventPlayer.player_state[PS_ILLARI_SUN_TARGET_HERO] = eventPlayer.player_state[PS_ILLARI_SUN_TARGET].getHero()
            eventPlayer.player_state[PS_ILLARI_SUN_TARGET].player_state[PS_ILLARI_MARKED_BY_SUN] = eventPlayer
            smallMessage(eventPlayer.player_state[PS_ILLARI_SUN_TARGET], "你被太阳点名了，快找掩体！")
            smallMessage(eventPlayer, "小太阳已锁定目标")
            createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Color.YELLOW, eventPlayer.player_state[PS_ILLARI_SUN_TARGET], 2, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
            eventPlayer.player_state[PS_ILLARI_SUN_MARK_FX].append(getLastCreatedEntity())
            createEffect(getAllPlayers(), Effect.GOOD_AURA, Color.ORANGE, eventPlayer.player_state[PS_ILLARI_SUN_TARGET], 1.6, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
            eventPlayer.player_state[PS_ILLARI_SUN_MARK_FX].append(getLastCreatedEntity())
            createBeam(getAllPlayers(), Beam.GOOD, eventPlayer.player_state[PS_ILLARI_SUN_POS], eventPlayer.player_state[PS_ILLARI_SUN_TARGET], Color.YELLOW, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
            eventPlayer.player_state[PS_ILLARI_SUN_MARK_FX].append(getLastCreatedEntity())
        else:
            smallMessage(eventPlayer, "小太阳未找到目标")
        while eventPlayer.player_state[PS_ILLARI_SUN_ACTIVE] == true and eventPlayer.isAlive() == true and eventPlayer.getHero() == Hero.ILLARI and eventPlayer.player_state[PS_ILLARI_SUN_TICK] < 10:
            if eventPlayer.player_state[PS_ILLARI_SUN_TARGET] != null and eventPlayer.player_state[PS_ILLARI_SUN_TARGET].isAlive() == true and eventPlayer.player_state[PS_ILLARI_SUN_TARGET].getHero() == eventPlayer.player_state[PS_ILLARI_SUN_TARGET_HERO] and distance(eventPlayer.player_state[PS_ILLARI_SUN_TARGET], eventPlayer.player_state[PS_ILLARI_SUN_POS]) <= 35 and isInLoS(eventPlayer.player_state[PS_ILLARI_SUN_POS], eventPlayer.player_state[PS_ILLARI_SUN_TARGET], BarrierLos.PASS_THROUGH_BARRIERS) == true:
                damage(eventPlayer.player_state[PS_ILLARI_SUN_TARGET], eventPlayer, 6)
                playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.ORANGE, eventPlayer.player_state[PS_ILLARI_SUN_TARGET], 0.8)
            eventPlayer.player_state[PS_ILLARI_SUN_TICK] += 1
            wait(0.5)
    if eventPlayer.player_state[PS_ILLARI_SUN_TARGET] != null and eventPlayer.player_state[PS_ILLARI_SUN_TARGET].player_state[PS_ILLARI_MARKED_BY_SUN] == eventPlayer:
        eventPlayer.player_state[PS_ILLARI_SUN_TARGET].player_state[PS_ILLARI_MARKED_BY_SUN] = null
    if len(eventPlayer.player_state[PS_ILLARI_SUN_FX]) > 0:
        destroyEffect(eventPlayer.player_state[PS_ILLARI_SUN_FX][0])
    if len(eventPlayer.player_state[PS_ILLARI_SUN_FX]) > 1:
        destroyEffect(eventPlayer.player_state[PS_ILLARI_SUN_FX][1])
    if len(eventPlayer.player_state[PS_ILLARI_SUN_FX]) > 2:
        destroyEffect(eventPlayer.player_state[PS_ILLARI_SUN_FX][2])
    if len(eventPlayer.player_state[PS_ILLARI_SUN_FX]) > 3:
        destroyEffect(eventPlayer.player_state[PS_ILLARI_SUN_FX][3])
    if len(eventPlayer.player_state[PS_ILLARI_SUN_FX]) > 4:
        destroyEffect(eventPlayer.player_state[PS_ILLARI_SUN_FX][4])
    if len(eventPlayer.player_state[PS_ILLARI_SUN_MARK_FX]) > 0:
        destroyEffect(eventPlayer.player_state[PS_ILLARI_SUN_MARK_FX][0])
    if len(eventPlayer.player_state[PS_ILLARI_SUN_MARK_FX]) > 1:
        destroyEffect(eventPlayer.player_state[PS_ILLARI_SUN_MARK_FX][1])
    if len(eventPlayer.player_state[PS_ILLARI_SUN_MARK_FX]) > 2:
        destroyEffect(eventPlayer.player_state[PS_ILLARI_SUN_MARK_FX][2])
    eventPlayer.player_state[PS_ILLARI_SUN_ACTIVE] = false
    eventPlayer.player_state[PS_ILLARI_SUN_POS] = null
    eventPlayer.player_state[PS_ILLARI_SUN_FX] = []
    eventPlayer.player_state[PS_ILLARI_SUN_TARGET] = null
    eventPlayer.player_state[PS_ILLARI_SUN_MARK_FX] = []
    eventPlayer.player_state[PS_ILLARI_SUN_TICK] = 0
    eventPlayer.player_state[PS_ILLARI_SUN_CASTING] = false
    eventPlayer.player_state[PS_ILLARI_SUN_TARGET_HERO] = null


rule "[illari] clear solar mark target":
    @Event eachPlayer
    @Condition eventPlayer.player_state[PS_ILLARI_MARKED_BY_SUN] != null
    @Condition eventPlayer.isDead() == true or eventPlayer.getHero() != eventPlayer.player_state[PS_ILLARI_MARKED_BY_SUN].player_state[PS_ILLARI_SUN_TARGET_HERO] or eventPlayer.player_state[PS_ILLARI_MARKED_BY_SUN].isAlive() == false or eventPlayer.player_state[PS_ILLARI_MARKED_BY_SUN].getHero() != Hero.ILLARI or eventPlayer.player_state[PS_ILLARI_MARKED_BY_SUN].player_state[PS_ILLARI_SUN_ACTIVE] == false

    eventPlayer.player_state[PS_ILLARI_MARKED_BY_SUN] = null


rule "[illari] clear mini sun on death or hero swap":
    @Event eachPlayer
    @Condition eventPlayer.getHero() != Hero.ILLARI or eventPlayer.isDead() == true
    @Condition eventPlayer.player_state[PS_ILLARI_SOLAR_POWER] > 0 or eventPlayer.player_state[PS_ILLARI_SOLAR_HUD_CREATED] == true or eventPlayer.player_state[PS_ILLARI_SUN_ACTIVE] == true or eventPlayer.player_state[PS_ILLARI_SUN_CASTING] == true or len(eventPlayer.player_state[PS_ILLARI_SUN_FX]) > 0 or len(eventPlayer.player_state[PS_ILLARI_SUN_MARK_FX]) > 0 or eventPlayer.player_state[PS_ILLARI_LAST_MELEE_TARGET] != null

    if eventPlayer.player_state[PS_ILLARI_SOLAR_HUD_CREATED] == true:
        destroyHudText(eventPlayer.player_state[PS_ILLARI_SOLAR_HUD_ID])
    if eventPlayer.player_state[PS_ILLARI_SUN_TARGET] != null and eventPlayer.player_state[PS_ILLARI_SUN_TARGET].player_state[PS_ILLARI_MARKED_BY_SUN] == eventPlayer:
        eventPlayer.player_state[PS_ILLARI_SUN_TARGET].player_state[PS_ILLARI_MARKED_BY_SUN] = null
    if len(eventPlayer.player_state[PS_ILLARI_SUN_FX]) > 0:
        destroyEffect(eventPlayer.player_state[PS_ILLARI_SUN_FX][0])
    if len(eventPlayer.player_state[PS_ILLARI_SUN_FX]) > 1:
        destroyEffect(eventPlayer.player_state[PS_ILLARI_SUN_FX][1])
    if len(eventPlayer.player_state[PS_ILLARI_SUN_FX]) > 2:
        destroyEffect(eventPlayer.player_state[PS_ILLARI_SUN_FX][2])
    if len(eventPlayer.player_state[PS_ILLARI_SUN_FX]) > 3:
        destroyEffect(eventPlayer.player_state[PS_ILLARI_SUN_FX][3])
    if len(eventPlayer.player_state[PS_ILLARI_SUN_FX]) > 4:
        destroyEffect(eventPlayer.player_state[PS_ILLARI_SUN_FX][4])
    if len(eventPlayer.player_state[PS_ILLARI_SUN_MARK_FX]) > 0:
        destroyEffect(eventPlayer.player_state[PS_ILLARI_SUN_MARK_FX][0])
    if len(eventPlayer.player_state[PS_ILLARI_SUN_MARK_FX]) > 1:
        destroyEffect(eventPlayer.player_state[PS_ILLARI_SUN_MARK_FX][1])
    if len(eventPlayer.player_state[PS_ILLARI_SUN_MARK_FX]) > 2:
        destroyEffect(eventPlayer.player_state[PS_ILLARI_SUN_MARK_FX][2])
    eventPlayer.player_state[PS_ILLARI_SOLAR_POWER] = 0
    eventPlayer.player_state[PS_ILLARI_SOLAR_HUD_CREATED] = false
    eventPlayer.player_state[PS_ILLARI_SOLAR_HUD_ID] = null
    eventPlayer.player_state[PS_ILLARI_LAST_MELEE_TARGET] = null
    eventPlayer.player_state[PS_ILLARI_SUN_ACTIVE] = false
    eventPlayer.player_state[PS_ILLARI_SUN_POS] = null
    eventPlayer.player_state[PS_ILLARI_SUN_FX] = []
    eventPlayer.player_state[PS_ILLARI_SUN_TARGET] = null
    eventPlayer.player_state[PS_ILLARI_SUN_MARK_FX] = []
    eventPlayer.player_state[PS_ILLARI_SUN_TICK] = 0
    eventPlayer.player_state[PS_ILLARI_SUN_CASTING] = false
    eventPlayer.player_state[PS_ILLARI_SUN_TARGET_HERO] = null
    eventPlayer.player_state[PS_ILLARI_MELEE_GAIN_CD] = false


rule "[lifeweaver] create garden bowling ball":
    @Event eachPlayer
    @Hero lifeweaver
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isDummy() == false
    @Condition eventPlayer.player_state[PS_LIFEWEAVER_BALL_CREATED] == false

    eventPlayer.player_state[PS_LIFEWEAVER_BALL_CREATED] = true
    eventPlayer.player_state[PS_LIFEWEAVER_BALL_POS] = eventPlayer.getPosition() + eventPlayer.getFacingDirection() * 1.8 + Vector.UP * 0.6
    eventPlayer.player_state[PS_LIFEWEAVER_BALL_DIR] = eventPlayer.getFacingDirection()
    eventPlayer.player_state[PS_LIFEWEAVER_BALL_FX] = []
    eventPlayer.player_state[PS_LIFEWEAVER_BALL_SPIN_TICK] = 0
    eventPlayer.player_state[PS_LIFEWEAVER_BALL_DUMMY] = null
    createProjectileEffect(getAllPlayers(), Projectile.ROADHOG_SCRAP_BALL, null, eventPlayer.player_state[PS_LIFEWEAVER_BALL_POS], eventPlayer.player_state[PS_LIFEWEAVER_BALL_DIR], 0, ProjectileEffectReeval.VISIBILITY_POSITION_DIRECTION_AND_SIZE)
    eventPlayer.player_state[PS_LIFEWEAVER_BALL_FX].append(getLastCreatedEntity())
    createEffect(getAllPlayers(), Effect.GOOD_AURA, Color.GREEN, eventPlayer.player_state[PS_LIFEWEAVER_BALL_POS], 1.6, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_state[PS_LIFEWEAVER_BALL_FX].append(getLastCreatedEntity())
    createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Color.YELLOW, eventPlayer.player_state[PS_LIFEWEAVER_BALL_POS], 0.35, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_state[PS_LIFEWEAVER_BALL_FX].append(getLastCreatedEntity())
    smallMessage(eventPlayer, "园艺球已就位")


rule "[lifeweaver] garden ball follows owner":
    @Event eachPlayer
    @Hero lifeweaver
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isDummy() == false
    @Condition eventPlayer.player_state[PS_LIFEWEAVER_BALL_CREATED] == true
    @Condition eventPlayer.player_state[PS_LIFEWEAVER_BALL_STATE] == 0

    eventPlayer.player_state[PS_LIFEWEAVER_BALL_POS] = eventPlayer.getPosition() + eventPlayer.getFacingDirection() * 1.8 + Vector.UP * 0.6
    eventPlayer.player_state[PS_LIFEWEAVER_BALL_DIR] = eventPlayer.getFacingDirection()
    wait(0.1)
    if ruleCondition:
        loop()


rule "[lifeweaver] refresh garden ball visual":
    @Event eachPlayer
    @Hero lifeweaver
    @Condition eventPlayer.isDummy() == false
    @Condition eventPlayer.player_state[PS_LIFEWEAVER_BALL_CREATED] == true
    @Condition len(eventPlayer.player_state[PS_LIFEWEAVER_BALL_FX]) > 0

    eventPlayer.player_state[PS_LIFEWEAVER_BALL_SPIN_TICK] = (eventPlayer.player_state[PS_LIFEWEAVER_BALL_SPIN_TICK] + 1) % 4
    destroyEffect(eventPlayer.player_state[PS_LIFEWEAVER_BALL_FX][0])
    if eventPlayer.player_state[PS_LIFEWEAVER_BALL_STATE] == 1:
        if eventPlayer.player_state[PS_LIFEWEAVER_BALL_SPIN_TICK] == 0:
            createProjectileEffect(getAllPlayers(), Projectile.ROADHOG_SCRAP_BALL, null, eventPlayer.player_state[PS_LIFEWEAVER_BALL_POS], eventPlayer.player_state[PS_LIFEWEAVER_BALL_DIR] + Vector.UP, 0.65, ProjectileEffectReeval.VISIBILITY_POSITION_DIRECTION_AND_SIZE)
        elif eventPlayer.player_state[PS_LIFEWEAVER_BALL_SPIN_TICK] == 1:
            createProjectileEffect(getAllPlayers(), Projectile.ROADHOG_SCRAP_BALL, null, eventPlayer.player_state[PS_LIFEWEAVER_BALL_POS], eventPlayer.player_state[PS_LIFEWEAVER_BALL_DIR] + vect(1, 0, 0), 0.65, ProjectileEffectReeval.VISIBILITY_POSITION_DIRECTION_AND_SIZE)
        elif eventPlayer.player_state[PS_LIFEWEAVER_BALL_SPIN_TICK] == 2:
            createProjectileEffect(getAllPlayers(), Projectile.ROADHOG_SCRAP_BALL, null, eventPlayer.player_state[PS_LIFEWEAVER_BALL_POS], eventPlayer.player_state[PS_LIFEWEAVER_BALL_DIR] + Vector.DOWN, 0.65, ProjectileEffectReeval.VISIBILITY_POSITION_DIRECTION_AND_SIZE)
        else:
            createProjectileEffect(getAllPlayers(), Projectile.ROADHOG_SCRAP_BALL, null, eventPlayer.player_state[PS_LIFEWEAVER_BALL_POS], eventPlayer.player_state[PS_LIFEWEAVER_BALL_DIR] + vect(-1, 0, 0), 0.65, ProjectileEffectReeval.VISIBILITY_POSITION_DIRECTION_AND_SIZE)
    elif eventPlayer.player_state[PS_LIFEWEAVER_BALL_STATE] == 3:
        createProjectileEffect(getAllPlayers(), Projectile.ROADHOG_SCRAP_BALL, null, eventPlayer.player_state[PS_LIFEWEAVER_BALL_POS], eventPlayer.player_state[PS_LIFEWEAVER_BALL_DIR], 0.65, ProjectileEffectReeval.VISIBILITY_POSITION_DIRECTION_AND_SIZE)
    else:
        createProjectileEffect(getAllPlayers(), Projectile.ROADHOG_SCRAP_BALL, null, eventPlayer.player_state[PS_LIFEWEAVER_BALL_POS], eventPlayer.player_state[PS_LIFEWEAVER_BALL_DIR], 0, ProjectileEffectReeval.VISIBILITY_POSITION_DIRECTION_AND_SIZE)
    eventPlayer.player_state[PS_LIFEWEAVER_BALL_FX][0] = getLastCreatedEntity()
    wait(0.08)
    if ruleCondition:
        loop()


rule "[lifeweaver] recover lost garden ball":
    @Event eachPlayer
    @Hero lifeweaver
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isDummy() == false
    @Condition eventPlayer.player_state[PS_LIFEWEAVER_BALL_CREATED] == true
    @Condition distance(eventPlayer.player_state[PS_LIFEWEAVER_BALL_POS], eventPlayer) > 28

    eventPlayer.player_state[PS_LIFEWEAVER_BALL_STATE] = 0
    eventPlayer.player_state[PS_LIFEWEAVER_BALL_POS] = eventPlayer.getPosition() + eventPlayer.getFacingDirection() * 1.8 + Vector.UP * 0.6
    eventPlayer.player_state[PS_LIFEWEAVER_BALL_DIR] = eventPlayer.getFacingDirection()
    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.GREEN, eventPlayer.player_state[PS_LIFEWEAVER_BALL_POS], 2)
    smallMessage(eventPlayer, "园艺球回收")


rule "[lifeweaver] melee launches garden ball":
    @Event eachPlayer
    @Hero lifeweaver
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isDummy() == false
    @Condition eventPlayer.isMeleeing() == true
    @Condition eventPlayer.player_state[PS_LIFEWEAVER_BALL_CREATED] == true
    @Condition eventPlayer.player_state[PS_LIFEWEAVER_HIT_LOCK] == false
    @Condition distance(eventPlayer, eventPlayer.player_state[PS_LIFEWEAVER_BALL_POS]) <= 5.5

    eventPlayer.player_state[PS_LIFEWEAVER_HIT_LOCK] = true
    eventPlayer.player_state[PS_LIFEWEAVER_BALL_STATE] = 1
    eventPlayer.player_state[PS_LIFEWEAVER_BALL_DIR] = eventPlayer.getFacingDirection()
    eventPlayer.player_state[PS_LIFEWEAVER_BALL_TICK] = 0
    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.GREEN, eventPlayer.player_state[PS_LIFEWEAVER_BALL_POS], 2)
    smallMessage(eventPlayer, "园艺保龄球！")
    while eventPlayer.player_state[PS_LIFEWEAVER_BALL_STATE] == 1 and eventPlayer.isAlive() == true and eventPlayer.getHero() == Hero.LIFEWEAVER and eventPlayer.player_state[PS_LIFEWEAVER_BALL_TICK] < 18:
        eventPlayer.player_state[PS_LIFEWEAVER_BALL_POS] = nearestWalkablePosition(eventPlayer.player_state[PS_LIFEWEAVER_BALL_POS] + eventPlayer.player_state[PS_LIFEWEAVER_BALL_DIR] * 2.2)
        if len(getPlayersInRadius(eventPlayer.player_state[PS_LIFEWEAVER_BALL_POS], 2.4, Team.ALL, LosCheck.OFF).filter(lambda player: player != eventPlayer and player.isAlive() == true and player.player_state[PS_LIFEWEAVER_BALL_HIT_CD] == false and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam()))) > 0:
            damage(getPlayersInRadius(eventPlayer.player_state[PS_LIFEWEAVER_BALL_POS], 2.4, Team.ALL, LosCheck.OFF).filter(lambda player: player != eventPlayer and player.isAlive() == true and player.player_state[PS_LIFEWEAVER_BALL_HIT_CD] == false and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())), eventPlayer, 24)
            getPlayersInRadius(eventPlayer.player_state[PS_LIFEWEAVER_BALL_POS], 2.4, Team.ALL, LosCheck.OFF).filter(lambda player: player != eventPlayer and player.isAlive() == true and player.player_state[PS_LIFEWEAVER_BALL_HIT_CD] == false and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).setStatusEffect(eventPlayer, Status.KNOCKED_DOWN, 0.55)
            getPlayersInRadius(eventPlayer.player_state[PS_LIFEWEAVER_BALL_POS], 2.4, Team.ALL, LosCheck.OFF).filter(lambda player: player != eventPlayer and player.isAlive() == true and player.player_state[PS_LIFEWEAVER_BALL_HIT_CD] == false and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).player_state[PS_LIFEWEAVER_BALL_HIT_CD] = true
            smallMessage(getPlayersInRadius(eventPlayer.player_state[PS_LIFEWEAVER_BALL_POS], 2.4, Team.ALL, LosCheck.OFF).filter(lambda player: player != eventPlayer and player.isAlive() == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())), "园艺保龄球命中")
            playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, Color.GREEN, eventPlayer.player_state[PS_LIFEWEAVER_BALL_POS], 2)
        eventPlayer.player_state[PS_LIFEWEAVER_BALL_TICK] += 1
        wait(0.1)
    eventPlayer.player_state[PS_LIFEWEAVER_BALL_STATE] = 0
    eventPlayer.player_state[PS_LIFEWEAVER_BALL_TICK] = 0
    wait(0.35)
    eventPlayer.player_state[PS_LIFEWEAVER_HIT_LOCK] = false


rule "[lifeweaver] clear garden ball hit cooldown":
    @Event eachPlayer
    @Condition eventPlayer.player_state[PS_LIFEWEAVER_BALL_HIT_CD] == true

    wait(1.1)
    eventPlayer.player_state[PS_LIFEWEAVER_BALL_HIT_CD] = false


rule "[lifeweaver] pull garden ball back":
    @Event eachPlayer
    @Hero lifeweaver
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isDummy() == false
    @Condition eventPlayer.isUsingAbility2() == true
    @Condition eventPlayer.player_state[PS_LIFEWEAVER_BALL_CREATED] == true
    @Condition eventPlayer.player_state[PS_LIFEWEAVER_PULL_LOCK] == false

    eventPlayer.player_state[PS_LIFEWEAVER_PULL_LOCK] = true
    eventPlayer.player_state[PS_LIFEWEAVER_BALL_STATE] = 2
    smallMessage(eventPlayer, "拉回园艺球")
    createBeam(getAllPlayers(), Beam.GOOD, eventPlayer, eventPlayer.player_state[PS_LIFEWEAVER_BALL_POS], Color.GREEN, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_state[PS_LIFEWEAVER_PULL_BEAM] = getLastCreatedEntity()
    while eventPlayer.player_state[PS_LIFEWEAVER_BALL_STATE] == 2 and eventPlayer.isAlive() == true and eventPlayer.getHero() == Hero.LIFEWEAVER and distance(eventPlayer.player_state[PS_LIFEWEAVER_BALL_POS], eventPlayer) > 2.4:
        eventPlayer.player_state[PS_LIFEWEAVER_BALL_DIR] = directionTowards(eventPlayer.player_state[PS_LIFEWEAVER_BALL_POS], eventPlayer.getPosition() + Vector.UP * 0.6)
        eventPlayer.player_state[PS_LIFEWEAVER_BALL_POS] = eventPlayer.player_state[PS_LIFEWEAVER_BALL_POS] + eventPlayer.player_state[PS_LIFEWEAVER_BALL_DIR] * 1.5
        getPlayersInRadius(eventPlayer.player_state[PS_LIFEWEAVER_BALL_POS], 2.4, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).applyImpulse(directionTowards(getPlayersInRadius(eventPlayer.player_state[PS_LIFEWEAVER_BALL_POS], 2.4, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).getPosition(), eventPlayer.player_state[PS_LIFEWEAVER_BALL_POS]), 2, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
        wait(0.1)
    eventPlayer.player_state[PS_LIFEWEAVER_BALL_POS] = eventPlayer.getPosition() + eventPlayer.getFacingDirection() * 1.8 + Vector.UP * 0.6
    eventPlayer.player_state[PS_LIFEWEAVER_BALL_DIR] = eventPlayer.getFacingDirection()
    eventPlayer.player_state[PS_LIFEWEAVER_BALL_STATE] = 0
    if eventPlayer.player_state[PS_LIFEWEAVER_PULL_BEAM] != null:
        destroyEffect(eventPlayer.player_state[PS_LIFEWEAVER_PULL_BEAM])
    eventPlayer.player_state[PS_LIFEWEAVER_PULL_BEAM] = null
    wait(0.6)
    wait(2.4)
    eventPlayer.player_state[PS_LIFEWEAVER_PULL_LOCK] = false


rule "[lifeweaver] garden pot ultimate":
    @Event eachPlayer
    @Hero lifeweaver
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isDummy() == false
    @Condition eventPlayer.getUltCharge() == 100
    @Condition eventPlayer.isHoldingButton(Button.ULTIMATE) == true
    @Condition eventPlayer.player_state[PS_LIFEWEAVER_ULT_LOCK] == false
    @Condition eventPlayer.player_state[PS_LIFEWEAVER_BALL_CREATED] == true

    eventPlayer.player_state[PS_LIFEWEAVER_ULT_LOCK] = true
    eventPlayer.player_state[PS_LIFEWEAVER_BALL_STATE] = 3
    eventPlayer.player_state[PS_LIFEWEAVER_ULT_POS] = nearestWalkablePosition(raycast(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * 40, getAllPlayers(), getAllPlayers(), false).getHitPosition())
    eventPlayer.setUltCharge(0)
    createEffect(getAllPlayers(), Effect.GOOD_AURA, Color.GREEN, eventPlayer.player_state[PS_LIFEWEAVER_ULT_POS], 4, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_state[PS_LIFEWEAVER_ULT_FX].append(getLastCreatedEntity())
    createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Color.YELLOW, eventPlayer.player_state[PS_LIFEWEAVER_ULT_POS], 4, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_state[PS_LIFEWEAVER_ULT_FX].append(getLastCreatedEntity())
    smallMessage(eventPlayer, "天降花盆预警")
    wait(1)
    eventPlayer.player_state[PS_LIFEWEAVER_BALL_POS] = eventPlayer.player_state[PS_LIFEWEAVER_ULT_POS] + Vector.UP * 9
    eventPlayer.player_state[PS_LIFEWEAVER_BALL_DIR] = Vector.DOWN
    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.GREEN, eventPlayer.player_state[PS_LIFEWEAVER_ULT_POS], 4)
    wait(0.25)
    eventPlayer.player_state[PS_LIFEWEAVER_BALL_POS] = eventPlayer.player_state[PS_LIFEWEAVER_ULT_POS]
    playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, Color.GREEN, eventPlayer.player_state[PS_LIFEWEAVER_ULT_POS], 4)
    damage(getPlayersInRadius(eventPlayer.player_state[PS_LIFEWEAVER_ULT_POS], 4, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())), eventPlayer, 55)
    getPlayersInRadius(eventPlayer.player_state[PS_LIFEWEAVER_ULT_POS], 4, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).setStatusEffect(eventPlayer, Status.KNOCKED_DOWN, 0.75)
    if len(eventPlayer.player_state[PS_LIFEWEAVER_ULT_FX]) > 0:
        destroyEffect(eventPlayer.player_state[PS_LIFEWEAVER_ULT_FX][0])
    if len(eventPlayer.player_state[PS_LIFEWEAVER_ULT_FX]) > 1:
        destroyEffect(eventPlayer.player_state[PS_LIFEWEAVER_ULT_FX][1])
    eventPlayer.player_state[PS_LIFEWEAVER_ULT_FX] = []
    eventPlayer.player_state[PS_LIFEWEAVER_ULT_POS] = null
    eventPlayer.player_state[PS_LIFEWEAVER_BALL_STATE] = 0
    wait(2)
    eventPlayer.player_state[PS_LIFEWEAVER_ULT_LOCK] = false


rule "[lifeweaver] clear garden bowling ball after hero swap":
    @Event eachPlayer
    @Condition eventPlayer.getHero() != Hero.LIFEWEAVER
    @Condition eventPlayer.player_state[PS_LIFEWEAVER_BALL_CREATED] == true or len(eventPlayer.player_state[PS_LIFEWEAVER_BALL_FX]) > 0 or len(eventPlayer.player_state[PS_LIFEWEAVER_ULT_FX]) > 0 or eventPlayer.player_state[PS_LIFEWEAVER_BALL_DUMMY] != null

    if len(eventPlayer.player_state[PS_LIFEWEAVER_BALL_FX]) > 0:
        destroyEffect(eventPlayer.player_state[PS_LIFEWEAVER_BALL_FX][0])
    if len(eventPlayer.player_state[PS_LIFEWEAVER_BALL_FX]) > 1:
        destroyEffect(eventPlayer.player_state[PS_LIFEWEAVER_BALL_FX][1])
    if len(eventPlayer.player_state[PS_LIFEWEAVER_BALL_FX]) > 2:
        destroyEffect(eventPlayer.player_state[PS_LIFEWEAVER_BALL_FX][2])
    if len(eventPlayer.player_state[PS_LIFEWEAVER_BALL_FX]) > 3:
        destroyEffect(eventPlayer.player_state[PS_LIFEWEAVER_BALL_FX][3])
    if len(eventPlayer.player_state[PS_LIFEWEAVER_ULT_FX]) > 0:
        destroyEffect(eventPlayer.player_state[PS_LIFEWEAVER_ULT_FX][0])
    if len(eventPlayer.player_state[PS_LIFEWEAVER_ULT_FX]) > 1:
        destroyEffect(eventPlayer.player_state[PS_LIFEWEAVER_ULT_FX][1])
    if eventPlayer.player_state[PS_LIFEWEAVER_PULL_BEAM] != null:
        destroyEffect(eventPlayer.player_state[PS_LIFEWEAVER_PULL_BEAM])
    if eventPlayer.player_state[PS_LIFEWEAVER_BALL_DUMMY] != null:
        destroyDummy(eventPlayer.player_state[PS_LIFEWEAVER_BALL_DUMMY].getTeam(), eventPlayer.player_state[PS_LIFEWEAVER_BALL_DUMMY].getSlot())
    eventPlayer.player_state[PS_LIFEWEAVER_BALL_CREATED] = false
    eventPlayer.player_state[PS_LIFEWEAVER_BALL_POS] = null
    eventPlayer.player_state[PS_LIFEWEAVER_BALL_FX] = []
    eventPlayer.player_state[PS_LIFEWEAVER_BALL_STATE] = 0
    eventPlayer.player_state[PS_LIFEWEAVER_BALL_DIR] = null
    eventPlayer.player_state[PS_LIFEWEAVER_BALL_TICK] = 0
    eventPlayer.player_state[PS_LIFEWEAVER_HIT_LOCK] = false
    eventPlayer.player_state[PS_LIFEWEAVER_PULL_LOCK] = false
    eventPlayer.player_state[PS_LIFEWEAVER_ULT_LOCK] = false
    eventPlayer.player_state[PS_LIFEWEAVER_ULT_POS] = null
    eventPlayer.player_state[PS_LIFEWEAVER_ULT_FX] = []
    eventPlayer.player_state[PS_LIFEWEAVER_PULL_BEAM] = null
    eventPlayer.player_state[PS_LIFEWEAVER_BALL_DUMMY] = null
    eventPlayer.player_state[PS_LIFEWEAVER_BALL_SPIN_TICK] = null


rule "[reinhardt] create glory hud":
    @Event eachPlayer
    @Hero reinhardt
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.player_state[PS_REINHARDT_HUD_CREATED] == false

    eventPlayer.player_state[PS_REINHARDT_HUD_CREATED] = true
    hudHeader(eventPlayer, "荣耀：{}/100".format(eventPlayer.player_state[PS_REINHARDT_GLORY]), HudPosition.RIGHT, -830, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING)
    eventPlayer.player_state[PS_REINHARDT_HUD_ID] = getLastCreatedText()


rule "[reinhardt] update glory tier buffs":
    @Event eachPlayer
    @Hero reinhardt
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.player_state[117] != (3 if eventPlayer.player_state[PS_REINHARDT_GLORY] >= 75 else 2 if eventPlayer.player_state[PS_REINHARDT_GLORY] >= 50 else 1 if eventPlayer.player_state[PS_REINHARDT_GLORY] >= 25 else 0)

    eventPlayer.player_state[117] = 3 if eventPlayer.player_state[PS_REINHARDT_GLORY] >= 75 else 2 if eventPlayer.player_state[PS_REINHARDT_GLORY] >= 50 else 1 if eventPlayer.player_state[PS_REINHARDT_GLORY] >= 25 else 0
    if eventPlayer.player_state[PS_REINHARDT_FATIGUED] == true:
        eventPlayer.setMoveSpeed(75)
    elif eventPlayer.player_state[PS_REINHARDT_OATH_ACTIVE] == true:
        eventPlayer.setMoveSpeed(110)
    else:
        eventPlayer.setMoveSpeed(105 if eventPlayer.player_state[117] >= 1 else 100)
    eventPlayer.setDamageReceived(90 if eventPlayer.player_state[117] >= 2 else 100)
    eventPlayer.setDamageDealt(110 if eventPlayer.player_state[117] >= 3 else 100)
    if eventPlayer.player_state[PS_REINHARDT_GLORY] >= 100:
        smallMessage(eventPlayer, "天罚就绪")
    elif eventPlayer.player_state[117] == 3:
        smallMessage(eventPlayer, "荣耀阶段 III")
    elif eventPlayer.player_state[117] == 2:
        smallMessage(eventPlayer, "荣耀阶段 II")
    elif eventPlayer.player_state[117] == 1:
        smallMessage(eventPlayer, "荣耀阶段 I")


rule "[reinhardt] glory ready prompt":
    @Event eachPlayer
    @Hero reinhardt
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.player_state[PS_REINHARDT_GLORY] >= 100
    @Condition eventPlayer.player_state[PS_REINHARDT_GLORY_READY] == false

    eventPlayer.player_state[PS_REINHARDT_GLORY] = 100
    eventPlayer.player_state[PS_REINHARDT_GLORY_READY] = true
    bigMessage(eventPlayer, "天罚就绪")
    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.YELLOW, eventPlayer, 2.5)


rule "[reinhardt] shield declaration":
    @Event eachPlayer
    @Hero reinhardt
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isHoldingButton(Button.SECONDARY_FIRE) == true
    @Condition eventPlayer.player_state[PS_REINHARDT_DECLARE_ACTIVE] == false
    @Condition eventPlayer.player_state[PS_REINHARDT_DECLARE_CD] == false
    @Condition len(getLivingPlayers(Team.ALL).filter(lambda player: player != eventPlayer and player.isAlive() == true and distance(eventPlayer, player) <= 8 and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam()))) > 0

    eventPlayer.player_state[PS_REINHARDT_DECLARE_ACTIVE] = true
    eventPlayer.player_state[PS_REINHARDT_DECLARE_CD] = true
    eventPlayer.player_state[PS_REINHARDT_DECLARE_FX] = []
    createEffect(getAllPlayers(), Effect.GOOD_AURA, Color.YELLOW, eventPlayer, 3.2, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_state[PS_REINHARDT_DECLARE_FX].append(getLastCreatedEntity())
    createEffect(getAllPlayers(), Effect.BAD_AURA, Color.RED, eventPlayer, 2.4, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_state[PS_REINHARDT_DECLARE_FX].append(getLastCreatedEntity())
    smallMessage(getLivingPlayers(Team.ALL).filter(lambda player: player != eventPlayer and player.isAlive() == true and distance(eventPlayer, player) <= 12 and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())), "骑士宣战")
    eventPlayer.player_state[PS_LIFEWEAVER_BALL_TICK] = 0
    while eventPlayer.player_state[PS_REINHARDT_DECLARE_ACTIVE] == true and eventPlayer.isAlive() == true and eventPlayer.getHero() == Hero.REINHARDT and eventPlayer.player_state[PS_LIFEWEAVER_BALL_TICK] < 8:
        if eventPlayer.isHoldingButton(Button.SECONDARY_FIRE) == true and eventPlayer.player_state[PS_REINHARDT_GLORY] < 100 and len(getLivingPlayers(Team.ALL).filter(lambda player: player != eventPlayer and player.isAlive() == true and distance(eventPlayer, player) <= 8 and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam()))) > 0:
            eventPlayer.player_state[PS_REINHARDT_GLORY] += 6 if eventPlayer.player_state[PS_REINHARDT_OATH_ACTIVE] == true else 4
            if eventPlayer.player_state[PS_REINHARDT_GLORY] > 100:
                eventPlayer.player_state[PS_REINHARDT_GLORY] = 100
        eventPlayer.player_state[PS_LIFEWEAVER_BALL_TICK] += 1
        wait(0.5)
    if len(eventPlayer.player_state[PS_REINHARDT_DECLARE_FX]) > 0:
        destroyEffect(eventPlayer.player_state[PS_REINHARDT_DECLARE_FX][0])
    if len(eventPlayer.player_state[PS_REINHARDT_DECLARE_FX]) > 1:
        destroyEffect(eventPlayer.player_state[PS_REINHARDT_DECLARE_FX][1])
    eventPlayer.player_state[PS_REINHARDT_DECLARE_FX] = []
    eventPlayer.player_state[PS_REINHARDT_DECLARE_ACTIVE] = false
    wait(4)
    eventPlayer.player_state[PS_REINHARDT_DECLARE_CD] = false


rule "[reinhardt] gain glory when damaged":
    @Event playerTookDamage
    @Hero reinhardt
    @Condition eventPlayer.getHealth() - eventDamage > 0
    @Condition eventDamage > 0
    @Condition eventPlayer.player_state[PS_REINHARDT_GLORY] < 100
    @Condition eventPlayer.player_state[PS_REINHARDT_GAIN_CD] == false

    eventPlayer.player_state[PS_REINHARDT_GAIN_CD] = true
    if eventPlayer.player_state[PS_REINHARDT_DECLARE_ACTIVE] == true and attacker != null and attacker != eventPlayer:
        if eventPlayer.isInViewAngle(attacker.getPosition(), 120) == true:
            eventPlayer.player_state[PS_REINHARDT_GLORY] += 12 if eventPlayer.player_state[PS_REINHARDT_OATH_ACTIVE] == true else 8
            smallMessage(eventPlayer, "正面迎击：荣耀上升")
    else:
        eventPlayer.player_state[PS_REINHARDT_GLORY] += 6 if eventPlayer.player_state[PS_REINHARDT_OATH_ACTIVE] == true else 4
    if eventPlayer.player_state[PS_REINHARDT_GLORY] > 100:
        eventPlayer.player_state[PS_REINHARDT_GLORY] = 100
    wait(0.45)
    eventPlayer.player_state[PS_REINHARDT_GAIN_CD] = false


rule "[reinhardt] gain glory on hit":
    @Event playerDealtDamage
    @Hero reinhardt
    @Condition victim != eventPlayer
    @Condition eventDamage > 0
    @Condition eventPlayer.player_state[PS_REINHARDT_GLORY] < 100
    @Condition eventPlayer.player_state[PS_REINHARDT_HIT_GAIN_CD] == false
    @Condition eventAbility == Button.PRIMARY_FIRE or eventAbility == Button.MELEE

    eventPlayer.player_state[PS_REINHARDT_HIT_GAIN_CD] = true
    eventPlayer.player_state[PS_REINHARDT_GLORY] += 12
    if eventPlayer.player_state[PS_REINHARDT_GLORY] > 100:
        eventPlayer.player_state[PS_REINHARDT_GLORY] = 100
    wait(0.5)
    eventPlayer.player_state[PS_REINHARDT_HIT_GAIN_CD] = false


rule "[reinhardt] gain glory on final blow":
    @Event playerDealtFinalBlow
    @Hero reinhardt
    @Condition victim != eventPlayer
    @Condition eventPlayer.player_state[PS_REINHARDT_GLORY] < 100

    eventPlayer.player_state[PS_REINHARDT_GLORY] += 20
    if eventPlayer.player_state[PS_REINHARDT_GLORY] > 100:
        eventPlayer.player_state[PS_REINHARDT_GLORY] = 100
    smallMessage(eventPlayer, "荣耀 +20")
    if eventPlayer.player_state[PS_REINHARDT_GLORY] >= 100:
        eventPlayer.player_state[PS_REINHARDT_GLORY] = 100
        eventPlayer.player_state[PS_REINHARDT_GLORY_READY] = false


rule "[reinhardt] knight charge warning":
    @Event eachPlayer
    @Hero reinhardt
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isUsingAbility1() == true
    @Condition eventPlayer.player_state[PS_REINHARDT_CHARGE_LOCK] == false

    eventPlayer.player_state[PS_REINHARDT_CHARGE_LOCK] = true
    eventPlayer.player_state[PS_REINHARDT_CHARGE_FX] = []
    createBeam(getAllPlayers(), Beam.BAD, eventPlayer.getPosition() + Vector.UP * 0.25, eventPlayer.getPosition() + eventPlayer.getFacingDirection() * (15 if eventPlayer.player_state[PS_REINHARDT_OATH_ACTIVE] == true else 11) + Vector.UP * 0.25, Color.RED, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_state[PS_REINHARDT_CHARGE_FX].append(getLastCreatedEntity())
    createEffect(getAllPlayers(), Effect.BAD_AURA, Color.RED, eventPlayer.getPosition() + eventPlayer.getFacingDirection() * (7 if eventPlayer.player_state[PS_REINHARDT_OATH_ACTIVE] == true else 5), 2.8 if eventPlayer.player_state[PS_REINHARDT_OATH_ACTIVE] == true else 2.2, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_state[PS_REINHARDT_CHARGE_FX].append(getLastCreatedEntity())
    getLivingPlayers(Team.ALL).filter(lambda player: player != eventPlayer and player.isAlive() == true and distance(player, eventPlayer.getPosition() + eventPlayer.getFacingDirection() * 5.5) <= 4.5 and eventPlayer.isInViewAngle(player.getPosition(), 40) == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).setStatusEffect(eventPlayer, Status.ROOTED, 0.25)
    wait(0.4)
    if eventPlayer.isAlive() == true and eventPlayer.getHero() == Hero.REINHARDT:
        if len(getLivingPlayers(Team.ALL).filter(lambda player: player != eventPlayer and player.isAlive() == true and distance(player, eventPlayer) <= (4.2 if eventPlayer.player_state[PS_REINHARDT_OATH_ACTIVE] == true else 3.4) and eventPlayer.isInViewAngle(player.getPosition(), 65) == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam()))) > 0:
            damage(getLivingPlayers(Team.ALL).filter(lambda player: player != eventPlayer and player.isAlive() == true and distance(player, eventPlayer) <= (4.2 if eventPlayer.player_state[PS_REINHARDT_OATH_ACTIVE] == true else 3.4) and eventPlayer.isInViewAngle(player.getPosition(), 65) == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())), eventPlayer, 38)
            getLivingPlayers(Team.ALL).filter(lambda player: player != eventPlayer and player.isAlive() == true and distance(player, eventPlayer) <= (4.2 if eventPlayer.player_state[PS_REINHARDT_OATH_ACTIVE] == true else 3.4) and eventPlayer.isInViewAngle(player.getPosition(), 65) == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).setStatusEffect(eventPlayer, Status.KNOCKED_DOWN, 0.55)
            eventPlayer.player_state[PS_REINHARDT_GLORY] += 16 if eventPlayer.player_state[PS_REINHARDT_OATH_ACTIVE] == true else 10
            if eventPlayer.player_state[PS_REINHARDT_GLORY] > 100:
                eventPlayer.player_state[PS_REINHARDT_GLORY] = 100
            playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, Color.RED, eventPlayer, 2.5)
        getLivingPlayers(Team.ALL).filter(lambda player: player != eventPlayer and player.isAlive() == true and player.player_state[PS_REINHARDT_DODGE_CD] == false and distance(player, eventPlayer.getPosition() + eventPlayer.getFacingDirection() * 5.5) <= 5.5 and distance(player, eventPlayer) > 4.2 and eventPlayer.isInViewAngle(player.getPosition(), 55) == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).player_state[PS_REINHARDT_DODGE_CD] = true
        smallMessage(getLivingPlayers(Team.ALL).filter(lambda player: player != eventPlayer and player.isAlive() == true and player.player_state[PS_REINHARDT_DODGE_CD] == true and distance(player, eventPlayer.getPosition() + eventPlayer.getFacingDirection() * 5.5) <= 6 and eventPlayer.isInViewAngle(player.getPosition(), 65) == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())), "险胜骑士")
        getLivingPlayers(Team.ALL).filter(lambda player: player != eventPlayer and player.isAlive() == true and player.player_state[PS_REINHARDT_DODGE_CD] == true and distance(player, eventPlayer.getPosition() + eventPlayer.getFacingDirection() * 5.5) <= 6 and eventPlayer.isInViewAngle(player.getPosition(), 65) == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).setMoveSpeed(115)
        wait(1.2)
        getLivingPlayers(Team.ALL).filter(lambda player: player.player_state[PS_REINHARDT_DODGE_CD] == true).setMoveSpeed(100)
        getLivingPlayers(Team.ALL).filter(lambda player: player.player_state[PS_REINHARDT_DODGE_CD] == true).player_state[PS_REINHARDT_DODGE_CD] = false
    if len(eventPlayer.player_state[PS_REINHARDT_CHARGE_FX]) > 0:
        destroyEffect(eventPlayer.player_state[PS_REINHARDT_CHARGE_FX][0])
    if len(eventPlayer.player_state[PS_REINHARDT_CHARGE_FX]) > 1:
        destroyEffect(eventPlayer.player_state[PS_REINHARDT_CHARGE_FX][1])
    eventPlayer.player_state[PS_REINHARDT_CHARGE_FX] = []
    wait(1)
    eventPlayer.player_state[PS_REINHARDT_CHARGE_LOCK] = false


rule "[reinhardt] trigger heavenly smite":
    @Event playerDealtDamage
    @Hero reinhardt
    @Condition eventPlayer.player_state[PS_REINHARDT_GLORY] >= 100
    @Condition eventPlayer.player_state[PS_REINHARDT_SMITE_ACTIVE] == false
    @Condition victim != eventPlayer
    @Condition eventDamage > 0

    eventPlayer.player_state[PS_REINHARDT_SMITE_ACTIVE] = true
    eventPlayer.player_state[116] = eventPlayer.getUltCharge()
    eventPlayer.player_state[PS_REINHARDT_GLORY] = 0
    eventPlayer.player_state[PS_REINHARDT_GLORY_READY] = false
    eventPlayer.player_state[117] = -1
    eventPlayer.player_state[PS_REINHARDT_SMITE_POS] = nearestWalkablePosition(victim.getPosition())
    eventPlayer.player_state[PS_REINHARDT_SMITE_FX] = []
    eventPlayer.setUltCharge(100)
    eventPlayer.setDamageDealt(100)
    createEffect(getAllPlayers(), Effect.BAD_AURA, Color.RED, eventPlayer.player_state[PS_REINHARDT_SMITE_POS], 6.5 if eventPlayer.player_state[PS_REINHARDT_OATH_ACTIVE] == true else 5.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_state[PS_REINHARDT_SMITE_FX].append(getLastCreatedEntity())
    createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Color.YELLOW, eventPlayer.player_state[PS_REINHARDT_SMITE_POS], 5.5 if eventPlayer.player_state[PS_REINHARDT_OATH_ACTIVE] == true else 4.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_state[PS_REINHARDT_SMITE_FX].append(getLastCreatedEntity())
    bigMessage(eventPlayer, "天罚落锤")
    smallMessage(getPlayersInRadius(eventPlayer.player_state[PS_REINHARDT_SMITE_POS], 9, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())), "天罚预警")
    wait(1.3 if eventPlayer.player_state[PS_REINHARDT_OATH_ACTIVE] == true else 1)
    if eventPlayer.isAlive() == true and eventPlayer.getHero() == Hero.REINHARDT and eventPlayer.player_state[PS_REINHARDT_SMITE_ACTIVE] == true:
        eventPlayer.forceButtonPress(Button.ULTIMATE)
        wait(0.15)
        playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, Color.RED, eventPlayer.player_state[PS_REINHARDT_SMITE_POS], 5)
        playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.YELLOW, eventPlayer.player_state[PS_REINHARDT_SMITE_POS], 4)
        damage(getPlayersInRadius(eventPlayer.player_state[PS_REINHARDT_SMITE_POS], 3.6 if eventPlayer.player_state[PS_REINHARDT_OATH_ACTIVE] == true else 3, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())), eventPlayer, 50)
        getPlayersInRadius(eventPlayer.player_state[PS_REINHARDT_SMITE_POS], 3.6 if eventPlayer.player_state[PS_REINHARDT_OATH_ACTIVE] == true else 3, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).setStatusEffect(eventPlayer, Status.KNOCKED_DOWN, 0.7)
        damage(getPlayersInRadius(eventPlayer.player_state[PS_REINHARDT_SMITE_POS], 6.5 if eventPlayer.player_state[PS_REINHARDT_OATH_ACTIVE] == true else 5.5, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and distance(player, eventPlayer.player_state[PS_REINHARDT_SMITE_POS]) > (3.6 if eventPlayer.player_state[PS_REINHARDT_OATH_ACTIVE] == true else 3) and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())), eventPlayer, 25)
        getPlayersInRadius(eventPlayer.player_state[PS_REINHARDT_SMITE_POS], 6.5 if eventPlayer.player_state[PS_REINHARDT_OATH_ACTIVE] == true else 5.5, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and distance(player, eventPlayer.player_state[PS_REINHARDT_SMITE_POS]) > (3.6 if eventPlayer.player_state[PS_REINHARDT_OATH_ACTIVE] == true else 3) and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).setStatusEffect(eventPlayer, Status.ROOTED, 0.35)
        smallMessage(getPlayersInRadius(eventPlayer.player_state[PS_REINHARDT_SMITE_POS], 9, Team.ALL, LosCheck.OFF).filter(lambda player: player != eventPlayer and player.isAlive() == true and distance(player, eventPlayer.player_state[PS_REINHARDT_SMITE_POS]) > (6.5 if eventPlayer.player_state[PS_REINHARDT_OATH_ACTIVE] == true else 5.5) and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())), "躲过天罚")
    if len(eventPlayer.player_state[PS_REINHARDT_SMITE_FX]) > 0:
        destroyEffect(eventPlayer.player_state[PS_REINHARDT_SMITE_FX][0])
    if len(eventPlayer.player_state[PS_REINHARDT_SMITE_FX]) > 1:
        destroyEffect(eventPlayer.player_state[PS_REINHARDT_SMITE_FX][1])
    eventPlayer.player_state[PS_REINHARDT_SMITE_FX] = []
    eventPlayer.player_state[PS_REINHARDT_SMITE_POS] = null
    if eventPlayer.getHero() == Hero.REINHARDT:
        eventPlayer.setUltCharge(eventPlayer.player_state[116])
    eventPlayer.player_state[116] = 0
    eventPlayer.player_state[PS_REINHARDT_SMITE_ACTIVE] = false


rule "[reinhardt] oathbreaker phase":
    @Event eachPlayer
    @Hero reinhardt
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.getHealth() < eventPlayer.getMaxHealth() * 0.4
    @Condition eventPlayer.player_state[PS_REINHARDT_OATH_USED_LIFE] == false
    @Condition eventPlayer.player_state[PS_REINHARDT_OATH_ACTIVE] == false

    eventPlayer.player_state[PS_REINHARDT_OATH_USED_LIFE] = true
    eventPlayer.player_state[PS_REINHARDT_OATH_ACTIVE] = true
    eventPlayer.player_state[PS_REINHARDT_OATH_FX] = []
    bigMessage(getAllPlayers(), "破誓骑士")
    createEffect(getAllPlayers(), Effect.BAD_AURA, Color.RED, eventPlayer, 5.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_state[PS_REINHARDT_OATH_FX].append(getLastCreatedEntity())
    createEffect(getAllPlayers(), Effect.GOOD_AURA, Color.YELLOW, eventPlayer, 4.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_state[PS_REINHARDT_OATH_FX].append(getLastCreatedEntity())
    playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, Color.RED, eventPlayer, 5)
    eventPlayer.setMoveSpeed(110)
    wait(10)
    if eventPlayer.isAlive() == true and eventPlayer.getHero() == Hero.REINHARDT and eventPlayer.player_state[PS_REINHARDT_OATH_ACTIVE] == true:
        eventPlayer.player_state[PS_REINHARDT_OATH_ACTIVE] = false
        if len(eventPlayer.player_state[PS_REINHARDT_OATH_FX]) > 0:
            destroyEffect(eventPlayer.player_state[PS_REINHARDT_OATH_FX][0])
        if len(eventPlayer.player_state[PS_REINHARDT_OATH_FX]) > 1:
            destroyEffect(eventPlayer.player_state[PS_REINHARDT_OATH_FX][1])
        eventPlayer.player_state[PS_REINHARDT_OATH_FX] = []
        eventPlayer.player_state[PS_REINHARDT_FATIGUED] = true
        eventPlayer.setMoveSpeed(75)
        eventPlayer.player_state[117] = -1
        smallMessage(eventPlayer, "骑士疲惫")
        wait(3)
        if eventPlayer.getHero() == Hero.REINHARDT and eventPlayer.player_state[PS_REINHARDT_FATIGUED] == true:
            eventPlayer.setMoveSpeed(100)
            eventPlayer.player_state[PS_REINHARDT_FATIGUED] = false
            eventPlayer.player_state[117] = -1


rule "[reinhardt] clear temporary states on death keep glory":
    @Event playerDied
    @Hero reinhardt

    if len(eventPlayer.player_state[PS_REINHARDT_DECLARE_FX]) > 0:
        destroyEffect(eventPlayer.player_state[PS_REINHARDT_DECLARE_FX][0])
    if len(eventPlayer.player_state[PS_REINHARDT_DECLARE_FX]) > 1:
        destroyEffect(eventPlayer.player_state[PS_REINHARDT_DECLARE_FX][1])
    if len(eventPlayer.player_state[PS_REINHARDT_CHARGE_FX]) > 0:
        destroyEffect(eventPlayer.player_state[PS_REINHARDT_CHARGE_FX][0])
    if len(eventPlayer.player_state[PS_REINHARDT_CHARGE_FX]) > 1:
        destroyEffect(eventPlayer.player_state[PS_REINHARDT_CHARGE_FX][1])
    if len(eventPlayer.player_state[PS_REINHARDT_SMITE_FX]) > 0:
        destroyEffect(eventPlayer.player_state[PS_REINHARDT_SMITE_FX][0])
    if len(eventPlayer.player_state[PS_REINHARDT_SMITE_FX]) > 1:
        destroyEffect(eventPlayer.player_state[PS_REINHARDT_SMITE_FX][1])
    if len(eventPlayer.player_state[PS_REINHARDT_OATH_FX]) > 0:
        destroyEffect(eventPlayer.player_state[PS_REINHARDT_OATH_FX][0])
    if len(eventPlayer.player_state[PS_REINHARDT_OATH_FX]) > 1:
        destroyEffect(eventPlayer.player_state[PS_REINHARDT_OATH_FX][1])
    eventPlayer.player_state[PS_REINHARDT_DECLARE_ACTIVE] = false
    eventPlayer.player_state[PS_REINHARDT_DECLARE_CD] = false
    eventPlayer.player_state[PS_REINHARDT_DECLARE_FX] = []
    eventPlayer.player_state[PS_REINHARDT_BROKEN_RETIRED] = false
    eventPlayer.player_state[PS_REINHARDT_CHARGE_LOCK] = false
    eventPlayer.player_state[PS_REINHARDT_CHARGE_FX] = []
    eventPlayer.player_state[PS_REINHARDT_SMITE_ACTIVE] = false
    eventPlayer.player_state[PS_REINHARDT_SMITE_POS] = null
    eventPlayer.player_state[PS_REINHARDT_SMITE_FX] = []
    eventPlayer.player_state[PS_REINHARDT_OATH_ACTIVE] = false
    eventPlayer.player_state[PS_REINHARDT_OATH_USED_LIFE] = false
    eventPlayer.player_state[PS_REINHARDT_FATIGUED] = false
    eventPlayer.player_state[PS_REINHARDT_OATH_FX] = []
    eventPlayer.player_state[PS_REINHARDT_GAIN_CD] = false
    eventPlayer.player_state[PS_REINHARDT_HIT_GAIN_CD] = false
    eventPlayer.player_state[117] = -1
    eventPlayer.setMoveSpeed(100)
    eventPlayer.setDamageDealt(100)
    eventPlayer.setDamageReceived(100)


rule "[reinhardt] clear all state after hero swap":
    @Event eachPlayer
    @Condition eventPlayer.getHero() != Hero.REINHARDT
    @Condition eventPlayer.player_state[PS_REINHARDT_GLORY] > 0 or eventPlayer.player_state[PS_REINHARDT_HUD_CREATED] == true or eventPlayer.player_state[PS_REINHARDT_HUD_ID] != null or eventPlayer.player_state[PS_REINHARDT_GLORY_READY] == true or eventPlayer.player_state[PS_REINHARDT_GAIN_CD] == true or eventPlayer.player_state[PS_REINHARDT_DECLARE_ACTIVE] == true or eventPlayer.player_state[PS_REINHARDT_DECLARE_CD] == true or len(eventPlayer.player_state[PS_REINHARDT_DECLARE_FX]) > 0 or eventPlayer.player_state[PS_REINHARDT_BROKEN_RETIRED] == true or eventPlayer.player_state[PS_REINHARDT_CHARGE_LOCK] == true or len(eventPlayer.player_state[PS_REINHARDT_CHARGE_FX]) > 0 or eventPlayer.player_state[PS_REINHARDT_SMITE_ACTIVE] == true or len(eventPlayer.player_state[PS_REINHARDT_SMITE_FX]) > 0 or eventPlayer.player_state[PS_REINHARDT_OATH_ACTIVE] == true or eventPlayer.player_state[PS_REINHARDT_OATH_USED_LIFE] == true or eventPlayer.player_state[PS_REINHARDT_FATIGUED] == true or len(eventPlayer.player_state[PS_REINHARDT_OATH_FX]) > 0 or eventPlayer.player_state[116] != 0 or eventPlayer.player_state[117] != -1

    if eventPlayer.player_state[PS_REINHARDT_HUD_ID] != null:
        destroyHudText(eventPlayer.player_state[PS_REINHARDT_HUD_ID])
    if len(eventPlayer.player_state[PS_REINHARDT_DECLARE_FX]) > 0:
        destroyEffect(eventPlayer.player_state[PS_REINHARDT_DECLARE_FX][0])
    if len(eventPlayer.player_state[PS_REINHARDT_DECLARE_FX]) > 1:
        destroyEffect(eventPlayer.player_state[PS_REINHARDT_DECLARE_FX][1])
    if len(eventPlayer.player_state[PS_REINHARDT_CHARGE_FX]) > 0:
        destroyEffect(eventPlayer.player_state[PS_REINHARDT_CHARGE_FX][0])
    if len(eventPlayer.player_state[PS_REINHARDT_CHARGE_FX]) > 1:
        destroyEffect(eventPlayer.player_state[PS_REINHARDT_CHARGE_FX][1])
    if len(eventPlayer.player_state[PS_REINHARDT_SMITE_FX]) > 0:
        destroyEffect(eventPlayer.player_state[PS_REINHARDT_SMITE_FX][0])
    if len(eventPlayer.player_state[PS_REINHARDT_SMITE_FX]) > 1:
        destroyEffect(eventPlayer.player_state[PS_REINHARDT_SMITE_FX][1])
    if len(eventPlayer.player_state[PS_REINHARDT_OATH_FX]) > 0:
        destroyEffect(eventPlayer.player_state[PS_REINHARDT_OATH_FX][0])
    if len(eventPlayer.player_state[PS_REINHARDT_OATH_FX]) > 1:
        destroyEffect(eventPlayer.player_state[PS_REINHARDT_OATH_FX][1])
    eventPlayer.player_state[PS_REINHARDT_GLORY] = 0
    eventPlayer.player_state[PS_REINHARDT_HUD_CREATED] = false
    eventPlayer.player_state[PS_REINHARDT_HUD_ID] = null
    eventPlayer.player_state[PS_REINHARDT_GLORY_READY] = false
    eventPlayer.player_state[PS_REINHARDT_GAIN_CD] = false
    eventPlayer.player_state[PS_REINHARDT_DECLARE_ACTIVE] = false
    eventPlayer.player_state[PS_REINHARDT_DECLARE_CD] = false
    eventPlayer.player_state[PS_REINHARDT_DECLARE_FX] = []
    eventPlayer.player_state[PS_REINHARDT_BROKEN_RETIRED] = false
    eventPlayer.player_state[PS_REINHARDT_CHARGE_LOCK] = false
    eventPlayer.player_state[PS_REINHARDT_CHARGE_FX] = []
    eventPlayer.player_state[PS_REINHARDT_SMITE_ACTIVE] = false
    eventPlayer.player_state[PS_REINHARDT_SMITE_POS] = null
    eventPlayer.player_state[PS_REINHARDT_SMITE_FX] = []
    eventPlayer.player_state[PS_REINHARDT_OATH_ACTIVE] = false
    eventPlayer.player_state[PS_REINHARDT_OATH_USED_LIFE] = false
    eventPlayer.player_state[PS_REINHARDT_FATIGUED] = false
    eventPlayer.player_state[PS_REINHARDT_OATH_FX] = []
    eventPlayer.player_state[PS_REINHARDT_DODGE_CD] = false
    eventPlayer.player_state[PS_REINHARDT_HIT_GAIN_CD] = false
    eventPlayer.player_state[116] = 0
    eventPlayer.player_state[117] = -1
    eventPlayer.setMoveSpeed(100)
    eventPlayer.setDamageDealt(100)
    eventPlayer.setDamageReceived(100)


rule "[freya] launch circle":
    @Event eachPlayer
    @Hero freja
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.player_state[PS_FREYA_LAUNCH_CIRCLE_LOCK] == false
    @Condition eventPlayer.isUsingAbility2() == true

    eventPlayer.player_state[PS_FREYA_LAUNCH_CIRCLE_LOCK] = true
    eventPlayer.player_state[PS_FREYA_LAUNCH_POS] = nearestWalkablePosition(eventPlayer.getPosition())
    eventPlayer.player_state[PS_FREYA_LAUNCH_FX] = []
    createEffect(getAllPlayers(), Effect.GOOD_AURA, Color.AQUA, eventPlayer.player_state[PS_FREYA_LAUNCH_POS], 4.4, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_state[PS_FREYA_LAUNCH_FX].append(getLastCreatedEntity())
    createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Color.WHITE, eventPlayer.player_state[PS_FREYA_LAUNCH_POS], 4.1, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_state[PS_FREYA_LAUNCH_FX].append(getLastCreatedEntity())
    smallMessage(getPlayersInRadius(eventPlayer.player_state[PS_FREYA_LAUNCH_POS], 6, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true), "飞天法阵预警")
    wait(0.9)
    if eventPlayer.isAlive() == true and eventPlayer.getHero() == Hero.FREJA:
        getPlayersInRadius(eventPlayer.player_state[PS_FREYA_LAUNCH_POS], 4.4, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and player.player_state[PS_FREYA_NOFLY_POS] == false and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).player_state[PS_FREYA_NOFLY_POS] = true
        getPlayersInRadius(eventPlayer.player_state[PS_FREYA_LAUNCH_POS], 4.4, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and player.player_state[PS_FREYA_NOFLY_FX] == null and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).player_state[PS_FREYA_NOFLY_FX] = eventPlayer
        getPlayersInRadius(eventPlayer.player_state[PS_FREYA_LAUNCH_POS], 4.4, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and player.player_state[PS_FREYA_NOFLY_TARGETS] == null and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).player_state[PS_FREYA_NOFLY_TARGETS] = eventPlayer.player_state[PS_FREYA_LAUNCH_POS]
        getPlayersInRadius(eventPlayer.player_state[PS_FREYA_LAUNCH_POS], 4.4, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and player.player_state[PS_FREYA_NOFLY_TICK] == false and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).applyImpulse(Vector.UP, 28, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
        playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.AQUA, eventPlayer.player_state[PS_FREYA_LAUNCH_POS], 4.4)
    wait(0.4)
    if len(eventPlayer.player_state[PS_FREYA_LAUNCH_FX]) > 0:
        destroyEffect(eventPlayer.player_state[PS_FREYA_LAUNCH_FX][0])
    if len(eventPlayer.player_state[PS_FREYA_LAUNCH_FX]) > 1:
        destroyEffect(eventPlayer.player_state[PS_FREYA_LAUNCH_FX][1])
    eventPlayer.player_state[PS_FREYA_LAUNCH_FX] = []
    wait(3.2)
    eventPlayer.player_state[PS_FREYA_LAUNCH_CIRCLE_LOCK] = false
    eventPlayer.player_state[PS_FREYA_LAUNCH_POS] = null


rule "[freya] airborne warrant settlement":
    @Event eachPlayer
    @Condition eventPlayer.player_state[PS_FREYA_NOFLY_POS] == true
    @Condition eventPlayer.player_state[PS_FREYA_NOFLY_TICK] == false

    eventPlayer.player_state[PS_FREYA_NOFLY_TICK] = true
    eventPlayer.player_state[PS_FREYA_NOFLY_TARGET_LOCK] = []
    createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Color.AQUA, eventPlayer, 1.2, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_state[PS_FREYA_NOFLY_TARGET_LOCK].append(getLastCreatedEntity())
    createEffect(getAllPlayers(), Effect.BAD_AURA, Color.AQUA, eventPlayer.player_state[PS_FREYA_NOFLY_TARGETS], 4.4, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_state[PS_FREYA_NOFLY_TARGET_LOCK].append(getLastCreatedEntity())
    smallMessage(eventPlayer, "空域通缉")
    waitUntil(eventPlayer.isOnGround() == true or eventPlayer.isAlive() == false or eventPlayer.player_state[PS_FREYA_NOFLY_POS] == false, 4)
    if eventPlayer.isAlive() == true and eventPlayer.player_state[PS_FREYA_NOFLY_POS] == true and eventPlayer.isOnGround() == true:
        if distance(eventPlayer, eventPlayer.player_state[PS_FREYA_NOFLY_TARGETS]) <= 4.4:
            damage(eventPlayer, eventPlayer.player_state[PS_FREYA_NOFLY_FX], 40)
            eventPlayer.setStatusEffect(eventPlayer.player_state[PS_FREYA_NOFLY_FX], Status.KNOCKED_DOWN, 2)
            smallMessage(eventPlayer, "降落失败")
            playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, Color.AQUA, eventPlayer, 2.2)
        else:
            smallMessage(eventPlayer, "安全降落")
    if len(eventPlayer.player_state[PS_FREYA_NOFLY_TARGET_LOCK]) > 0:
        destroyEffect(eventPlayer.player_state[PS_FREYA_NOFLY_TARGET_LOCK][0])
    if len(eventPlayer.player_state[PS_FREYA_NOFLY_TARGET_LOCK]) > 1:
        destroyEffect(eventPlayer.player_state[PS_FREYA_NOFLY_TARGET_LOCK][1])
    eventPlayer.player_state[PS_FREYA_NOFLY_POS] = false
    eventPlayer.player_state[PS_FREYA_NOFLY_FX] = null
    eventPlayer.player_state[PS_FREYA_NOFLY_TARGETS] = null
    eventPlayer.player_state[PS_FREYA_NOFLY_TICK] = false
    eventPlayer.player_state[PS_FREYA_NOFLY_TARGET_LOCK] = []


rule "[freya] no fly zone":
    @Event eachPlayer
    @Hero freja
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.player_state[PS_FREYA_WARRANT_ACTIVE] == false
    @Condition eventPlayer.isUsingAbility1() == true

    eventPlayer.player_state[PS_FREYA_WARRANT_ACTIVE] = true
    eventPlayer.player_state[PS_FREYA_WARRANT_TARGET] = nearestWalkablePosition(raycast(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * 40, getAllPlayers(), getAllPlayers(), false).getHitPosition())
    eventPlayer.player_state[PS_FREYA_WARRANT_LAND_SAFE] = []
    eventPlayer.player_state[PS_FREYA_WARRANT_SETTLED] = 0
    createEffect(getAllPlayers(), Effect.BAD_AURA, Color.AQUA, eventPlayer.player_state[PS_FREYA_WARRANT_TARGET], 4.2, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_state[PS_FREYA_WARRANT_LAND_SAFE].append(getLastCreatedEntity())
    createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Color.AQUA, eventPlayer.player_state[PS_FREYA_WARRANT_TARGET], 3.6, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_state[PS_FREYA_WARRANT_LAND_SAFE].append(getLastCreatedEntity())
    smallMessage(getPlayersInRadius(eventPlayer.player_state[PS_FREYA_WARRANT_TARGET], 5.5, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true), "禁飞区")
    while eventPlayer.player_state[PS_FREYA_WARRANT_ACTIVE] == true and eventPlayer.isAlive() == true and eventPlayer.getHero() == Hero.FREJA and eventPlayer.player_state[PS_FREYA_WARRANT_SETTLED] < 20:
        getPlayersInRadius(eventPlayer.player_state[PS_FREYA_WARRANT_TARGET], 4.2, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).disallowButton(Button.JUMP)
        getPlayersInRadius(eventPlayer.player_state[PS_FREYA_WARRANT_TARGET], 4.2, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).player_state[PS_FREYA_TEMP_TARGETS] = true
        getPlayersInRadius(eventPlayer.player_state[PS_FREYA_WARRANT_TARGET], 4.2, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).A = 0
        getPlayersInRadius(eventPlayer.player_state[PS_FREYA_WARRANT_TARGET], 4.2, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and player.isInAir() == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).applyImpulse(Vector.DOWN, 13, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
        eventPlayer.player_state[PS_FREYA_WARRANT_SETTLED] += 1
        wait(0.25)
    if len(eventPlayer.player_state[PS_FREYA_WARRANT_LAND_SAFE]) > 0:
        destroyEffect(eventPlayer.player_state[PS_FREYA_WARRANT_LAND_SAFE][0])
    if len(eventPlayer.player_state[PS_FREYA_WARRANT_LAND_SAFE]) > 1:
        destroyEffect(eventPlayer.player_state[PS_FREYA_WARRANT_LAND_SAFE][1])
    eventPlayer.player_state[PS_FREYA_WARRANT_LAND_SAFE] = []
    eventPlayer.player_state[PS_FREYA_WARRANT_ACTIVE] = false
    eventPlayer.player_state[PS_FREYA_WARRANT_TARGET] = null
    eventPlayer.player_state[PS_FREYA_WARRANT_SETTLED] = 0
    wait(2)


rule "[freya] clear no fly target lock":
    @Event eachPlayer
    @Condition eventPlayer.player_state[PS_FREYA_TEMP_TARGETS] == true

    wait(0.25)
    while eventPlayer.player_state[PS_FREYA_TEMP_TARGETS] == true and len(getPlayersOnHero(Hero.FREJA, Team.ALL).filter(lambda player: player.player_state[PS_FREYA_WARRANT_ACTIVE] == true and player.player_state[PS_FREYA_WARRANT_TARGET] != null and player != eventPlayer and distance(eventPlayer, player.player_state[PS_FREYA_WARRANT_TARGET]) <= 4.2 and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam()))) > 0:
        wait(0.25)
    eventPlayer.allowButton(Button.JUMP)
    eventPlayer.player_state[PS_FREYA_TEMP_TARGETS] = false


rule "[freya] clear temporary states on death":
    @Event playerDied
    @Hero freja

    if len(eventPlayer.player_state[PS_FREYA_LAUNCH_FX]) > 0:
        destroyEffect(eventPlayer.player_state[PS_FREYA_LAUNCH_FX][0])
    if len(eventPlayer.player_state[PS_FREYA_LAUNCH_FX]) > 1:
        destroyEffect(eventPlayer.player_state[PS_FREYA_LAUNCH_FX][1])
    if len(eventPlayer.player_state[PS_FREYA_WARRANT_LAND_SAFE]) > 0:
        destroyEffect(eventPlayer.player_state[PS_FREYA_WARRANT_LAND_SAFE][0])
    if len(eventPlayer.player_state[PS_FREYA_WARRANT_LAND_SAFE]) > 1:
        destroyEffect(eventPlayer.player_state[PS_FREYA_WARRANT_LAND_SAFE][1])
    getAllPlayers().filter(lambda player: player.player_state[PS_FREYA_NOFLY_FX] == eventPlayer).player_state[PS_FREYA_NOFLY_POS] = false
    eventPlayer.player_state[PS_FREYA_LAUNCH_CIRCLE_LOCK] = false
    eventPlayer.player_state[PS_FREYA_LAUNCH_POS] = null
    eventPlayer.player_state[PS_FREYA_LAUNCH_FX] = []
    eventPlayer.player_state[PS_FREYA_WARRANT_ACTIVE] = false
    eventPlayer.player_state[PS_FREYA_WARRANT_TARGET] = null
    eventPlayer.player_state[PS_FREYA_WARRANT_LAND_SAFE] = []
    eventPlayer.player_state[PS_FREYA_WARRANT_SETTLED] = 0


rule "[freya] clear all state after hero swap":
    @Event eachPlayer
    @Condition eventPlayer.getHero() != Hero.FREJA
    @Condition eventPlayer.player_state[PS_FREYA_LAUNCH_CIRCLE_LOCK] == true or len(eventPlayer.player_state[PS_FREYA_LAUNCH_FX]) > 0 or eventPlayer.player_state[PS_FREYA_WARRANT_ACTIVE] == true or len(eventPlayer.player_state[PS_FREYA_WARRANT_LAND_SAFE]) > 0

    if len(eventPlayer.player_state[PS_FREYA_LAUNCH_FX]) > 0:
        destroyEffect(eventPlayer.player_state[PS_FREYA_LAUNCH_FX][0])
    if len(eventPlayer.player_state[PS_FREYA_LAUNCH_FX]) > 1:
        destroyEffect(eventPlayer.player_state[PS_FREYA_LAUNCH_FX][1])
    if len(eventPlayer.player_state[PS_FREYA_WARRANT_LAND_SAFE]) > 0:
        destroyEffect(eventPlayer.player_state[PS_FREYA_WARRANT_LAND_SAFE][0])
    if len(eventPlayer.player_state[PS_FREYA_WARRANT_LAND_SAFE]) > 1:
        destroyEffect(eventPlayer.player_state[PS_FREYA_WARRANT_LAND_SAFE][1])
    getAllPlayers().filter(lambda player: player.player_state[PS_FREYA_NOFLY_FX] == eventPlayer).player_state[PS_FREYA_NOFLY_POS] = false
    eventPlayer.player_state[PS_FREYA_LAUNCH_CIRCLE_LOCK] = false
    eventPlayer.player_state[PS_FREYA_LAUNCH_POS] = null
    eventPlayer.player_state[PS_FREYA_LAUNCH_FX] = []
    eventPlayer.player_state[PS_FREYA_WARRANT_ACTIVE] = false
    eventPlayer.player_state[PS_FREYA_WARRANT_TARGET] = null
    eventPlayer.player_state[PS_FREYA_WARRANT_LAND_SAFE] = []
    eventPlayer.player_state[PS_FREYA_WARRANT_SETTLED] = 0


rule "[wuyang] initialize tide lifeguard state":
    @Event eachPlayer
    @Hero wuyang
    @Condition eventPlayer.player_state[PS_WUYANG_TIDE_VALUE] == null or eventPlayer.player_state[PS_WUYANG_SURF_LOCK] == null

    eventPlayer.player_state[PS_WUYANG_SURF_LOCK] = false
    eventPlayer.player_state[PS_WUYANG_SURF_DIR] = null
    eventPlayer.player_state[PS_WUYANG_SURF_FX] = []
    eventPlayer.player_state[PS_WUYANG_TICK] = 0
    eventPlayer.player_state[PS_WUYANG_LIFEBUOY_LOCK] = false
    eventPlayer.player_state[PS_WUYANG_LIFEBUOY_TARGET] = null
    eventPlayer.player_state[PS_WUYANG_LIFEBUOY_FX] = []
    eventPlayer.player_state[PS_WUYANG_TIDE_HUD_ID] = null
    eventPlayer.player_state[PS_WUYANG_TIDE_VALUE] = 0
    eventPlayer.player_state[PS_WUYANG_TARGET_HIT_SOURCE] = null
    eventPlayer.player_state[PS_WUYANG_TARGET_SLOW_ACTIVE] = false
    eventPlayer.player_state[PS_WUYANG_LIFEBUOY_OWNER] = null
    eventPlayer.player_state[PS_WUYANG_TIDE_HUD_CREATED] = false


rule "[wuyang] create tide value hud":
    @Event eachPlayer
    @Hero wuyang
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.player_state[PS_WUYANG_TIDE_HUD_CREATED] == false

    if eventPlayer.player_state[PS_WUYANG_TIDE_HUD_ID] != null:
        destroyHudText(eventPlayer.player_state[PS_WUYANG_TIDE_HUD_ID])
    eventPlayer.player_state[PS_WUYANG_TIDE_HUD_CREATED] = true
    hudHeader(eventPlayer, "潮汐：{}/100".format(eventPlayer.player_state[PS_WUYANG_TIDE_VALUE]), HudPosition.RIGHT, -832, Color.AQUA, HudReeval.VISIBILITY_AND_STRING)
    eventPlayer.player_state[PS_WUYANG_TIDE_HUD_ID] = getLastCreatedText()


rule "[wuyang] gain tide from melee":
    @Event playerDealtDamage
    @Hero wuyang
    @Condition eventAbility == Button.MELEE

    if victim.player_state[PS_WUYANG_LIFEBUOY_OWNER] == eventPlayer:
        victim.player_state[PS_WUYANG_LIFEBUOY_OWNER] = null
        victim.player_state[PS_WUYANG_TARGET_HIT_SOURCE] = eventPlayer
        victim.player_state[PS_WUYANG_TARGET_SLOW_ACTIVE] = true
        victim.setMoveSpeed(70)
        damage(victim, eventPlayer, 24)
        victim.applyImpulse(eventPlayer.getFacingDirection() + Vector.UP * 0.15, 7, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
        playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.AQUA, victim, 1.6)
        smallMessage(eventPlayer, "拖回岸边")
        smallMessage(victim, "被拖回岸边")
        eventPlayer.player_state[PS_WUYANG_TIDE_VALUE] += 20
    else:
        eventPlayer.player_state[PS_WUYANG_TIDE_VALUE] += 18
        smallMessage(eventPlayer, "潮汐 +18")
    if eventPlayer.player_state[PS_WUYANG_TIDE_VALUE] > 100:
        eventPlayer.player_state[PS_WUYANG_TIDE_VALUE] = 100
    if eventPlayer.player_state[PS_WUYANG_TIDE_VALUE] >= 100:
        smallMessage(eventPlayer, "大浪已至")


rule "[wuyang] surf rescue or tidal wave":
    @Event eachPlayer
    @Hero wuyang
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.player_state[PS_WUYANG_SURF_LOCK] == false
    @Condition eventPlayer.isUsingAbility1() == true

    eventPlayer.player_state[PS_WUYANG_SURF_LOCK] = true
    eventPlayer.player_state[PS_WUYANG_SURF_DIR] = eventPlayer.getFacingDirection()
    eventPlayer.player_state[PS_WUYANG_SURF_FX] = []
    eventPlayer.player_state[PS_WUYANG_TICK] = 0
    if eventPlayer.player_state[PS_WUYANG_TIDE_VALUE] >= 100:
        eventPlayer.player_state[PS_WUYANG_TIDE_VALUE] = 0
        bigMessage(getPlayersInRadius(eventPlayer, 16, Team.ALL, LosCheck.SURFACES), "巨浪拍岸")
        createBeam(getAllPlayers(), Beam.GOOD, eventPlayer.getPosition() + Vector.UP * 0.25, eventPlayer.getPosition() + eventPlayer.player_state[PS_WUYANG_SURF_DIR] * 14 + Vector.UP * 0.25, Color.AQUA, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
        eventPlayer.player_state[PS_WUYANG_SURF_FX].append(getLastCreatedEntity())
        createEffect(getAllPlayers(), Effect.GOOD_AURA, Color.AQUA, eventPlayer.getPosition() + eventPlayer.player_state[PS_WUYANG_SURF_DIR] * 7, 4.6, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
        eventPlayer.player_state[PS_WUYANG_SURF_FX].append(getLastCreatedEntity())
        createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Color.BLUE, eventPlayer.getPosition() + eventPlayer.player_state[PS_WUYANG_SURF_DIR] * 7, 4, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
        eventPlayer.player_state[PS_WUYANG_SURF_FX].append(getLastCreatedEntity())
        wait(0.8)
        while eventPlayer.player_state[PS_WUYANG_SURF_LOCK] == true and eventPlayer.isAlive() == true and eventPlayer.getHero() == Hero.WUYANG and eventPlayer.player_state[PS_WUYANG_TICK] < 12:
            eventPlayer.applyImpulse(eventPlayer.player_state[PS_WUYANG_SURF_DIR] + Vector.UP * 0.12, 17, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
            getPlayersInRadius(eventPlayer, 2.7, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and player.player_state[PS_WUYANG_TARGET_HIT_SOURCE] != eventPlayer and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).player_state[PS_WUYANG_TARGET_HIT_SOURCE] = eventPlayer
            damage(getPlayersInRadius(eventPlayer, 2.7, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and player.player_state[PS_WUYANG_TARGET_HIT_SOURCE] == eventPlayer and player.player_state[PS_WUYANG_TARGET_SLOW_ACTIVE] == false and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())), eventPlayer, 40)
            getPlayersInRadius(eventPlayer, 2.7, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and player.player_state[PS_WUYANG_TARGET_HIT_SOURCE] == eventPlayer and player.player_state[PS_WUYANG_TARGET_SLOW_ACTIVE] == false and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).setStatusEffect(eventPlayer, Status.KNOCKED_DOWN, 0.55)
            getPlayersInRadius(eventPlayer, 2.7, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and player.player_state[PS_WUYANG_TARGET_HIT_SOURCE] == eventPlayer and player.player_state[PS_WUYANG_TARGET_SLOW_ACTIVE] == false and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).player_state[PS_WUYANG_TARGET_SLOW_ACTIVE] = true
            getPlayersInRadius(eventPlayer, 5, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and player.player_state[PS_WUYANG_TARGET_HIT_SOURCE] != eventPlayer and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).player_state[PS_WUYANG_TARGET_HIT_SOURCE] = eventPlayer
            damage(getPlayersInRadius(eventPlayer, 5, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and player.player_state[PS_WUYANG_TARGET_HIT_SOURCE] == eventPlayer and player.player_state[PS_WUYANG_TARGET_SLOW_ACTIVE] == false and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())), eventPlayer, 20)
            getPlayersInRadius(eventPlayer, 5, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and player.player_state[PS_WUYANG_TARGET_HIT_SOURCE] == eventPlayer and player.player_state[PS_WUYANG_TARGET_SLOW_ACTIVE] == false and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).setMoveSpeed(70)
            getPlayersInRadius(eventPlayer, 5, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and player.player_state[PS_WUYANG_TARGET_HIT_SOURCE] == eventPlayer and player.player_state[PS_WUYANG_TARGET_SLOW_ACTIVE] == false and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).player_state[PS_WUYANG_TARGET_SLOW_ACTIVE] = true
            eventPlayer.player_state[PS_WUYANG_TICK] += 1
            wait(0.12)
    else:
        smallMessage(eventPlayer, "冲浪救援")
        createBeam(getAllPlayers(), Beam.GOOD, eventPlayer.getPosition() + Vector.UP * 0.2, eventPlayer.getPosition() + eventPlayer.player_state[PS_WUYANG_SURF_DIR] * 9 + Vector.UP * 0.2, Color.AQUA, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
        eventPlayer.player_state[PS_WUYANG_SURF_FX].append(getLastCreatedEntity())
        createEffect(getAllPlayers(), Effect.CLOUD, Color.AQUA, eventPlayer, 2.4, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
        eventPlayer.player_state[PS_WUYANG_SURF_FX].append(getLastCreatedEntity())
        wait(0.18)
        while eventPlayer.player_state[PS_WUYANG_SURF_LOCK] == true and eventPlayer.isAlive() == true and eventPlayer.getHero() == Hero.WUYANG and eventPlayer.player_state[PS_WUYANG_TICK] < 9:
            eventPlayer.applyImpulse(eventPlayer.player_state[PS_WUYANG_SURF_DIR] + Vector.UP * 0.08, 13, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
            if len(getPlayersInRadius(eventPlayer, 2.4, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and player.player_state[PS_WUYANG_TARGET_HIT_SOURCE] != eventPlayer and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam()))) > 0:
                getPlayersInRadius(eventPlayer, 2.4, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and player.player_state[PS_WUYANG_TARGET_HIT_SOURCE] != eventPlayer and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).player_state[PS_WUYANG_TARGET_HIT_SOURCE] = eventPlayer
                damage(getPlayersInRadius(eventPlayer, 2.4, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and player.player_state[PS_WUYANG_TARGET_HIT_SOURCE] == eventPlayer and player.player_state[PS_WUYANG_TARGET_SLOW_ACTIVE] == false and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())), eventPlayer, 18)
                getPlayersInRadius(eventPlayer, 2.4, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and player.player_state[PS_WUYANG_TARGET_HIT_SOURCE] == eventPlayer and player.player_state[PS_WUYANG_TARGET_SLOW_ACTIVE] == false and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).applyImpulse(eventPlayer.player_state[PS_WUYANG_SURF_DIR] + Vector.UP * 0.2, 8, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
                getPlayersInRadius(eventPlayer, 2.4, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and player.player_state[PS_WUYANG_TARGET_HIT_SOURCE] == eventPlayer and player.player_state[PS_WUYANG_TARGET_SLOW_ACTIVE] == false and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).setMoveSpeed(82)
                getPlayersInRadius(eventPlayer, 2.4, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and player.player_state[PS_WUYANG_TARGET_HIT_SOURCE] == eventPlayer and player.player_state[PS_WUYANG_TARGET_SLOW_ACTIVE] == false and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).player_state[PS_WUYANG_TARGET_SLOW_ACTIVE] = true
                eventPlayer.player_state[PS_WUYANG_TIDE_VALUE] += 10
                if eventPlayer.player_state[PS_WUYANG_TIDE_VALUE] > 100:
                    eventPlayer.player_state[PS_WUYANG_TIDE_VALUE] = 100
                if eventPlayer.player_state[PS_WUYANG_TIDE_VALUE] >= 100:
                    smallMessage(eventPlayer, "大浪已至")
            eventPlayer.player_state[PS_WUYANG_TICK] += 1
            wait(0.14)
    if len(eventPlayer.player_state[PS_WUYANG_SURF_FX]) > 0:
        destroyEffect(eventPlayer.player_state[PS_WUYANG_SURF_FX][0])
    if len(eventPlayer.player_state[PS_WUYANG_SURF_FX]) > 1:
        destroyEffect(eventPlayer.player_state[PS_WUYANG_SURF_FX][1])
    if len(eventPlayer.player_state[PS_WUYANG_SURF_FX]) > 2:
        destroyEffect(eventPlayer.player_state[PS_WUYANG_SURF_FX][2])
    eventPlayer.player_state[PS_WUYANG_SURF_FX] = []
    eventPlayer.player_state[PS_WUYANG_SURF_LOCK] = false
    eventPlayer.player_state[PS_WUYANG_SURF_DIR] = null
    eventPlayer.player_state[PS_WUYANG_TICK] = 0
    wait(1.4)


rule "[wuyang] lifebuoy lasso":
    @Event eachPlayer
    @Hero wuyang
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.player_state[PS_WUYANG_LIFEBUOY_LOCK] == false
    @Condition eventPlayer.isUsingAbility2() == true
    @Condition len(getLivingPlayers(Team.ALL).filter(lambda player: player != eventPlayer and player.player_state[PS_WUYANG_LIFEBUOY_TARGET_CD] == false and distance(player, eventPlayer) <= 20 and eventPlayer.isInViewAngle(player.getPosition(), 35) == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam()))) > 0

    eventPlayer.player_state[PS_WUYANG_LIFEBUOY_LOCK] = true
    eventPlayer.player_state[PS_WUYANG_LIFEBUOY_TARGET] = sorted(getLivingPlayers(Team.ALL).filter(lambda player: player != eventPlayer and player.player_state[PS_WUYANG_LIFEBUOY_TARGET_CD] == false and distance(player, eventPlayer) <= 20 and eventPlayer.isInViewAngle(player.getPosition(), 35) == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())), key=lambda player: distance(player, eventPlayer))[0]
    eventPlayer.player_state[PS_WUYANG_LIFEBUOY_FX] = []
    eventPlayer.player_state[PS_WUYANG_TICK] = 0
    eventPlayer.player_state[PS_WUYANG_LIFEBUOY_TARGET].player_state[PS_WUYANG_LIFEBUOY_OWNER] = eventPlayer
    eventPlayer.player_state[PS_WUYANG_LIFEBUOY_TARGET].player_state[PS_WUYANG_LIFEBUOY_TARGET_CD] = true
    createBeam(getAllPlayers(), Beam.GOOD, eventPlayer, eventPlayer.player_state[PS_WUYANG_LIFEBUOY_TARGET], Color.AQUA, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_state[PS_WUYANG_LIFEBUOY_FX].append(getLastCreatedEntity())
    createEffect(getAllPlayers(), Effect.BAD_AURA, Color.AQUA, eventPlayer.player_state[PS_WUYANG_LIFEBUOY_TARGET], 1.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_state[PS_WUYANG_LIFEBUOY_FX].append(getLastCreatedEntity())
    createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Color.BLUE, eventPlayer.player_state[PS_WUYANG_LIFEBUOY_TARGET], 1.8, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_state[PS_WUYANG_LIFEBUOY_FX].append(getLastCreatedEntity())
    smallMessage(eventPlayer.player_state[PS_WUYANG_LIFEBUOY_TARGET], "救生圈套住了你")
    smallMessage(eventPlayer, "救生圈套索")
    while eventPlayer.player_state[PS_WUYANG_LIFEBUOY_LOCK] == true and eventPlayer.isAlive() == true and eventPlayer.getHero() == Hero.WUYANG and eventPlayer.player_state[PS_WUYANG_LIFEBUOY_TARGET] != null and eventPlayer.player_state[PS_WUYANG_LIFEBUOY_TARGET].isAlive() == true and eventPlayer.player_state[PS_WUYANG_LIFEBUOY_TARGET].player_state[PS_WUYANG_LIFEBUOY_OWNER] == eventPlayer and eventPlayer.player_state[PS_WUYANG_TICK] < 12:
        eventPlayer.player_state[PS_WUYANG_LIFEBUOY_TARGET].applyImpulse(directionTowards(eventPlayer.player_state[PS_WUYANG_LIFEBUOY_TARGET].getPosition(), eventPlayer.getPosition()) + Vector.UP * 0.04, 11, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
        if eventPlayer.player_state[PS_WUYANG_TICK] % 3 == 0:
            playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.AQUA, eventPlayer.player_state[PS_WUYANG_LIFEBUOY_TARGET], 0.8)
        eventPlayer.player_state[PS_WUYANG_TICK] += 1
        wait(0.25)
    if eventPlayer.player_state[PS_WUYANG_LIFEBUOY_TARGET] != null and eventPlayer.player_state[PS_WUYANG_LIFEBUOY_TARGET].player_state[PS_WUYANG_LIFEBUOY_OWNER] == eventPlayer:
        if distance(eventPlayer.player_state[PS_WUYANG_LIFEBUOY_TARGET], eventPlayer) > 15:
            smallMessage(eventPlayer.player_state[PS_WUYANG_LIFEBUOY_TARGET], "挣脱救生圈")
            smallMessage(eventPlayer, "套索挣脱")
        else:
            eventPlayer.player_state[PS_WUYANG_TIDE_VALUE] += 10
            if eventPlayer.player_state[PS_WUYANG_TIDE_VALUE] > 100:
                eventPlayer.player_state[PS_WUYANG_TIDE_VALUE] = 100
            smallMessage(eventPlayer, "潮汐 +10")
        eventPlayer.player_state[PS_WUYANG_LIFEBUOY_TARGET].player_state[PS_WUYANG_LIFEBUOY_OWNER] = null
    if len(eventPlayer.player_state[PS_WUYANG_LIFEBUOY_FX]) > 0:
        destroyEffect(eventPlayer.player_state[PS_WUYANG_LIFEBUOY_FX][0])
    if len(eventPlayer.player_state[PS_WUYANG_LIFEBUOY_FX]) > 1:
        destroyEffect(eventPlayer.player_state[PS_WUYANG_LIFEBUOY_FX][1])
    if len(eventPlayer.player_state[PS_WUYANG_LIFEBUOY_FX]) > 2:
        destroyEffect(eventPlayer.player_state[PS_WUYANG_LIFEBUOY_FX][2])
    eventPlayer.player_state[PS_WUYANG_LIFEBUOY_FX] = []
    eventPlayer.player_state[PS_WUYANG_LIFEBUOY_LOCK] = false
    eventPlayer.player_state[PS_WUYANG_LIFEBUOY_TARGET] = null
    eventPlayer.player_state[PS_WUYANG_TICK] = 0
    wait(2)


rule "[wuyang] clear temporary target states":
    @Event eachPlayer
    @Condition eventPlayer.player_state[PS_WUYANG_TARGET_HIT_SOURCE] != null or eventPlayer.player_state[PS_WUYANG_TARGET_SLOW_ACTIVE] == true

    wait(2)
    eventPlayer.setMoveSpeed(100)
    eventPlayer.player_state[PS_WUYANG_TARGET_HIT_SOURCE] = null
    eventPlayer.player_state[PS_WUYANG_TARGET_SLOW_ACTIVE] = false


rule "[wuyang] clear lifebuoy target cooldown":
    @Event eachPlayer
    @Condition eventPlayer.player_state[PS_WUYANG_LIFEBUOY_TARGET_CD] == true

    wait(5.5)
    eventPlayer.player_state[PS_WUYANG_LIFEBUOY_TARGET_CD] = false


rule "[wuyang] clear temporary states on death":
    @Event playerDied
    @Hero wuyang

    if len(eventPlayer.player_state[PS_WUYANG_SURF_FX]) > 0:
        destroyEffect(eventPlayer.player_state[PS_WUYANG_SURF_FX][0])
    if len(eventPlayer.player_state[PS_WUYANG_SURF_FX]) > 1:
        destroyEffect(eventPlayer.player_state[PS_WUYANG_SURF_FX][1])
    if len(eventPlayer.player_state[PS_WUYANG_SURF_FX]) > 2:
        destroyEffect(eventPlayer.player_state[PS_WUYANG_SURF_FX][2])
    if len(eventPlayer.player_state[PS_WUYANG_LIFEBUOY_FX]) > 0:
        destroyEffect(eventPlayer.player_state[PS_WUYANG_LIFEBUOY_FX][0])
    if len(eventPlayer.player_state[PS_WUYANG_LIFEBUOY_FX]) > 1:
        destroyEffect(eventPlayer.player_state[PS_WUYANG_LIFEBUOY_FX][1])
    if len(eventPlayer.player_state[PS_WUYANG_LIFEBUOY_FX]) > 2:
        destroyEffect(eventPlayer.player_state[PS_WUYANG_LIFEBUOY_FX][2])
    getAllPlayers().filter(lambda player: player.player_state[PS_WUYANG_TARGET_HIT_SOURCE] == eventPlayer or player.player_state[PS_WUYANG_LIFEBUOY_OWNER] == eventPlayer).setMoveSpeed(100)
    getAllPlayers().filter(lambda player: player.player_state[PS_WUYANG_TARGET_HIT_SOURCE] == eventPlayer).player_state[PS_WUYANG_TARGET_HIT_SOURCE] = null
    getAllPlayers().filter(lambda player: player.player_state[PS_WUYANG_LIFEBUOY_OWNER] == eventPlayer).player_state[PS_WUYANG_LIFEBUOY_OWNER] = null
    eventPlayer.player_state[PS_WUYANG_SURF_LOCK] = false
    eventPlayer.player_state[PS_WUYANG_SURF_DIR] = null
    eventPlayer.player_state[PS_WUYANG_SURF_FX] = []
    eventPlayer.player_state[PS_WUYANG_TICK] = 0
    eventPlayer.player_state[PS_WUYANG_LIFEBUOY_LOCK] = false
    eventPlayer.player_state[PS_WUYANG_LIFEBUOY_TARGET] = null
    eventPlayer.player_state[PS_WUYANG_LIFEBUOY_FX] = []


rule "[wuyang] clear all state after hero swap":
    @Event eachPlayer
    @Condition eventPlayer.getHero() != Hero.WUYANG
    @Condition eventPlayer.player_state[PS_WUYANG_SURF_LOCK] == true or len(eventPlayer.player_state[PS_WUYANG_SURF_FX]) > 0 or eventPlayer.player_state[PS_WUYANG_LIFEBUOY_LOCK] == true or len(eventPlayer.player_state[PS_WUYANG_LIFEBUOY_FX]) > 0 or eventPlayer.player_state[PS_WUYANG_TIDE_VALUE] > 0 or eventPlayer.player_state[PS_WUYANG_TIDE_HUD_CREATED] == true or eventPlayer.player_state[PS_WUYANG_TIDE_HUD_ID] != null

    if len(eventPlayer.player_state[PS_WUYANG_SURF_FX]) > 0:
        destroyEffect(eventPlayer.player_state[PS_WUYANG_SURF_FX][0])
    if len(eventPlayer.player_state[PS_WUYANG_SURF_FX]) > 1:
        destroyEffect(eventPlayer.player_state[PS_WUYANG_SURF_FX][1])
    if len(eventPlayer.player_state[PS_WUYANG_SURF_FX]) > 2:
        destroyEffect(eventPlayer.player_state[PS_WUYANG_SURF_FX][2])
    if len(eventPlayer.player_state[PS_WUYANG_LIFEBUOY_FX]) > 0:
        destroyEffect(eventPlayer.player_state[PS_WUYANG_LIFEBUOY_FX][0])
    if len(eventPlayer.player_state[PS_WUYANG_LIFEBUOY_FX]) > 1:
        destroyEffect(eventPlayer.player_state[PS_WUYANG_LIFEBUOY_FX][1])
    if len(eventPlayer.player_state[PS_WUYANG_LIFEBUOY_FX]) > 2:
        destroyEffect(eventPlayer.player_state[PS_WUYANG_LIFEBUOY_FX][2])
    if eventPlayer.player_state[PS_WUYANG_TIDE_HUD_ID] != null:
        destroyHudText(eventPlayer.player_state[PS_WUYANG_TIDE_HUD_ID])
    getAllPlayers().filter(lambda player: player.player_state[PS_WUYANG_TARGET_HIT_SOURCE] == eventPlayer or player.player_state[PS_WUYANG_LIFEBUOY_OWNER] == eventPlayer).setMoveSpeed(100)
    getAllPlayers().filter(lambda player: player.player_state[PS_WUYANG_TARGET_HIT_SOURCE] == eventPlayer).player_state[PS_WUYANG_TARGET_HIT_SOURCE] = null
    getAllPlayers().filter(lambda player: player.player_state[PS_WUYANG_LIFEBUOY_OWNER] == eventPlayer).player_state[PS_WUYANG_LIFEBUOY_OWNER] = null
    eventPlayer.player_state[PS_WUYANG_SURF_LOCK] = false
    eventPlayer.player_state[PS_WUYANG_SURF_DIR] = null
    eventPlayer.player_state[PS_WUYANG_SURF_FX] = []
    eventPlayer.player_state[PS_WUYANG_TICK] = 0
    eventPlayer.player_state[PS_WUYANG_LIFEBUOY_LOCK] = false
    eventPlayer.player_state[PS_WUYANG_LIFEBUOY_TARGET] = null
    eventPlayer.player_state[PS_WUYANG_LIFEBUOY_FX] = []
    eventPlayer.player_state[PS_WUYANG_TIDE_HUD_ID] = null
    eventPlayer.player_state[PS_WUYANG_TIDE_VALUE] = 0
    eventPlayer.player_state[PS_WUYANG_TIDE_HUD_CREATED] = false


rule "[domina] initialize adjudication state":
    @Event eachPlayer
    @Hero domina
    @Condition eventPlayer.player_state[PS_DOMINA_ADJUDICATION] == null or eventPlayer.player_state[PS_DOMINA_BARRIER_FX] == null

    eventPlayer.player_state[PS_DOMINA_ADJUDICATION] = 0
    eventPlayer.player_state[PS_DOMINA_HUD_CREATED] = false
    eventPlayer.player_state[PS_DOMINA_HUD_ID] = null
    eventPlayer.player_state[PS_DOMINA_BARRIER_ACTIVE] = false
    eventPlayer.player_state[PS_DOMINA_BARRIER_POS] = null
    eventPlayer.player_state[PS_DOMINA_BARRIER_DIR] = null
    eventPlayer.player_state[PS_DOMINA_BARRIER_FX] = []
    eventPlayer.player_state[PS_DOMINA_CRYSTAL_ACTIVE] = false
    eventPlayer.player_state[PS_DOMINA_CRYSTAL_POS] = null
    eventPlayer.player_state[PS_DOMINA_CRYSTAL_FX] = []
    eventPlayer.player_state[PS_DOMINA_CRYSTAL_CHARGE] = 0
    eventPlayer.player_state[PS_DOMINA_CAGE_ACTIVE] = false
    eventPlayer.player_state[PS_DOMINA_CAGE_POS] = null
    eventPlayer.player_state[PS_DOMINA_CAGE_FX] = []
    eventPlayer.player_state[PS_DOMINA_TICK] = 0


rule "[domina] create adjudication hud":
    @Event eachPlayer
    @Hero domina
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.player_state[PS_DOMINA_HUD_CREATED] == false

    eventPlayer.player_state[PS_DOMINA_HUD_CREATED] = true
    hudHeader(eventPlayer, "裁定：{}/100".format(eventPlayer.player_state[PS_DOMINA_ADJUDICATION]), HudPosition.RIGHT, -834, Color.YELLOW, HudReeval.VISIBILITY_AND_STRING)
    eventPlayer.player_state[PS_DOMINA_HUD_ID] = getLastCreatedText()


rule "[domina] barrier array or panopticon":
    @Event eachPlayer
    @Hero domina
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.player_state[PS_DOMINA_BARRIER_ACTIVE] == false
    @Condition eventPlayer.player_state[PS_DOMINA_CAGE_ACTIVE] == false
    @Condition eventPlayer.isFiringSecondaryFire() == true

    if eventPlayer.player_state[PS_DOMINA_ADJUDICATION] >= 100:
        eventPlayer.player_state[PS_DOMINA_ADJUDICATION] = 0
        eventPlayer.player_state[PS_DOMINA_CAGE_ACTIVE] = true
        eventPlayer.player_state[PS_DOMINA_CAGE_POS] = nearestWalkablePosition(raycast(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * 28, getAllPlayers(), getAllPlayers(), false).getHitPosition())
        eventPlayer.player_state[PS_DOMINA_CAGE_FX] = []
        eventPlayer.player_state[PS_DOMINA_TICK] = 0
        bigMessage(getPlayersInRadius(eventPlayer.player_state[PS_DOMINA_CAGE_POS], 13, Team.ALL, LosCheck.SURFACES), "全景牢笼")
        createEffect(getAllPlayers(), Effect.BAD_AURA, Color.YELLOW, eventPlayer.player_state[PS_DOMINA_CAGE_POS], 6.2, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
        eventPlayer.player_state[PS_DOMINA_CAGE_FX].append(getLastCreatedEntity())
        createEffect(getAllPlayers(), Effect.GOOD_AURA, Color.ORANGE, eventPlayer.player_state[PS_DOMINA_CAGE_POS], 3.4, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
        eventPlayer.player_state[PS_DOMINA_CAGE_FX].append(getLastCreatedEntity())
        createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Color.YELLOW, eventPlayer.player_state[PS_DOMINA_CAGE_POS], 4.6, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
        eventPlayer.player_state[PS_DOMINA_CAGE_FX].append(getLastCreatedEntity())
        wait(1)
        while eventPlayer.player_state[PS_DOMINA_CAGE_ACTIVE] == true and eventPlayer.isAlive() == true and eventPlayer.getHero() == Hero.DOMINA and eventPlayer.player_state[PS_DOMINA_TICK] < 10:
            getPlayersInRadius(eventPlayer.player_state[PS_DOMINA_CAGE_POS], 6.2, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).applyImpulse(directionTowards(getPlayersInRadius(eventPlayer.player_state[PS_DOMINA_CAGE_POS], 6.2, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).getPosition(), eventPlayer.player_state[PS_DOMINA_CAGE_POS]) + Vector.UP * 0.02, 4.2, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
            eventPlayer.player_state[PS_DOMINA_TICK] += 1
            wait(0.25)
        if eventPlayer.isAlive() == true and eventPlayer.getHero() == Hero.DOMINA:
            damage(getPlayersInRadius(eventPlayer.player_state[PS_DOMINA_CAGE_POS], 3.2, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())), eventPlayer, 50)
            getPlayersInRadius(eventPlayer.player_state[PS_DOMINA_CAGE_POS], 3.2, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).setStatusEffect(eventPlayer, Status.KNOCKED_DOWN, 0.7)
            damage(getPlayersInRadius(eventPlayer.player_state[PS_DOMINA_CAGE_POS], 6.2, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and distance(player, eventPlayer.player_state[PS_DOMINA_CAGE_POS]) > 3.2 and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())), eventPlayer, 25)
            getPlayersInRadius(eventPlayer.player_state[PS_DOMINA_CAGE_POS], 6.2, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and distance(player, eventPlayer.player_state[PS_DOMINA_CAGE_POS]) > 3.2 and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).setMoveSpeed(70)
            getPlayersInRadius(eventPlayer.player_state[PS_DOMINA_CAGE_POS], 6.2, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and distance(player, eventPlayer.player_state[PS_DOMINA_CAGE_POS]) > 3.2 and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).player_state[PS_DOMINA_TEMP_SLOW_ACTIVE] = true
            playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, Color.YELLOW, eventPlayer.player_state[PS_DOMINA_CAGE_POS], 4.4)
        if len(eventPlayer.player_state[PS_DOMINA_CAGE_FX]) > 0:
            destroyEffect(eventPlayer.player_state[PS_DOMINA_CAGE_FX][0])
        if len(eventPlayer.player_state[PS_DOMINA_CAGE_FX]) > 1:
            destroyEffect(eventPlayer.player_state[PS_DOMINA_CAGE_FX][1])
        if len(eventPlayer.player_state[PS_DOMINA_CAGE_FX]) > 2:
            destroyEffect(eventPlayer.player_state[PS_DOMINA_CAGE_FX][2])
        eventPlayer.player_state[PS_DOMINA_CAGE_FX] = []
        eventPlayer.player_state[PS_DOMINA_CAGE_POS] = null
        eventPlayer.player_state[PS_DOMINA_TICK] = 0
        wait(2)
        eventPlayer.player_state[PS_DOMINA_CAGE_ACTIVE] = false
    else:
        eventPlayer.player_state[PS_DOMINA_BARRIER_ACTIVE] = true
        eventPlayer.player_state[PS_DOMINA_BARRIER_POS] = nearestWalkablePosition(eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * 6.5)
        eventPlayer.player_state[PS_DOMINA_BARRIER_DIR] = eventPlayer.getFacingDirection()
        eventPlayer.player_state[PS_DOMINA_BARRIER_FX] = []
        smallMessage(getPlayersInRadius(eventPlayer.player_state[PS_DOMINA_BARRIER_POS], 8, Team.ALL, LosCheck.SURFACES), "屏障阵列预告")
        createBeam(getAllPlayers(), Beam.GOOD, eventPlayer.player_state[PS_DOMINA_BARRIER_POS] - eventPlayer.player_state[PS_DOMINA_BARRIER_DIR] * 3 + Vector.UP * 0.25, eventPlayer.player_state[PS_DOMINA_BARRIER_POS] + eventPlayer.player_state[PS_DOMINA_BARRIER_DIR] * 3 + Vector.UP * 0.25, Color.YELLOW, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
        eventPlayer.player_state[PS_DOMINA_BARRIER_FX].append(getLastCreatedEntity())
        createEffect(getAllPlayers(), Effect.GOOD_AURA, Color.YELLOW, eventPlayer.player_state[PS_DOMINA_BARRIER_POS], 3.2, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
        eventPlayer.player_state[PS_DOMINA_BARRIER_FX].append(getLastCreatedEntity())
        createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Color.ORANGE, eventPlayer.player_state[PS_DOMINA_BARRIER_POS], 2.4, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
        eventPlayer.player_state[PS_DOMINA_BARRIER_FX].append(getLastCreatedEntity())
        wait(0.55)
        eventPlayer.player_state[PS_DOMINA_TICK] = 0
        while eventPlayer.player_state[PS_DOMINA_BARRIER_ACTIVE] == true and eventPlayer.isAlive() == true and eventPlayer.getHero() == Hero.DOMINA and eventPlayer.player_state[PS_DOMINA_TICK] < 12:
            getPlayersInRadius(eventPlayer.player_state[PS_DOMINA_BARRIER_POS], 3.8, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and player.player_state[PS_DOMINA_BARRIER_TARGET_CD] == false and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).player_state[PS_DOMINA_BARRIER_TARGET_CD] = true
            getPlayersInRadius(eventPlayer.player_state[PS_DOMINA_BARRIER_POS], 3.8, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and player.player_state[PS_DOMINA_BARRIER_TARGET_CD] == true and player.player_state[PS_DOMINA_TEMP_SLOW_ACTIVE] == false and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).setMoveSpeed(72)
            getPlayersInRadius(eventPlayer.player_state[PS_DOMINA_BARRIER_POS], 3.8, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and player.player_state[PS_DOMINA_BARRIER_TARGET_CD] == true and player.player_state[PS_DOMINA_TEMP_SLOW_ACTIVE] == false and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).player_state[PS_DOMINA_TEMP_SLOW_ACTIVE] = true
            getPlayersInRadius(eventPlayer.player_state[PS_DOMINA_BARRIER_POS], 2.2, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).applyImpulse(directionTowards(eventPlayer.player_state[PS_DOMINA_BARRIER_POS], getPlayersInRadius(eventPlayer.player_state[PS_DOMINA_BARRIER_POS], 2.2, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).getPosition()) + Vector.UP * 0.08, 7, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
            eventPlayer.player_state[PS_DOMINA_TICK] += 1
            wait(0.25)
        if len(eventPlayer.player_state[PS_DOMINA_BARRIER_FX]) > 0:
            destroyEffect(eventPlayer.player_state[PS_DOMINA_BARRIER_FX][0])
        if len(eventPlayer.player_state[PS_DOMINA_BARRIER_FX]) > 1:
            destroyEffect(eventPlayer.player_state[PS_DOMINA_BARRIER_FX][1])
        if len(eventPlayer.player_state[PS_DOMINA_BARRIER_FX]) > 2:
            destroyEffect(eventPlayer.player_state[PS_DOMINA_BARRIER_FX][2])
        eventPlayer.player_state[PS_DOMINA_BARRIER_FX] = []
        eventPlayer.player_state[PS_DOMINA_BARRIER_POS] = null
        eventPlayer.player_state[PS_DOMINA_BARRIER_DIR] = null
        eventPlayer.player_state[PS_DOMINA_TICK] = 0
        wait(1.5)
        eventPlayer.player_state[PS_DOMINA_BARRIER_ACTIVE] = false


rule "[domina] explosive crystal":
    @Event eachPlayer
    @Hero domina
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.player_state[PS_DOMINA_CRYSTAL_ACTIVE] == false
    @Condition eventPlayer.isUsingAbility2() == true

    eventPlayer.player_state[PS_DOMINA_CRYSTAL_ACTIVE] = true
    eventPlayer.player_state[PS_DOMINA_CRYSTAL_POS] = nearestWalkablePosition(raycast(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * 30, getAllPlayers(), getAllPlayers(), false).getHitPosition())
    eventPlayer.player_state[PS_DOMINA_CRYSTAL_FX] = []
    eventPlayer.player_state[PS_DOMINA_CRYSTAL_CHARGE] = 0
    eventPlayer.player_state[PS_DOMINA_TICK] = 0
    createEffect(getAllPlayers(), Effect.GOOD_AURA, Color.YELLOW, eventPlayer.player_state[PS_DOMINA_CRYSTAL_POS], 3.4, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_state[PS_DOMINA_CRYSTAL_FX].append(getLastCreatedEntity())
    createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Color.ORANGE, eventPlayer.player_state[PS_DOMINA_CRYSTAL_POS], 2.6, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_state[PS_DOMINA_CRYSTAL_FX].append(getLastCreatedEntity())
    smallMessage(getPlayersInRadius(eventPlayer.player_state[PS_DOMINA_CRYSTAL_POS], 7, Team.ALL, LosCheck.SURFACES), "爆能水晶")
    wait(0.8)
    while eventPlayer.player_state[PS_DOMINA_CRYSTAL_ACTIVE] == true and eventPlayer.isAlive() == true and eventPlayer.getHero() == Hero.DOMINA and eventPlayer.player_state[PS_DOMINA_TICK] < 16 and eventPlayer.player_state[PS_DOMINA_CRYSTAL_CHARGE] < 4:
        if len(getPlayersInRadius(eventPlayer.player_state[PS_DOMINA_CRYSTAL_POS], 3.4, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and player.player_state[PS_DOMINA_CRYSTAL_TARGET_CD] == false and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam()))) > 0:
            getPlayersInRadius(eventPlayer.player_state[PS_DOMINA_CRYSTAL_POS], 3.4, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and player.player_state[PS_DOMINA_CRYSTAL_TARGET_CD] == false and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).player_state[PS_DOMINA_CRYSTAL_TARGET_CD] = true
            eventPlayer.player_state[PS_DOMINA_CRYSTAL_CHARGE] += 1
            playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.YELLOW, eventPlayer.player_state[PS_DOMINA_CRYSTAL_POS], 1.2)
            smallMessage(eventPlayer, "水晶充能")
        eventPlayer.player_state[PS_DOMINA_TICK] += 1
        wait(0.25)
    if eventPlayer.isAlive() == true and eventPlayer.getHero() == Hero.DOMINA and eventPlayer.player_state[PS_DOMINA_CRYSTAL_CHARGE] > 0:
        damage(getPlayersInRadius(eventPlayer.player_state[PS_DOMINA_CRYSTAL_POS], 3.8, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())), eventPlayer, 16 + eventPlayer.player_state[PS_DOMINA_CRYSTAL_CHARGE] * 6)
        getPlayersInRadius(eventPlayer.player_state[PS_DOMINA_CRYSTAL_POS], 3.8, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).setMoveSpeed(72)
        getPlayersInRadius(eventPlayer.player_state[PS_DOMINA_CRYSTAL_POS], 3.8, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).player_state[PS_DOMINA_TEMP_SLOW_ACTIVE] = true
        heal(eventPlayer, null, 12 + eventPlayer.player_state[PS_DOMINA_CRYSTAL_CHARGE] * 4)
        eventPlayer.player_state[PS_DOMINA_ADJUDICATION] += 10 + eventPlayer.player_state[PS_DOMINA_CRYSTAL_CHARGE] * 5
        if eventPlayer.player_state[PS_DOMINA_ADJUDICATION] > 100:
            eventPlayer.player_state[PS_DOMINA_ADJUDICATION] = 100
        if eventPlayer.player_state[PS_DOMINA_ADJUDICATION] >= 100:
            smallMessage(eventPlayer, "全景牢笼就绪")
        playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, Color.YELLOW, eventPlayer.player_state[PS_DOMINA_CRYSTAL_POS], 3)
    if len(eventPlayer.player_state[PS_DOMINA_CRYSTAL_FX]) > 0:
        destroyEffect(eventPlayer.player_state[PS_DOMINA_CRYSTAL_FX][0])
    if len(eventPlayer.player_state[PS_DOMINA_CRYSTAL_FX]) > 1:
        destroyEffect(eventPlayer.player_state[PS_DOMINA_CRYSTAL_FX][1])
    eventPlayer.player_state[PS_DOMINA_CRYSTAL_FX] = []
    eventPlayer.player_state[PS_DOMINA_CRYSTAL_POS] = null
    eventPlayer.player_state[PS_DOMINA_CRYSTAL_CHARGE] = 0
    eventPlayer.player_state[PS_DOMINA_TICK] = 0
    wait(2)
    eventPlayer.player_state[PS_DOMINA_CRYSTAL_ACTIVE] = false


rule "[domina] sonic repulsor melee":
    @Event playerDealtDamage
    @Hero domina
    @Condition eventAbility == Button.MELEE
    @Condition victim.player_state[PS_DOMINA_REPULSOR_TARGET_CD] == false

    victim.player_state[PS_DOMINA_REPULSOR_TARGET_CD] = true
    victim.applyImpulse(eventPlayer.getFacingDirection() + Vector.UP * 0.1, 13, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
    eventPlayer.player_state[PS_DOMINA_ADJUDICATION] += 15
    if eventPlayer.player_state[PS_DOMINA_BARRIER_ACTIVE] == true and eventPlayer.player_state[PS_DOMINA_BARRIER_POS] != null and distance(victim, eventPlayer.player_state[PS_DOMINA_BARRIER_POS]) <= 4.5:
        damage(victim, eventPlayer, 20)
        victim.setStatusEffect(eventPlayer, Status.STUNNED, 0.45)
        eventPlayer.player_state[PS_DOMINA_ADJUDICATION] += 25
        smallMessage(eventPlayer, "撞上阵列")
        smallMessage(victim, "费斯卡裁定")
        playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.YELLOW, victim, 1.6)
    elif eventPlayer.player_state[PS_DOMINA_CRYSTAL_ACTIVE] == true and eventPlayer.player_state[PS_DOMINA_CRYSTAL_POS] != null and distance(victim, eventPlayer.player_state[PS_DOMINA_CRYSTAL_POS]) <= 4.5:
        eventPlayer.player_state[PS_DOMINA_CRYSTAL_CHARGE] += 1
        eventPlayer.player_state[PS_DOMINA_ADJUDICATION] += 20
        smallMessage(eventPlayer, "水晶充能")
        playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.ORANGE, victim, 1.4)
    else:
        smallMessage(eventPlayer, "裁定 +15")
    if eventPlayer.player_state[PS_DOMINA_ADJUDICATION] > 100:
        eventPlayer.player_state[PS_DOMINA_ADJUDICATION] = 100
    if eventPlayer.player_state[PS_DOMINA_ADJUDICATION] >= 100:
        smallMessage(eventPlayer, "全景牢笼就绪")
    wait(0.7)
    victim.player_state[PS_DOMINA_REPULSOR_TARGET_CD] = false


rule "[domina] clear target temporary states":
    @Event eachPlayer
    @Condition eventPlayer.player_state[PS_DOMINA_BARRIER_TARGET_CD] == true or eventPlayer.player_state[PS_DOMINA_CRYSTAL_TARGET_CD] == true or eventPlayer.player_state[PS_DOMINA_TEMP_SLOW_ACTIVE] == true

    wait(1.2)
    eventPlayer.setMoveSpeed(100)
    eventPlayer.player_state[PS_DOMINA_BARRIER_TARGET_CD] = false
    eventPlayer.player_state[PS_DOMINA_CRYSTAL_TARGET_CD] = false
    eventPlayer.player_state[PS_DOMINA_TEMP_SLOW_ACTIVE] = false


rule "[domina] clear temporary states on death":
    @Event playerDied
    @Hero domina

    if len(eventPlayer.player_state[PS_DOMINA_BARRIER_FX]) > 0:
        destroyEffect(eventPlayer.player_state[PS_DOMINA_BARRIER_FX][0])
    if len(eventPlayer.player_state[PS_DOMINA_BARRIER_FX]) > 1:
        destroyEffect(eventPlayer.player_state[PS_DOMINA_BARRIER_FX][1])
    if len(eventPlayer.player_state[PS_DOMINA_BARRIER_FX]) > 2:
        destroyEffect(eventPlayer.player_state[PS_DOMINA_BARRIER_FX][2])
    if len(eventPlayer.player_state[PS_DOMINA_CRYSTAL_FX]) > 0:
        destroyEffect(eventPlayer.player_state[PS_DOMINA_CRYSTAL_FX][0])
    if len(eventPlayer.player_state[PS_DOMINA_CRYSTAL_FX]) > 1:
        destroyEffect(eventPlayer.player_state[PS_DOMINA_CRYSTAL_FX][1])
    if len(eventPlayer.player_state[PS_DOMINA_CAGE_FX]) > 0:
        destroyEffect(eventPlayer.player_state[PS_DOMINA_CAGE_FX][0])
    if len(eventPlayer.player_state[PS_DOMINA_CAGE_FX]) > 1:
        destroyEffect(eventPlayer.player_state[PS_DOMINA_CAGE_FX][1])
    if len(eventPlayer.player_state[PS_DOMINA_CAGE_FX]) > 2:
        destroyEffect(eventPlayer.player_state[PS_DOMINA_CAGE_FX][2])
    eventPlayer.player_state[PS_DOMINA_BARRIER_ACTIVE] = false
    eventPlayer.player_state[PS_DOMINA_BARRIER_POS] = null
    eventPlayer.player_state[PS_DOMINA_BARRIER_DIR] = null
    eventPlayer.player_state[PS_DOMINA_BARRIER_FX] = []
    eventPlayer.player_state[PS_DOMINA_CRYSTAL_ACTIVE] = false
    eventPlayer.player_state[PS_DOMINA_CRYSTAL_POS] = null
    eventPlayer.player_state[PS_DOMINA_CRYSTAL_FX] = []
    eventPlayer.player_state[PS_DOMINA_CRYSTAL_CHARGE] = 0
    eventPlayer.player_state[PS_DOMINA_CAGE_ACTIVE] = false
    eventPlayer.player_state[PS_DOMINA_CAGE_POS] = null
    eventPlayer.player_state[PS_DOMINA_CAGE_FX] = []
    eventPlayer.player_state[PS_DOMINA_TICK] = 0


rule "[domina] clear all state after hero swap":
    @Event eachPlayer
    @Condition eventPlayer.getHero() != Hero.DOMINA
    @Condition eventPlayer.player_state[PS_DOMINA_ADJUDICATION] > 0 or eventPlayer.player_state[PS_DOMINA_HUD_CREATED] == true or eventPlayer.player_state[PS_DOMINA_BARRIER_ACTIVE] == true or len(eventPlayer.player_state[PS_DOMINA_BARRIER_FX]) > 0 or eventPlayer.player_state[PS_DOMINA_CRYSTAL_ACTIVE] == true or len(eventPlayer.player_state[PS_DOMINA_CRYSTAL_FX]) > 0 or eventPlayer.player_state[PS_DOMINA_CAGE_ACTIVE] == true or len(eventPlayer.player_state[PS_DOMINA_CAGE_FX]) > 0

    if eventPlayer.player_state[PS_DOMINA_HUD_CREATED] == true and eventPlayer.player_state[PS_DOMINA_HUD_ID] != null:
        destroyHudText(eventPlayer.player_state[PS_DOMINA_HUD_ID])
    if len(eventPlayer.player_state[PS_DOMINA_BARRIER_FX]) > 0:
        destroyEffect(eventPlayer.player_state[PS_DOMINA_BARRIER_FX][0])
    if len(eventPlayer.player_state[PS_DOMINA_BARRIER_FX]) > 1:
        destroyEffect(eventPlayer.player_state[PS_DOMINA_BARRIER_FX][1])
    if len(eventPlayer.player_state[PS_DOMINA_BARRIER_FX]) > 2:
        destroyEffect(eventPlayer.player_state[PS_DOMINA_BARRIER_FX][2])
    if len(eventPlayer.player_state[PS_DOMINA_CRYSTAL_FX]) > 0:
        destroyEffect(eventPlayer.player_state[PS_DOMINA_CRYSTAL_FX][0])
    if len(eventPlayer.player_state[PS_DOMINA_CRYSTAL_FX]) > 1:
        destroyEffect(eventPlayer.player_state[PS_DOMINA_CRYSTAL_FX][1])
    if len(eventPlayer.player_state[PS_DOMINA_CAGE_FX]) > 0:
        destroyEffect(eventPlayer.player_state[PS_DOMINA_CAGE_FX][0])
    if len(eventPlayer.player_state[PS_DOMINA_CAGE_FX]) > 1:
        destroyEffect(eventPlayer.player_state[PS_DOMINA_CAGE_FX][1])
    if len(eventPlayer.player_state[PS_DOMINA_CAGE_FX]) > 2:
        destroyEffect(eventPlayer.player_state[PS_DOMINA_CAGE_FX][2])
    eventPlayer.player_state[PS_DOMINA_ADJUDICATION] = 0
    eventPlayer.player_state[PS_DOMINA_HUD_CREATED] = false
    eventPlayer.player_state[PS_DOMINA_HUD_ID] = null
    eventPlayer.player_state[PS_DOMINA_BARRIER_ACTIVE] = false
    eventPlayer.player_state[PS_DOMINA_BARRIER_POS] = null
    eventPlayer.player_state[PS_DOMINA_BARRIER_DIR] = null
    eventPlayer.player_state[PS_DOMINA_BARRIER_FX] = []
    eventPlayer.player_state[PS_DOMINA_CRYSTAL_ACTIVE] = false
    eventPlayer.player_state[PS_DOMINA_CRYSTAL_POS] = null
    eventPlayer.player_state[PS_DOMINA_CRYSTAL_FX] = []
    eventPlayer.player_state[PS_DOMINA_CRYSTAL_CHARGE] = 0
    eventPlayer.player_state[PS_DOMINA_CAGE_ACTIVE] = false
    eventPlayer.player_state[PS_DOMINA_CAGE_POS] = null
    eventPlayer.player_state[PS_DOMINA_CAGE_FX] = []
    eventPlayer.player_state[PS_DOMINA_TICK] = 0


rule "[emre] initialize humanity state":
    @Event eachPlayer
    @Hero emre
    @Condition eventPlayer.player_state[PS_EMRE_HUMANITY] == null or eventPlayer.player_state[PS_EMRE_HUD_ID] == null

    eventPlayer.player_state[PS_EMRE_HUMANITY] = 100
    eventPlayer.player_state[PS_EMRE_HUD_CREATED] = false
    eventPlayer.player_state[PS_EMRE_HUD_ID] = null
    eventPlayer.player_state[PS_EMRE_SIPHON_ACTIVE] = false
    eventPlayer.player_state[PS_EMRE_SIPHON_CD] = false
    eventPlayer.player_state[PS_EMRE_GRENADE_LOCK] = false
    eventPlayer.player_state[PS_EMRE_GRENADE_POS] = null
    eventPlayer.player_state[PS_EMRE_GRENADE_FX] = []
    eventPlayer.player_state[PS_EMRE_DAMAGE_TOKEN] = 0
    eventPlayer.player_state[PS_EMRE_RECOVERY_ACTIVE] = false
    eventPlayer.player_state[PS_EMRE_RECOVERY_SNAPSHOT] = 0
    eventPlayer.player_state[PS_EMRE_SELF_DESTRUCT_FX] = []
    eventPlayer.player_state[283] = false
    eventPlayer.player_state[PS_EMRE_SELF_DESTRUCTING] = false
    eventPlayer.player_state[PS_EMRE_SIPHON_FX] = []
    eventPlayer.player_state[PS_EMRE_ALIVE_SEEN] = false
    eventPlayer.player_state[PS_EMRE_TEMP_TARGETS] = []


rule "[emre] disable primary fire":
    @Event eachPlayer
    @Hero emre
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.player_state[283] == false
    @Condition eventPlayer.getUltCharge() < 100

    eventPlayer.disallowButton(Button.PRIMARY_FIRE)
    eventPlayer.player_state[283] = true


rule "[emre] restore primary fire during ultimate":
    @Event eachPlayer
    @Hero emre
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.getUltCharge() == 100
    @Condition eventPlayer.isHoldingButton(Button.ULTIMATE) == true

    eventPlayer.allowButton(Button.PRIMARY_FIRE)
    waitUntil(eventPlayer.getUltCharge() > 0 or eventPlayer.isAlive() == false or eventPlayer.getHero() != Hero.EMRE, 15)
    if eventPlayer.isAlive() == true and eventPlayer.getHero() == Hero.EMRE:
        eventPlayer.disallowButton(Button.PRIMARY_FIRE)


rule "[emre] create humanity hud":
    @Event eachPlayer
    @Hero emre
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.player_state[PS_EMRE_HUD_CREATED] == false

    eventPlayer.player_state[PS_EMRE_HUD_CREATED] = true
    hudHeader(eventPlayer, "人性：{}/100".format(eventPlayer.player_state[PS_EMRE_HUMANITY]), HudPosition.RIGHT, -836, Color.BLUE, HudReeval.VISIBILITY_AND_STRING)
    eventPlayer.player_state[PS_EMRE_HUD_ID] = getLastCreatedText()


rule "[emre] restore humanity on respawn":
    @Event eachPlayer
    @Hero emre
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.player_state[PS_EMRE_ALIVE_SEEN] == false

    eventPlayer.player_state[PS_EMRE_HUMANITY] = 100
    eventPlayer.player_state[PS_EMRE_ALIVE_SEEN] = true
    eventPlayer.player_state[PS_EMRE_SELF_DESTRUCTING] = false
    smallMessage(eventPlayer, "人性稳定")


rule "[emre] remember damage dealt":
    @Event playerDealtDamage
    @Hero emre

    eventPlayer.player_state[PS_EMRE_DAMAGE_TOKEN] += 1


rule "[emre] recover humanity after calm":
    @Event eachPlayer
    @Hero emre
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.player_state[PS_EMRE_HUMANITY] < 100
    @Condition eventPlayer.player_state[PS_EMRE_RECOVERY_ACTIVE] == false
    @Condition eventPlayer.player_state[PS_EMRE_SELF_DESTRUCTING] == false

    eventPlayer.player_state[PS_EMRE_RECOVERY_ACTIVE] = true
    eventPlayer.player_state[PS_EMRE_RECOVERY_SNAPSHOT] = eventPlayer.player_state[PS_EMRE_DAMAGE_TOKEN]
    wait(5)
    if eventPlayer.isAlive() == true and eventPlayer.getHero() == Hero.EMRE and eventPlayer.player_state[PS_EMRE_RECOVERY_SNAPSHOT] == eventPlayer.player_state[PS_EMRE_DAMAGE_TOKEN] and eventPlayer.player_state[PS_EMRE_HUMANITY] < 100:
        eventPlayer.player_state[PS_EMRE_HUMANITY] += 10
        if eventPlayer.player_state[PS_EMRE_HUMANITY] > 100:
            eventPlayer.player_state[PS_EMRE_HUMANITY] = 100
        smallMessage(eventPlayer, "人性恢复")
    wait(1)
    eventPlayer.player_state[PS_EMRE_RECOVERY_ACTIVE] = false


rule "[emre] recover humanity from health pack":
    @Event playerReceivedHealing
    @Hero emre
    @Condition eventWasHealthPack == true

    eventPlayer.player_state[PS_EMRE_HUMANITY] += 30 if eventHealing >= 75 else 18
    if eventPlayer.player_state[PS_EMRE_HUMANITY] > 100:
        eventPlayer.player_state[PS_EMRE_HUMANITY] = 100
    smallMessage(eventPlayer, "血包稳定人性")


rule "[emre] lose humanity on final blow":
    @Event playerDealtFinalBlow
    @Hero emre
    @Condition eventPlayer.isAlive() == true

    eventPlayer.player_state[PS_EMRE_HUMANITY] -= 25
    if eventPlayer.player_state[PS_EMRE_HUMANITY] < 0:
        eventPlayer.player_state[PS_EMRE_HUMANITY] = 0
    smallMessage(eventPlayer, "击杀侵蚀人性")


rule "[emre] siphon blaster window":
    @Event eachPlayer
    @Hero emre
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.player_state[PS_EMRE_SIPHON_CD] == false
    @Condition eventPlayer.isUsingAbility1() == true

    eventPlayer.player_state[PS_EMRE_SIPHON_CD] = true
    eventPlayer.player_state[PS_EMRE_SIPHON_ACTIVE] = true
    eventPlayer.player_state[PS_EMRE_HUMANITY] -= 8
    if eventPlayer.player_state[PS_EMRE_HUMANITY] < 0:
        eventPlayer.player_state[PS_EMRE_HUMANITY] = 0
    eventPlayer.player_state[PS_EMRE_SIPHON_FX] = []
    createEffect(getAllPlayers(), Effect.GOOD_AURA, Color.BLUE, eventPlayer, 2.2, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_state[PS_EMRE_SIPHON_FX].append(getLastCreatedEntity())
    createEffect(getAllPlayers(), Effect.BAD_AURA, Color.PURPLE, eventPlayer, 1.4, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_state[PS_EMRE_SIPHON_FX].append(getLastCreatedEntity())
    smallMessage(eventPlayer, "虹吸冲击枪")
    wait(3)
    if len(eventPlayer.player_state[PS_EMRE_SIPHON_FX]) > 0:
        destroyEffect(eventPlayer.player_state[PS_EMRE_SIPHON_FX][0])
    if len(eventPlayer.player_state[PS_EMRE_SIPHON_FX]) > 1:
        destroyEffect(eventPlayer.player_state[PS_EMRE_SIPHON_FX][1])
    eventPlayer.player_state[PS_EMRE_SIPHON_FX] = []
    eventPlayer.player_state[PS_EMRE_SIPHON_ACTIVE] = false
    wait(4)
    eventPlayer.player_state[PS_EMRE_SIPHON_CD] = false


rule "[emre] siphon close hit":
    @Event playerDealtDamage
    @Hero emre
    @Condition eventPlayer.player_state[PS_EMRE_SIPHON_ACTIVE] == true
    @Condition victim.player_state[PS_EMRE_SIPHON_TARGET_CD] == false
    @Condition distance(eventPlayer, victim) <= 8

    victim.player_state[PS_EMRE_SIPHON_TARGET_CD] = true
    heal(eventPlayer, null, 16 if eventPlayer.player_state[PS_EMRE_HUMANITY] <= 30 else 10)
    victim.applyImpulse(directionTowards(eventPlayer, victim) + Vector.UP * 0.12, 6, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.BLUE, victim, 1.2)
    eventPlayer.player_state[PS_EMRE_HUMANITY] -= 4
    if eventPlayer.player_state[PS_EMRE_HUMANITY] < 0:
        eventPlayer.player_state[PS_EMRE_HUMANITY] = 0
    smallMessage(eventPlayer, "虹吸命中")
    wait(0.7)
    victim.player_state[PS_EMRE_SIPHON_TARGET_CD] = false


rule "[emre] cyber frag grenade":
    @Event eachPlayer
    @Hero emre
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.player_state[PS_EMRE_GRENADE_LOCK] == false
    @Condition eventPlayer.isUsingAbility2() == true

    eventPlayer.player_state[PS_EMRE_GRENADE_LOCK] = true
    eventPlayer.player_state[PS_EMRE_HUMANITY] -= 12
    if eventPlayer.player_state[PS_EMRE_HUMANITY] < 0:
        eventPlayer.player_state[PS_EMRE_HUMANITY] = 0
    eventPlayer.player_state[PS_EMRE_GRENADE_POS] = nearestWalkablePosition(raycast(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * 28, getAllPlayers(), getAllPlayers(), false).getHitPosition())
    eventPlayer.player_state[PS_EMRE_GRENADE_FX] = []
    eventPlayer.player_state[PS_EMRE_TEMP_TARGETS] = 0
    createBeam(getAllPlayers(), Beam.BAD, eventPlayer.getEyePosition(), eventPlayer.player_state[PS_EMRE_GRENADE_POS] + Vector.UP * 0.25, Color.BLUE, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_state[PS_EMRE_GRENADE_FX].append(getLastCreatedEntity())
    createEffect(getAllPlayers(), Effect.GOOD_AURA, Color.BLUE, eventPlayer.player_state[PS_EMRE_GRENADE_POS], 3.4, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_state[PS_EMRE_GRENADE_FX].append(getLastCreatedEntity())
    smallMessage(getPlayersInRadius(eventPlayer.player_state[PS_EMRE_GRENADE_POS], 6, Team.ALL, LosCheck.SURFACES), "赛博手雷")
    wait(0.45)
    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.BLUE, eventPlayer.getPosition() + eventPlayer.getFacingDirection() * 5, 1.2)
    wait(0.45)
    eventPlayer.player_state[PS_EMRE_TEMP_TARGETS] = getPlayersInRadius(eventPlayer.player_state[PS_EMRE_GRENADE_POS], 3.6, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and player.player_state[PS_EMRE_GRENADE_TARGET_CD] == false and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam()))
    eventPlayer.player_state[PS_EMRE_TEMP_TARGETS].player_state[PS_EMRE_GRENADE_TARGET_CD] = true
    damage(eventPlayer.player_state[PS_EMRE_TEMP_TARGETS], eventPlayer, 26)
    eventPlayer.player_state[PS_EMRE_TEMP_TARGETS].applyImpulse(directionTowards(eventPlayer.player_state[PS_EMRE_GRENADE_POS], eventPlayer.player_state[PS_EMRE_TEMP_TARGETS].getPosition()) + Vector.UP * 0.18, 8 if eventPlayer.player_state[PS_EMRE_HUMANITY] > 30 else 11, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
    eventPlayer.player_state[PS_EMRE_TEMP_TARGETS].setMoveSpeed(78)
    playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, Color.BLUE, eventPlayer.player_state[PS_EMRE_GRENADE_POS], 3)
    if len(eventPlayer.player_state[PS_EMRE_GRENADE_FX]) > 0:
        destroyEffect(eventPlayer.player_state[PS_EMRE_GRENADE_FX][0])
    if len(eventPlayer.player_state[PS_EMRE_GRENADE_FX]) > 1:
        destroyEffect(eventPlayer.player_state[PS_EMRE_GRENADE_FX][1])
    eventPlayer.player_state[PS_EMRE_GRENADE_FX] = []
    eventPlayer.player_state[PS_EMRE_GRENADE_POS] = null
    eventPlayer.player_state[PS_EMRE_TEMP_TARGETS] = []
    wait(3)
    eventPlayer.player_state[PS_EMRE_GRENADE_LOCK] = false


rule "[emre] clear grenade target slow":
    @Event eachPlayer
    @Condition eventPlayer.player_state[PS_EMRE_GRENADE_TARGET_CD] == true

    wait(1)
    eventPlayer.setMoveSpeed(100)
    eventPlayer.player_state[PS_EMRE_GRENADE_TARGET_CD] = false


rule "[emre] humanity zero self destruct":
    @Event eachPlayer
    @Hero emre
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.player_state[PS_EMRE_HUMANITY] <= 0
    @Condition eventPlayer.player_state[PS_EMRE_SELF_DESTRUCTING] == false

    eventPlayer.player_state[PS_EMRE_SELF_DESTRUCTING] = true
    eventPlayer.player_state[PS_EMRE_HUMANITY] = 0
    bigMessage(getPlayersInRadius(eventPlayer, 12, Team.ALL, LosCheck.SURFACES), "埃姆雷人性归零")
    createEffect(getAllPlayers(), Effect.BAD_AURA, Color.RED, eventPlayer, 5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_state[PS_EMRE_SELF_DESTRUCT_FX].append(getLastCreatedEntity())
    wait(0.8)
    eventPlayer.player_state[PS_EMRE_TEMP_TARGETS] = getPlayersInRadius(eventPlayer, 5.2, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam()))
    damage(eventPlayer.player_state[PS_EMRE_TEMP_TARGETS], eventPlayer, 65)
    eventPlayer.player_state[PS_EMRE_TEMP_TARGETS].applyImpulse(directionTowards(eventPlayer, eventPlayer.player_state[PS_EMRE_TEMP_TARGETS].getPosition()) + Vector.UP * 0.35, 13, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
    playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, Color.RED, eventPlayer, 5.2)
    eventPlayer.setHealth(0)


rule "[emre] clear temporary state on death":
    @Event playerDied
    @Hero emre

    if len(eventPlayer.player_state[PS_EMRE_GRENADE_FX]) > 0:
        destroyEffect(eventPlayer.player_state[PS_EMRE_GRENADE_FX][0])
    if len(eventPlayer.player_state[PS_EMRE_GRENADE_FX]) > 1:
        destroyEffect(eventPlayer.player_state[PS_EMRE_GRENADE_FX][1])
    if len(eventPlayer.player_state[PS_EMRE_SELF_DESTRUCT_FX]) > 0:
        destroyEffect(eventPlayer.player_state[PS_EMRE_SELF_DESTRUCT_FX][0])
    if len(eventPlayer.player_state[PS_EMRE_SELF_DESTRUCT_FX]) > 1:
        destroyEffect(eventPlayer.player_state[PS_EMRE_SELF_DESTRUCT_FX][1])
    if len(eventPlayer.player_state[PS_EMRE_SIPHON_FX]) > 0:
        destroyEffect(eventPlayer.player_state[PS_EMRE_SIPHON_FX][0])
    if len(eventPlayer.player_state[PS_EMRE_SIPHON_FX]) > 1:
        destroyEffect(eventPlayer.player_state[PS_EMRE_SIPHON_FX][1])
    eventPlayer.allowButton(Button.PRIMARY_FIRE)
    eventPlayer.player_state[PS_EMRE_HUMANITY] = 100
    eventPlayer.player_state[PS_EMRE_SIPHON_ACTIVE] = false
    eventPlayer.player_state[PS_EMRE_GRENADE_LOCK] = false
    eventPlayer.player_state[PS_EMRE_GRENADE_POS] = null
    eventPlayer.player_state[PS_EMRE_GRENADE_FX] = []
    eventPlayer.player_state[PS_EMRE_RECOVERY_ACTIVE] = false
    eventPlayer.player_state[PS_EMRE_SELF_DESTRUCT_FX] = []
    eventPlayer.player_state[283] = false
    eventPlayer.player_state[PS_EMRE_SELF_DESTRUCTING] = false
    eventPlayer.player_state[PS_EMRE_SIPHON_FX] = []
    eventPlayer.player_state[PS_EMRE_ALIVE_SEEN] = false
    eventPlayer.player_state[PS_EMRE_TEMP_TARGETS] = []


rule "[emre] clear all state after hero swap":
    @Event eachPlayer
    @Condition eventPlayer.getHero() != Hero.EMRE
    @Condition eventPlayer.player_state[PS_EMRE_HUMANITY] != 100 or eventPlayer.player_state[PS_EMRE_HUD_CREATED] == true or eventPlayer.player_state[PS_EMRE_SIPHON_ACTIVE] == true or eventPlayer.player_state[PS_EMRE_SIPHON_CD] == true or eventPlayer.player_state[PS_EMRE_GRENADE_LOCK] == true or len(eventPlayer.player_state[PS_EMRE_GRENADE_FX]) > 0 or len(eventPlayer.player_state[PS_EMRE_SELF_DESTRUCT_FX]) > 0 or eventPlayer.player_state[283] == true or eventPlayer.player_state[PS_EMRE_SELF_DESTRUCTING] == true or len(eventPlayer.player_state[PS_EMRE_SIPHON_FX]) > 0

    if eventPlayer.player_state[PS_EMRE_HUD_CREATED] == true and eventPlayer.player_state[PS_EMRE_HUD_ID] != null:
        destroyHudText(eventPlayer.player_state[PS_EMRE_HUD_ID])
    if len(eventPlayer.player_state[PS_EMRE_GRENADE_FX]) > 0:
        destroyEffect(eventPlayer.player_state[PS_EMRE_GRENADE_FX][0])
    if len(eventPlayer.player_state[PS_EMRE_GRENADE_FX]) > 1:
        destroyEffect(eventPlayer.player_state[PS_EMRE_GRENADE_FX][1])
    if len(eventPlayer.player_state[PS_EMRE_SELF_DESTRUCT_FX]) > 0:
        destroyEffect(eventPlayer.player_state[PS_EMRE_SELF_DESTRUCT_FX][0])
    if len(eventPlayer.player_state[PS_EMRE_SELF_DESTRUCT_FX]) > 1:
        destroyEffect(eventPlayer.player_state[PS_EMRE_SELF_DESTRUCT_FX][1])
    if len(eventPlayer.player_state[PS_EMRE_SIPHON_FX]) > 0:
        destroyEffect(eventPlayer.player_state[PS_EMRE_SIPHON_FX][0])
    if len(eventPlayer.player_state[PS_EMRE_SIPHON_FX]) > 1:
        destroyEffect(eventPlayer.player_state[PS_EMRE_SIPHON_FX][1])
    eventPlayer.allowButton(Button.PRIMARY_FIRE)
    eventPlayer.player_state[PS_EMRE_HUMANITY] = 100
    eventPlayer.player_state[PS_EMRE_HUD_CREATED] = false
    eventPlayer.player_state[PS_EMRE_HUD_ID] = null
    eventPlayer.player_state[PS_EMRE_SIPHON_ACTIVE] = false
    eventPlayer.player_state[PS_EMRE_SIPHON_CD] = false
    eventPlayer.player_state[PS_EMRE_GRENADE_LOCK] = false
    eventPlayer.player_state[PS_EMRE_GRENADE_POS] = null
    eventPlayer.player_state[PS_EMRE_GRENADE_FX] = []
    eventPlayer.player_state[PS_EMRE_DAMAGE_TOKEN] = 0
    eventPlayer.player_state[PS_EMRE_RECOVERY_ACTIVE] = false
    eventPlayer.player_state[PS_EMRE_RECOVERY_SNAPSHOT] = 0
    eventPlayer.player_state[PS_EMRE_SELF_DESTRUCT_FX] = []
    eventPlayer.player_state[283] = false
    eventPlayer.player_state[PS_EMRE_SELF_DESTRUCTING] = false
    eventPlayer.player_state[PS_EMRE_SIPHON_FX] = []
    eventPlayer.player_state[PS_EMRE_ALIVE_SEEN] = false
    eventPlayer.player_state[PS_EMRE_TEMP_TARGETS] = []


rule "[mizuki] remember katashiro paper":
    @Event eachPlayer
    @Hero mizuki
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.player_state[PS_MIZUKI_PAPER_ACTIVE] == false
    @Condition eventPlayer.isUsingAbility1() == true

    eventPlayer.player_state[PS_MIZUKI_PAPER_ACTIVE] = true
    eventPlayer.player_state[PS_MIZUKI_PAPER_POS] = nearestWalkablePosition(eventPlayer.getPosition())
    wait(4.2)
    eventPlayer.player_state[PS_MIZUKI_PAPER_ACTIVE] = false
    eventPlayer.player_state[PS_MIZUKI_PAPER_POS] = null


rule "[mizuki] paper blade from melee":
    @Event playerDealtDamage
    @Hero mizuki
    @Condition victim != eventPlayer
    @Condition eventAbility == Button.MELEE
    @Condition eventPlayer.player_state[PS_MIZUKI_PAPER_ACTIVE] == true
    @Condition eventPlayer.player_state[PS_MIZUKI_PAPER_BLADE_CD] == false

    eventPlayer.player_state[PS_MIZUKI_PAPER_BLADE_CD] = true
    eventPlayer.player_state[PS_MIZUKI_RESERVED_FX] = eventPlayer.player_state[PS_MIZUKI_PAPER_POS] + Vector.UP * 0.9
    eventPlayer.player_state[PS_MIZUKI_BINDING_BURST_TARGET] = victim.getPosition() + Vector.UP * 0.9
    eventPlayer.player_state[PS_ANRAN_TICK] = 0
    createProjectileEffect(getAllPlayers(), Projectile.GENJI_SHURIKEN, null, eventPlayer.player_state[PS_MIZUKI_RESERVED_FX], directionTowards(eventPlayer.player_state[PS_MIZUKI_RESERVED_FX], eventPlayer.player_state[PS_MIZUKI_BINDING_BURST_TARGET]), 0.75, ProjectileEffectReeval.VISIBILITY_POSITION_DIRECTION_AND_SIZE)
    eventPlayer.player_state[PS_MIZUKI_RESERVED_BEAM] = getLastCreatedEntity()
    while eventPlayer.isAlive() == true and eventPlayer.getHero() == Hero.MIZUKI and victim.isAlive() == true and eventPlayer.player_state[PS_ANRAN_TICK] < 9 and distance(victim.getPosition() + Vector.UP * 0.9, eventPlayer.player_state[PS_MIZUKI_RESERVED_FX]) > 1.35:
        eventPlayer.player_state[PS_MIZUKI_RESERVED_FX] += directionTowards(eventPlayer.player_state[PS_MIZUKI_RESERVED_FX], eventPlayer.player_state[PS_MIZUKI_BINDING_BURST_TARGET]) * 2.15
        eventPlayer.player_state[PS_ANRAN_TICK] += 1
        wait(0.06)
    if eventPlayer.player_state[PS_MIZUKI_RESERVED_BEAM] != null:
        destroyEffect(eventPlayer.player_state[PS_MIZUKI_RESERVED_BEAM])
    eventPlayer.player_state[PS_MIZUKI_RESERVED_BEAM] = null
    if eventPlayer.isAlive() == true and eventPlayer.getHero() == Hero.MIZUKI and victim.isAlive() == true and distance(victim.getPosition() + Vector.UP * 0.9, eventPlayer.player_state[PS_MIZUKI_RESERVED_FX]) <= 1.35:
        damage(victim, eventPlayer, 15)
        victim.setMoveSpeed(72)
        eventPlayer.setMoveSpeed(120)
        playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.VIOLET, victim, 1.3)
        wait(0.75)
        victim.setMoveSpeed(100)
        if eventPlayer.isAlive() == true and eventPlayer.getHero() == Hero.MIZUKI:
            eventPlayer.setMoveSpeed(100)
    eventPlayer.player_state[PS_MIZUKI_RESERVED_FX] = null
    eventPlayer.player_state[PS_MIZUKI_BINDING_BURST_TARGET] = null
    eventPlayer.player_state[PS_ANRAN_TICK] = 0
    wait(0.4)
    eventPlayer.player_state[PS_MIZUKI_PAPER_BLADE_CD] = false


rule "[mizuki] binding chain paper burst":
    @Event playerDealtDamage
    @Hero mizuki
    @Condition victim != eventPlayer
    @Condition eventAbility == Button.ABILITY_2
    @Condition eventPlayer.player_state[PS_MIZUKI_PAPER_ACTIVE] == true
    @Condition eventPlayer.player_state[PS_MIZUKI_BINDING_BURST_LOCK] == false

    eventPlayer.player_state[PS_MIZUKI_BINDING_BURST_LOCK] = true
    eventPlayer.player_state[PS_MIZUKI_BINDING_BURST_TARGET] = victim
    damage(victim, eventPlayer, 20)
    victim.setMoveSpeed(65)
    victim.setStatusEffect(eventPlayer, Status.ROOTED, 0.55)
    eventPlayer.teleport(nearestWalkablePosition(victim.getPosition() - victim.getFacingDirection() * 1.6))
    eventPlayer.setMoveSpeed(125)
    playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, Color.VIOLET, victim, 1.8)
    wait(0.8)
    if victim.isAlive() == true:
        victim.setMoveSpeed(100)
    if eventPlayer.isAlive() == true and eventPlayer.getHero() == Hero.MIZUKI:
        eventPlayer.setMoveSpeed(100)
    eventPlayer.player_state[PS_MIZUKI_BINDING_BURST_TARGET] = null
    eventPlayer.player_state[PS_MIZUKI_BINDING_BURST_LOCK] = false


rule "[mizuki] clear paper state":
    @Event eachPlayer
    @Condition eventPlayer.getHero() != Hero.MIZUKI or eventPlayer.isDead() == true
    @Condition eventPlayer.player_state[PS_MIZUKI_PAPER_ACTIVE] == true or eventPlayer.player_state[PS_MIZUKI_PAPER_BLADE_CD] == true or eventPlayer.player_state[PS_MIZUKI_BINDING_BURST_LOCK] == true or eventPlayer.player_state[PS_MIZUKI_RESERVED_BEAM] != null

    if eventPlayer.player_state[PS_MIZUKI_RESERVED_BEAM] != null:
        destroyEffect(eventPlayer.player_state[PS_MIZUKI_RESERVED_BEAM])
    if eventPlayer.player_state[PS_MIZUKI_BINDING_BURST_TARGET] != null and eventPlayer.player_state[PS_MIZUKI_BINDING_BURST_LOCK] == true:
        eventPlayer.player_state[PS_MIZUKI_BINDING_BURST_TARGET].setMoveSpeed(100)
    eventPlayer.setMoveSpeed(100)
    eventPlayer.player_state[PS_MIZUKI_PAPER_ACTIVE] = false
    eventPlayer.player_state[PS_MIZUKI_PAPER_POS] = null
    eventPlayer.player_state[PS_MIZUKI_RESERVED_FX] = null
    eventPlayer.player_state[PS_MIZUKI_PAPER_BLADE_CD] = false
    eventPlayer.player_state[PS_MIZUKI_BINDING_BURST_LOCK] = false
    eventPlayer.player_state[PS_MIZUKI_BINDING_BURST_TARGET] = null
    eventPlayer.player_state[PS_MIZUKI_RESERVED_BEAM] = null


#!optimizeForSize


rule "[anran] lock vanilla fire tools":
    @Event eachPlayer
    @Hero anran
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.player_state[PS_ANRAN_BUTTONS_LOCKED] == false

    eventPlayer.disallowButton(Button.PRIMARY_FIRE)
    eventPlayer.disallowButton(Button.SECONDARY_FIRE)
    eventPlayer.disallowButton(Button.ABILITY_1)
    eventPlayer.disallowButton(Button.ABILITY_2)
    eventPlayer.player_state[PS_ANRAN_BUTTONS_LOCKED] = true


rule "[anran] blazing step":
    @Event eachPlayer
    @Hero anran
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.player_state[PS_ANRAN_STEP_CD] == false
    @Condition eventPlayer.player_state[PS_ANRAN_STEP_ACTIVE] == false
    @Condition eventPlayer.isHoldingButton(Button.ABILITY_1) == true

    eventPlayer.player_state[PS_ANRAN_STEP_CD] = true
    eventPlayer.player_state[PS_ANRAN_STEP_ACTIVE] = true
    eventPlayer.player_state[PS_ANRAN_STEP_DIR] = eventPlayer.getFacingDirection()
    smallMessage(eventPlayer, "燎步")
    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.ORANGE, eventPlayer, 1.2)
    eventPlayer.applyImpulse(eventPlayer.player_state[PS_ANRAN_STEP_DIR] + Vector.UP * 0.06, 20, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
    eventPlayer.setMoveSpeed(122)
    wait(0.22)
    damage(getPlayersInRadius(eventPlayer, 2.5, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())), eventPlayer, 8)
    getPlayersInRadius(eventPlayer, 2.5, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).applyImpulse(eventPlayer.player_state[PS_ANRAN_STEP_DIR] + Vector.UP * 0.1, 7, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
    playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, Color.ORANGE, eventPlayer, 0.9)
    wait(0.28)
    eventPlayer.setMoveSpeed(100)
    eventPlayer.player_state[PS_ANRAN_STEP_ACTIVE] = false
    eventPlayer.player_state[PS_ANRAN_STEP_DIR] = null
    wait(2.6)
    eventPlayer.player_state[PS_ANRAN_STEP_CD] = false


rule "[anran] ember guard stance":
    @Event eachPlayer
    @Hero anran
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.player_state[PS_ANRAN_GUARD_ACTIVE] == false
    @Condition eventPlayer.player_state[PS_ANRAN_GUARD_CD] == false
    @Condition eventPlayer.isHoldingButton(Button.ABILITY_2) == true

    eventPlayer.player_state[PS_ANRAN_GUARD_ACTIVE] = true
    eventPlayer.player_state[PS_ANRAN_GUARD_CD] = true
    smallMessage(eventPlayer, "收焰架势")
    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.ORANGE, eventPlayer, 1.4)
    wait(1.05)
    eventPlayer.player_state[PS_ANRAN_GUARD_ACTIVE] = false
    wait(4.2)
    eventPlayer.player_state[PS_ANRAN_GUARD_CD] = false


rule "[anran] ember guard parries melee":
    @Event playerDealtDamage
    @Condition victim.getHero() == Hero.ANRAN
    @Condition victim.player_state[PS_ANRAN_GUARD_ACTIVE] == true
    @Condition eventAbility == Button.MELEE
    @Condition eventPlayer != victim

    heal(victim, null, eventDamage)
    victim.player_state[PS_ANRAN_GUARD_ACTIVE] = false
    victim.player_state[PS_ANRAN_BORROWED_FIRE] = true
    eventPlayer.applyImpulse(directionTowards(victim.getPosition(), eventPlayer.getPosition()) + Vector.UP * 0.12, 11, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.ORANGE, victim, 1.6)
    smallMessage(victim, "借火")
    smallMessage(eventPlayer, "被收焰弹开")
    wait(6)
    if victim.isAlive() == true and victim.getHero() == Hero.ANRAN and victim.player_state[PS_ANRAN_BORROWED_FIRE] == true:
        victim.player_state[PS_ANRAN_BORROWED_FIRE] = false


rule "[anran] borrowed fire kick":
    @Event playerDealtDamage
    @Hero anran
    @Condition victim != eventPlayer
    @Condition eventAbility == Button.MELEE
    @Condition eventPlayer.player_state[PS_ANRAN_BORROWED_FIRE] == true
    @Condition eventPlayer.player_state[PS_ANRAN_KICK_LOCK] == false

    eventPlayer.player_state[PS_ANRAN_KICK_LOCK] = true
    eventPlayer.player_state[PS_ANRAN_BORROWED_FIRE] = false
    damage(victim, eventPlayer, 10)
    victim.applyImpulse(eventPlayer.getFacingDirection() + Vector.UP * 0.18, 22, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
    victim.setMoveSpeed(85)
    playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, Color.ORANGE, victim, 1.7)
    smallMessage(eventPlayer, "朱雀踢")
    smallMessage(victim, "被朱雀踢飞")
    wait(1)
    if victim.isAlive() == true:
        victim.setMoveSpeed(100)
    eventPlayer.player_state[PS_ANRAN_KICK_LOCK] = false


rule "[anran] clear all temporary state":
    @Event eachPlayer
    @Condition eventPlayer.getHero() != Hero.ANRAN or eventPlayer.isDead() == true
    @Condition eventPlayer.player_state[PS_ANRAN_BUTTONS_LOCKED] == true or eventPlayer.player_state[PS_ANRAN_STEP_CD] == true or eventPlayer.player_state[PS_ANRAN_STEP_ACTIVE] == true or eventPlayer.player_state[PS_ANRAN_GUARD_ACTIVE] == true or eventPlayer.player_state[PS_ANRAN_GUARD_CD] == true or eventPlayer.player_state[PS_ANRAN_BORROWED_FIRE] == true

    eventPlayer.allowButton(Button.PRIMARY_FIRE)
    eventPlayer.allowButton(Button.SECONDARY_FIRE)
    eventPlayer.allowButton(Button.ABILITY_1)
    eventPlayer.allowButton(Button.ABILITY_2)
    eventPlayer.setMoveSpeed(100)
    eventPlayer.player_state[PS_ANRAN_BUTTONS_LOCKED] = false
    eventPlayer.player_state[PS_ANRAN_STEP_CD] = false
    eventPlayer.player_state[PS_ANRAN_STEP_ACTIVE] = false
    eventPlayer.player_state[293] = null
    eventPlayer.player_state[PS_ANRAN_STEP_DIR] = null
    eventPlayer.player_state[PS_ANRAN_TICK] = 0
    eventPlayer.player_state[PS_ANRAN_GUARD_ACTIVE] = false
    eventPlayer.player_state[PS_ANRAN_GUARD_CD] = false
    eventPlayer.player_state[PS_ANRAN_BORROWED_FIRE] = false
    eventPlayer.player_state[PS_ANRAN_KICK_LOCK] = false

rule "[junkrat] lock vanilla tools and create powder hud":
    @Event eachPlayer
    @Hero junkrat
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.player_state[PS_JUNKRAT_HUD_CREATED] == false

    eventPlayer.player_state[PS_JUNKRAT_HUD_CREATED] = true
    eventPlayer.disallowButton(Button.ABILITY_1)
    eventPlayer.disallowButton(Button.ABILITY_2)
    hudHeader(eventPlayer, "火药：{}/3".format(eventPlayer.player_state[PS_JUNKRAT_POWDER]), HudPosition.RIGHT, -835, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING)
    eventPlayer.player_state[PS_JUNKRAT_HUD_ID] = getLastCreatedText()


rule "[junkrat] powder ready prompt":
    @Event eachPlayer
    @Hero junkrat
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.player_state[PS_JUNKRAT_POWDER] >= 3
    @Condition eventPlayer.player_state[PS_JUNKRAT_POWDER_READY_PROMPTED] == false

    eventPlayer.player_state[PS_JUNKRAT_POWDER] = 3
    eventPlayer.player_state[PS_JUNKRAT_POWDER_READY_PROMPTED] = true
    bigMessage(eventPlayer, "大爆破就绪")


rule "[junkrat] clear powder ready flag":
    @Event eachPlayer
    @Hero junkrat
    @Condition eventPlayer.player_state[PS_JUNKRAT_POWDER] < 3
    @Condition eventPlayer.player_state[PS_JUNKRAT_POWDER_READY_PROMPTED] == true

    eventPlayer.player_state[PS_JUNKRAT_POWDER_READY_PROMPTED] = false


rule "[junkrat] powder from melee":
    @Event playerDealtDamage
    @Hero junkrat
    @Condition victim != eventPlayer
    @Condition eventDamage > 0
    @Condition eventAbility == Button.MELEE
    @Condition eventPlayer.player_state[PS_JUNKRAT_MELEE_POWDER_CD] == false
    @Condition eventPlayer.player_state[PS_JUNKRAT_POWDER] < 3

    eventPlayer.player_state[PS_JUNKRAT_MELEE_POWDER_CD] = true
    eventPlayer.player_state[PS_JUNKRAT_POWDER] += 1
    if eventPlayer.player_state[PS_JUNKRAT_POWDER] > 3:
        eventPlayer.player_state[PS_JUNKRAT_POWDER] = 3
    smallMessage(eventPlayer, "火药 +1")
    wait(0.35)
    eventPlayer.player_state[PS_JUNKRAT_MELEE_POWDER_CD] = false


rule "[junkrat] big blast from full powder melee":
    @Event playerDealtDamage
    @Hero junkrat
    @Condition victim != eventPlayer
    @Condition eventDamage > 0
    @Condition eventAbility == Button.MELEE
    @Condition eventPlayer.player_state[PS_JUNKRAT_POWDER] >= 3
    @Condition eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_LOCK] == false

    eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_LOCK] = true
    eventPlayer.player_state[PS_JUNKRAT_POWDER] = 0
    eventPlayer.player_state[PS_JUNKRAT_POWDER_READY_PROMPTED] = false
    eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_POS] = nearestWalkablePosition(victim.getPosition())
    eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_FX] = []
    createEffect(getAllPlayers(), Effect.BAD_AURA, Color.ORANGE, eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_POS], 5.2, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_FX].append(getLastCreatedEntity())
    createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Color.YELLOW, eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_POS], 4.2, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_FX].append(getLastCreatedEntity())
    smallMessage(getPlayersInRadius(eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_POS], 7, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true), "大爆破预警")
    wait(1)
    if eventPlayer.isAlive() == true and eventPlayer.getHero() == Hero.JUNKRAT and eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_LOCK] == true:
        playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, Color.RED, eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_POS] + Vector.UP * 0.35, 5.8)
        damage(getPlayersInRadius(eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_POS], 2.8, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())), eventPlayer, 40)
        getPlayersInRadius(eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_POS], 2.8, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).applyImpulse(directionTowards(eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_POS], getPlayersInRadius(eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_POS], 2.8, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).getPosition()) + Vector.UP * 0.4, 20, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
        damage(getPlayersInRadius(eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_POS], 5.2, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and distance(player, eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_POS]) > 2.8 and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())), eventPlayer, 20)
        getPlayersInRadius(eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_POS], 5.2, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and distance(player, eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_POS]) > 2.8 and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).setMoveSpeed(75)
        eventPlayer.setMoveSpeed(120)
        eventPlayer.applyImpulse(Vector.UP, 12, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
        smallMessage(getPlayersInRadius(eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_POS], 8, Team.ALL, LosCheck.OFF).filter(lambda player: player != eventPlayer and player.isAlive() == true and distance(player, eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_POS]) > 5.2 and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())), "躲过爆破")
        wait(1)
        getPlayersInRadius(eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_POS], 5.4, Team.ALL, LosCheck.OFF).filter(lambda player: player != eventPlayer and player.isAlive() == true).setMoveSpeed(100)
        eventPlayer.setMoveSpeed(100)
    if len(eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_FX]) > 0:
        destroyEffect(eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_FX][0])
    if len(eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_FX]) > 1:
        destroyEffect(eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_FX][1])
    eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_FX] = []
    eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_POS] = null
    eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_LOCK] = false
    wait(1)


rule "[junkrat] timed mine throw":
    @Event eachPlayer
    @Hero junkrat
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.player_state[PS_JUNKRAT_MINE_LOCK] == false
    @Condition eventPlayer.isHoldingButton(Button.ABILITY_1) == true
    @Condition eventPlayer.player_state[PS_JUNKRAT_POWDER] < 3

    eventPlayer.player_state[PS_JUNKRAT_MINE_LOCK] = true
    eventPlayer.player_state[PS_JUNKRAT_MINE_DIR] = eventPlayer.getFacingDirection()
    eventPlayer.player_state[PS_JUNKRAT_MINE_POS] = eventPlayer.getEyePosition() + eventPlayer.player_state[PS_JUNKRAT_MINE_DIR] * 1.2
    eventPlayer.player_state[PS_JUNKRAT_MINE_FX] = []
    eventPlayer.player_state[PS_LIFEWEAVER_BALL_TICK] = 0
    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.ORANGE, eventPlayer.getEyePosition() + eventPlayer.player_state[PS_JUNKRAT_MINE_DIR], 0.7)
    createProjectileEffect(getAllPlayers(), Projectile.ECHO_STICKY_BOMB, null, eventPlayer.player_state[PS_JUNKRAT_MINE_POS], eventPlayer.player_state[PS_JUNKRAT_MINE_DIR], 0.35, ProjectileEffectReeval.VISIBILITY_POSITION_DIRECTION_AND_SIZE)
    eventPlayer.player_state[PS_JUNKRAT_MINE_FX].append(getLastCreatedEntity())
    createEffect(getAllPlayers(), Effect.BAD_AURA, Color.ORANGE, eventPlayer.player_state[PS_JUNKRAT_MINE_POS], 1.2, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_state[PS_JUNKRAT_MINE_FX].append(getLastCreatedEntity())
    smallMessage(eventPlayer, "投出定时地雷")
    while eventPlayer.player_state[PS_JUNKRAT_MINE_LOCK] == true and eventPlayer.isAlive() == true and eventPlayer.getHero() == Hero.JUNKRAT and eventPlayer.player_state[PS_LIFEWEAVER_BALL_TICK] < 8:
        eventPlayer.player_state[PS_JUNKRAT_MINE_POS] = eventPlayer.player_state[PS_JUNKRAT_MINE_POS] + eventPlayer.player_state[PS_JUNKRAT_MINE_DIR] * 1.25 + Vector.UP * (0.45 - eventPlayer.player_state[PS_LIFEWEAVER_BALL_TICK] * 0.12)
        eventPlayer.player_state[PS_LIFEWEAVER_BALL_TICK] += 1
        wait(0.08)
    if eventPlayer.player_state[PS_JUNKRAT_MINE_LOCK] == true and eventPlayer.isAlive() == true and eventPlayer.getHero() == Hero.JUNKRAT and eventPlayer.player_state[PS_JUNKRAT_MINE_POS] != null:
        eventPlayer.player_state[PS_JUNKRAT_MINE_POS] = nearestWalkablePosition(eventPlayer.player_state[PS_JUNKRAT_MINE_POS])
        createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Color.YELLOW, eventPlayer.player_state[PS_JUNKRAT_MINE_POS], 0.75, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
        eventPlayer.player_state[PS_JUNKRAT_MINE_FX].append(getLastCreatedEntity())
        smallMessage(getPlayersInRadius(eventPlayer.player_state[PS_JUNKRAT_MINE_POS], 5, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true), "定时地雷")
        wait(1.1)
        if eventPlayer.isAlive() == true and eventPlayer.getHero() == Hero.JUNKRAT and eventPlayer.player_state[PS_JUNKRAT_MINE_POS] != null:
            playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, Color.ORANGE, eventPlayer.player_state[PS_JUNKRAT_MINE_POS], 3.4)
            damage(getPlayersInRadius(eventPlayer.player_state[PS_JUNKRAT_MINE_POS], 3.4, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())), eventPlayer, 15)
            getPlayersInRadius(eventPlayer.player_state[PS_JUNKRAT_MINE_POS], 3.4, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).applyImpulse(directionTowards(eventPlayer.player_state[PS_JUNKRAT_MINE_POS], getPlayersInRadius(eventPlayer.player_state[PS_JUNKRAT_MINE_POS], 3.4, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).getPosition()) + Vector.UP * 0.6, 18, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
            if distance(eventPlayer, eventPlayer.player_state[PS_JUNKRAT_MINE_POS]) <= 4:
                eventPlayer.applyImpulse(Vector.UP, 18, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
                eventPlayer.setMoveSpeed(115)
            if len(getPlayersInRadius(eventPlayer.player_state[PS_JUNKRAT_MINE_POS], 3.4, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam()))) > 0 and eventPlayer.player_state[PS_JUNKRAT_POWDER] < 3:
                eventPlayer.player_state[PS_JUNKRAT_POWDER] += 1
                if eventPlayer.player_state[PS_JUNKRAT_POWDER] > 3:
                    eventPlayer.player_state[PS_JUNKRAT_POWDER] = 3
                smallMessage(eventPlayer, "火药 +1")
        wait(1)
        eventPlayer.setMoveSpeed(100)
    if len(eventPlayer.player_state[PS_JUNKRAT_MINE_FX]) > 0:
        destroyEffect(eventPlayer.player_state[PS_JUNKRAT_MINE_FX][0])
    if len(eventPlayer.player_state[PS_JUNKRAT_MINE_FX]) > 1:
        destroyEffect(eventPlayer.player_state[PS_JUNKRAT_MINE_FX][1])
    if len(eventPlayer.player_state[PS_JUNKRAT_MINE_FX]) > 2:
        destroyEffect(eventPlayer.player_state[PS_JUNKRAT_MINE_FX][2])
    eventPlayer.player_state[PS_JUNKRAT_MINE_FX] = []
    eventPlayer.player_state[PS_JUNKRAT_MINE_POS] = null
    eventPlayer.player_state[PS_JUNKRAT_MINE_DIR] = null
    eventPlayer.player_state[PS_LIFEWEAVER_BALL_TICK] = 0
    wait(2)
    eventPlayer.player_state[PS_JUNKRAT_MINE_LOCK] = false


rule "[junkrat] big blast from full powder skill":
    @Event eachPlayer
    @Hero junkrat
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_LOCK] == false
    @Condition eventPlayer.player_state[PS_JUNKRAT_POWDER] >= 3
    @Condition eventPlayer.isHoldingButton(Button.ABILITY_1) == true or eventPlayer.isHoldingButton(Button.ABILITY_2) == true

    eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_LOCK] = true
    eventPlayer.player_state[PS_JUNKRAT_POWDER] = 0
    eventPlayer.player_state[PS_JUNKRAT_POWDER_READY_PROMPTED] = false
    eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_POS] = nearestWalkablePosition(eventPlayer.getPosition() + eventPlayer.getFacingDirection() * 4)
    eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_FX] = []
    createEffect(getAllPlayers(), Effect.BAD_AURA, Color.ORANGE, eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_POS], 5.2, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_FX].append(getLastCreatedEntity())
    createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Color.YELLOW, eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_POS], 4.2, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_FX].append(getLastCreatedEntity())
    smallMessage(getPlayersInRadius(eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_POS], 7, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true), "大爆破预警")
    wait(1)
    if eventPlayer.isAlive() == true and eventPlayer.getHero() == Hero.JUNKRAT and eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_LOCK] == true:
        playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, Color.RED, eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_POS] + Vector.UP * 0.35, 5.8)
        damage(getPlayersInRadius(eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_POS], 2.8, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())), eventPlayer, 40)
        getPlayersInRadius(eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_POS], 2.8, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).applyImpulse(directionTowards(eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_POS], getPlayersInRadius(eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_POS], 2.8, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).getPosition()) + Vector.UP * 0.4, 20, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
        damage(getPlayersInRadius(eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_POS], 5.2, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and distance(player, eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_POS]) > 2.8 and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())), eventPlayer, 20)
        getPlayersInRadius(eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_POS], 5.2, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and distance(player, eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_POS]) > 2.8 and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).setMoveSpeed(75)
        eventPlayer.setMoveSpeed(120)
        eventPlayer.applyImpulse(Vector.UP, 12, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
        smallMessage(getPlayersInRadius(eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_POS], 8, Team.ALL, LosCheck.OFF).filter(lambda player: player != eventPlayer and player.isAlive() == true and distance(player, eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_POS]) > 5.2 and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())), "躲过爆破")
        wait(1)
        getPlayersInRadius(eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_POS], 5.4, Team.ALL, LosCheck.OFF).filter(lambda player: player != eventPlayer and player.isAlive() == true).setMoveSpeed(100)
        eventPlayer.setMoveSpeed(100)
    if len(eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_FX]) > 0:
        destroyEffect(eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_FX][0])
    if len(eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_FX]) > 1:
        destroyEffect(eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_FX][1])
    eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_FX] = []
    eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_POS] = null
    eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_LOCK] = false
    wait(1)


rule "[junkrat] bounty trap zone":
    @Event eachPlayer
    @Hero junkrat
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.player_state[PS_JUNKRAT_TRAP_LOCK] == false
    @Condition eventPlayer.isHoldingButton(Button.ABILITY_2) == true
    @Condition eventPlayer.player_state[PS_JUNKRAT_POWDER] < 3

    eventPlayer.player_state[PS_JUNKRAT_TRAP_LOCK] = true
    eventPlayer.player_state[PS_JUNKRAT_TRAP_POS] = nearestWalkablePosition(raycast(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * 30, getAllPlayers(), getAllPlayers(), false).getHitPosition())
    eventPlayer.player_state[PS_JUNKRAT_TRAP_FX] = []
    createEffect(getAllPlayers(), Effect.BAD_AURA, Color.ORANGE, eventPlayer.player_state[PS_JUNKRAT_TRAP_POS], 3.1, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_state[PS_JUNKRAT_TRAP_FX].append(getLastCreatedEntity())
    createEffect(getAllPlayers(), Effect.GOOD_AURA, Color.YELLOW, eventPlayer.player_state[PS_JUNKRAT_TRAP_POS], 1.8, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_state[PS_JUNKRAT_TRAP_FX].append(getLastCreatedEntity())
    smallMessage(getPlayersInRadius(eventPlayer.player_state[PS_JUNKRAT_TRAP_POS], 5, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true), "夹子悬赏")
    wait(0.4)
    eventPlayer.player_state[PS_JUNKRAT_TRAP_TRIGGERED] = false
    eventPlayer.player_state[PS_LIFEWEAVER_BALL_TICK] = 0
    while eventPlayer.player_state[PS_JUNKRAT_TRAP_LOCK] == true and eventPlayer.isAlive() == true and eventPlayer.getHero() == Hero.JUNKRAT and eventPlayer.player_state[PS_LIFEWEAVER_BALL_TICK] < 20:
        if eventPlayer.player_state[PS_JUNKRAT_TRAP_TRIGGERED] == false and len(getPlayersInRadius(eventPlayer.player_state[PS_JUNKRAT_TRAP_POS], 2.7, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and player.player_state[PS_JUNKRAT_TRAP_TARGET_SLOW] == false and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam()))) > 0:
            getPlayersInRadius(eventPlayer.player_state[PS_JUNKRAT_TRAP_POS], 2.7, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and player.player_state[PS_JUNKRAT_TRAP_TARGET_SLOW] == false and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).player_state[PS_JUNKRAT_TRAP_TARGET_SLOW] = true
            getPlayersInRadius(eventPlayer.player_state[PS_JUNKRAT_TRAP_POS], 2.7, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and player.player_state[PS_JUNKRAT_TRAP_TARGET_SLOW] == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).setMoveSpeed(35)
            smallMessage(getPlayersInRadius(eventPlayer.player_state[PS_JUNKRAT_TRAP_POS], 2.7, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and player.player_state[PS_JUNKRAT_TRAP_TARGET_SLOW] == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())), "踩雷悬赏")
            playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, Color.YELLOW, eventPlayer.player_state[PS_JUNKRAT_TRAP_POS], 2)
            if eventPlayer.player_state[PS_JUNKRAT_POWDER] < 3:
                eventPlayer.player_state[PS_JUNKRAT_POWDER] += 1
                if eventPlayer.player_state[PS_JUNKRAT_POWDER] > 3:
                    eventPlayer.player_state[PS_JUNKRAT_POWDER] = 3
                smallMessage(eventPlayer, "火药 +1")
            eventPlayer.player_state[PS_JUNKRAT_TRAP_TRIGGERED] = true
        eventPlayer.player_state[PS_LIFEWEAVER_BALL_TICK] += 1
        wait(0.25)
    getAllPlayers().filter(lambda player: player.player_state[PS_JUNKRAT_TRAP_TARGET_SLOW] == true).setMoveSpeed(100)
    getAllPlayers().filter(lambda player: player.player_state[PS_JUNKRAT_TRAP_TARGET_SLOW] == true).player_state[PS_JUNKRAT_TRAP_TARGET_SLOW] = false
    if len(eventPlayer.player_state[PS_JUNKRAT_TRAP_FX]) > 0:
        destroyEffect(eventPlayer.player_state[PS_JUNKRAT_TRAP_FX][0])
    if len(eventPlayer.player_state[PS_JUNKRAT_TRAP_FX]) > 1:
        destroyEffect(eventPlayer.player_state[PS_JUNKRAT_TRAP_FX][1])
    eventPlayer.player_state[PS_JUNKRAT_TRAP_FX] = []
    eventPlayer.player_state[PS_JUNKRAT_TRAP_POS] = null
    wait(2)
    eventPlayer.player_state[PS_JUNKRAT_TRAP_LOCK] = false


rule "[junkrat] death fireworks":
    @Event playerDied
    @Hero junkrat
    @Condition eventPlayer.player_state[PS_JUNKRAT_DEATH_FIREWORKS_LOCK] == false

    eventPlayer.player_state[PS_JUNKRAT_DEATH_FIREWORKS_LOCK] = true
    playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, Color.ORANGE, eventPlayer.getPosition() + Vector.FORWARD * 1.5, 1.5)
    wait(0.25)
    playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, Color.YELLOW, eventPlayer.getPosition() + Vector.RIGHT * 1.5, 1.5)
    wait(0.25)
    playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, Color.ORANGE, eventPlayer.getPosition() + Vector.LEFT * 1.5, 1.5)
    damage(getPlayersInRadius(eventPlayer.getPosition(), 3.6, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())), eventPlayer, 10)
    getPlayersInRadius(eventPlayer.getPosition(), 3.6, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).applyImpulse(directionTowards(eventPlayer.getPosition(), getPlayersInRadius(eventPlayer.getPosition(), 3.6, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam())).getPosition()) + Vector.UP * 0.35, 8, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
    wait(2)
    eventPlayer.player_state[PS_JUNKRAT_DEATH_FIREWORKS_LOCK] = false


rule "[junkrat] clear temporary states on death keep powder":
    @Event playerDied
    @Hero junkrat

    if eventPlayer.player_state[PS_JUNKRAT_HUD_ID] != null:
        destroyHudText(eventPlayer.player_state[PS_JUNKRAT_HUD_ID])
    if len(eventPlayer.player_state[PS_JUNKRAT_MINE_FX]) > 0:
        destroyEffect(eventPlayer.player_state[PS_JUNKRAT_MINE_FX][0])
    if len(eventPlayer.player_state[PS_JUNKRAT_MINE_FX]) > 1:
        destroyEffect(eventPlayer.player_state[PS_JUNKRAT_MINE_FX][1])
    if len(eventPlayer.player_state[PS_JUNKRAT_MINE_FX]) > 2:
        destroyEffect(eventPlayer.player_state[PS_JUNKRAT_MINE_FX][2])
    if len(eventPlayer.player_state[PS_JUNKRAT_TRAP_FX]) > 0:
        destroyEffect(eventPlayer.player_state[PS_JUNKRAT_TRAP_FX][0])
    if len(eventPlayer.player_state[PS_JUNKRAT_TRAP_FX]) > 1:
        destroyEffect(eventPlayer.player_state[PS_JUNKRAT_TRAP_FX][1])
    if len(eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_FX]) > 0:
        destroyEffect(eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_FX][0])
    if len(eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_FX]) > 1:
        destroyEffect(eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_FX][1])
    getAllPlayers().filter(lambda player: player.player_state[PS_JUNKRAT_TRAP_TARGET_SLOW] == true).setMoveSpeed(100)
    getAllPlayers().filter(lambda player: player.player_state[PS_JUNKRAT_TRAP_TARGET_SLOW] == true).player_state[PS_JUNKRAT_TRAP_TARGET_SLOW] = false
    eventPlayer.allowButton(Button.ABILITY_1)
    eventPlayer.allowButton(Button.ABILITY_2)
    eventPlayer.player_state[PS_JUNKRAT_HUD_CREATED] = false
    eventPlayer.player_state[PS_JUNKRAT_HUD_ID] = null
    eventPlayer.player_state[PS_JUNKRAT_MINE_LOCK] = false
    eventPlayer.player_state[PS_JUNKRAT_MINE_POS] = null
    eventPlayer.player_state[PS_JUNKRAT_MINE_FX] = []
    eventPlayer.player_state[PS_JUNKRAT_TRAP_LOCK] = false
    eventPlayer.player_state[PS_JUNKRAT_TRAP_POS] = null
    eventPlayer.player_state[PS_JUNKRAT_TRAP_FX] = []
    eventPlayer.player_state[PS_JUNKRAT_MELEE_POWDER_CD] = false
    eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_LOCK] = false
    eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_POS] = null
    eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_FX] = []
    eventPlayer.player_state[PS_JUNKRAT_MINE_DIR] = null
    eventPlayer.player_state[PS_JUNKRAT_TRAP_TRIGGERED] = false
    eventPlayer.player_state[PS_LIFEWEAVER_BALL_TICK] = 0
    eventPlayer.setMoveSpeed(100)


rule "[junkrat] clear all state after hero swap":
    @Event eachPlayer
    @Condition eventPlayer.getHero() != Hero.JUNKRAT
    @Condition eventPlayer.player_state[PS_JUNKRAT_POWDER] > 0 or eventPlayer.player_state[PS_JUNKRAT_HUD_CREATED] == true or eventPlayer.player_state[PS_JUNKRAT_HUD_ID] != null or eventPlayer.player_state[PS_JUNKRAT_MINE_LOCK] == true or eventPlayer.player_state[PS_JUNKRAT_TRAP_LOCK] == true or eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_LOCK] == true or len(eventPlayer.player_state[PS_JUNKRAT_MINE_FX]) > 0 or len(eventPlayer.player_state[PS_JUNKRAT_TRAP_FX]) > 0 or len(eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_FX]) > 0

    if eventPlayer.player_state[PS_JUNKRAT_HUD_ID] != null:
        destroyHudText(eventPlayer.player_state[PS_JUNKRAT_HUD_ID])
    if len(eventPlayer.player_state[PS_JUNKRAT_MINE_FX]) > 0:
        destroyEffect(eventPlayer.player_state[PS_JUNKRAT_MINE_FX][0])
    if len(eventPlayer.player_state[PS_JUNKRAT_MINE_FX]) > 1:
        destroyEffect(eventPlayer.player_state[PS_JUNKRAT_MINE_FX][1])
    if len(eventPlayer.player_state[PS_JUNKRAT_MINE_FX]) > 2:
        destroyEffect(eventPlayer.player_state[PS_JUNKRAT_MINE_FX][2])
    if len(eventPlayer.player_state[PS_JUNKRAT_TRAP_FX]) > 0:
        destroyEffect(eventPlayer.player_state[PS_JUNKRAT_TRAP_FX][0])
    if len(eventPlayer.player_state[PS_JUNKRAT_TRAP_FX]) > 1:
        destroyEffect(eventPlayer.player_state[PS_JUNKRAT_TRAP_FX][1])
    if len(eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_FX]) > 0:
        destroyEffect(eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_FX][0])
    if len(eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_FX]) > 1:
        destroyEffect(eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_FX][1])
    getAllPlayers().filter(lambda player: player.player_state[PS_JUNKRAT_TRAP_TARGET_SLOW] == true).setMoveSpeed(100)
    getAllPlayers().filter(lambda player: player.player_state[PS_JUNKRAT_TRAP_TARGET_SLOW] == true).player_state[PS_JUNKRAT_TRAP_TARGET_SLOW] = false
    eventPlayer.allowButton(Button.ABILITY_1)
    eventPlayer.allowButton(Button.ABILITY_2)
    eventPlayer.player_state[PS_JUNKRAT_POWDER] = 0
    eventPlayer.player_state[PS_JUNKRAT_HUD_CREATED] = false
    eventPlayer.player_state[PS_JUNKRAT_HUD_ID] = null
    eventPlayer.player_state[PS_JUNKRAT_MINE_LOCK] = false
    eventPlayer.player_state[PS_JUNKRAT_MINE_POS] = null
    eventPlayer.player_state[PS_JUNKRAT_MINE_FX] = []
    eventPlayer.player_state[PS_JUNKRAT_TRAP_LOCK] = false
    eventPlayer.player_state[PS_JUNKRAT_TRAP_POS] = null
    eventPlayer.player_state[PS_JUNKRAT_TRAP_FX] = []
    eventPlayer.player_state[PS_JUNKRAT_POWDER_READY_PROMPTED] = false
    eventPlayer.player_state[PS_JUNKRAT_MELEE_POWDER_CD] = false
    eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_LOCK] = false
    eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_POS] = null
    eventPlayer.player_state[PS_JUNKRAT_BIG_BLAST_FX] = []
    eventPlayer.player_state[PS_JUNKRAT_MINE_DIR] = null
    eventPlayer.player_state[PS_JUNKRAT_TRAP_TRIGGERED] = false
    eventPlayer.player_state[PS_LIFEWEAVER_BALL_TICK] = 0
    eventPlayer.setMoveSpeed(100)


rule "[juno] low orbit slingshot":
    @Event eachPlayer
    @Hero juno
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.player_state[210] == false
    @Condition eventPlayer.player_state[213] == false
    @Condition eventPlayer.isUsingAbility1() == true

    eventPlayer.player_state[210] = true
    eventPlayer.player_state[213] = true
    eventPlayer.player_state[211] = eventPlayer.getPosition()
    eventPlayer.player_state[212] = eventPlayer.getFacingDirection()
    eventPlayer.player_state[214] = []
    createEffect(getAllPlayers(), Effect.GOOD_AURA, Color.BLUE, eventPlayer.player_state[211], 2.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_state[214].append(getLastCreatedEntity())
    createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Color.AQUA, eventPlayer.player_state[211], 2.2, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_state[214].append(getLastCreatedEntity())
    smallMessage(eventPlayer, "近地点锁定")
    wait(0.35)
    if eventPlayer.isAlive() == true and eventPlayer.getHero() == Hero.JUNO:
        playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.BLUE, eventPlayer, 2)
        eventPlayer.applyImpulse(eventPlayer.player_state[212] + Vector.UP * 0.45, 30, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
        eventPlayer.player_state[PS_LIFEWEAVER_BALL_TICK] = 0
        while eventPlayer.player_state[213] == true and eventPlayer.isAlive() == true and eventPlayer.getHero() == Hero.JUNO and eventPlayer.player_state[PS_LIFEWEAVER_BALL_TICK] < 10:
            eventPlayer.player_state[229] = getPlayersInRadius(eventPlayer, 2.2, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and player.player_state[228] == false and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam()))
            if len(eventPlayer.player_state[229]) > 0:
                eventPlayer.player_state[229].player_state[228] = true
                damage(eventPlayer.player_state[229], eventPlayer, 8)
                eventPlayer.player_state[229].applyImpulse(eventPlayer.player_state[212] + Vector.UP * 0.2, 12, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
                eventPlayer.applyImpulse(eventPlayer.player_state[212] * -1 + Vector.UP * 0.25, 7, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
                playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.AQUA, eventPlayer, 1.2)
            eventPlayer.player_state[PS_LIFEWEAVER_BALL_TICK] += 1
            wait(0.15)
    getAllPlayers().filter(lambda player: player.player_state[228] == true).player_state[228] = false
    if len(eventPlayer.player_state[214]) > 0:
        destroyEffect(eventPlayer.player_state[214][0])
    if len(eventPlayer.player_state[214]) > 1:
        destroyEffect(eventPlayer.player_state[214][1])
    eventPlayer.player_state[211] = null
    eventPlayer.player_state[212] = null
    eventPlayer.player_state[213] = false
    eventPlayer.player_state[214] = []
    eventPlayer.player_state[229] = []
    wait(3)
    eventPlayer.player_state[210] = false


rule "[juno] anti gravity bubble":
    @Event eachPlayer
    @Hero juno
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.player_state[215] == false
    @Condition eventPlayer.isUsingAbility2() == true

    eventPlayer.player_state[215] = true
    eventPlayer.player_state[216] = nearestWalkablePosition(eventPlayer.getPosition())
    eventPlayer.player_state[217] = []
    eventPlayer.player_state[218] = 0
    createEffect(getAllPlayers(), Effect.GOOD_AURA, Color.AQUA, eventPlayer.player_state[216], 4, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_state[217].append(getLastCreatedEntity())
    createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Color.BLUE, eventPlayer.player_state[216], 3.2, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_state[217].append(getLastCreatedEntity())
    smallMessage(getPlayersInRadius(eventPlayer.player_state[216], 5, Team.ALL, LosCheck.SURFACES).filter(lambda player: player.isAlive() == true), "反重力泡泡")
    while eventPlayer.player_state[215] == true and eventPlayer.isAlive() == true and eventPlayer.getHero() == Hero.JUNO and eventPlayer.player_state[218] < 12:
        getPlayersInRadius(eventPlayer.player_state[216], 4, Team.ALL, LosCheck.SURFACES).filter(lambda player: player.isAlive() == true and player.player_state[219] == false).player_state[220] = eventPlayer
        getPlayersInRadius(eventPlayer.player_state[216], 4, Team.ALL, LosCheck.SURFACES).filter(lambda player: player.isAlive() == true and player.player_state[219] == false).player_state[221] = getPlayersInRadius(eventPlayer.player_state[216], 4, Team.ALL, LosCheck.SURFACES).filter(lambda player: player.isAlive() == true and player.player_state[219] == false).getHero()
        getPlayersInRadius(eventPlayer.player_state[216], 4, Team.ALL, LosCheck.SURFACES).filter(lambda player: player.isAlive() == true).setGravity(45)
        getPlayersInRadius(eventPlayer.player_state[216], 4, Team.ALL, LosCheck.SURFACES).filter(lambda player: player.isAlive() == true).player_state[219] = true
        eventPlayer.player_state[218] += 1
        wait(0.25)
    if len(eventPlayer.player_state[217]) > 0:
        destroyEffect(eventPlayer.player_state[217][0])
    if len(eventPlayer.player_state[217]) > 1:
        destroyEffect(eventPlayer.player_state[217][1])
    getAllPlayers().filter(lambda player: player.player_state[220] == eventPlayer).setGravity(100)
    getAllPlayers().filter(lambda player: player.player_state[220] == eventPlayer).player_state[219] = false
    getAllPlayers().filter(lambda player: player.player_state[220] == eventPlayer).player_state[221] = null
    getAllPlayers().filter(lambda player: player.player_state[220] == eventPlayer).player_state[220] = null
    eventPlayer.player_state[215] = false
    eventPlayer.player_state[216] = null
    eventPlayer.player_state[217] = []
    eventPlayer.player_state[218] = 0
    wait(4)


rule "[juno] clear anti gravity on target exit":
    @Event eachPlayer
    @Condition eventPlayer.player_state[219] == true

    wait(0.35)
    while eventPlayer.player_state[219] == true and eventPlayer.player_state[220] != null and eventPlayer.player_state[220].player_state[215] == true and eventPlayer.player_state[220].player_state[216] != null and eventPlayer.isAlive() == true and eventPlayer.getHero() == eventPlayer.player_state[221] and distance(eventPlayer, eventPlayer.player_state[220].player_state[216]) <= 4:
        wait(0.25)
    eventPlayer.setGravity(100)
    eventPlayer.player_state[219] = false
    eventPlayer.player_state[220] = null
    eventPlayer.player_state[221] = null


rule "[juno] star track drift":
    @Event eachPlayer
    @Hero juno
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isInAir() == true
    @Condition eventPlayer.player_state[222] == false
    @Condition eventPlayer.player_state[223] == false
    @Condition eventPlayer.isHoldingButton(Button.JUMP) == true or eventPlayer.isHoldingButton(Button.CROUCH) == true

    eventPlayer.player_state[222] = true
    eventPlayer.player_state[223] = true
    eventPlayer.applyImpulse(eventPlayer.getFacingDirection() + Vector.UP * 0.08, 14, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.BLUE, eventPlayer, 1)
    wait(0.45)
    eventPlayer.player_state[223] = false
    wait(1.1)
    eventPlayer.player_state[222] = false


rule "[juno] orbital courier melee":
    @Event playerDealtDamage
    @Hero juno
    @Condition victim != eventPlayer
    @Condition eventDamage > 0
    @Condition eventAbility == Button.MELEE
    @Condition eventPlayer.player_state[224] == false

    eventPlayer.player_state[224] = true
    victim.applyImpulse(eventPlayer.getFacingDirection() + Vector.UP * 0.15, 16, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
    smallMessage(victim, "轨道快递")
    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.BLUE, victim, 1.2)
    wait(0.8)
    eventPlayer.player_state[224] = false


rule "[juno] lunar escape on lethal damage":
    @Event playerTookDamage
    @Hero juno
    @Condition eventPlayer.player_state[225] == false
    @Condition eventPlayer.getHealth() - eventDamage <= 0

    eventPlayer.player_state[225] = true
    eventPlayer.player_state[226] = false
    eventPlayer.resurrect()
    eventPlayer.setHealth(45)
    eventPlayer.setStatusEffect(eventPlayer, Status.INVINCIBLE, 0.6)
    eventPlayer.applyImpulse(Vector.UP, 28, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.AQUA, eventPlayer, 2.4)
    bigMessage(eventPlayer, "环月逃逸")
    wait(0.6)
    if eventPlayer.isAlive() == true and eventPlayer.getHero() == Hero.JUNO:
        eventPlayer.player_state[226] = true
        eventPlayer.setMoveSpeed(80)
        eventPlayer.setDamageReceived(130)
        smallMessage(eventPlayer, "氧气债务")
        wait(3)
        if eventPlayer.getHero() == Hero.JUNO:
            eventPlayer.setMoveSpeed(100)
            eventPlayer.setDamageReceived(100)
            eventPlayer.player_state[226] = false
    wait(10)
    eventPlayer.player_state[225] = false


rule "[juno] clear temporary states on death":
    @Event playerDied
    @Hero juno

    if len(eventPlayer.player_state[214]) > 0:
        destroyEffect(eventPlayer.player_state[214][0])
    if len(eventPlayer.player_state[214]) > 1:
        destroyEffect(eventPlayer.player_state[214][1])
    if len(eventPlayer.player_state[217]) > 0:
        destroyEffect(eventPlayer.player_state[217][0])
    if len(eventPlayer.player_state[217]) > 1:
        destroyEffect(eventPlayer.player_state[217][1])
    getAllPlayers().filter(lambda player: player.player_state[220] == eventPlayer).setGravity(100)
    getAllPlayers().filter(lambda player: player.player_state[220] == eventPlayer).player_state[219] = false
    getAllPlayers().filter(lambda player: player.player_state[220] == eventPlayer).player_state[221] = null
    getAllPlayers().filter(lambda player: player.player_state[220] == eventPlayer).player_state[220] = null
    eventPlayer.player_state[211] = null
    eventPlayer.player_state[212] = null
    eventPlayer.player_state[213] = false
    eventPlayer.player_state[214] = []
    eventPlayer.player_state[215] = false
    eventPlayer.player_state[216] = null
    eventPlayer.player_state[217] = []
    eventPlayer.player_state[218] = 0
    eventPlayer.player_state[223] = false
    eventPlayer.player_state[224] = false
    eventPlayer.player_state[226] = false
    eventPlayer.player_state[229] = []
    eventPlayer.setGravity(100)
    eventPlayer.setMoveSpeed(100)
    eventPlayer.setDamageReceived(100)


rule "[juno] clear all state after hero swap":
    @Event eachPlayer
    @Condition eventPlayer.getHero() != Hero.JUNO
    @Condition eventPlayer.player_state[210] == true or eventPlayer.player_state[213] == true or len(eventPlayer.player_state[214]) > 0 or eventPlayer.player_state[215] == true or len(eventPlayer.player_state[217]) > 0 or eventPlayer.player_state[219] == true or eventPlayer.player_state[222] == true or eventPlayer.player_state[223] == true or eventPlayer.player_state[224] == true or eventPlayer.player_state[225] == true or eventPlayer.player_state[226] == true

    if len(eventPlayer.player_state[214]) > 0:
        destroyEffect(eventPlayer.player_state[214][0])
    if len(eventPlayer.player_state[214]) > 1:
        destroyEffect(eventPlayer.player_state[214][1])
    if len(eventPlayer.player_state[217]) > 0:
        destroyEffect(eventPlayer.player_state[217][0])
    if len(eventPlayer.player_state[217]) > 1:
        destroyEffect(eventPlayer.player_state[217][1])
    getAllPlayers().filter(lambda player: player.player_state[220] == eventPlayer).setGravity(100)
    getAllPlayers().filter(lambda player: player.player_state[220] == eventPlayer).player_state[219] = false
    getAllPlayers().filter(lambda player: player.player_state[220] == eventPlayer).player_state[221] = null
    getAllPlayers().filter(lambda player: player.player_state[220] == eventPlayer).player_state[220] = null
    eventPlayer.player_state[210] = false
    eventPlayer.player_state[211] = null
    eventPlayer.player_state[212] = null
    eventPlayer.player_state[213] = false
    eventPlayer.player_state[214] = []
    eventPlayer.player_state[215] = false
    eventPlayer.player_state[216] = null
    eventPlayer.player_state[217] = []
    eventPlayer.player_state[218] = 0
    eventPlayer.player_state[219] = false
    eventPlayer.player_state[220] = null
    eventPlayer.player_state[221] = null
    eventPlayer.player_state[222] = false
    eventPlayer.player_state[223] = false
    eventPlayer.player_state[224] = false
    eventPlayer.player_state[225] = false
    eventPlayer.player_state[226] = false
    eventPlayer.player_state[229] = []
    eventPlayer.setGravity(100)
    eventPlayer.setMoveSpeed(100)
    eventPlayer.setDamageReceived(100)


rule "[pharah] arm sky raptor dive":
    @Event eachPlayer
    @Hero pharah
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.player_state[PS_PHARAH_DIVE_ACTIVE] == false
    @Condition eventPlayer.isUsingAbility1() == true

    eventPlayer.player_state[PS_PHARAH_DIVE_ACTIVE] = true
    smallMessage(eventPlayer, "天隼预备：5秒内左键俯冲")
    waitUntil(eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) == true or eventPlayer.isAlive() == false or eventPlayer.getHero() != Hero.PHARAH, 5)
    if eventPlayer.isAlive() == true and eventPlayer.getHero() == Hero.PHARAH and eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) == true:
        eventPlayer.player_state[PS_PHARAH_DIVE_POS] = nearestWalkablePosition(raycast(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * 35, getAllPlayers(), getAllPlayers(), false).getHitPosition())
        eventPlayer.player_state[PS_PHARAH_EMPOWERED_DIVE] = eventPlayer.player_state[PS_PHARAH_EAGLE_MOMENTUM] >= 3
        eventPlayer.player_state[PS_PHARAH_DIVE_TARGETS] = []
        wait(0.35)
        eventPlayer.applyImpulse(directionTowards(eventPlayer.getPosition(), eventPlayer.player_state[PS_PHARAH_DIVE_POS]) + Vector.DOWN * 0.18, 44 if eventPlayer.player_state[PS_PHARAH_EMPOWERED_DIVE] == true else 31, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
        wait(0.55)
        if eventPlayer.isAlive() == true and eventPlayer.getHero() == Hero.PHARAH:
            eventPlayer.player_state[PS_PHARAH_DIVE_TARGETS] = getPlayersInRadius(eventPlayer, 3.4, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam()))
        if len(eventPlayer.player_state[PS_PHARAH_DIVE_TARGETS]) > 0:
            damage(eventPlayer.player_state[PS_PHARAH_DIVE_TARGETS], eventPlayer, 45)
            eventPlayer.player_state[PS_PHARAH_DIVE_TARGETS].applyImpulse(directionTowards(eventPlayer, eventPlayer.player_state[PS_PHARAH_DIVE_TARGETS].getPosition()) + Vector.UP * 0.25, 10, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
            eventPlayer.player_state[PS_PHARAH_DIVE_TARGETS].setStatusEffect(eventPlayer, Status.KNOCKED_DOWN, 0.55)
            if eventPlayer.player_state[PS_PHARAH_EMPOWERED_DIVE] == false and eventPlayer.player_state[PS_PHARAH_EAGLE_MOMENTUM] < 3:
                eventPlayer.player_state[PS_PHARAH_EAGLE_MOMENTUM] += 1
                if eventPlayer.player_state[PS_PHARAH_EAGLE_MOMENTUM] >= 3:
                    eventPlayer.player_state[PS_PHARAH_EAGLE_MOMENTUM] = 3
        if len(eventPlayer.player_state[PS_PHARAH_DIVE_TARGETS]) == 0 and eventPlayer.isAlive() == true and eventPlayer.getHero() == Hero.PHARAH:
            eventPlayer.setStatusEffect(eventPlayer, Status.STUNNED, 3)
            bigMessage(eventPlayer, "俯冲落空")
        if eventPlayer.player_state[PS_PHARAH_EMPOWERED_DIVE] == true and eventPlayer.getHero() == Hero.PHARAH:
            eventPlayer.player_state[PS_PHARAH_EAGLE_MOMENTUM] = 0
            eventPlayer.setAbilityCooldown(Button.ABILITY_1, 0)
            eventPlayer.setAbilityCooldown(Button.ABILITY_2, 0)
    eventPlayer.player_state[PS_PHARAH_DIVE_ACTIVE] = false
    eventPlayer.player_state[PS_PHARAH_DIVE_POS] = null
    eventPlayer.player_state[PS_PHARAH_EMPOWERED_DIVE] = false
    eventPlayer.player_state[PS_PHARAH_DIVE_TARGETS] = []


rule "[pharah] eagle momentum from melee":
    @Event playerDealtDamage
    @Hero pharah
    @Condition victim != eventPlayer
    @Condition eventDamage > 0
    @Condition eventAbility == Button.MELEE
    @Condition eventPlayer.player_state[PS_PHARAH_MELEE_GAIN_CD] == false
    @Condition eventPlayer.player_state[PS_PHARAH_EAGLE_MOMENTUM] < 3

    eventPlayer.player_state[PS_PHARAH_MELEE_GAIN_CD] = true
    eventPlayer.player_state[PS_PHARAH_EAGLE_MOMENTUM] += 1
    if eventPlayer.player_state[PS_PHARAH_EAGLE_MOMENTUM] >= 3:
        eventPlayer.player_state[PS_PHARAH_EAGLE_MOMENTUM] = 3
        bigMessage(eventPlayer, "鹰势已满")
    wait(0.35)
    eventPlayer.player_state[PS_PHARAH_MELEE_GAIN_CD] = false


rule "[pharah] clear temporary states on death keep eagle momentum":
    @Event playerDied
    @Hero pharah

    eventPlayer.player_state[PS_PHARAH_DIVE_ACTIVE] = false
    eventPlayer.player_state[PS_PHARAH_DIVE_POS] = null
    eventPlayer.player_state[PS_PHARAH_MELEE_GAIN_CD] = false
    eventPlayer.player_state[PS_PHARAH_EMPOWERED_DIVE] = false
    eventPlayer.player_state[PS_PHARAH_DIVE_TARGETS] = []


rule "[pharah] clear all state after hero swap":
    @Event eachPlayer
    @Condition eventPlayer.getHero() != Hero.PHARAH
    @Condition eventPlayer.player_state[PS_PHARAH_EAGLE_MOMENTUM] > 0 or eventPlayer.player_state[PS_PHARAH_DIVE_ACTIVE] == true or eventPlayer.player_state[PS_PHARAH_DIVE_POS] != null or eventPlayer.player_state[PS_PHARAH_MELEE_GAIN_CD] == true or eventPlayer.player_state[PS_PHARAH_EMPOWERED_DIVE] == true or len(eventPlayer.player_state[PS_PHARAH_DIVE_TARGETS]) > 0

    eventPlayer.player_state[PS_PHARAH_EAGLE_MOMENTUM] = 0
    eventPlayer.player_state[PS_PHARAH_DIVE_ACTIVE] = false
    eventPlayer.player_state[PS_PHARAH_DIVE_POS] = null
    eventPlayer.player_state[PS_PHARAH_MELEE_GAIN_CD] = false
    eventPlayer.player_state[PS_PHARAH_EMPOWERED_DIVE] = false
    eventPlayer.player_state[PS_PHARAH_DIVE_TARGETS] = []


rule "[ashe] create bounty hud":
    @Event eachPlayer
    @Hero ashe
    @Condition eventPlayer.player_state[PS_ASHE_BOUNTY_HUD_CREATED] == false

    eventPlayer.player_state[PS_ASHE_BOUNTY_HUD_CREATED] = true
    hudHeader(eventPlayer, "赏金：{}".format(eventPlayer.player_state[PS_ASHE_BOUNTY]), HudPosition.RIGHT, -760, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING)
    eventPlayer.player_state[PS_ASHE_BOUNTY_HUD_ID] = getLastCreatedText()


rule "[ashe] damage bounty and dynamite burn cap":
    @Event playerDealtDamage
    @Hero ashe
    @Condition victim != eventPlayer
    @Condition eventDamage > 0

    eventPlayer.player_state[PS_ASHE_BOUNTY_GAIN_TEMP] = 0
    if eventAbility == Button.ABILITY_1:
        if eventDamage <= 20 and eventDamage > 12:
            heal(victim, null, eventDamage - 12)
        if eventPlayer.player_state[PS_ASHE_DYNAMITE_GAIN_CD] == false:
            eventPlayer.player_state[PS_ASHE_DYNAMITE_GAIN_CD] = true
            eventPlayer.player_state[PS_ASHE_DYNAMITE_RESET_LOCK] = true
            eventPlayer.player_state[PS_ASHE_BOUNTY_GAIN_TEMP] += 3
    elif eventPlayer.player_state[PS_ASHE_HIT_GAIN_CD] == false:
        eventPlayer.player_state[PS_ASHE_HIT_GAIN_CD] = true
        eventPlayer.player_state[PS_ASHE_BOUNTY_GAIN_TEMP] += 1
    grantAsheBountyFromTemp()
    if eventAbility == Button.ABILITY_1 and eventPlayer.player_state[PS_ASHE_DYNAMITE_RESET_LOCK] == true:
        eventPlayer.player_state[PS_ASHE_DYNAMITE_RESET_LOCK] = false
        wait(5.2)
        eventPlayer.player_state[PS_ASHE_DYNAMITE_GAIN_CD] = false
    if eventPlayer.player_state[PS_ASHE_HIT_GAIN_CD] == true:
        wait(0.35)
        eventPlayer.player_state[PS_ASHE_HIT_GAIN_CD] = false


rule "[ashe] lasso with primary fire":
    @Event eachPlayer
    @Hero ashe
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) == true
    @Condition eventPlayer.player_state[PS_ASHE_LASSO_CD] == false
    @Condition eventPlayer.player_state[PS_ASHE_LASSO_BUTTON_LOCK] == false

    eventPlayer.player_state[PS_ASHE_LASSO_BUTTON_LOCK] = true
    eventPlayer.player_state[PS_ASHE_LASSO_TARGET] = eventPlayer.getRealPlayerClosestToReticle(Team.ALL)
    if eventPlayer.player_state[PS_ASHE_LASSO_TARGET] != null and eventPlayer.player_state[PS_ASHE_LASSO_TARGET] != eventPlayer and eventPlayer.player_state[PS_ASHE_LASSO_TARGET].isAlive() == true and distance(eventPlayer, eventPlayer.player_state[PS_ASHE_LASSO_TARGET]) <= 18 and eventPlayer.isInViewAngle(eventPlayer.player_state[PS_ASHE_LASSO_TARGET].getPosition(), 20) == true and isInLoS(eventPlayer, eventPlayer.player_state[PS_ASHE_LASSO_TARGET], BarrierLos.PASS_THROUGH_BARRIERS) == true and (getCurrentGamemode() == Gamemode.FFA or eventPlayer.player_state[PS_ASHE_LASSO_TARGET].getTeam() != eventPlayer.getTeam()):
        eventPlayer.player_state[PS_ASHE_LASSO_CD] = true
        eventPlayer.player_state[PS_ASHE_BOUNTY_GAIN_TEMP] = 4
        grantAsheBountyFromTemp()
        eventPlayer.player_state[PS_ASHE_LASSO_TARGET].applyImpulse(directionTowards(eventPlayer.player_state[PS_ASHE_LASSO_TARGET], eventPlayer.getPosition() + eventPlayer.getFacingDirection() * 2) + Vector.UP * 0.08, 24, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
        wait(0.25)
        if eventPlayer.player_state[PS_ASHE_LASSO_TARGET] != null and eventPlayer.player_state[PS_ASHE_LASSO_TARGET].isAlive() == true and eventPlayer.isAlive() == true and eventPlayer.getHero() == Hero.ASHE:
            eventPlayer.player_state[PS_ASHE_LASSO_TARGET].teleport(nearestWalkablePosition(eventPlayer.getPosition() + eventPlayer.getFacingDirection() * 2))
        eventPlayer.player_state[PS_ASHE_RESERVED_LASSO_FX] = []
        eventPlayer.player_state[PS_ASHE_LASSO_TARGET] = null
        wait(5 if eventPlayer.player_state[PS_ASHE_BOUNTY] < 20 else 4 if eventPlayer.player_state[PS_ASHE_BOUNTY] < 70 else 3)
        eventPlayer.player_state[PS_ASHE_LASSO_CD] = false
    waitUntil(eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) == false or eventPlayer.isAlive() == false or eventPlayer.getHero() != Hero.ASHE, 1.5)
    eventPlayer.player_state[PS_ASHE_LASSO_BUTTON_LOCK] = false


rule "[ashe] gain bounty on final blow":
    @Event playerDealtFinalBlow
    @Hero ashe
    @Condition victim != eventPlayer

    eventPlayer.player_state[PS_ASHE_BOUNTY_GAIN_TEMP] = 20
    grantAsheBountyFromTemp()


rule "[ashe] reward killer for high bounty":
    @Event playerDealtFinalBlow
    @Condition victim.getHero() == Hero.ASHE
    @Condition victim.player_state[PS_ASHE_BOUNTY] >= 40
    @Condition eventPlayer != victim

    eventPlayer.player_state[PS_ASHE_REWARD_BOUNTY_SNAPSHOT] = victim.player_state[PS_ASHE_BOUNTY]
    eventPlayer.player_state[PS_ASHE_KILLER_REWARD_SPEED] = true
    eventPlayer.setMoveSpeed(115)
    if eventPlayer.player_state[PS_ASHE_REWARD_BOUNTY_SNAPSHOT] >= 70:
        if eventPlayer.getAbilityCooldown(Button.ABILITY_1) > 3:
            eventPlayer.setAbilityCooldown(Button.ABILITY_1, 3)
        if eventPlayer.getAbilityCooldown(Button.ABILITY_2) > 3:
            eventPlayer.setAbilityCooldown(Button.ABILITY_2, 3)
    if eventPlayer.player_state[PS_ASHE_REWARD_BOUNTY_SNAPSHOT] >= 100:
        if eventPlayer.getUltCharge() + eventPlayer.player_state[PS_ASHE_REWARD_BOUNTY_SNAPSHOT] - 50 >= 100:
            eventPlayer.setUltCharge(100)
        else:
            eventPlayer.setUltCharge(eventPlayer.getUltCharge() + eventPlayer.player_state[PS_ASHE_REWARD_BOUNTY_SNAPSHOT] - 50)
    wait(2)
    if eventPlayer.player_state[PS_ASHE_KILLER_REWARD_SPEED] == true:
        eventPlayer.setMoveSpeed(100)
        eventPlayer.player_state[PS_ASHE_KILLER_REWARD_SPEED] = false
    eventPlayer.player_state[PS_ASHE_REWARD_BOUNTY_SNAPSHOT] = 0


rule "[ashe] clear bounty on death":
    @Event playerDied
    @Hero ashe

    if len(eventPlayer.player_state[PS_ASHE_RESERVED_LASSO_FX]) > 0:
        destroyEffect(eventPlayer.player_state[PS_ASHE_RESERVED_LASSO_FX][0])
    if len(eventPlayer.player_state[PS_ASHE_RESERVED_HIGH_BOUNTY_FX]) > 0:
        destroyEffect(eventPlayer.player_state[PS_ASHE_RESERVED_HIGH_BOUNTY_FX][0])
    if len(eventPlayer.player_state[PS_ASHE_RESERVED_HIGH_BOUNTY_FX]) > 1:
        destroyEffect(eventPlayer.player_state[PS_ASHE_RESERVED_HIGH_BOUNTY_FX][1])
    eventPlayer.player_state[PS_ASHE_BOUNTY] = 0
    eventPlayer.player_state[PS_ASHE_LASSO_CD] = false
    eventPlayer.player_state[PS_ASHE_LASSO_TARGET] = null
    eventPlayer.player_state[PS_ASHE_RESERVED_LASSO_FX] = []
    eventPlayer.player_state[PS_ASHE_HIT_GAIN_CD] = false
    eventPlayer.player_state[PS_ASHE_HIGH_BOUNTY_PROMPTED] = false
    eventPlayer.player_state[PS_ASHE_RESERVED_HIGH_BOUNTY_FX] = []
    eventPlayer.player_state[PS_ASHE_BOUNTY_GAIN_TEMP] = 0
    eventPlayer.player_state[PS_ASHE_LASSO_BUTTON_LOCK] = false
    eventPlayer.setMoveSpeed(100)


rule "[ashe] clear all state after hero swap":
    @Event eachPlayer
    @Condition eventPlayer.getHero() != Hero.ASHE
    @Condition eventPlayer.player_state[PS_ASHE_BOUNTY] > 0 or eventPlayer.player_state[PS_ASHE_BOUNTY_HUD_CREATED] == true or eventPlayer.player_state[PS_ASHE_LASSO_CD] == true or len(eventPlayer.player_state[PS_ASHE_RESERVED_LASSO_FX]) > 0 or eventPlayer.player_state[PS_ASHE_HIGH_BOUNTY_PROMPTED] == true or len(eventPlayer.player_state[PS_ASHE_RESERVED_HIGH_BOUNTY_FX]) > 0 or eventPlayer.player_state[PS_ASHE_LASSO_BUTTON_LOCK] == true

    if eventPlayer.player_state[PS_ASHE_BOUNTY_HUD_CREATED] == true:
        destroyHudText(eventPlayer.player_state[PS_ASHE_BOUNTY_HUD_ID])
    if len(eventPlayer.player_state[PS_ASHE_RESERVED_LASSO_FX]) > 0:
        destroyEffect(eventPlayer.player_state[PS_ASHE_RESERVED_LASSO_FX][0])
    if len(eventPlayer.player_state[PS_ASHE_RESERVED_HIGH_BOUNTY_FX]) > 0:
        destroyEffect(eventPlayer.player_state[PS_ASHE_RESERVED_HIGH_BOUNTY_FX][0])
    if len(eventPlayer.player_state[PS_ASHE_RESERVED_HIGH_BOUNTY_FX]) > 1:
        destroyEffect(eventPlayer.player_state[PS_ASHE_RESERVED_HIGH_BOUNTY_FX][1])
    eventPlayer.player_state[PS_ASHE_BOUNTY] = 0
    eventPlayer.player_state[PS_ASHE_BOUNTY_HUD_CREATED] = false
    eventPlayer.player_state[PS_ASHE_BOUNTY_HUD_ID] = null
    eventPlayer.player_state[PS_ASHE_LASSO_CD] = false
    eventPlayer.player_state[PS_ASHE_LASSO_TARGET] = null
    eventPlayer.player_state[PS_ASHE_RESERVED_LASSO_FX] = []
    eventPlayer.player_state[PS_ASHE_HIT_GAIN_CD] = false
    eventPlayer.player_state[PS_ASHE_HIGH_BOUNTY_PROMPTED] = false
    eventPlayer.player_state[PS_ASHE_RESERVED_HIGH_BOUNTY_FX] = []
    eventPlayer.player_state[PS_ASHE_BOUNTY_GAIN_TEMP] = 0
    eventPlayer.player_state[PS_ASHE_LASSO_BUTTON_LOCK] = false
    eventPlayer.setMoveSpeed(100)


rule "[wrecking ball] enter ball form":
    @Event eachPlayer
    @Hero wreckingBall
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isInAlternateForm() == false

    eventPlayer.allowButton(Button.ABILITY_1)
    eventPlayer.forceButtonPress(Button.ABILITY_1)
    waitUntil(eventPlayer.isInAlternateForm() == true or eventPlayer.isAlive() == false or eventPlayer.getHero() != Hero.WRECKING_BALL, 0.4)
    if eventPlayer.isAlive() == true and eventPlayer.getHero() == Hero.WRECKING_BALL and eventPlayer.isInAlternateForm() == false:
        eventPlayer.forceButtonPress(Button.ABILITY_1)
        waitUntil(eventPlayer.isInAlternateForm() == true or eventPlayer.isAlive() == false or eventPlayer.getHero() != Hero.WRECKING_BALL, 0.4)
    if eventPlayer.isAlive() == true and eventPlayer.getHero() == Hero.WRECKING_BALL and eventPlayer.isInAlternateForm() == true:
        eventPlayer.disallowButton(Button.ABILITY_1)


rule "[wrecking ball] lock ball form":
    @Event eachPlayer
    @Hero wreckingBall
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.isInAlternateForm() == true

    eventPlayer.disallowButton(Button.ABILITY_1)
    wait(0.25)


rule "[wrecking ball] restore roll transform after hero swap":
    @Event eachPlayer
    @Condition eventPlayer.getHero() != Hero.WRECKING_BALL

    eventPlayer.allowButton(Button.ABILITY_1)


rule "[wrecking ball] billiard charge and break":
    @Event eachPlayer
    @Hero wreckingBall
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.player_state[230] == false
    @Condition eventPlayer.player_state[234] == false
    @Condition eventPlayer.player_state[245] == false
    @Condition eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) == true

    eventPlayer.player_state[230] = true
    eventPlayer.player_state[245] = true
    eventPlayer.player_state[231] = 0
    eventPlayer.player_state[232] = eventPlayer.getFacingDirection()
    eventPlayer.player_state[233] = []
    eventPlayer.setMoveSpeed(12)
    eventPlayer.disallowButton(Button.PRIMARY_FIRE)
    createBeam(getAllPlayers(), Beam.BAD, eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + eventPlayer.player_state[232] * 18, Color.ORANGE, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_state[233].append(getLastCreatedEntity())
    createEffect(getAllPlayers(), Effect.BAD_AURA, Color.ORANGE, eventPlayer, 2.2, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_state[233].append(getLastCreatedEntity())
    createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Color.ORANGE, eventPlayer.getEyePosition() + eventPlayer.player_state[232] * 18, 1.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_state[233].append(getLastCreatedEntity())
    smallMessage(eventPlayer, "架杆蓄力")
    smallMessage(eventPlayer, "瞄准会跟随视野，松开左键爆杆")
    smallMessage(getPlayersInRadius(eventPlayer, 10, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true), "仓鼠正在架杆")
    while eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) == true and eventPlayer.isAlive() == true and eventPlayer.getHero() == Hero.WRECKING_BALL and eventPlayer.hasStatus(Status.STUNNED) == false and eventPlayer.hasStatus(Status.KNOCKED_DOWN) == false and eventPlayer.hasStatus(Status.ASLEEP) == false and eventPlayer.hasStatus(Status.FROZEN) == false and eventPlayer.player_state[231] < 13:
        eventPlayer.player_state[232] = eventPlayer.getFacingDirection()
        eventPlayer.player_state[231] += 1
        if eventPlayer.player_state[231] == 5:
            smallMessage(eventPlayer, "中力爆杆")
            playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.YELLOW, eventPlayer, 1.4)
        if eventPlayer.player_state[231] == 10:
            smallMessage(eventPlayer, "满力爆杆")
            playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.ORANGE, eventPlayer, 1.5)
        wait(0.2)
    if len(eventPlayer.player_state[233]) > 0:
        destroyEffect(eventPlayer.player_state[233][0])
    if len(eventPlayer.player_state[233]) > 1:
        destroyEffect(eventPlayer.player_state[233][1])
    if len(eventPlayer.player_state[233]) > 2:
        destroyEffect(eventPlayer.player_state[233][2])
    eventPlayer.player_state[233] = []
    eventPlayer.allowButton(Button.PRIMARY_FIRE)
    eventPlayer.setMoveSpeed(100)
    if eventPlayer.isAlive() == true and eventPlayer.getHero() == Hero.WRECKING_BALL and eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) == false and eventPlayer.hasStatus(Status.STUNNED) == false and eventPlayer.hasStatus(Status.KNOCKED_DOWN) == false and eventPlayer.hasStatus(Status.ASLEEP) == false and eventPlayer.hasStatus(Status.FROZEN) == false:
        eventPlayer.player_state[235] = 3 if eventPlayer.player_state[231] >= 10 else 2 if eventPlayer.player_state[231] >= 5 else 1
        eventPlayer.player_state[234] = true
        eventPlayer.player_state[236] = 0
        eventPlayer.player_state[239] = 0
        eventPlayer.player_state[240] = false
        eventPlayer.player_state[246] = eventPlayer.getPosition()
        smallMessage(eventPlayer, "爆杆！")
        while eventPlayer.player_state[234] == true and eventPlayer.isAlive() == true and eventPlayer.getHero() == Hero.WRECKING_BALL and eventPlayer.player_state[236] < (18 if eventPlayer.player_state[235] == 3 else 13 if eventPlayer.player_state[235] == 2 else 9):
            eventPlayer.applyImpulse(eventPlayer.player_state[232], 32 if eventPlayer.player_state[235] == 3 else 20 if eventPlayer.player_state[235] == 2 else 13, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
            wait(0.14)
            eventPlayer.player_state[237] = getPlayersInRadius(eventPlayer, 2.3, Team.ALL, LosCheck.SURFACES).filter(lambda player: player != eventPlayer and player.isAlive() == true and player.player_state[238] != eventPlayer and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.getTeam()))
            if len(eventPlayer.player_state[237]) > 0:
                eventPlayer.player_state[237].player_state[238] = eventPlayer
                damage(eventPlayer.player_state[237], eventPlayer, 85 if eventPlayer.player_state[235] == 3 else 55 if eventPlayer.player_state[235] == 2 else 30)
                eventPlayer.player_state[237].applyImpulse(eventPlayer.player_state[232] + Vector.UP * 0.2, 12, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
                eventPlayer.player_state[237].setMoveSpeed(80)
                if eventPlayer.player_state[240] == false:
                    sorted(eventPlayer.player_state[237].filter(lambda player: player.player_state[241] == null), key=lambda player: distance(eventPlayer, player))[0].player_state[241] = eventPlayer
                    eventPlayer.player_state[240] = true
                playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, Color.ORANGE, eventPlayer, 1.8)
            if distance(eventPlayer, eventPlayer.player_state[246]) < 0.45:
                if eventPlayer.player_state[239] < 2:
                    eventPlayer.player_state[239] += 1
                    eventPlayer.player_state[232] = eventPlayer.player_state[232] * -1
                    eventPlayer.applyImpulse(eventPlayer.player_state[232] + Vector.UP * 0.1, 12 if eventPlayer.player_state[235] == 3 else 9, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
                    smallMessage(eventPlayer, "库边反弹")
                    playEffect(getAllPlayers(), DynamicEffect.BAD_EXPLOSION, Color.WHITE, eventPlayer, 1.4)
                else:
                    smallMessage(eventPlayer, "母球落袋")
                    eventPlayer.setStatusEffect(eventPlayer, Status.ROOTED, 0.6)
                    eventPlayer.player_state[236] = 99
            eventPlayer.player_state[246] = eventPlayer.getPosition()
            eventPlayer.player_state[236] += 1
        if eventPlayer.player_state[235] == 3 and eventPlayer.player_state[240] == false:
            smallMessage(eventPlayer, "空杆犯规")
            eventPlayer.setMoveSpeed(55)
            wait(1)
            eventPlayer.setMoveSpeed(100)
        getAllPlayers().filter(lambda player: player.player_state[238] == eventPlayer).setMoveSpeed(100)
        getAllPlayers().filter(lambda player: player.player_state[238] == eventPlayer).player_state[238] = null
        eventPlayer.player_state[234] = false
    eventPlayer.player_state[230] = false
    eventPlayer.player_state[231] = 0
    eventPlayer.player_state[232] = null
    eventPlayer.player_state[235] = 0
    eventPlayer.player_state[236] = 0
    eventPlayer.player_state[237] = null
    eventPlayer.player_state[239] = 0
    eventPlayer.player_state[240] = false
    eventPlayer.player_state[246] = null
    wait(1.5)
    eventPlayer.player_state[245] = false


rule "[wrecking ball] target ball chain":
    @Event eachPlayer
    @Condition eventPlayer.player_state[241] != null
    @Condition len(eventPlayer.player_state[242]) == 0

    eventPlayer.player_state[242] = []
    eventPlayer.player_state[243] = 0
    createEffect(getAllPlayers(), Effect.BAD_AURA, Color.ORANGE, eventPlayer, 1.4, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_state[242].append(getLastCreatedEntity())
    smallMessage(eventPlayer, "目标球")
    eventPlayer.player_state[PS_LIFEWEAVER_BALL_TICK] = 0
    while eventPlayer.player_state[241] != null and eventPlayer.player_state[241].isAlive() == true and eventPlayer.player_state[241].getHero() == Hero.WRECKING_BALL and eventPlayer.isAlive() == true and eventPlayer.player_state[PS_LIFEWEAVER_BALL_TICK] < 10 and eventPlayer.player_state[243] < 2:
        eventPlayer.player_state[237] = getLivingPlayers(Team.ALL).filter(lambda player: player != eventPlayer and player != eventPlayer.player_state[241] and distance(player, eventPlayer) <= 2.2 and (getCurrentGamemode() == Gamemode.FFA or player.getTeam() != eventPlayer.player_state[241].getTeam()))
        if len(eventPlayer.player_state[237]) > 0:
            damage(eventPlayer.player_state[237], eventPlayer.player_state[241], 25)
            eventPlayer.player_state[237].setMoveSpeed(75)
            eventPlayer.player_state[241].setMoveSpeed(120)
            smallMessage(eventPlayer.player_state[241], "连环进球")
            playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.ORANGE, eventPlayer, 2)
            eventPlayer.player_state[243] += 1
            wait(1)
            eventPlayer.player_state[237].setMoveSpeed(100)
            if eventPlayer.player_state[241] != null:
                eventPlayer.player_state[241].setMoveSpeed(100)
        eventPlayer.player_state[PS_LIFEWEAVER_BALL_TICK] += 1
        wait(0.2)
    if len(eventPlayer.player_state[242]) > 0:
        destroyEffect(eventPlayer.player_state[242][0])
    eventPlayer.player_state[241] = null
    eventPlayer.player_state[242] = []
    eventPlayer.player_state[243] = 0


rule "[wrecking ball] clear target ball if invalid":
    @Event eachPlayer
    @Condition eventPlayer.player_state[241] != null
    @Condition eventPlayer.isDead() == true or eventPlayer.player_state[241].isAlive() == false or eventPlayer.player_state[241].getHero() != Hero.WRECKING_BALL

    if len(eventPlayer.player_state[242]) > 0:
        destroyEffect(eventPlayer.player_state[242][0])
    eventPlayer.player_state[241] = null
    eventPlayer.player_state[242] = []
    eventPlayer.player_state[243] = 0


rule "[wrecking ball] clear temporary states on death":
    @Event playerDied
    @Hero wreckingBall

    if len(eventPlayer.player_state[233]) > 0:
        destroyEffect(eventPlayer.player_state[233][0])
    if len(eventPlayer.player_state[233]) > 1:
        destroyEffect(eventPlayer.player_state[233][1])
    if len(eventPlayer.player_state[233]) > 2:
        destroyEffect(eventPlayer.player_state[233][2])
    getAllPlayers().filter(lambda player: player.player_state[238] == eventPlayer).setMoveSpeed(100)
    getAllPlayers().filter(lambda player: player.player_state[238] == eventPlayer).player_state[238] = null
    eventPlayer.allowButton(Button.PRIMARY_FIRE)
    eventPlayer.allowButton(Button.ABILITY_1)
    eventPlayer.setMoveSpeed(100)
    eventPlayer.player_state[230] = false
    eventPlayer.player_state[231] = 0
    eventPlayer.player_state[232] = null
    eventPlayer.player_state[233] = []
    eventPlayer.player_state[234] = false
    eventPlayer.player_state[235] = 0
    eventPlayer.player_state[236] = 0
    eventPlayer.player_state[237] = null
    eventPlayer.player_state[239] = 0
    eventPlayer.player_state[240] = false
    eventPlayer.player_state[245] = false
    eventPlayer.player_state[246] = null


rule "[wrecking ball] clear all state after hero swap":
    @Event eachPlayer
    @Condition eventPlayer.getHero() != Hero.WRECKING_BALL
    @Condition eventPlayer.player_state[230] == true or eventPlayer.player_state[234] == true or len(eventPlayer.player_state[233]) > 0 or eventPlayer.player_state[245] == true

    if len(eventPlayer.player_state[233]) > 0:
        destroyEffect(eventPlayer.player_state[233][0])
    if len(eventPlayer.player_state[233]) > 1:
        destroyEffect(eventPlayer.player_state[233][1])
    if len(eventPlayer.player_state[233]) > 2:
        destroyEffect(eventPlayer.player_state[233][2])
    getAllPlayers().filter(lambda player: player.player_state[238] == eventPlayer).setMoveSpeed(100)
    getAllPlayers().filter(lambda player: player.player_state[238] == eventPlayer).player_state[238] = null
    eventPlayer.allowButton(Button.PRIMARY_FIRE)
    eventPlayer.allowButton(Button.ABILITY_1)
    eventPlayer.setMoveSpeed(100)
    eventPlayer.player_state[230] = false
    eventPlayer.player_state[231] = 0
    eventPlayer.player_state[232] = null
    eventPlayer.player_state[233] = []
    eventPlayer.player_state[234] = false
    eventPlayer.player_state[235] = 0
    eventPlayer.player_state[236] = 0
    eventPlayer.player_state[237] = null
    eventPlayer.player_state[239] = 0
    eventPlayer.player_state[240] = false
    eventPlayer.player_state[245] = false
    eventPlayer.player_state[246] = null
