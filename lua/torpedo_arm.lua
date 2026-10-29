launched = false
tick = 0
arm_tick = 1000

function onTick()
    if input.getBool(1) then
        launched = true
    end

    if launched then
        tick = tick + 1
    end

    if tick > arm_tick then
        output.setBool(1, true)
    else
        output.setBool(1, false)
    end
end