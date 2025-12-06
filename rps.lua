local draw = "Draw!"
local lose = "You lose!"
local win = "You win!"

local choices = { "Rock", "Paper", "Scissors" }

local winTable = {
    rock = { draw, lose, win },
    paper = { win, draw, lose },
    scissors = { lose, win, draw }
}

local play
local askToPlayAgain

askToPlayAgain = function()
    print("Play again? (y/n)")

    local yesOrNo = string.lower(io.read())
    if yesOrNo == "y" then
        return true
    elseif yesOrNo == "n" then
        return false
    else
        print("Invalid answer")
        return askToPlayAgain()
    end
end

play = function()
    print("Rock, Paper, Scissors:")
    local input = string.lower(io.read())
    local randomChoice = math.random(1, 3)

    if not winTable[input] then
        print("That isn't a valid answer!")
        return play()
    end

    print("Computer chose: " .. choices[randomChoice])

    local result = winTable[input][randomChoice]
    print(result)

    local continue = askToPlayAgain()
    if continue then
        return play()
    else
        return
    end
end

play()
