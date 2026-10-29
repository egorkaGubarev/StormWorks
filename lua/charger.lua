min_charge = 0.8
max_charge = 0.9

clutch = 0
clutch_step = 0.01

function onTick()
	charge = input.getNumber(1)

    if charge < min_charge then
        clutch = math.min(clutch + clutch_step, 1)
    else
        if charge > max_charge then
            clutch = math.max(clutch - clutch_step, 0)
        end
    end

	output.setNumber(1, clutch)
end