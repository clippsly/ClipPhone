-- Get references to the DockShelf and its children

local dockShelf = script.Parent.Parent.MobileDock
local backShelf = script.Parent.Parent.Wallpaper.Apps
local aFinderButton = dockShelf.DStore
local swipebar = script.Parent.Parent.Swipe
local window = script.Parent.Parent.AppManager["App Store"]
local tweenService = game:GetService("TweenService")
local tweeninfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local tween = tweenService:Create(window, tweeninfo, {
	Size = UDim2.new(1.007,0,1,0),
	Position = UDim2.new(-0.007,0,0,0)
})
-- Define the function to open or close the window with gene-alike effect
local function toggleWindow()
	if window.Visible == false then
		dockShelf.Visible = false
		backShelf.Visible = false
		-- Set the initial position of the window to be relative to the button
		window.Position = UDim2.new(0.367, 0, 0.355, 0)

		-- Set the initial size of the window to be zero
		window.Size = UDim2.new(0.263, 0, 0.29, 0)

		-- Show the window and tween its position and size from the button position and size to its original position and size
		window.Visible = true
		tween:Play()
	end
end

-- Set up the event handler for the GClippsly button
aFinderButton.MouseButton1Click:Connect(toggleWindow)
