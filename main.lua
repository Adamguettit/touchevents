------------------------------------------------------------------------------------------
-- created on : april 17
-- created by : Adam
-- main.lua
-- multiplies numbers
----------------------------------------------------------------------------------------

-- simple touch code

local theBall = display.newImage( "./assets/sprites/ball.png" )
theBall.x = display.contentCenterX + 500
theBall.y = display.contentCenterY
theBall.id = "ball object"
 
local function onBallTouched( event )
    if ( event.phase == "began" ) then
        print( "Touch event began on: " .. event.target.id )
    elseif ( event.phase == "ended" ) then
        print( "Touch event ended on: " .. event.target.id )
    end
  
    return true
end

theBall:addEventListener( "touch", onBallTouched )



-- Comprehensive touch code

local robot = display.newImage( "./assets/sprites/robot.png" )
robot.x = display.contentCenterX
robot.y = display.contentCenterY
robot.id = "ball object"
 
function robot:touch( event )
    if ( event.phase == "began" ) then
        print( "Touch event began on: " .. self.id )
 
        -- Set touch focus
        display.getCurrentStage():setFocus( self )
        self.isFocus = true
     
    elseif ( self.isFocus ) then
        if ( event.phase == "moved" ) then
            print( "Moved phase of touch event detected." )
 
        elseif ( event.phase == "ended" or event.phase == "cancelled" ) then
 
            -- Reset touch focus
            display.getCurrentStage():setFocus( nil )
            self.isFocus = nil
            print( "Touch event ended on: " .. self.id )
        end
    end

    return true
end

robot:addEventListener( "touch", robot )