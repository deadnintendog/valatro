function love.load()
    
    audio = {}
    audio.flip = love.audio.newSource("audio/flip.mp3", "static")

    card = love.graphics.newImage("sprites/card_back.png")
    deckclick = 0
    card1 = false
    card2 = false
    card3 = false
    card4 = false
    card5 = false

    wait = false
    happy = false
    valentines = false
    day = false

    Card = {}
    Card.speed = 10

    Deck = {Card, Card, Card, Card, Card}

    for index in ipairs(Deck) do
        Deck[index].x = 700
        Deck[index].y = 500
    end
    
    bg = love.graphics.newImage("sprites/bg.png")
    cardH = love.graphics.newImage("sprites/cardH.png")    
    cardA = love.graphics.newImage("sprites/cardA.png")
    cardP = love.graphics.newImage("sprites/cardP.png")
    cardY = love.graphics.newImage("sprites/cardY.png")
    cardVA = love.graphics.newImage("sprites/cardVA.png")
    cardLE = love.graphics.newImage("sprites/cardLE.png")
    cardNT = love.graphics.newImage("sprites/cardNT.png")
    cardIN = love.graphics.newImage("sprites/cardIN.png")
    cardES = love.graphics.newImage("sprites/cardES.png")
    cardD = love.graphics.newImage("sprites/cardD.png")
    
    Invisible = {}
    Invisible.x, Invisible.y = 0, 0
    invisible = love.graphics.newImage("sprites/invisible.png")
    
end

function love.update(dt)

    if deckclick == 1 then
        if Deck[deckclick].x > deckclick*100 then
            Deck[deckclick].x = Deck[deckclick].x - Card.speed
            if Deck[deckclick].x == deckclick*100 then
                card1 = true
            end
        end
    end

    if deckclick == 2 then
        if Deck[deckclick].x > deckclick*100 then
            Deck[deckclick].x = Deck[deckclick].x - Card.speed
            if Deck[deckclick].x == deckclick*100 then
                card2 = true
            end
        end
    end

    if deckclick == 3 then
        if Deck[deckclick].x > deckclick*100 then
            Deck[deckclick].x = Deck[deckclick].x - Card.speed
            if Deck[deckclick].x == deckclick*100 then
                card3 = true
            end
        end
    end

    if deckclick == 4 then
        if Deck[deckclick].x > deckclick*100 then
            Deck[deckclick].x = Deck[deckclick].x - Card.speed
            if Deck[deckclick].x == deckclick*100 then
                card4 = true
            end
        end
    end

    if deckclick == 5 then
        if Deck[deckclick].x > deckclick*100 then
            Deck[deckclick].x = Deck[deckclick].x - Card.speed
            if Deck[deckclick].x == deckclick*100 then
                card5 = true
            end
        end
    end

    if wait == true then
        Invisible.x = Invisible.x + 5
        if Invisible.x >= 700 then
            happy = true
        end
    end

    if happy == true then
        Invisible.y = Invisible.y + 3
        if Invisible.y >= 500 then
            valentines = true
        end
    end


end

function love.draw()
    love.graphics.draw(bg)
    love.graphics.draw(invisible, Invisible.x, Invisible.y)

    if deckclick < 5 then
        love.graphics.draw(card, 700, 500) -- set deck
    end
    for index, value in ipairs(Deck) do
        love.graphics.draw(card, Card.x, Card.y)
    end

    if card1 == true then
        love.graphics.draw(cardH, 100, 500)
    end

    if card2 == true then
        love.graphics.draw(cardA, 200, 500)
    end

    if card3 == true then
        love.graphics.draw(cardP, 300, 500)
    end

    if card4 == true then
        love.graphics.draw(cardP, 400, 500)
    end

    if card5 == true then
        love.graphics.draw(cardY, 500, 500)
    end

    if card1 and card2 and card3 and card4 and card5 == true then
        wait = true
        if happy == true then
            love.graphics.draw(cardVA, 100, 500)
            love.graphics.draw(cardLE, 200, 500)
            love.graphics.draw(cardNT, 300, 500)
            love.graphics.draw(cardIN, 400, 500)
            love.graphics.draw(cardES, 500, 500)
        end
        
        if valentines == true then
            love.graphics.draw(card, 100, 500)
            love.graphics.draw(cardD, 200, 500)
            love.graphics.draw(cardA, 300, 500)
            love.graphics.draw(cardY, 400, 500)
            love.graphics.draw(card, 500, 500)
        end

        day = true

    end

end

function love.mousepressed(x, y)
    if x > 700 -- if deck clicked
        and x < 750
        and y > 500
        and y < 580
        and deckclick < 5
    then
        audio.flip:play()
        deckclick = deckclick + 1
        Deck[deckclick].x = 700
    end
end