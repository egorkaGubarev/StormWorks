function onTick()
    course_lock = input.getBool(1)
    target_x = input.getNumber(1)
    target_y = input.getNumber(2)
    target_course = input.getNumber(3) / 360
    depth = input.getNumber(4)
    course = input.getNumber(5)
    x = input.getNumber(6)
    y = input.getNumber(7)

    delta_x = target_x - x
    delta_y = target_y - y

    if not course_lock then
        target_course = 0.25 - math.atan(delta_y / delta_x) / (2 * math.pi)

        if delta_x < 0 then
            target_course = target_course + 0.5
        end
    end

    if target_course < 0.5 then
        target_course = -target_course
    else
        target_course = 1 - target_course
    end

    turn = course - target_course
    if turn > 0.5 then
        turn = 1 - turn
    else
        if turn < -0.5 then
            turn = 1 + turn
        end
    end

    distance = (delta_x ^ 2 + delta_y ^ 2) ^ 0.5

    output.setNumber(1, math.max(-1, math.min(1, turn * 10)))
    output.setNumber(2, depth)
    output.setNumber(3, distance)
end