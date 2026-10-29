x_land = 3570
y_land = -5650

run_course = 130
appr_proj = 20000
target_appr_dist = 30000
p = 2

course_rad = run_course * math.pi / 180

sin_course = math.sin(course_rad)
cos_course = math.cos(course_rad)

target_x = x_land - sin_course * target_appr_dist
target_y = y_land - cos_course * target_appr_dist

course = 0

function onTick()
    on = input.getBool(1)

    x = input.getNumber(1)
    y = input.getNumber(2)

    if on then
        dx = x - x_land
        dy = y - y_land

        proj = -(sin_course * dx + cos_course * dy)
        shift = cos_course * dx - sin_course * dy

        if proj > appr_proj then
            stat = "final"
        end

        if stat == "appr" then
            course_guide = false
            gps_guide = true
        else
            course_guide = true
            gps_guide = false
            course = run_course - math.max(-90, math.min(90, math.atan(shift / proj) * 180 / math.pi * p))
        end

    else
        course_guide = false
        gps_guide = false
        stat = "appr"
    end

    output.setNumber(1, target_x)
    output.setNumber(2, target_y)
    output.setNumber(3, course)

    output.setBool(1, course_guide)
    output.setBool(2, gps_guide)
end