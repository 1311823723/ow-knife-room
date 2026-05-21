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
playervar baptiste_fake_drug_target_active 45
playervar baptiste_fake_drug_roll 46
playervar genji_ult_window_active 47
playervar genji_ult_window_timer 48
playervar genji_ult_window_token 49


#Only remove the following directive if the gamemode does not use tricks such as A+0, A*0, "am" == "**", etc which would otherwise be optimized out.
#!optimizeStrict


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
    @Condition isGameInProgress() == true

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


rule "76初始化":
    @Event eachPlayer
    @Hero soldier

    eventPlayer.Y++


rule "76变大":
    @Event eachPlayer
    @Hero soldier
    @Condition eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) == true
    @Condition eventPlayer.Y <= 32

    eventPlayer.Y *= 2
    eventPlayer.Z -= 6
    eventPlayer.setDamageDealt(eventPlayer.Z)
    eventPlayer.startModifyingVoicelinePitch(0.5)


rule "76变小":
    @Event eachPlayer
    @Hero soldier
    @Condition eventPlayer.isHoldingButton(Button.SECONDARY_FIRE) == true
    @Condition eventPlayer.Y >= 0.001

    eventPlayer.Y /= 2
    eventPlayer.Z += 6
    eventPlayer.setMoveSpeed(eventPlayer.Z)
    eventPlayer.startModifyingVoicelinePitch(1.5)


rule "76复活后回归":
    @Event eachPlayer
    @Hero soldier
    @Condition eventPlayer.isAlive() == true
    @Condition Hero.SOLDIER == true

    eventPlayer.startScalingSize(eventPlayer.Y)
    eventPlayer.setMoveSpeed(100)
    eventPlayer.Z = 100


rule "规则 19":
    @Event eachPlayer
    @Condition eventPlayer.isDead() == true

    eventPlayer.stopScalingSize()


rule "移除机器人":
    @Condition hostPlayer.isHoldingButton(Button.RELOAD) == true

    destroyAllDummies()


rule "[hud] create ability guide prompt":
    hudHeader(getAllPlayers(), "按住互动键查看技能说明", HudPosition.ACTUALLY_LEFT, -999, Color.YELLOW, HudReeval.VISIBILITY_AND_STRING)


rule "[hud] show ability guide while holding interact":
    @Event eachPlayer
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true

    bigMessage(eventPlayer, "技能说明\n被入侵：变大并持续扣血\n蚁人76：左键变大，右键变小\n天使：每条命一次复活甲，致命伤回血并震开敌人\n巴蒂：大招哈哈镜随机变形；伤害有概率打出假药副作用\n源氏：击杀开启8秒疯狗时间；续杀刷新，结束后沉睡\n小美：造成伤害时20%概率冰冻目标\n路霸：钩中缩小目标，并强化下一次近战击退\n卢西奥：落地弹起附近其他玩家，自己短暂加速\n索杰恩：滑铲撞人会伤害、击倒并铲飞\n伊拉锐：概率晒黑目标；爆发弹开附近玩家\n芙蕾娅：E技能生成法阵，范围内玩家一起高飞\n安娜：睡针命中会添加醒目睡眠标记")


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

    eventPlayer.startScalingSize(32)
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
    @Condition victim.baptiste_fake_drug_target_active == false

    if random.randint(1, 100) <= 18:
        eventPlayer.baptiste_fake_drug_cooldown = true
        victim.baptiste_fake_drug_target_active = true
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
        victim.baptiste_fake_drug_target_active = false
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
    @Condition isGameInProgress() == true

    eventPlayer.genji_ult_window_token += 1
    eventPlayer.genji_ult_window_timer = 8
    eventPlayer.genji_ult_window_active = true
    eventPlayer.setUltCharge(100)
    eventPlayer.setAbilityCooldown(Button.ABILITY_1, 0)
    eventPlayer.setDamageDealt(70)
    eventPlayer.forceButtonPress(Button.ULTIMATE)
    playEffect(getAllPlayers(), DynamicEffect.GOOD_EXPLOSION, Color.GREEN, eventPlayer, 2)
    smallMessage(eventPlayer, "疯狗时间：8秒")


rule "[genji] blade window countdown":
    @Event eachPlayer
    @Hero genji
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.genji_ult_window_active == true
    @Condition eventPlayer.genji_ult_window_timer > 0

    wait(1)
    eventPlayer.genji_ult_window_timer -= 1


rule "[genji] end blade window with sleep":
    @Event eachPlayer
    @Hero genji
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.genji_ult_window_active == true
    @Condition eventPlayer.genji_ult_window_timer <= 0

    eventPlayer.genji_ult_window_active = false
    eventPlayer.genji_ult_window_timer = 0
    eventPlayer.setUltCharge(0)
    eventPlayer.setAbilityCooldown(Button.ABILITY_1, 999)
    eventPlayer.setDamageDealt(100)
    eventPlayer.setMoveSpeed(100)
    eventPlayer.setDamageReceived(100)
    eventPlayer.stopScalingSize()
    eventPlayer.setStatusEffect(null, Status.ASLEEP, 5)
    smallMessage(eventPlayer, "疯狗时间结束，源氏睡着了")


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
    eventPlayer.setUltCharge(0)
    eventPlayer.setDamageDealt(100)
    eventPlayer.setMoveSpeed(100)
    eventPlayer.setDamageReceived(100)
    eventPlayer.stopScalingSize()


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
