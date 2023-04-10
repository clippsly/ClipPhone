-- Get references to the DockShelf and its children
local dockShelf = script.Parent.Parent.MobileDock
local backShelf = script.Parent.Parent.Wallpaper
local aFinderButton = backShelf.GASettings
local window = script.Parent.Parent.AppManager.Settings

-- Define the function to open or close the window with gene-alike effect
local function toggleWindow()
	if window.Visible == false then
		dockShelf.Visible = false
		-- Set the initial position of the window to be relative to the button
		local startPos = UDim2.new(0, aFinderButton.AbsolutePosition.X, 0, aFinderButton.AbsolutePosition.Y) --UDim2.new(0.336, 0, 0.908, 0) aFinderButton.Position
		window.Position = startPos

		-- Set the initial size of the window to be zero
		window.Size = UDim2.new(0, 0, 0, 0)

		-- Show the window and tween its position and size from the button position and size to its original position and size
		window.Visible = true
		window:TweenSizeAndPosition(
			UDim2.new(1, 0, 1, 0),
			UDim2.new(0, 0, 0, 0),
			'Out',
			'Quad',
			0.5
		)
	end
end

-- Set up the event handler for the GClippsly button
aFinderButton.MouseButton1Click:Connect(toggleWindow)
