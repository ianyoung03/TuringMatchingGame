%GAME INSTRUCTIONS
%This is a card matching game. Click a card to uncover it's hidden colour
%then click another card to uncover another hidden colour. If the colours 
%are the same, the cards stay up and are matched, if not, they turn back
%over. The object of the game is to have all the cards matched. Good luck!

%setting the screen
setscreen ("graphics:800;800")
%declaring variables and arrays
var x1, x2, y1, y2, xmouse, ymouse, button : int %variables used to draw the cards and the mouse variables for mouse tracking
var solvedornot : array 1 .. 16 of boolean  %array to track whether or a card is solved
var col : array 1 .. 16 of int    %array to store the colours of each card
var card1 : int := 0 %stores the first card the user uncovered so it can be checked
var card2 : int := 0 %stores the second card the user uncovered so it can be checked
var gameover : int := 0 %used so that the game can end
var font1 : int := Font.New("serif:30:bold")
%making sure the boolean array of solvedornot is set to false for all values
for i : 1 .. 16
    solvedornot (i) := false
end for


Music.PlayFileLoop ("GameMusic.mp3")
%assigning colours for the hidden side of the cards
col (1) := 40
col (2) := 36
col (3) := 56
col (4) := 40
col (5) := 25
col (6) := 44
col (7) := 38
col (8) := 25
col (9) := 34
col (10) := 56
col (11) := 36
col (12) := 34
col (13) := 42
col (14) := 44
col (15) := 38
col (16) := 42


drawfillbox (0,0, maxx, maxy, 0) %background
%procedure to create the card grid so it stays updated as cards are matched
procedure creategrid
    x1 := 70
    y1 := 630
    x2 := 190
    y2 := 770
    for i : 1 .. 16
	if solvedornot (i) = false then
	    drawfillbox (x1, y1, x2, y2, 7)
	else
	    drawfillbox (x1, y1, x2, y2, col (i))
	end if
	x1 := x1 + 180
	x2 := x2 + 180
	if x1 > 610 then
	    x1 := x1 - 720
	    x2 := x2 - 720
	    y1 := y1 - 180
	    y2 := y2 - 180
	end if
    end for
end creategrid

creategrid



loop %main game loop

    exit when gameover = 1 
    
    loop    %card1
	mousewhere (xmouse, ymouse, button)
	if xmouse >= 70 and xmouse <= 190 and ymouse >= 630 and ymouse <= 770 and button = 1 then
	    drawfillbox (70, 630, 190, 770, col (1))
	    card1 := 1

	elsif xmouse >= 250 and xmouse <= 370 and ymouse >= 630 and ymouse <= 770 and button = 1 then
	    drawfillbox (250, 630, 370, 770, col (2))
	    card1 := 2

	elsif xmouse >= 430 and xmouse <= 550 and ymouse >= 630 and ymouse <= 770 and button = 1 then
	    drawfillbox (430, 630, 550, 770, col (3))
	    card1 := 3
	elsif xmouse >= 610 and xmouse <= 730 and ymouse >= 630 and ymouse <= 770 and button = 1 then
	    drawfillbox (610, 630, 730, 770, col (4))
	    card1 := 4
	elsif xmouse >= 70 and xmouse <= 190 and ymouse >= 450 and ymouse <= 590 and button = 1 then
	    drawfillbox (70, 450, 190, 590, col (5))
	    card1 := 5
	elsif xmouse >= 250 and xmouse <= 370 and ymouse >= 450 and ymouse <= 590 and button = 1 then
	    drawfillbox (250, 450, 370, 590, col (6))
	    card1 := 6
	elsif xmouse >= 430 and xmouse <= 550 and ymouse >= 450 and ymouse <= 590 and button = 1 then
	    drawfillbox (430, 450, 550, 590, col (7))
	    card1 := 7
	elsif xmouse >= 610 and xmouse <= 730 and ymouse >= 450 and ymouse <= 590 and button = 1 then
	    drawfillbox (610, 450, 730, 590, col (8))
	    card1 := 8
	elsif xmouse >= 70 and xmouse <= 190 and ymouse >= 270 and ymouse <= 410 and button = 1 then
	    drawfillbox (70, 270, 190, 410, col (9))
	    card1 := 9
	elsif xmouse >= 250 and xmouse <= 370 and ymouse >= 270 and ymouse <= 410 and button = 1 then
	    drawfillbox (250, 270, 370, 410, col (10))
	    card1 := 10
	elsif xmouse >= 430 and xmouse <= 550 and ymouse >= 270 and ymouse <= 410 and button = 1 then
	    drawfillbox (430, 270, 550, 410, col (11))
	    card1 := 11
	elsif xmouse >= 610 and xmouse <= 730 and ymouse >= 270 and ymouse <= 410 and button = 1 then
	    drawfillbox (610, 270, 730, 410, col (12))
	    card1 := 12
	elsif xmouse >= 70 and xmouse <= 190 and ymouse >= 90 and ymouse <= 230 and button = 1 then
	    drawfillbox (70, 90, 190, 230, col (13))
	    card1 := 13
	elsif xmouse >= 250 and xmouse <= 370 and ymouse >= 90 and ymouse <= 230 and button = 1 then
	    drawfillbox (250, 90, 370, 230, col (14))
	    card1 := 14
	elsif xmouse >= 430 and xmouse <= 550 and ymouse >= 90 and ymouse <= 230 and button = 1 then
	    drawfillbox (430, 90, 550, 230, col (15))
	    card1 := 15
	elsif xmouse >= 610 and xmouse <= 730 and ymouse >= 90 and ymouse <= 230 and button = 1 then
	    drawfillbox (610, 90, 730, 230, col (16))
	    card1 := 16
	end if
	
	exit when card1 not= 0
   
    end loop
    
    
    delay(200) %delay so that a click doesn't count for both card 1 and 2
    
  
    loop %card2
	mousewhere(xmouse, ymouse, button)
	if xmouse >= 70 and xmouse <= 190 and ymouse >= 630 and ymouse <= 770 and button = 1 then
	    drawfillbox (70, 630, 190, 770, col (1))
	    card2 := 1

	elsif xmouse >= 250 and xmouse <= 370 and ymouse >= 630 and ymouse <= 770 and button = 1 then
	    drawfillbox (250, 630, 370, 770, col (2))
	    card2 := 2

	elsif xmouse >= 430 and xmouse <= 550 and ymouse >= 630 and ymouse <= 770 and button = 1 then
	    drawfillbox (430, 630, 550, 770, col (3))
	    card2 := 3
	elsif xmouse >= 610 and xmouse <= 730 and ymouse >= 630 and ymouse <= 770 and button = 1 then
	    drawfillbox (610, 630, 730, 770, col (4))
	    card2 := 4
	elsif xmouse >= 70 and xmouse <= 190 and ymouse >= 450 and ymouse <= 590 and button = 1 then
	    drawfillbox (70, 450, 190, 590, col (5))
	    card2 := 5
	elsif xmouse >= 250 and xmouse <= 370 and ymouse >= 450 and ymouse <= 590 and button = 1 then
	    drawfillbox (250, 450, 370, 590, col (6))
	    card2 := 6
	elsif xmouse >= 430 and xmouse <= 550 and ymouse >= 450 and ymouse <= 590 and button = 1 then
	    drawfillbox (430, 450, 550, 590, col (7))
	    card2 := 7
	elsif xmouse >= 610 and xmouse <= 730 and ymouse >= 450 and ymouse <= 590 and button = 1 then
	    drawfillbox (610, 450, 730, 590, col (8))
	    card2 := 8
	elsif xmouse >= 70 and xmouse <= 190 and ymouse >= 270 and ymouse <= 410 and button = 1 then
	    drawfillbox (70, 270, 190, 410, col (9))
	    card2 := 9
	elsif xmouse >= 250 and xmouse <= 370 and ymouse >= 270 and ymouse <= 410 and button = 1 then
	    drawfillbox (250, 270, 370, 410, col (10))
	    card2 := 10
	elsif xmouse >= 430 and xmouse <= 550 and ymouse >= 270 and ymouse <= 410 and button = 1 then
	    drawfillbox (430, 270, 550, 410, col (11))
	    card2 := 11
	elsif xmouse >= 610 and xmouse <= 730 and ymouse >= 270 and ymouse <= 410 and button = 1 then
	    drawfillbox (610, 270, 730, 410, col (12))
	    card2 := 12
	elsif xmouse >= 70 and xmouse <= 190 and ymouse >= 90 and ymouse <= 230 and button = 1 then
	    drawfillbox (70, 90, 190, 230, col (13))
	    card2 := 13
	elsif xmouse >= 250 and xmouse <= 370 and ymouse >= 90 and ymouse <= 230 and button = 1 then
	    drawfillbox (250, 90, 370, 230, col (14))
	    card2 := 14
	elsif xmouse >= 430 and xmouse <= 550 and ymouse >= 90 and ymouse <= 230 and button = 1 then
	    drawfillbox (430, 90, 550, 230, col (15))
	    card2 := 15
	elsif xmouse >= 610 and xmouse <= 730 and ymouse >= 90 and ymouse <= 230 and button = 1 then
	    drawfillbox (610, 90, 730, 230, col (16))
	    card2 := 16
	end if
	exit when card2 not= 0

    end loop
    
    
    
    
    if col (card1) = col (card2) then %checking if the cards uncovered are a match, and if so updating the boolean array so that the cards stay solved
	solvedornot (card1) := true
	solvedornot (card2) := true
    end if
    
    
    delay(800) %delay so that when user clicks a second card it and they don't match they can see the card before it turns back over
    creategrid
    
    card1 := 0 %resetting the values of card1 and card2 to 0
    card2 := 0
   %checking for when the game is over
   if solvedornot (1) = true and solvedornot (2) = true and solvedornot (3) = true and solvedornot (4) = true and solvedornot (5) = true and solvedornot (6) = true and solvedornot (7) = true and solvedornot (8) = true and solvedornot (9) = true and solvedornot (10) = true and solvedornot (11) = true and solvedornot (12) = true and solvedornot (13) = true and solvedornot (14) = true and solvedornot (15) = true and solvedornot (16) = true then 
	gameover := gameover + 1
   end if
   
end loop

drawfillbox(0,0,maxx,maxy, 42)


Font.Draw ("Congratulations, you won the game!", 75, 400, font1, 24)  
