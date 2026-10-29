p = 0.1
max_vertical_speed = 10

vertical_speed = 0

function onTick()
    on = input.getBool(1)

    target = input.getNumber(1)
    current = input.getNumber(2)

    if on then
        vertical_speed = math.min(max_vertical_speed, math.max(-max_vertical_speed, (target - current) * p))
    end

    output.setNumber(1, vertical_speed)
end