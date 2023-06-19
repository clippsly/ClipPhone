-- Define the GUI elements

local window = script.Parent.Parent.AppManager.cMessage
local chatLog = window.ChatLog
local messageBox = window.MesgBar
local msgFrame = game.ReplicatedStorage.MsgFrameMobile
local notif = script.Parent.Parent.MobileDock.BMessages.Notif
local notifSound = script.Parent.Parent.Wallpaper.Notif
local sentSound = script.Parent.Parent.Wallpaper.Sent
local TweenService = game:GetService("TweenService")

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Define the server event
local serverEvent = game.ReplicatedStorage:WaitForChild("MobileServerEvent")

-- Define the remote event
local remoteEvent = game:GetService("ReplicatedStorage").CLUINotif.Notification

-- Function to add a message to the chat log
local function addMessageToChatLog(senderName, message, isServerMessage, isModerated)
	-- Copy the message frame and set its parent to the chat log
	isModerated = nil -- DISABLED DUE TO ISSUES
	local newMsgFrame = msgFrame:Clone()
	newMsgFrame.Parent = chatLog

	-- Set the message text and sender username
	local sndr = newMsgFrame.Sndr
	sndr.Value = senderName
	local msgText = newMsgFrame.MsgText
	msgText.Text = message
	local userName = newMsgFrame.UsrName
	userName.Text = senderName

	--print("cMessage: Message successfully sent.")

	-- Notify the player of the new message
	if LocalPlayer.Name ~= senderName then
		notif.Visible = true
		notifSound:Play()

		if isModerated then
			local notificationText = "Message has not been sent" -- Replace with the desired notification text
			local notificationImage = "rbxassetid://13138382142"
			-- Trigger the remote event with the notification information
			remoteEvent:FireServer(notificationText, notificationImage)
		else
			local notificationText = "New Message" -- Replace with the desired notification text
			local notificationImage = "rbxassetid://13138382142"
			-- Trigger the remote event with the notification information
			remoteEvent:FireServer(notificationText, notificationImage)
		end

	else
		sentSound:Play()
	end
end

-- Function to handle sending messages
local function sendMessage()
	local message = messageBox.Text
	if message ~= "" then
		chatLog.CanvasPosition = Vector2.new(0, 9999)
		serverEvent:FireServer(message, LocalPlayer.Name)
		messageBox.Text = ""
		addMessageToChatLog(LocalPlayer.Name, message)
	end
end

-- Connect the message box to the sendMessage function
messageBox.FocusLost:Connect(sendMessage)

-- Connect the server event to adding messages to the chat log
serverEvent.OnClientEvent:Connect(function(senderName, message, isServerMessage)
	addMessageToChatLog(senderName, message, isServerMessage)
end)
