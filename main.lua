-----------------------------------------------------------------------------------------
-- Title: NumericTextFields
-- Name: Your Name
-- Course: ICS2O/3C
-- This program displays a math question and asks the user to answer in a numeric 
-- textfield terminal.
--
-- main.lua
-- 
-----------------------------------------------------------------------------------------

-- Your code here

-- hide the status bar

-- sets the background colour
display.setDefault("background", 70/255, 16/255, 71/255)

-----------------------------------------------------------------------------------
-- LOCAL VARIBALES
-----------------------------------------------------------------------------------

-- create local variables 
local questionObject
local correctObject
local incorrectObject
local NumericTextField
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer


---------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
---------------------------------------------------------------------------------

local function AskQuestion()
	-- generate 2 random numbers between a max. and a min. number 
	randomNumber1 = math.random (10, 20)
	randomNumber2 = math.random (10, 20)

	correctAnswer = randomNumber1 + randomNumber2

	-- create question in text object 
	questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. 	" = " 

end 

local function HideCorrect()
	correctObject.isVisible = false 
	incorrectObject.isVisible = false 
	AskQuestion()
end 

local function NumericFieldListener(event)
	-- User begins editing "numericField"
	if ( event.phase == "began" ) then 

		-- clear text field 
		event.target.text = ""

		elseif event.phase == "submitted" then

			-- when the answer is submitted (enter key is pressed) set user input to user's answer
			userAnswer = tonumber(event.target.text)

			-- if the users answer and the correct answer are the same:
			if (userAnswer == correctAnswer) then
				correctObject.isVisible = true 
				timer.performWithDelay(2000, HideCorrect)
			else incorrectObject.isVisible = true 
				timer.performWithDelay(20, HideIncorrect)
			end		
		end
	end 



-----------------------------------------------------------------------------------
-- OBJECT CREATION
-----------------------------------------------------------------------------------

-- displays a question and sets the color
questionObject = display.newText( "", display.contentWidth/3, display.contentHeight/3, nil, 100) 
questionObject:setTextColor(0/255, 246/255, 0/255)

-- create the correct text object and make it invisible 
correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentHeight*2/3, nil, 50)
correctObject:setTextColor(0/255, 246/255, 0/255)
correctObject.isVisible = false 

-- create the incorrect text object and make it invisible
incorrectObject = display.newText( "Incorrect!", display.contentWidth/2, display.contentHeight*2/3, nil, 50)
incorrectObject:setTextColor(225/255, 0/255, 0/255)
incorrectObject.isVisible = false 

-- create numeric field 
numericField = native.newTextField( 650, 263, 200, 100)
numericField.inputType = "number"

-- add the event listener for the numeric field 
numericField:addEventListener( "userInput", NumericFieldListener )

----------------------------------------------------------------------------------
-- FUNCTION CALLS
----------------------------------------------------------------------------------

-- call the function to ask the question
AskQuestion()







