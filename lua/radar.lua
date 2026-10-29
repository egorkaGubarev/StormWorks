min_distance = 10
min_signature_distance = 1000
remove_delay = 1000
lock_shift = 0
prev_lock = 0
screen_range = 4000
targets = {}

function onTick()
    current_lock = input.getNumber(29)
    course = input.getNumber(30)

    if current_lock ~= prev_lock then
        lock_shift = 0
        prev_lock = current_lock
    end

    lock_target = current_lock + lock_shift

    for channel = 1, 7 do
        if input.getBool(channel) then
            targets_found = #targets
            channel_shift = 4 * (channel - 1)
            is_new = true

            r1 = input.getNumber(channel_shift + 1)

            if r1 > min_distance then
                phi1 = input.getNumber(channel_shift + 2) - course

                if phi1 < 0 then
                    phi1 = 1 + phi1
                end

                target = {distance = r1,
                          azimuth = phi1,
                          ticks = 0,
                          delta_x = r1 * math.sin(phi1 * 2 * math.pi),
                          delta_y = r1 * math.cos(phi1 * 2 * math.pi)}
                
                i = 1
                while (i <= targets_found and is_new) do
                    other = targets[i]

                    r2 = other.distance
                    phi2 = other.azimuth

                    if (r1 ^ 2 + r2 ^ 2 - 2 * r1 * r2 * math.cos((phi2 - phi1) * 2 * math.pi)) ^ 0.5 < min_signature_distance then
                        targets[i] = target
                        is_new = false
                    end

                    i = i + 1
                end

                if is_new then

                    i = 1
                    while i <= targets_found and targets[i].distance < r1 do
                        i = i + 1
                    end

                    table.insert(targets, i, target)

                    if i <= lock_target then
                        lock_shift = lock_shift + 1
                    end
                end
            end
        end
    end

    i = 1
    while i <= #targets do
        ticks = targets[i].ticks

        if ticks > remove_delay then
            table.remove(targets, i)

            if i < lock_target then
                lock_shift = lock_shift - 1
            end
        else
            targets[i].ticks = ticks + 1
            i = i + 1
        end
    end

    targets_found = #targets
    output.setNumber(3, targets_found)

    for i = 1, targets_found - 1 do
        next_target = i + 1

        first = targets[i]
        second = targets[next_target]

        if first.distance > second.distance then
            targets[i] = second
            targets[next_target] = first

            if lock_target == i then
                lock_shift = lock_shift + 1
            else
                if lock_target == next_target then
                    lock_shift = lock_shift - 1
                end
            end
        end
    end
	
    if lock_target > 0 and targets_found >= lock_target then
        target = targets[lock_target]

        output.setNumber(1, target.distance / 1000)
        output.setNumber(2, target.azimuth * 360)
        output.setNumber(4, target.delta_x)
        output.setNumber(5, target.delta_y)
    else
        lock_shift = 0
    end
end

function onDraw()
    size = screen.getWidth()
    scale = size / (2 * screen_range)
    center = size / 2

    screen.setColor(0, 255, 0)
    screen.drawLine(0, center, size - 1, center)
    screen.drawLine(center, 0, center, size - 1)

    screen.setColor(255, 0, 0)

    for i = 1, #targets do
        x = center + targets[i].delta_x * scale
        y = center - targets[i].delta_y * scale

        screen.drawCircleF(x, y, 1)
    end
end