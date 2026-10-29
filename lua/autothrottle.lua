i = 0.0001
d = 1
dead_zone = 0.01
min_throttle = 0.2

prev_speed = 0
integral = 0
throttle = min_throttle

function onTick()
    on = input.getBool(1)
    target = input.getNumber(1)
    current_speed = input.getNumber(2)
    current_throttle = input.getNumber(3)

    if on then
        integral = math.max(min_throttle, math.min(1, integral + (target - current_speed) * i))
        throttle = (prev_speed - current_speed) * d + integral
    else
        throttle = current_throttle
    end

    up = false
    down = false

    if current_throttle < throttle - dead_zone then
        up = true
    end

    if current_throttle > throttle + dead_zone then
        down = true
    end

    prev_speed = current_speed

    output.setBool(1, up)
    output.setBool(2, down)
end