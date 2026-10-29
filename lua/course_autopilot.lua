p = 40
max_rotation_speed = 6

function onTick()
    on = input.getBool(1)

    target_course = input.getNumber(1)
    current_course = input.getNumber(2)
    target_rotation_speed = input.getNumber(3)

    rotation_speed = target_rotation_speed

    if on then
        target_course = target_course / 360

        if target_course < 0.5 then
            target_course = -target_course
        else
            target_course = 1 - target_course
        end

        turn = current_course - target_course

        if turn > 0.5 then
            turn = turn - 1
        end

        if turn < -0.5 then
            turn = 1 + turn
        end
        
        rotation_speed = math.min(max_rotation_speed, math.max(-max_rotation_speed, turn * p))
    end

    output.setNumber(1, rotation_speed)
end