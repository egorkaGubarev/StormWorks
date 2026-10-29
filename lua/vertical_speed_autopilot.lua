i = 0.04
max_pitch = 10

pitch = 0

function onTick()
    on = input.getBool(1)

    target = input.getNumber(1)
    current_speed = input.getNumber(2)
    current_pitch = input.getNumber(3)

    if on then
        pitch = math.min(max_pitch, math.max(-max_pitch, pitch + (target - current_speed) * i))
    else
        pitch = current_pitch * 360
    end

    output.setNumber(1, pitch)
end