-- Get reference to the Dock frame
local dock = script.Parent.Parent.Wallpaper

-- Define the jump scale for the buttons
local jumpScale = 0.2

-- Define the jump duration
local jumpDuration = 0.1

-- Set up the click event handlers for each button
for _, button in ipairs(dock:GetChildren()) do
	if button:IsA("ImageButton") then
		button.MouseButton1Click:Connect(function()
			-- Create the jump tween
			local Click = script.Click
			Click:Play()
		end)
	end
end