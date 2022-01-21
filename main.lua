
function love.load()
    boxes = {}
    questions = {"Q: The only number in the English language \nthat is spelt with the same number of letters \nas the number itself.",
                "Q: This person became one of the best leaders \nin the history of France. He made himself the \nemperor of France, got sent to St. Helena in the \nSouth Atlantic and died in 1821. He was considered \nto be a military genius.",
                "Q: This everyday necessity covers approximately \n71% of Earth’s surface.",
                "Q: Exaggerated statements or claims not meant \nto be taken literally. Example: \"Her brain is the \nsize of a pea.\"",
                "Q: This kind of number has exactly 2 factors. 1 \nand itself.",
                "Q: This person was famous for being one of the \ngreatest poets and playwrights in history. He is \nhugely popular, and most schools make their \nstudents study him.",
                "Q: This is a stable subatomic particle with a \ncharge of negative electricity, found in all atoms.",
                "Q: The use of words that imitate the sounds \nassociated with the objects or actions they \nrefer to. Examples: “Bark, chirp, growl.”",
                "Q: A famous mathematical sequence:  1, 1, 2, 3, \n5, 8, 13, 21, 34, 55, etc...",
                "Q: This person is famous for his view on slavery \nand he started a civil war between the North \nand South in the United States during his presidency.",
                "Q: This is the part of physics that tells us how \nthe things that make up atoms work. It also \ntells us how electromagnetic waves like light work.",
                "Q: The repetition of an initial consonant sound. \nExample: “Larry’s lizard likes leaping leopards.”",
                "Q: These are examples of this type of number: \n13431, 11099011, 456654, 38900983",
                "Q: This person was best known for his theory \nof evolution. He wrote the book \"On the Origin \nof Species\".",
                "Q: This states “For every action, there is an \nequal and opposite reaction”",
                "Q: A figure of speech in which incongruous or \ncontradictory terms appear side by side. \nExamples: “Living dead, Run Slowly, Dark light.”",
                "Q: These sets of numbers are examples derived \nfrom a popular mathematical theory: (3, 4, 5), \n(5, 12, 13), (8, 15, 17)",
                "Q: This person is famous for being the greatest \nMongolian ruler, for leading the largest army \nwhich at its peak stretched from Southern Europe \nto Northern China and for being the greatest \nconqueror in history.",
                "Q: This is the chemical formula for common \nTable Salt.",
                "Q: A figure of speech in which an inanimate \nobject or abstraction is endowed with human \nqualities or abilities."}

    answers = {"A: What is 4?", 
                "A: Who was Napoleon?",
                "A: What is water?", 
                "A: What is hyperbole?", 
                "A: What is a prime number?", 
                "A: Who was Shakespeare?", 
                "A: What is an Electron?", 
                "A: What is onomatopoeia?", 
                "A: What is the Fibonacci Sequence?", 
                "A: Who is Abraham Lincoln?", 
                "A: What is Quantum Mechanics?", 
                "A: What is alliteration?", 
                "A: What is a Palindrome Number?", 
                "A: Who is Charles Darwin?", 
                "A: What is Newtons Third Law?", 
                "A: What is oxymoron?", 
                "A: What is a Pythagorean triplet?", 
                "A: Who is Genghis Khan?", 
                "A: What is NaCl?",
                "A: What is personification?"}
    questionNum = 0
	fontL = love.graphics.newFont("golong.ttf",100)
    fontS = love.graphics.newFont("golong.ttf",75)
    fontF = love.graphics.newFont("golong.ttf",50)
    fontNum = love.graphics.newFont("golong.ttf", 160)
    hand = love.mouse.getSystemCursor("hand")
	a = 200
	b = 170
	c = 260
	d = 180
    m = 0
    n = 0
	clicked = {}
    board = true
	for w = 1, 20 do
	    table.insert(clicked, true)
        boxes[w] = {}
        boxes[w][1] = a
        boxes[w][2] = a + 350
        boxes[w][3] = b
        boxes[w][4] = b + 150
        a = a + 400
        m = m + 1
        if m == 4 then
            a = 200
            b = b + 175
            m = 0
        end
	end
end

function round(val, decimal)
  if (decimal) then
    return math.floor( (val * 10^decimal) + 0.5) / (10^decimal)
  else
    return math.floor(val+0.5)
  end
end

function handU()
    if board then
       for p = 1, 20 do
            if boxes[p][1] <= mx and boxes[p][2] >= mx then
                if boxes[p][3] <= my and boxes[p][4] >= my and clicked[p] then
                    love.mouse.setCursor(hand)
                    break
                else
                    love.mouse.setCursor()
                end
            else
                love.mouse.setCursor()
            end
        end
    elseif question then
        if my >= 850 and my <= 1000 then
            if mx >= 200 and mx <= 800 then
                love.mouse.setCursor(hand)
            elseif mx >= 1120 and mx <= 1720 then
                love.mouse.setCursor(hand)
            else
                love.mouse.setCursor()
            end
        else
            love.mouse.setCursor()
        end
    elseif answer then
        if mx >= 680 and mx <= 1280 then
            if my >= 850 and my <= 1000 then
                love.mouse.setCursor(hand)
            else
                love.mouse.setCursor()
            end
        else
            love.mouse.setCursor()
        end
    end
end

function love.update()
    mx, my = love.mouse.getPosition()
    handU()
end

function love.mousepressed(x, y, button)
    if board and button == "l" then
       for o = 1, #boxes do
            if boxes[o][1] <= x and boxes[o][2] >= x then
                if boxes[o][3] <= y and boxes[o][4] >=y and clicked[o] then
                    board = false
                    answer = false
                    question = true
                    questionNum = o
                    break
                end
            end
        end
    elseif question and button == "l" then
        if y >= 850 and y <= 1000 then
            if x >= 200 and x <= 800 then
                question = false
                answer = false
                board = true
            elseif x >= 1120 and x <= 1720 then
                question = false
                board = false
                answer = true
                clicked[questionNum] = false
            end
        end
    elseif answer and button =="l" then
        if x >= 680 and x <= 1280 then
            if y >= 850 and y <= 1000 then
                question = false
                answer = false
                board = true
            end
        end
    end
end

function love.mousereleased(x, y, button)
end


function love.draw()
    a = 200
    b = 170
    c = 260
    d = 180
    m = 0
    love.graphics.setBackgroundColor(255, 251, 236)
    love.graphics.setColor(48, 56, 80)
    love.graphics.setFont(fontL)
    love.graphics.print("Jeopardy", 800, 2)
    if board then
        for i = 1, 20 do
            if clicked[i] then
                love.graphics.setColor(102, 205, 237)
            else
                love.graphics.setColor(48, 56, 80)
            end
            love.graphics.rectangle("fill", a, b, 350, 150)
            a = a + 400
            m = m + 1
            if m == 4 then
                a = 200
                b = b + 175
                m = 0
            end
        end
        love.graphics.setColor(255,70,72)
        love.graphics.setFont(fontNum)
        for q = 1, 20 do
            if d == 180  then
                love.graphics.print("100", c, d)
            elseif d == 355 then
                love.graphics.print("200", c, d)
            elseif d == 530 then
                love.graphics.print("300", c, d)
            elseif d == 705 then
                love.graphics.print("400", c, d)
            elseif d == 880 then
                love.graphics.print("500", c, d)
            end
            c = c + 400
            n = n + 1
            if n == 4 then
                d = d + 175
                c = 260
                n = 0
            end
        end
        love.graphics.setColor(48, 56, 80)
        love.graphics.setFont(fontS)
        love.graphics.print("Math", 300, 100)
        love.graphics.print("History", 665, 100)
        love.graphics.print("Science", 1050, 100)
        love.graphics.setFont(fontF)
        love.graphics.print("Figures of Speech", 1390, 120)
    elseif question then
        love.graphics.setFont(fontS)
        love.graphics.setColor(48, 56, 80)
        love.graphics.print(questions[questionNum], 250, 300)
        love.graphics.setColor(102, 205, 237)
        love.graphics.rectangle("fill", 200, 850, 600, 150)
        love.graphics.rectangle("fill", 1120, 850, 600, 150)
        love.graphics.setColor(255,70,72)
        love.graphics.setFont(fontNum)
        love.graphics.print("Go Back", 220, 855)
        love.graphics.print("Answer", 1175, 855)
    elseif answer then
        love.graphics.setColor(48, 56, 80)
        love.graphics.setFont(fontS)
        love.graphics.print(answers[questionNum], 250, 300)
        love.graphics.setColor(102, 205, 237)
        love.graphics.setFont(fontNum)
        love.graphics.rectangle("fill", 680, 850, 600, 150)
        love.graphics.setColor(255,70,72)
        love.graphics.print("Go Back", 700, 855)
    end
end



