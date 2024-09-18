local toFollow = "nick" -- nome do jogador (teste)
local toFollowPos = {nick}

local followMacro = macro(200, "follow target", function()
  local target = getCreatureByName(toFollow)
  if target then
    local tpos = target:getPosition()
    toFollowPos[tpos.z] = tpos
  end
  if player:isWalking() then return end
  local p = toFollowPos[posz()]
  if not p then return end
  if autoWalk(p, 20, {ignoreNonPathable=true, precision=1}) then
    delay(100)
  end
end)

onCreaturePositionChange(function(creature, oldPos, newPos)
  if creature:getName() == toFollow then
    toFollowPos[newPos.z] = newPos
  end
end)