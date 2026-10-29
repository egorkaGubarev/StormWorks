p = 1
i = 0.01
max_roll = 60

integral = 0

function onTick()
    on = input.getBool(1)

    target = input.getNumber(1)
    current_speed = input.getNumber(2)
    current_roll = input.getNumber(3)

    if on then
        integral = math.min(max_roll, math.max(-max_roll, integral + (target - current_speed * 360) * i))
        roll = math.min(max_roll, math.max(-max_roll, (target - current_speed * 360) * p + integral))
    else
        integral = 0
        roll = current_roll * 360
    end

    output.setNumber(1, roll)
end