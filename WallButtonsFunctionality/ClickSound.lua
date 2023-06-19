--[[

Clippsly "Mobile Dock" Click Sound
By: Placeholder Studio.
Twitter: @Clippsly
EDITED BY PAULOCEZARNBR
]]

-- Get reference to the Dock frame
local dock = script.Parent.Parent.Wallpaper

-- Set up the click event handlers for each button
for _, button in ipairs(dock:GetChildren()) do
	if button:IsA("GuiButton") then
		button.MouseButton1Click:Connect(function()
			-- Create the jump tween
			local Click = script.Click
			Click:Play()
		end)
	end
end
