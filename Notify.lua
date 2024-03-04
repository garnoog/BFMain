Notify = {}
function Notify:New(Title,SupTitle)

    local Notify_DM = Instance.new("ScreenGui")
    local NotifyList = Instance.new("Frame")
    local UIListLayout = Instance.new("UIListLayout")
    local NotifyTemple = Instance.new("Frame")
    local CornerTemple = Instance.new("UICorner")
    local Frame = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local Close = Instance.new("TextButton")
    local Main = Instance.new("TextLabel")
    local Sup = Instance.new("TextLabel")

    Notify_DM.Name = "Notify_DM"
    Notify_DM.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    Notify_DM.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    NotifyList.Name = "NotifyList"
    NotifyList.Parent = Notify_DM
    NotifyList.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    NotifyList.BackgroundTransparency = 1.000
    NotifyList.BorderColor3 = Color3.fromRGB(0, 0, 0)
    NotifyList.BorderSizePixel = 0
    NotifyList.Position = UDim2.new(0.780645132, 0, 0, 0)
    NotifyList.Size = UDim2.new(0, 190, 0, 504)

    UIListLayout.Parent = NotifyList
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
    UIListLayout.Padding = UDim.new(0, 5)

    NotifyTemple.Name = "NotifyTemple"
    NotifyTemple.Parent = NotifyList
    NotifyTemple.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    NotifyTemple.BorderColor3 = Color3.fromRGB(0, 0, 0)
    NotifyTemple.BorderSizePixel = 0
    NotifyTemple.Position = UDim2.new(0.264976948, 0, 0.390873015, 0)
    NotifyTemple.Size = UDim2.new(0, 187, 0, 40)

    CornerTemple.Name = "CornerTemple"
    CornerTemple.Parent = NotifyTemple

    Frame.Parent = NotifyTemple
    Frame.BackgroundColor3 = Color3.fromRGB(255, 204, 0)
    Frame.BorderColor3 = Color3.fromRGB(255, 255, 0)
    Frame.BorderSizePixel = 0
    Frame.Size = UDim2.new(0, 6, 0, 40)
    Frame.ZIndex = 2

    UICorner.Parent = Frame

    Close.Name = "Close"
    Close.Parent = NotifyTemple
    Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Close.BackgroundTransparency = 1.000
    Close.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Close.BorderSizePixel = 0
    Close.Position = UDim2.new(0.837499976, 0, 0.25, 0)
    Close.Size = UDim2.new(0, 20, 0, 20)
    Close.Font = Enum.Font.Ubuntu
    Close.Text = "X"
    Close.TextColor3 = Color3.fromRGB(255, 204, 0)
    Close.TextScaled = true
    Close.TextSize = 14.000
    Close.TextWrapped = true
    Close.MouseButton1Click:Connect(function()
        NotifyList:Destroy()
    end)

    Main.Name = "Main"
    Main.Parent = NotifyTemple
    Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Main.BackgroundTransparency = 1.000
    Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Main.BorderSizePixel = 0
    Main.Position = UDim2.new(0.0375000015, 0, 0, 0)
    Main.Size = UDim2.new(0, 148, 0, 19)
    Main.Font = Enum.Font.Ubuntu
    Main.Text = Title
    Main.TextColor3 = Color3.fromRGB(255, 204, 0)
    Main.TextSize = 14.000
    Main.TextXAlignment = Enum.TextXAlignment.Left

    Sup.Name = "Sup"
    Sup.Parent = NotifyTemple
    Sup.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Sup.BackgroundTransparency = 1.000
    Sup.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Sup.BorderSizePixel = 0
    Sup.Position = UDim2.new(0.0375000648, 0, 0.474999994, 0)
    Sup.Size = UDim2.new(0, 148, 0, 19)
    Sup.Font = Enum.Font.Ubuntu
    Sup.Text = SupTitle
    Sup.TextColor3 = Color3.fromRGB(255, 250, 99)
    Sup.TextSize = 14.000
    Sup.TextXAlignment = Enum.TextXAlignment.Left
    return Notify
end

Notify:New("Test","DummyHub")
