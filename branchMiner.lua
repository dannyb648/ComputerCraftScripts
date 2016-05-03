-- Branch mining software
-- @DannyB648

blocksTravelled = 0

function main(toMine)
 turtle.up()
	for i = 0, toMine do
		checkFuel()
		checkGravel()
		turtle.dig()
		turtle.forward()
		turtle.digDown()
		if blocksTravelled % 15 == 5 then
			placeTorch()
		end
		blocksTravelled = blocksTravelled + 1
	end
	returnHome()
	dropContents()
	turtle.turnLeft()
	turtle.turnLeft()
end

function returnHome()
	turtle.turnLeft()
	turtle.turnLeft()
	for i = 0, blocksTravelled do
			turtle.forward()
	end
	turtle.down()
end

function placeTorch() 
	turtle.select(15)
	turtle.placeDown()
	turtle.select(1)
end

function checkGravel()
	local success, data = turtle.inspect()
	if (success) then
		if (data.name == "minecraft:gravel") then
			turtle.dig()
			os.sleep(1)
			checkGravel()
		end
	end
end

function dropContents()
	for i = 1, 14 do
		turtle.select(i)
		turtle.drop()
	end
end

function checkFuel()
	local x = turtle.getFuelLevel()
	if (x < 3000) then
		turtle.select(16)
		turtle.refuel()
		turtle.select(1)
	end
end

main(argv[1])

