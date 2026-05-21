#Player variables

playervar Kiriko_Skill 26


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

    eventPlayer.setAbilityCooldown(Button.ABILITY_1, 50)
    eventPlayer.setAbilityCooldown(Button.ABILITY_2, 50)
    eventPlayer.setUltCharge(20)
    playEffect(getAllPlayers(), DynamicEffect.BAD_PICKUP_EFFECT, Color.ROSE, eventPlayer, 40)


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
    hudHeader(getAllPlayers(), "按住互动键查看技能说明", HudPosition.LEFT, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)


rule "[hud] show ability guide while holding interact":
    @Event eachPlayer
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true

    smallMessage(eventPlayer, "技能说明：被入侵会变大并持续扣血；铁拳拥有全部技能但伤害降低；蚁人76左键变大右键变小；天使拥有一层复活甲；所有角色拥有二段跳；小美造成伤害时有10%概率冰冻目标。")


rule "天使复活":
    @Event playerTookDamage
    @Hero mercy
    @Condition eventPlayer.isDead() == true

    eventPlayer.C++
    #Note: this '__while__' had no 'end' action.
    if eventPlayer.C < 2:
        eventPlayer.resurrect()
        attacker.addToScore(eventPlayer.getScore() - 1)


rule "天使死亡":
    @Event playerDied
    @Hero mercy
    @Condition victim == true
    @Condition eventPlayer.C == 2

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
    @Condition random.uniform(0, 100) < 10

    victim.setStatusEffect(eventPlayer, Status.FROZEN, 1)
