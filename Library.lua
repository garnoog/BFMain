Library = {}

local Aizawa = Instance.new("ScreenGui")
Aizawa.Name = "Aizawa"
Aizawa.Parent = not game:GetService("RunService"):IsStudio() and game:GetService("CoreGui") or game:GetService("Players").LocalPlayer.PlayerGui
Aizawa.IgnoreGuiInset = true

local NotifyList = Instance.new("Frame")
local UIListLayout_1 = Instance.new("UIListLayout")

NotifyList.Name = "NotifyList"
NotifyList.Parent = Aizawa
NotifyList.AnchorPoint = Vector2.new(0, 1)
NotifyList.BackgroundColor3 = Color3.fromRGB(255,255,255)
NotifyList.BackgroundTransparency = 1
NotifyList.BorderColor3 = Color3.fromRGB(0,0,0)
NotifyList.BorderSizePixel = 0
NotifyList.Position = UDim2.new(0.0299999993, 0,0.949999988, 0)
NotifyList.Size = UDim2.new(0, 100,0, 100)
NotifyList.ZIndex = 0

UIListLayout_1.Parent = NotifyList
UIListLayout_1.Padding = UDim.new(0,5)
UIListLayout_1.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_1.VerticalAlignment = Enum.VerticalAlignment.Bottom

local function Tw(info)
    local Value = info.vu or info.Value or info.value or info.Vu or info.v or info.u
    local Time = info.Time or info.t or info.T or 0
    local Style = info.Style or info.style or info.Sty or info.sty or info.s or info.S or "Linear"
    local Direction = info.Direction or info.direction or info.d or info.D or info.Drt or info.drt or info.dt or info.Dt or "Out"
    local Goal = info.Goal or info.goal or info.go or info.Go or info.G or info.g

    return game:GetService("TweenService"):Create(Value,TweenInfo.new(Time,Enum.EasingStyle[Style],Enum.EasingDirection[Direction]),Goal)
end

local function lak(topbarobject, object)
    local Dragging = nil
    local DragInput = nil
    local DragStart = nil
    local StartPosition = nil

    local function Update(input)
        local Delta = input.Position - DragStart
        local pos = UDim2.new(StartPosition.X.Scale, StartPosition.X.Offset + Delta.X, StartPosition.Y.Scale, StartPosition.Y.Offset + Delta.Y)
        local Tween = game:GetService("TweenService"):Create(object, TweenInfo.new(0.3), {Position = pos})
        Tween:Play()
    end

    topbarobject.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            Dragging = true
            DragStart = input.Position
            StartPosition = object.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    Dragging = false
                end
            end)
        end
    end)

    topbarobject.InputChanged:Connect(
        function(input)
            if
                input.UserInputType == Enum.UserInputType.MouseMovement or
                input.UserInputType == Enum.UserInputType.Touch
            then
                DragInput = input
            end
        end
    )

    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if input == DragInput and Dragging then
            Update(input)
        end
    end)
end

local MainColor = {}

function SetThemeColor(newColor)
    
    local Color = newColor or Color3.fromRGB(255,150,93)
    
    for _, element in pairs(MainColor) do
        if element:IsA("UIGradient") then
            local colorSequence = element.Color
            local newColorSequence = ColorSequence.new{
                ColorSequenceKeypoint.new(0, Color),
                ColorSequenceKeypoint.new(1, colorSequence.Keypoints[2].Value)
            }
            element.Color = newColorSequence

        elseif element:IsA("ScrollingFrame") then
            element.ScrollBarImageColor3 = Color

        elseif element:IsA("Frame") or element:IsA("TextButton") or element:IsA("TextLabel") or element:IsA("SliderValueBar") then
            element.BackgroundColor3 = Color
        elseif element:IsA("ImageLabel") or element:IsA("ImageButton") then
            element.ImageColor3 = Color
        end
    end
end

function Library:CreateWindow(info)
    
    local CloseUI = Instance.new("TextButton")
    local UICorner_1 = Instance.new("UICorner")
    local ClouseUIIcon = Instance.new("ImageLabel")
    local BackgroundGradient_1 = Instance.new("UIGradient")

    CloseUI.Name = "CloseUI"
    CloseUI.Parent = Aizawa
    CloseUI.Active = true
    CloseUI.AnchorPoint = Vector2.new(0.5, 0.5)
    CloseUI.BackgroundColor3 = Color3.fromRGB(58,58,58)
    CloseUI.BorderColor3 = Color3.fromRGB(0,0,0)
    CloseUI.BorderSizePixel = 0
    CloseUI.Position = UDim2.new(0.0906918421, 0,0.186, 0)
    CloseUI.Size = UDim2.new(0, 70,0, 30)
    CloseUI.Font = Enum.Font.Gotham
    CloseUI.Text = ""
    CloseUI.TextColor3 = Color3.fromRGB(255,255,255)
    CloseUI.TextSize = 14
    CloseUI.ZIndex = 3
    CloseUI.BackgroundTransparency = 1

    UICorner_1.Parent = CloseUI
    UICorner_1.CornerRadius = UDim.new(1,0)

    ClouseUIIcon.Parent = CloseUI
    ClouseUIIcon.AnchorPoint = Vector2.new(0.5, 0.5)
    ClouseUIIcon.BackgroundColor3 = Color3.fromRGB(255,255,255)
    ClouseUIIcon.BackgroundTransparency = 1
    ClouseUIIcon.BorderColor3 = Color3.fromRGB(0,0,0)
    ClouseUIIcon.BorderSizePixel = 0
    ClouseUIIcon.Position = UDim2.new(0.5, 0,0.5, 0)
    ClouseUIIcon.Size = UDim2.new(0, 20,0, 20)
    ClouseUIIcon.Image = "rbxassetid://2790679829"
    ClouseUIIcon.ZIndex = 4
    ClouseUIIcon.ImageTransparency = 1

    table.insert(MainColor, ClouseUIIcon)

    BackgroundGradient_1.Name = "BackgroundGradient"
    BackgroundGradient_1.Parent = CloseUI
    BackgroundGradient_1.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(13, 13, 13)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))}
    BackgroundGradient_1.Rotation = -100

    lak(CloseUI ,CloseUI)

    local Sound_1 = Instance.new("Sound")

    Sound_1.Parent = CloseUI
    Sound_1.Volume = 0.3
    Sound_1.RollOffMode = Enum.RollOffMode.InverseTapered
    Sound_1.SoundId = "rbxassetid://17208361335"
    
    delay(0,function()
        Tw({
            v = CloseUI,
            t = 0.3,
            s = "Linear",
            d = "Out",
            g = {BackgroundTransparency = 0}
        }):Play()
        Tw({
            v = ClouseUIIcon,
            t = 0.3,
            s = "Linear",
            d = "Out",
            g = {ImageTransparency = 0}
        }):Play()
    end)

    local HubName = info.Name or info.name or info.Title or info.title or info.Text or info.text

    local Background_1 = Instance.new("Frame")
    local UICorner_1 = Instance.new("UICorner")
    local Hub_1 = Instance.new("TextLabel")
    local UIGradient_2 = Instance.new("UIGradient")
    local LogoHubEar = Instance.new("ImageLabel")
    local LogoHubBody = Instance.new("ImageLabel")

    Background_1.Name = "Background"
    Background_1.Parent = Aizawa
    Background_1.AnchorPoint = Vector2.new(0.5, 0.5)
    Background_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
    Background_1.BorderColor3 = Color3.fromRGB(0,0,0)
    Background_1.BorderSizePixel = 0
    Background_1.Position = UDim2.new(0.5, 0,0.5, 0)
    Background_1.Size = UDim2.new(0, 0,0, 0)
    Background_1.ClipsDescendants = true
    
    local LoadingUI = Instance.new("Frame")
    local UICorner_1UI = Instance.new("UICorner")
    local LogoHubEarLoading = Instance.new("ImageLabel")
    local LogoHubBodyLoading = Instance.new("ImageLabel")
    
    LoadingUI.Name = "Loading"
    LoadingUI.Parent = Background_1
    LoadingUI.BackgroundColor3 = Color3.fromRGB(22,22,24)
    LoadingUI.BorderColor3 = Color3.fromRGB(0,0,0)
    LoadingUI.BorderSizePixel = 0
    LoadingUI.Size = UDim2.new(1, 0,1, 0)
    LoadingUI.ZIndex = 299

    UICorner_1UI.Parent = LoadingUI
    UICorner_1UI.CornerRadius = UDim.new(0.029999999329447746,0)

    LogoHubBodyLoading.Name = "LogoHubBody"
    LogoHubBodyLoading.Parent = Background_1
    LogoHubBodyLoading.AnchorPoint = Vector2.new(0.5,0.5)
    LogoHubBodyLoading.BackgroundColor3 = Color3.fromRGB(255,255,255)
    LogoHubBodyLoading.BackgroundTransparency = 1
    LogoHubBodyLoading.BorderColor3 = Color3.fromRGB(0,0,0)
    LogoHubBodyLoading.BorderSizePixel = 0
    LogoHubBodyLoading.Position = UDim2.new(0.5, 0,0.5, 0)
    LogoHubBodyLoading.Size = UDim2.new(0, 0,0, 0)
    LogoHubBodyLoading.Image = "rbxassetid://120150059981563"
    LogoHubBodyLoading.ZIndex = 300
    LogoHubBodyLoading.ImageTransparency = 1

    LogoHubEarLoading.Name = "LogoHubEar"
    LogoHubEarLoading.Parent = Background_1
    LogoHubEarLoading.AnchorPoint = Vector2.new(0.5,0.5)
    LogoHubEarLoading.BackgroundColor3 = Color3.fromRGB(255,255,255)
    LogoHubEarLoading.BackgroundTransparency = 1
    LogoHubEarLoading.BorderColor3 = Color3.fromRGB(0,0,0)
    LogoHubEarLoading.BorderSizePixel = 0
    LogoHubEarLoading.Position = UDim2.new(0.5, 0,0.5, 0)
    LogoHubEarLoading.Size = UDim2.new(0, 0,0, 0)
    LogoHubEarLoading.Image = "rbxassetid://90772891511701"
    LogoHubEarLoading.ImageColor3 = Color3.fromRGB(255,150,93)
    LogoHubEarLoading.ZIndex = 300
    LogoHubEarLoading.ImageTransparency = 1
    
    table.insert(MainColor, LogoHubEarLoading)
    
    delay(0,function()
        Tw({
            v = Background_1,
            t = 0.3,
            s = "Linear",
            d = "Out",
            g = {Size = UDim2.new(0, 475,0, 350)}
        }):Play()
        
        Tw({
            v = LogoHubBodyLoading,
            t = 0.3,
            s = "Linear",
            d = "Out",
            g = {Size = UDim2.new(0, 100,0, 100)}
        }):Play()
        Tw({
            v = LogoHubEarLoading,
            t = 0.3,
            s = "Linear",
            d = "Out",
            g = {Size = UDim2.new(0, 100,0, 100)}
        }):Play()
        
        Tw({
            v = LogoHubBodyLoading,
            t = 0.15,
            s = "Linear",
            d = "Out",
            g = {ImageTransparency = 0}
        }):Play()
        Tw({
            v = LogoHubEarLoading,
            t = 0.15,
            s = "Linear",
            d = "Out",
            g = {ImageTransparency = 0}
        }):Play()
        wait(.5)
        Tw({
            v = LogoHubBodyLoading,
            t = 0.15,
            s = "Linear",
            d = "Out",
            g = {ImageTransparency = 1}
        }):Play()
        Tw({
            v = LogoHubEarLoading,
            t = 0.15,
            s = "Linear",
            d = "Out",
            g = {ImageTransparency = 1}
        }):Play()
        Tw({
            v = LoadingUI,
            t = 0.15,
            s = "Linear",
            d = "Out",
            g = {BackgroundTransparency = 1}
        }):Play()
    end)
    
    lak(Background_1, Background_1)
    
    local IsOpenUI = false
    
    CloseUI.MouseButton1Click:Connect(function()
        Sound_1:Play()
        if not IsOpenUI then
            Tw({
                v = LoadingUI,
                t = 0.15,
                s = "Linear",
                d = "Out",
                g = {BackgroundTransparency = 0}
            }):Play()
            Tw({
                v = LogoHubBodyLoading,
                t = 0.3,
                s = "Linear",
                d = "Out",
                g = {Size = UDim2.new(0, 100,0, 100)}
            }):Play()
            Tw({
                v = LogoHubEarLoading,
                t = 0.3,
                s = "Linear",
                d = "Out",
                g = {Size = UDim2.new(0, 100,0, 100)}
            }):Play()

            Tw({
                v = LogoHubBodyLoading,
                t = 0.15,
                s = "Linear",
                d = "Out",
                g = {ImageTransparency = 0}
            }):Play()
            Tw({
                v = LogoHubEarLoading,
                t = 0.15,
                s = "Linear",
                d = "Out",
                g = {ImageTransparency = 0}
            }):Play()
            ClouseUIIcon.Rotation = 90
            ClouseUIIcon.Image = "rbxassetid://2790679413"
            Tw({
                v = ClouseUIIcon,
                t = 0.15,
                s = "Back",
                d = "Out",
                g = {Rotation = 0}
            }):Play()
            wait(.5)
            Tw({
                v = Background_1,
                t = 0.15,
                s = "Quint",
                d = "In",
                g = {Size = UDim2.new(0, 0,0, 0)}
            }):Play()
            IsOpenUI = not IsOpenUI
        else
            Tw({
                v = Background_1,
                t = 0.15,
                s = "Quint",
                d = "Out",
                g = {Size = UDim2.new(0, 475,0, 350)}
            }):Play()
            ClouseUIIcon.Image = "rbxassetid://2790679829"
            ClouseUIIcon.Rotation = 45
            Tw({
                v = ClouseUIIcon,
                t = 0.15,
                s = "Back",
                d = "Out",
                g = {Rotation = 0}
            }):Play()
            IsOpenUI = not IsOpenUI
            wait(.5)
            Tw({
                v = LoadingUI,
                t = 0.15,
                s = "Linear",
                d = "Out",
                g = {BackgroundTransparency = 1}
            }):Play()
            Tw({
                v = LogoHubBodyLoading,
                t = 0.3,
                s = "Linear",
                d = "Out",
                g = {Size = UDim2.new(0, 0,0, 0)}
            }):Play()
            Tw({
                v = LogoHubEarLoading,
                t = 0.3,
                s = "Linear",
                d = "Out",
                g = {Size = UDim2.new(0, 0,0, 0)}
            }):Play()

            Tw({
                v = LogoHubBodyLoading,
                t = 0.15,
                s = "Linear",
                d = "Out",
                g = {ImageTransparency = 1}
            }):Play()
            Tw({
                v = LogoHubEarLoading,
                t = 0.15,
                s = "Linear",
                d = "Out",
                g = {ImageTransparency = 1}
            }):Play()
        end
    end)

    UICorner_1.Parent = Background_1
    UICorner_1.CornerRadius = UDim.new(0.029999999329447746,0)

    Hub_1.Name = "Hub"
    Hub_1.Parent = Background_1
    Hub_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
    Hub_1.BackgroundTransparency = 1
    Hub_1.BorderColor3 = Color3.fromRGB(0,0,0)
    Hub_1.BorderSizePixel = 0
    Hub_1.Position = UDim2.new(0.1, 0,0, 0)
    Hub_1.Size = UDim2.new(0, 70,0, 35)
    Hub_1.Font = Enum.Font.GothamBold
    Hub_1.Text = HubName
    Hub_1.TextColor3 = Color3.fromRGB(255,255,255)
    Hub_1.TextSize = 11
    Hub_1.TextXAlignment = Enum.TextXAlignment.Left
    
    LogoHubBody.Name = "LogoHubBody"
    LogoHubBody.Parent = Background_1
    LogoHubBody.BackgroundColor3 = Color3.fromRGB(255,255,255)
    LogoHubBody.BackgroundTransparency = 1
    LogoHubBody.BorderColor3 = Color3.fromRGB(0,0,0)
    LogoHubBody.BorderSizePixel = 0
    LogoHubBody.Position = UDim2.new(0.0199999996, 0,0.00999999978, 0)
    LogoHubBody.Size = UDim2.new(0, 30,0, 30)
    LogoHubBody.Image = "rbxassetid://120150059981563"
    
    LogoHubEar.Name = "LogoHubEar"
    LogoHubEar.Parent = Background_1
    LogoHubEar.BackgroundColor3 = Color3.fromRGB(255,255,255)
    LogoHubEar.BackgroundTransparency = 1
    LogoHubEar.BorderColor3 = Color3.fromRGB(0,0,0)
    LogoHubEar.BorderSizePixel = 0
    LogoHubEar.Position = UDim2.new(0.0199999996, 0,0.00999999978, 0)
    LogoHubEar.Size = UDim2.new(0, 30,0, 30)
    LogoHubEar.Image = "rbxassetid://90772891511701"
    LogoHubEar.ImageColor3 = Color3.fromRGB(255,150,93)

    table.insert(MainColor, LogoHubEar)

    UIGradient_2.Parent = Background_1
    UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(22, 22, 24)), ColorSequenceKeypoint.new(1, Color3.fromRGB(11, 13, 16))}
    UIGradient_2.Rotation = 90
    
    local Blurr = Instance.new("Frame")
    local UIGradient_1000 = Instance.new("UIGradient")

    Blurr.Parent = Background_1
    Blurr.BackgroundColor3 = Color3.fromRGB(16,18,21)
    Blurr.BorderColor3 = Color3.fromRGB(0,0,0)
    Blurr.BorderSizePixel = 0
    Blurr.Position = UDim2.new(-0.00210526306, 0,0.714285731, 0)
    Blurr.Size = UDim2.new(0, 476,0, 70)
    Blurr.ZIndex = 3

    UIGradient_1000.Parent = Blurr
    UIGradient_1000.Rotation = 90
    UIGradient_1000.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0,1), NumberSequenceKeypoint.new(1,0)}

    local Backgroundinside_1 = Instance.new("Frame")
    local UICorner_2 = Instance.new("UICorner")

    Backgroundinside_1.Name = "Backgroundinside"
    Backgroundinside_1.Parent = Background_1
    Backgroundinside_1.AnchorPoint = Vector2.new(0.5, 0.5)
    Backgroundinside_1.BackgroundColor3 = Color3.fromRGB(16,18,21)
    Backgroundinside_1.BorderColor3 = Color3.fromRGB(0,0,0)
    Backgroundinside_1.BorderSizePixel = 0
    Backgroundinside_1.Position = UDim2.new(0.5, 0,0.507142901, 0)
    Backgroundinside_1.Size = UDim2.new(1, 0,0, 284)

    UICorner_2.Parent = Backgroundinside_1
    UICorner_2.CornerRadius = UDim.new(0.05000000074505806,0)

    local Map_1 = Instance.new("Frame")
    local MapName_1 = Instance.new("TextLabel")

    Map_1.Name = "Map"
    Map_1.Parent = Background_1
    Map_1.AnchorPoint = Vector2.new(0, 1)
    Map_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
    Map_1.BackgroundTransparency = 1
    Map_1.BorderColor3 = Color3.fromRGB(0,0,0)
    Map_1.BorderSizePixel = 0
    Map_1.Position = UDim2.new(0.0299999993, 0,1, 0)
    Map_1.Size = UDim2.new(0, 100,0, 30)

    MapName_1.Name = "MapName"
    MapName_1.Parent = Map_1
    MapName_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
    MapName_1.BackgroundTransparency = 1
    MapName_1.BorderColor3 = Color3.fromRGB(0,0,0)
    MapName_1.BorderSizePixel = 0
    MapName_1.Size = UDim2.new(0, 70,1, 0)
    MapName_1.Font = Enum.Font.Gotham
    MapName_1.Text = "Script for "..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
    MapName_1.TextColor3 = Color3.fromRGB(255,255,255)
    MapName_1.TextSize = 10
    MapName_1.TextTransparency = 0.30000001192092896
    MapName_1.TextXAlignment = Enum.TextXAlignment.Left

    local TabList_1 = Instance.new("Frame")
    local UIStroke_1 = Instance.new("UIStroke")

    TabList_1.Name = "TabList"
    TabList_1.Parent = Backgroundinside_1
    TabList_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
    TabList_1.BackgroundTransparency = 1
    TabList_1.BorderColor3 = Color3.fromRGB(0,0,0)
    TabList_1.BorderSizePixel = 0
    TabList_1.Size = UDim2.new(0, 120,1, 0)

    UIStroke_1.Parent = TabList_1
    UIStroke_1.Color = Color3.fromRGB(22,24,27)
    UIStroke_1.Thickness = 1

    local ScrollingFrame_1 = Instance.new("ScrollingFrame")
    local UIListLayout_1 = Instance.new("UIListLayout")

    ScrollingFrame_1.Name = "ScrollingFrame"
    ScrollingFrame_1.Parent = TabList_1
    ScrollingFrame_1.Active = true
    ScrollingFrame_1.AnchorPoint = Vector2.new(0, 0.5)
    ScrollingFrame_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
    ScrollingFrame_1.BackgroundTransparency = 1
    ScrollingFrame_1.BorderColor3 = Color3.fromRGB(0,0,0)
    ScrollingFrame_1.BorderSizePixel = 0
    ScrollingFrame_1.Position = UDim2.new(0, 0,0.5, 0)
    ScrollingFrame_1.Size = UDim2.new(1, 0,0.949999988, 0)
    ScrollingFrame_1.ClipsDescendants = true
    ScrollingFrame_1.AutomaticCanvasSize = Enum.AutomaticSize.None
    ScrollingFrame_1.BottomImage = "rbxasset://textures/ui/Scroll/scroll-bottom.png"
    ScrollingFrame_1.CanvasPosition = Vector2.new(0, 0)
    ScrollingFrame_1.ElasticBehavior = Enum.ElasticBehavior.WhenScrollable
    ScrollingFrame_1.HorizontalScrollBarInset = Enum.ScrollBarInset.None
    ScrollingFrame_1.MidImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
    ScrollingFrame_1.ScrollBarImageColor3 = Color3.fromRGB(0,0,0)
    ScrollingFrame_1.ScrollBarImageTransparency = 0
    ScrollingFrame_1.ScrollBarThickness = 0
    ScrollingFrame_1.ScrollingDirection = Enum.ScrollingDirection.XY
    ScrollingFrame_1.TopImage = "rbxasset://textures/ui/Scroll/scroll-top.png"
    ScrollingFrame_1.VerticalScrollBarInset = Enum.ScrollBarInset.None
    ScrollingFrame_1.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right

    UIListLayout_1.Parent = ScrollingFrame_1
    UIListLayout_1.HorizontalAlignment = Enum.HorizontalAlignment.Center
    UIListLayout_1.SortOrder = Enum.SortOrder.LayoutOrder

    Library.Tab = {
        Value = false
    }

    function Library.Tab:CreateTab(info)

        local TabName = info.Name or info.name or info.Title or info.title or info.Text or info.text or nil

        local Tab_1 = Instance.new("TextButton")
        local UIListLayout_2 = Instance.new("UIListLayout")
        local Keed_1 = Instance.new("Frame")
        local UICorner_3 = Instance.new("UICorner")
        local Title_1 = Instance.new("TextLabel")

        Tab_1.Name = "Tab"
        Tab_1.Parent = ScrollingFrame_1
        Tab_1.Active = true
        Tab_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
        Tab_1.BackgroundTransparency = 1
        Tab_1.BorderColor3 = Color3.fromRGB(0,0,0)
        Tab_1.BorderSizePixel = 0
        Tab_1.Size = UDim2.new(0.800000012, 0,0, 25)
        Tab_1.Font = Enum.Font.SourceSans
        Tab_1.Text = ""
        Tab_1.TextSize = 14

        UIListLayout_2.Parent = Tab_1
        UIListLayout_2.Padding = UDim.new(0,0)
        UIListLayout_2.FillDirection = Enum.FillDirection.Horizontal
        UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout_2.VerticalAlignment = Enum.VerticalAlignment.Center

        Keed_1.Name = "Keed"
        Keed_1.Parent = Tab_1
        Keed_1.BackgroundColor3 = Color3.fromRGB(255,150,93)
        Keed_1.BorderColor3 = Color3.fromRGB(0,0,0)
        Keed_1.BorderSizePixel = 0
        Keed_1.LayoutOrder = -1
        Keed_1.Size = UDim2.new(0, 2,0.600000024, 0)
        Keed_1.BackgroundTransparency = 1
        
        table.insert(MainColor, Keed_1)

        UICorner_3.Parent = Keed_1
        UICorner_3.CornerRadius = UDim.new(1,0)

        Title_1.Name = "Title"
        Title_1.Parent = Tab_1
        Title_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
        Title_1.BackgroundTransparency = 1
        Title_1.BorderColor3 = Color3.fromRGB(0,0,0)
        Title_1.BorderSizePixel = 0
        Title_1.Size = UDim2.new(1, 0,1, 0)
        Title_1.Font = Enum.Font.GothamBold
        Title_1.Text = TabName
        Title_1.TextColor3 = Color3.fromRGB(255,255,255)
        Title_1.TextSize = 10
        Title_1.TextXAlignment = Enum.TextXAlignment.Left
        Title_1.TextTransparency = 0.6

        local Page_1 = Instance.new("Frame")
        local ScrollingFrame_2 = Instance.new("ScrollingFrame")

        local PageLeft_1 = Instance.new("Frame")
        local UIListLayout_3 = Instance.new("UIListLayout")

        Page_1.Name = "Page"
        Page_1.Parent = Backgroundinside_1
        Page_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
        Page_1.BackgroundTransparency = 1
        Page_1.BorderColor3 = Color3.fromRGB(0,0,0)
        Page_1.BorderSizePixel = 0
        Page_1.Position = UDim2.new(0.248421058, 0,0.05, 0)
        Page_1.Size = UDim2.new(0, 351,0, 274)
        Page_1.Visible = false

        ScrollingFrame_2.Name = "ScrollingFrame"
        ScrollingFrame_2.Parent = Page_1
        ScrollingFrame_2.Active = true
        ScrollingFrame_2.BackgroundColor3 = Color3.fromRGB(255,255,255)
        ScrollingFrame_2.BackgroundTransparency = 1
        ScrollingFrame_2.BorderColor3 = Color3.fromRGB(0,0,0)
        ScrollingFrame_2.BorderSizePixel = 0
        ScrollingFrame_2.Position = UDim2.new(0.0227920227, 0,0, 0)
        ScrollingFrame_2.Size = UDim2.new(0.977207959, 0,1, 0)
        ScrollingFrame_2.ClipsDescendants = true
        ScrollingFrame_2.AutomaticCanvasSize = Enum.AutomaticSize.None
        ScrollingFrame_2.BottomImage = "rbxasset://textures/ui/Scroll/scroll-bottom.png"
        ScrollingFrame_2.CanvasPosition = Vector2.new(0, 0)
        ScrollingFrame_2.ElasticBehavior = Enum.ElasticBehavior.WhenScrollable
        ScrollingFrame_2.HorizontalScrollBarInset = Enum.ScrollBarInset.None
        ScrollingFrame_2.MidImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
        ScrollingFrame_2.ScrollBarImageColor3 = Color3.fromRGB(255,150,93)
        ScrollingFrame_2.ScrollBarImageTransparency = 0
        ScrollingFrame_2.ScrollBarThickness = 3
        ScrollingFrame_2.ScrollingDirection = Enum.ScrollingDirection.XY
        ScrollingFrame_2.TopImage = "rbxasset://textures/ui/Scroll/scroll-top.png"
        ScrollingFrame_2.VerticalScrollBarInset = Enum.ScrollBarInset.None
        ScrollingFrame_2.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right
        
        table.insert(MainColor, ScrollingFrame_2)

        PageLeft_1.Name = "PageLeft"
        PageLeft_1.Parent = ScrollingFrame_2
        PageLeft_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
        PageLeft_1.BackgroundTransparency = 1
        PageLeft_1.BorderColor3 = Color3.fromRGB(0,0,0)
        PageLeft_1.BorderSizePixel = 0
        PageLeft_1.Size = UDim2.new(0.479999989, 0,0, 0)

        UIListLayout_3.Parent = PageLeft_1
        UIListLayout_3.Padding = UDim.new(0,5)
        UIListLayout_3.HorizontalAlignment = Enum.HorizontalAlignment.Center
        UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder

        local PageRight_1 = Instance.new("Frame")
        local UIListLayout_5 = Instance.new("UIListLayout")

        PageRight_1.Name = "PageRight"
        PageRight_1.Parent = ScrollingFrame_2
        PageRight_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
        PageRight_1.BackgroundTransparency = 1
        PageRight_1.BorderColor3 = Color3.fromRGB(0,0,0)
        PageRight_1.BorderSizePixel = 0
        PageRight_1.Position = UDim2.new(0.5, 0,0, 0)
        PageRight_1.Size = UDim2.new(0.479999989, 0,0, 0)

        UIListLayout_5.Parent = PageRight_1
        UIListLayout_5.Padding = UDim.new(0,5)
        UIListLayout_5.HorizontalAlignment = Enum.HorizontalAlignment.Center
        UIListLayout_5.SortOrder = Enum.SortOrder.LayoutOrder

        Tab_1.MouseButton1Click:Connect(function()
            for i,v in pairs(Backgroundinside_1:GetChildren()) do
                if v.Name == "Page" then
                    v.Visible = false
                    v.Position = UDim2.new(0.248421058, 0,0.05, 0)
                end
            end
            Tw({
                v = Page_1,
                t = 0.15,
                s = "Linear",
                d = "Out",
                g = {Position = UDim2.new(0.248421058, 0,0.033802893, 0)}
            }):Play()
            Page_1.Visible = true
            for i,v in pairs(ScrollingFrame_1:GetChildren()) do
                if v:IsA("TextButton") then
                    Tw({
                        v = v.Keed,
                        t = 0.3,
                        s = "Quint",
                        d = "InOut",
                        g = {BackgroundTransparency = 1}
                    }):Play()
                    Tw({
                        v = v.UIListLayout,
                        t = 0.3,
                        s = "Quint",
                        d = "InOut",
                        g = {Padding = UDim.new(0,0)}
                    }):Play()
                    Tw({
                        v = v.Title,
                        t = 0.15,
                        s = "Quint",
                        d = "InOut",
                        g = {TextTransparency = 0.6}
                    }):Play()
                end
            end
            task.spawn(function()
                Tw({
                    v = Keed_1,
                    t = 0.3,
                    s = "Quint",
                    d = "InOut",
                    g = {BackgroundTransparency = 0}
                }):Play()
                Tw({
                    v = UIListLayout_2,
                    t = 0.15,
                    s = "Quint",
                    d = "Out",
                    g = {Padding = UDim.new(0,8)}
                }):Play()
                Tw({
                    v = Title_1,
                    t = 0.15,
                    s = "Quint",
                    d = "InOut",
                    g = {TextTransparency = 0}
                }):Play()
            end)
        end)

        delay(0,function()
            if not Library.Tab.Value then
                Keed_1.Visible = true
                Tw({
                    v = UIListLayout_2,
                    t = 0.15,
                    s = "Linear",
                    d = "Out",
                    g = {Padding = UDim.new(0,8)}
                }):Play()
                Tw({
                    v = Title_1,
                    t = 0.15,
                    s = "Linear",
                    d = "Out",
                    g = {TextTransparency = 0}
                }):Play()
                Tw({
                    v = Page_1,
                    t = 0.15,
                    s = "Linear",
                    d = "Out",
                    g = {Position = UDim2.new(0.248421058, 0,0.033802893, 0)}
                }):Play()
                Tw({
                    v = Keed_1,
                    t = 0.15,
                    s = "Linear",
                    d = "Out",
                    g = {BackgroundTransparency = 0}
                }):Play()
                Page_1.Visible = true
                Library.Tab.Value = true
            end
        end)

        local function GetSideRL(parent)
            local RSide = {"Right", "right", "r", "R", "2"}
            local LSide = {"Left", "left", "l", "L", "1"}
            local Side

            if table.find(RSide, parent) then
                Side = PageRight_1
            elseif table.find(LSide, parent) then
                Side = PageLeft_1
            else
                Side = PageLeft_1
            end
            return Side
        end

        Library.Section = {}

        function Library.Section:CreateSection(info)

            local Title = info.Name or info.name or info.Title or info.title or info.Text or info.text or nil
            local Side = info.Side or info.side

            local Section_1 = Instance.new("Frame")
            local UICorner_4 = Instance.new("UICorner")
            local UIListLayout_4 = Instance.new("UIListLayout")
            local Section_2 = Instance.new("TextLabel")

            Section_1.Name = "Section"
            Section_1.Parent = GetSideRL(Side)
            Section_1.BackgroundColor3 = Color3.fromRGB(20,22,26)
            Section_1.BorderColor3 = Color3.fromRGB(0,0,0)
            Section_1.BorderSizePixel = 0
            Section_1.Size = UDim2.new(1, 0,0, 0)

            UICorner_4.Parent = Section_1
            UICorner_4.CornerRadius = UDim.new(0,9)

            UIListLayout_4.Parent = Section_1
            UIListLayout_4.HorizontalAlignment = Enum.HorizontalAlignment.Center
            UIListLayout_4.SortOrder = Enum.SortOrder.LayoutOrder

            Section_2.Name = "Section"
            Section_2.Parent = Section_1
            Section_2.BackgroundColor3 = Color3.fromRGB(255,255,255)
            Section_2.BackgroundTransparency = 1
            Section_2.BorderColor3 = Color3.fromRGB(0,0,0)
            Section_2.BorderSizePixel = 0
            Section_2.Size = UDim2.new(0.870000005, 0,0, 20)
            Section_2.Font = Enum.Font.GothamBold
            Section_2.Text = Title
            Section_2.TextColor3 = Color3.fromRGB(255,255,255)
            Section_2.TextSize = 10
            Section_2.TextTransparency = 0.30000001192092896
            Section_2.TextXAlignment = Enum.TextXAlignment.Left

            Library.Main = {}

            function Library.Main:CreateToggle(info)

                local Title = info.Name or info.name or info.Title or info.title or info.Text or info.text or nil
                local Risk = info.Risk or info.risk or false
                local Value = info.Value or info.Defuse or info.value or info.defuse or info.vu or info.df or false
                local Callback = info.Callback or info.callback or info.cb or function() end

                local Toggle_1 = Instance.new("Frame")
                local Title_2 = Instance.new("TextLabel")
                local ToggleO_1 = Instance.new("Frame")
                local UICorner_5 = Instance.new("UICorner")
                local UIStroke_2 = Instance.new("UIStroke")
                local O_1 = Instance.new("Frame")
                local UICorner_6 = Instance.new("UICorner")
                local UIStroke_3 = Instance.new("UIStroke")
                local Click_1 = Instance.new("TextButton")

                Toggle_1.Name = "Toggle"
                Toggle_1.Parent = Section_1
                Toggle_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
                Toggle_1.BackgroundTransparency = 1
                Toggle_1.BorderColor3 = Color3.fromRGB(0,0,0)
                Toggle_1.BorderSizePixel = 0
                Toggle_1.Size = UDim2.new(0.870000005, 0,0, 20)

                Title_2.Name = "Title"
                Title_2.Parent = Toggle_1
                Title_2.AnchorPoint = Vector2.new(0.5, 0.5)
                Title_2.BackgroundColor3 = Color3.fromRGB(255,255,255)
                Title_2.BackgroundTransparency = 1
                Title_2.BorderColor3 = Color3.fromRGB(0,0,0)
                Title_2.BorderSizePixel = 0
                Title_2.Position = UDim2.new(0.5, 0,0.5, 0)
                Title_2.Size = UDim2.new(1, 0,1, 0)
                Title_2.Font = Enum.Font.Gotham
                Title_2.Text = Title
                Title_2.TextColor3 = Color3.fromRGB(255,255,255)
                Title_2.TextSize = 9
                Title_2.TextTransparency = 0.6
                Title_2.TextXAlignment = Enum.TextXAlignment.Left

                ToggleO_1.Name = "ToggleO"
                ToggleO_1.Parent = Toggle_1
                ToggleO_1.AnchorPoint = Vector2.new(0.5, 0.5)
                ToggleO_1.BackgroundColor3 = Color3.fromRGB(37,40,46)
                ToggleO_1.BorderColor3 = Color3.fromRGB(0,0,0)
                ToggleO_1.BorderSizePixel = 0
                ToggleO_1.Position = UDim2.new(0.930000007, 0,0.5, 0)
                ToggleO_1.Size = UDim2.new(0, 25,0, 10)

                UICorner_5.Parent = ToggleO_1
                UICorner_5.CornerRadius = UDim.new(0,3)

                UIStroke_2.Parent = ToggleO_1
                UIStroke_2.Color = Color3.fromRGB(44,47,53)
                UIStroke_2.Thickness = 1

                O_1.Name = "O"
                O_1.Parent = ToggleO_1
                O_1.AnchorPoint = Vector2.new(0.5, 0.5)
                O_1.BackgroundColor3 = Color3.fromRGB(84,90,101)
                O_1.BorderColor3 = Color3.fromRGB(0,0,0)
                O_1.BorderSizePixel = 0
                O_1.Position = UDim2.new(0.25, 0,0.5, 0)
                O_1.Size = UDim2.new(0, 8,0, 8)

                UICorner_6.Parent = O_1
                UICorner_6.CornerRadius = UDim.new(0,2)

                UIStroke_3.Parent = O_1
                UIStroke_3.Color = Color3.fromRGB(44,47,53)
                UIStroke_3.Thickness = 1

                Click_1.Name = "Click"
                Click_1.Parent = Toggle_1
                Click_1.Active = true
                Click_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
                Click_1.BackgroundTransparency = 1
                Click_1.BorderColor3 = Color3.fromRGB(0,0,0)
                Click_1.BorderSizePixel = 0
                Click_1.Size = UDim2.new(1, 0,1, 0)
                Click_1.Font = Enum.Font.SourceSans
                Click_1.Text = ""
                Click_1.TextSize = 14

                if Risk then
                    local RiskIcon = Instance.new("ImageLabel")

                    RiskIcon.Name = "RiskIcon"
                    RiskIcon.Parent = Toggle_1
                    RiskIcon.AnchorPoint = Vector2.new(0.5, 0.5)
                    RiskIcon.BackgroundColor3 = Color3.fromRGB(255,255,255)
                    RiskIcon.BackgroundTransparency = 1
                    RiskIcon.BorderColor3 = Color3.fromRGB(0,0,0)
                    RiskIcon.BorderSizePixel = 0
                    RiskIcon.Position = UDim2.new(0.0299999993, 0,0.5, 0)
                    RiskIcon.Size = UDim2.new(0, 10,0, 10)
                    RiskIcon.Image = "rbxassetid://2790460444"
                    RiskIcon.ImageColor3 = Color3.fromRGB(255,0,0)
                    Title_2.Size = UDim2.new(0.8, 0,1, 0)
                end

                local function ToggleC(Value)
                    if not Value then 
                        Callback(Value)
                        Tw({
                            v = O_1,
                            t = 0.15,
                            s = "Back",
                            d = "Out",
                            g = {Position = UDim2.new(0.25, 0,0.5, 0)}
                        }):Play()
                        Tw({
                            v = Title_2,
                            t = 0.15,
                            s = "Linear",
                            d = "Out",
                            g = {TextTransparency = 0.6}
                        }):Play()
                    elseif Value then 
                        Callback(Value)
                        Tw({
                            v = O_1,
                            t = 0.15,
                            s = "Back",
                            d = "Out",
                            g = {Position = UDim2.new(0.7, 0,0.5, 0)}
                        }):Play()
                        Tw({
                            v = Title_2,
                            t = 0.15,
                            s = "Linear",
                            d = "Out",
                            g = {TextTransparency = 0}
                        }):Play()
                    end
                end

                Click_1.MouseButton1Click:Connect(function()
                    Value = not Value
                    ToggleC(Value)
                end)

                ToggleC(Value)

                local NewValue = {}

                function NewValue:SetValue(a)
                    Value = a
                    ToggleC(Value)
                end
                
                function NewValue:Set(b)
                    Title_1.Text = b
                end
                
                return NewValue
            end

            function Library.Main:CreateSlider(info)

                local Title = info.Name or info.name or info.Title or info.title or info.Text or info.text or nil
                local Textending = info.TextEnding or info.textending or info.te or info.ending or ""
                local Min = info.Min or info.min
                local Max = info.Max or info.max
                local Value = info.Value or info.Defuse or info.value or info.defuse or info.vu or info.df or Min
                local Callback = info.Callback or info.callback or info.cb or function() end

                local Slider = Instance.new("Frame")
                local Title_1 = Instance.new("TextLabel")
                local SliderBar_1 = Instance.new("Frame")
                local UICorner_1 = Instance.new("UICorner")
                local UIStroke_1 = Instance.new("UIStroke")
                local Click_1 = Instance.new("TextButton")
                local SliderValueBar_1 = Instance.new("Frame")
                local UICorner_2 = Instance.new("UICorner")
                local UIStroke_2 = Instance.new("UIStroke")
                local O_1 = Instance.new("Frame")
                local UICorner_3 = Instance.new("UICorner")
                local UIStroke_3 = Instance.new("UIStroke")
                local UIGradient_1 = Instance.new("UIGradient")
                local ValueBox_1 = Instance.new("TextBox")

                Slider.Name = "Slider"
                Slider.Parent = Section_1
                Slider.BackgroundColor3 = Color3.fromRGB(255,255,255)
                Slider.BackgroundTransparency = 1
                Slider.BorderColor3 = Color3.fromRGB(0,0,0)
                Slider.BorderSizePixel = 0
                Slider.Size = UDim2.new(0.870000005, 0,0, 40)

                Title_1.Name = "Title"
                Title_1.Parent = Slider
                Title_1.AnchorPoint = Vector2.new(0.5, 0)
                Title_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
                Title_1.BackgroundTransparency = 1
                Title_1.BorderColor3 = Color3.fromRGB(0,0,0)
                Title_1.BorderSizePixel = 0
                Title_1.Position = UDim2.new(0.5, 0,0.100000001, 0)
                Title_1.Size = UDim2.new(1, 0,0.5, 0)
                Title_1.Font = Enum.Font.Gotham
                Title_1.Text = Title
                Title_1.TextColor3 = Color3.fromRGB(255,255,255)
                Title_1.TextSize = 9
                Title_1.TextTransparency = 0.5
                Title_1.TextXAlignment = Enum.TextXAlignment.Left

                SliderBar_1.Name = "SliderBar"
                SliderBar_1.Parent = Slider
                SliderBar_1.AnchorPoint = Vector2.new(0.5, 0.5)
                SliderBar_1.BackgroundColor3 = Color3.fromRGB(37,40,46)
                SliderBar_1.BorderColor3 = Color3.fromRGB(0,0,0)
                SliderBar_1.BorderSizePixel = 0
                SliderBar_1.Position = UDim2.new(0.5, 0,0.699999988, 0)
                SliderBar_1.Size = UDim2.new(1, 0,0, 5)

                UICorner_1.Parent = SliderBar_1
                UICorner_1.CornerRadius = UDim.new(0,3)

                UIStroke_1.Parent = SliderBar_1
                UIStroke_1.Color = Color3.fromRGB(44,47,53)
                UIStroke_1.Thickness = 1

                Click_1.Name = "Click"
                Click_1.Parent = SliderBar_1
                Click_1.AnchorPoint = Vector2.new(0.5,0.5)
                Click_1.Active = true
                Click_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
                Click_1.BackgroundTransparency = 1
                Click_1.BorderColor3 = Color3.fromRGB(0,0,0)
                Click_1.BorderSizePixel = 0
                Click_1.Size = UDim2.new(1, 0,0, 15)
                Click_1.Position = UDim2.new(0.5, 0,0.5, 0)
                Click_1.Font = Enum.Font.SourceSans
                Click_1.Text = ""
                Click_1.TextSize = 14

                SliderValueBar_1.Name = "SliderValueBar"
                SliderValueBar_1.Parent = SliderBar_1
                SliderValueBar_1.BackgroundColor3 = Color3.fromRGB(255,150,93)
                SliderValueBar_1.BorderColor3 = Color3.fromRGB(0,0,0)
                SliderValueBar_1.BorderSizePixel = 0
                SliderValueBar_1.Size = UDim2.new(0.899999976, 0,1, 0)
                
                table.insert(MainColor, SliderValueBar_1)

                UICorner_2.Parent = SliderValueBar_1
                UICorner_2.CornerRadius = UDim.new(0,3)

                UIStroke_2.Parent = SliderValueBar_1
                UIStroke_2.Color = Color3.fromRGB(44,47,53)
                UIStroke_2.Thickness = 1

                O_1.Name = "O"
                O_1.Parent = SliderValueBar_1
                O_1.AnchorPoint = Vector2.new(0.5, 0.5)
                O_1.BackgroundColor3 = Color3.fromRGB(84,90,101)
                O_1.BorderColor3 = Color3.fromRGB(0,0,0)
                O_1.BorderSizePixel = 0
                O_1.Position = UDim2.new(1, 0,0.5, 0)
                O_1.Size = UDim2.new(0, 8,0, 8)

                UICorner_3.Parent = O_1
                UICorner_3.CornerRadius = UDim.new(0,2)

                UIStroke_3.Parent = O_1
                UIStroke_3.Color = Color3.fromRGB(44,47,53)
                UIStroke_3.Thickness = 1

                UIGradient_1.Parent = SliderValueBar_1
                UIGradient_1.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(86, 86, 86)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))}

                ValueBox_1.Name = "ValueBox"
                ValueBox_1.Parent = Slider
                ValueBox_1.Active = true
                ValueBox_1.AnchorPoint = Vector2.new(1, 0)
                ValueBox_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
                ValueBox_1.BackgroundTransparency = 1
                ValueBox_1.BorderColor3 = Color3.fromRGB(0,0,0)
                ValueBox_1.BorderSizePixel = 0
                ValueBox_1.Position = UDim2.new(1, 0,0.100000001, 0)
                ValueBox_1.Size = UDim2.new(0, 20,0.5, 0)
                ValueBox_1.Font = Enum.Font.Gotham
                ValueBox_1.PlaceholderColor3 = Color3.fromRGB(178,178,178)
                ValueBox_1.PlaceholderText = ""
                ValueBox_1.Text = Value..Textending
                ValueBox_1.TextColor3 = Color3.fromRGB(255,255,255)
                ValueBox_1.TextSize = 9

                local function updateSlider(value)
                    value = math.clamp(value, Min, Max)
                    Tw({
                        v = SliderValueBar_1,
                        t = 0.15,
                        s = "Exponential",
                        d = "Out",
                        g = {Size = UDim2.new((value - Min) / (Max - Min), 0, 1, 0)}
                    }):Play()
                    ValueBox_1.Text = tostring(value)..Textending
                    ValueBox_1.Size = UDim2.new(0, ValueBox_1.TextBounds.X + 2, 0.5, 0)
                    Callback(value)
                    
                    Title_1.TextTransparency = 0
                    Tw({
                        v = Title_1,
                        t = 3,
                        s = "Exponential",
                        d = "Out",
                        g = {TextTransparency = 0.5}
                    }):Play()
                end

                updateSlider(Value or 0)

                ValueBox_1.FocusLost:Connect(function()
                    local value = tonumber(ValueBox_1.Text) or Min
                    updateSlider(value)
                end)

                local function move(input)
                    local sliderBar = SliderBar_1
                    local relativeX = math.clamp((input.Position.X - sliderBar.AbsolutePosition.X) / sliderBar.AbsoluteSize.X, 0, 1)
                    local value = math.floor(relativeX * (Max - Min) + Min)
                    updateSlider(value)
                end

                local dragging = false

                Click_1.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                        dragging = true
                        move(input)
                    end
                end)

                Click_1.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                        dragging = false
                    end
                end)

                game:GetService("UserInputService").InputChanged:Connect(function(input)
                    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                        move(input)
                    end
                end)

            end

            function Library.Main:CreateMinSlider(info)
                
                local Title = info.Name or info.name or info.Title or info.title or info.Text or info.text or nil
                local Textending = info.TextEnding or info.textending or info.te or info.ending or ""
                local Min = info.Min or info.min
                local Max = info.Max or info.max
                local ValueHigh = info.ValueHigh or info.DefuseHigh or info.valuehigh or info.defusehigh or info.vuh or info.dfh or Min + 2
                local ValueLow = info.ValueLow or info.DefuseLow or info.valuelow or info.defuselow or info.vul or info.dfl or Min + -1
                local Callback = info.Callback or info.callback or info.cb or function() end
                
                local MinSlider = Instance.new("Frame")
                local Title_1 = Instance.new("TextLabel")
                local SliderBarLow_1 = Instance.new("Frame")
                local UICorner_1 = Instance.new("UICorner")
                local UIStroke_1 = Instance.new("UIStroke")
                local Click_1 = Instance.new("TextButton")
                local SliderValueBar_1 = Instance.new("Frame")
                local UICorner_2 = Instance.new("UICorner")
                local UIStroke_2 = Instance.new("UIStroke")
                local O_1 = Instance.new("Frame")
                local UICorner_3 = Instance.new("UICorner")
                local UIStroke_3 = Instance.new("UIStroke")
                local UIGradient_1 = Instance.new("UIGradient")
                local SliderBarHigh_1 = Instance.new("Frame")
                local UICorner_4 = Instance.new("UICorner")
                local UIStroke_4 = Instance.new("UIStroke")
                local Click_2 = Instance.new("TextButton")
                local SliderValueBar_2 = Instance.new("Frame")
                local UICorner_5 = Instance.new("UICorner")
                local UIStroke_5 = Instance.new("UIStroke")
                local O_2 = Instance.new("Frame")
                local UICorner_6 = Instance.new("UICorner")
                local UIStroke_6 = Instance.new("UIStroke")
                local UIGradient_2 = Instance.new("UIGradient")
                
                local ListBox = Instance.new("Frame")
                local UIListLayout_1 = Instance.new("UIListLayout")
                local ValueBoxHigh_1 = Instance.new("TextBox")
                local Lop_1 = Instance.new("TextLabel")
                local ValueBoxLow_1 = Instance.new("TextBox")
                
                MinSlider.Name = "MinSlider"
                MinSlider.Parent = Section_1
                MinSlider.BackgroundColor3 = Color3.fromRGB(255,255,255)
                MinSlider.BackgroundTransparency = 1
                MinSlider.BorderColor3 = Color3.fromRGB(0,0,0)
                MinSlider.BorderSizePixel = 0
                MinSlider.Size = UDim2.new(0.870000005, 0,0, 60)

                Title_1.Name = "Title"
                Title_1.Parent = MinSlider
                Title_1.AnchorPoint = Vector2.new(0.5, 0)
                Title_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
                Title_1.BackgroundTransparency = 1
                Title_1.BorderColor3 = Color3.fromRGB(0,0,0)
                Title_1.BorderSizePixel = 0
                Title_1.Position = UDim2.new(0.5, 0,0.0500000007, 0)
                Title_1.Size = UDim2.new(1, 0,0.5, 0)
                Title_1.Font = Enum.Font.Gotham
                Title_1.Text = Title
                Title_1.TextColor3 = Color3.fromRGB(255,255,255)
                Title_1.TextSize = 9
                Title_1.TextTransparency = 0.5
                Title_1.TextXAlignment = Enum.TextXAlignment.Left

                SliderBarLow_1.Name = "SliderBarLow"
                SliderBarLow_1.Parent = MinSlider
                SliderBarLow_1.AnchorPoint = Vector2.new(0.5, 0.5)
                SliderBarLow_1.BackgroundColor3 = Color3.fromRGB(37,40,46)
                SliderBarLow_1.BorderColor3 = Color3.fromRGB(0,0,0)
                SliderBarLow_1.BorderSizePixel = 0
                SliderBarLow_1.Position = UDim2.new(0.5, 0,0.600000024, 0)
                SliderBarLow_1.Size = UDim2.new(1, 0,0, 5)

                UICorner_1.Parent = SliderBarLow_1
                UICorner_1.CornerRadius = UDim.new(0,3)

                UIStroke_1.Parent = SliderBarLow_1
                UIStroke_1.Color = Color3.fromRGB(44,47,53)
                UIStroke_1.Thickness = 1

                Click_1.Name = "Click"
                Click_1.Parent = SliderBarLow_1
                Click_1.AnchorPoint = Vector2.new(0.5,0.5)
                Click_1.Active = true
                Click_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
                Click_1.BackgroundTransparency = 1
                Click_1.BorderColor3 = Color3.fromRGB(0,0,0)
                Click_1.BorderSizePixel = 0
                Click_1.Size = UDim2.new(1, 0,0, 15)
                Click_1.Position = UDim2.new(0.5, 0,0.5, 0)
                Click_1.Font = Enum.Font.SourceSans
                Click_1.Text = ""
                Click_1.TextSize = 14

                SliderValueBar_1.Name = "SliderValueBar"
                SliderValueBar_1.Parent = SliderBarLow_1
                SliderValueBar_1.BackgroundColor3 = Color3.fromRGB(255,150,93)
                SliderValueBar_1.BorderColor3 = Color3.fromRGB(0,0,0)
                SliderValueBar_1.BorderSizePixel = 0
                SliderValueBar_1.Size = UDim2.new(0.899999976, 0,1, 0)
                
                table.insert(MainColor, SliderValueBar_1)

                UICorner_2.Parent = SliderValueBar_1
                UICorner_2.CornerRadius = UDim.new(0,3)

                UIStroke_2.Parent = SliderValueBar_1
                UIStroke_2.Color = Color3.fromRGB(44,47,53)
                UIStroke_2.Thickness = 1

                O_1.Name = "O"
                O_1.Parent = SliderValueBar_1
                O_1.AnchorPoint = Vector2.new(0.5, 0.5)
                O_1.BackgroundColor3 = Color3.fromRGB(84,90,101)
                O_1.BorderColor3 = Color3.fromRGB(0,0,0)
                O_1.BorderSizePixel = 0
                O_1.Position = UDim2.new(1, 0,0.5, 0)
                O_1.Size = UDim2.new(0, 8,0, 8)

                UICorner_3.Parent = O_1
                UICorner_3.CornerRadius = UDim.new(0,2)

                UIStroke_3.Parent = O_1
                UIStroke_3.Color = Color3.fromRGB(44,47,53)
                UIStroke_3.Thickness = 1

                UIGradient_1.Parent = SliderValueBar_1
                UIGradient_1.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(86, 86, 86)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))}

                SliderBarHigh_1.Name = "SliderBarHigh"
                SliderBarHigh_1.Parent = MinSlider
                SliderBarHigh_1.AnchorPoint = Vector2.new(0.5, 0.5)
                SliderBarHigh_1.BackgroundColor3 = Color3.fromRGB(37,40,46)
                SliderBarHigh_1.BorderColor3 = Color3.fromRGB(0,0,0)
                SliderBarHigh_1.BorderSizePixel = 0
                SliderBarHigh_1.Position = UDim2.new(0.5, 0,0.899999976, 0)
                SliderBarHigh_1.Size = UDim2.new(1, 0,0, 5)

                UICorner_4.Parent = SliderBarHigh_1
                UICorner_4.CornerRadius = UDim.new(0,3)

                UIStroke_4.Parent = SliderBarHigh_1
                UIStroke_4.Color = Color3.fromRGB(44,47,53)
                UIStroke_4.Thickness = 1

                Click_2.Name = "Click"
                Click_2.Parent = SliderBarHigh_1
                Click_2.AnchorPoint = Vector2.new(0.5,0.5)
                Click_2.Active = true
                Click_2.BackgroundColor3 = Color3.fromRGB(255,255,255)
                Click_2.BackgroundTransparency = 1
                Click_2.BorderColor3 = Color3.fromRGB(0,0,0)
                Click_2.BorderSizePixel = 0
                Click_2.Size = UDim2.new(1, 0,0, 15)
                Click_2.Position = UDim2.new(0.5, 0,0.5, 0)
                Click_2.Font = Enum.Font.SourceSans
                Click_2.Text = ""
                Click_2.TextSize = 14

                SliderValueBar_2.Name = "SliderValueBar"
                SliderValueBar_2.Parent = SliderBarHigh_1
                SliderValueBar_2.BackgroundColor3 = Color3.fromRGB(255,150,93)
                SliderValueBar_2.BorderColor3 = Color3.fromRGB(0,0,0)
                SliderValueBar_2.BorderSizePixel = 0
                SliderValueBar_2.Size = UDim2.new(0.899999976, 0,1, 0)
                
                table.insert(MainColor, SliderValueBar_2)

                UICorner_5.Parent = SliderValueBar_2
                UICorner_5.CornerRadius = UDim.new(0,3)

                UIStroke_5.Parent = SliderValueBar_2
                UIStroke_5.Color = Color3.fromRGB(44,47,53)
                UIStroke_5.Thickness = 1

                O_2.Name = "O"
                O_2.Parent = SliderValueBar_2
                O_2.AnchorPoint = Vector2.new(0.5, 0.5)
                O_2.BackgroundColor3 = Color3.fromRGB(84,90,101)
                O_2.BorderColor3 = Color3.fromRGB(0,0,0)
                O_2.BorderSizePixel = 0
                O_2.Position = UDim2.new(1, 0,0.5, 0)
                O_2.Size = UDim2.new(0, 8,0, 8)

                UICorner_6.Parent = O_2
                UICorner_6.CornerRadius = UDim.new(0,2)

                UIStroke_6.Parent = O_2
                UIStroke_6.Color = Color3.fromRGB(44,47,53)
                UIStroke_6.Thickness = 1

                UIGradient_2.Parent = SliderValueBar_2
                UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(86, 86, 86)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))}

                ListBox.Name = "ListBox"
                ListBox.Parent = MinSlider
                ListBox.AnchorPoint = Vector2.new(1, 0)
                ListBox.BackgroundColor3 = Color3.fromRGB(255,255,255)
                ListBox.BackgroundTransparency = 1
                ListBox.BorderColor3 = Color3.fromRGB(0,0,0)
                ListBox.BorderSizePixel = 0
                ListBox.Position = UDim2.new(1, 0,0.0500000007, 0)
                ListBox.Size = UDim2.new(0, 20,0.5, 0)

                UIListLayout_1.Parent = ListBox
                UIListLayout_1.FillDirection = Enum.FillDirection.Horizontal
                UIListLayout_1.HorizontalAlignment = Enum.HorizontalAlignment.Right
                UIListLayout_1.SortOrder = Enum.SortOrder.LayoutOrder
                UIListLayout_1.VerticalAlignment = Enum.VerticalAlignment.Center

                ValueBoxHigh_1.Name = "ValueBoxHigh"
                ValueBoxHigh_1.Parent = ListBox
                ValueBoxHigh_1.Active = true
                ValueBoxHigh_1.AnchorPoint = Vector2.new(1, 0)
                ValueBoxHigh_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
                ValueBoxHigh_1.BackgroundTransparency = 1
                ValueBoxHigh_1.BorderColor3 = Color3.fromRGB(0,0,0)
                ValueBoxHigh_1.BorderSizePixel = 0
                ValueBoxHigh_1.Position = UDim2.new(1, 0,0.0500000007, 0)
                ValueBoxHigh_1.Size = UDim2.new(0, 20,0.5, 0)
                ValueBoxHigh_1.Font = Enum.Font.Gotham
                ValueBoxHigh_1.PlaceholderColor3 = Color3.fromRGB(178,178,178)
                ValueBoxHigh_1.PlaceholderText = ""
                ValueBoxHigh_1.Text = ValueHigh
                ValueBoxHigh_1.TextColor3 = Color3.fromRGB(255,255,255)
                ValueBoxHigh_1.TextSize = 9

                Lop_1.Name = "Lop"
                Lop_1.Parent = ListBox
                Lop_1.AnchorPoint = Vector2.new(1, 0)
                Lop_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
                Lop_1.BackgroundTransparency = 1
                Lop_1.BorderColor3 = Color3.fromRGB(0,0,0)
                Lop_1.BorderSizePixel = 0
                Lop_1.Position = UDim2.new(0.920000017, 0,0.0399999991, 0)
                Lop_1.Size = UDim2.new(0, 10,0.5, 0)
                Lop_1.Font = Enum.Font.Gotham
                Lop_1.Text = "-"
                Lop_1.TextColor3 = Color3.fromRGB(255,255,255)
                Lop_1.TextSize = 14

                ValueBoxLow_1.Name = "ValueBoxLow"
                ValueBoxLow_1.Parent = ListBox
                ValueBoxLow_1.Active = true
                ValueBoxLow_1.AnchorPoint = Vector2.new(1, 0)
                ValueBoxLow_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
                ValueBoxLow_1.BackgroundTransparency = 1
                ValueBoxLow_1.BorderColor3 = Color3.fromRGB(0,0,0)
                ValueBoxLow_1.BorderSizePixel = 0
                ValueBoxLow_1.Position = UDim2.new(0.850000024, 0,0.0500000007, 0)
                ValueBoxLow_1.Size = UDim2.new(0, 20,0.5, 0)
                ValueBoxLow_1.Font = Enum.Font.Gotham
                ValueBoxLow_1.PlaceholderColor3 = Color3.fromRGB(178,178,178)
                ValueBoxLow_1.PlaceholderText = ""
                ValueBoxLow_1.Text = ValueLow
                ValueBoxLow_1.TextColor3 = Color3.fromRGB(255,255,255)
                ValueBoxLow_1.TextSize = 9

                local function updateSliderHigh(value)
                    value = math.clamp(value, ValueLow + 1, Max)
                    ValueHigh = value
                    Tw({
                        v = SliderValueBar_1,
                        t = 0.15,
                        s = "Exponential",
                        d = "Out",
                        g = {Size = UDim2.new((value - Min) / (Max - Min), 0, 1, 0)}
                    }):Play()
                    ValueBoxHigh_1.Text = tostring(value)..Textending
                    ValueBoxHigh_1.Size = UDim2.new(0, ValueBoxHigh_1.TextBounds.X + 2, 0.5, 0)
                    Callback(value,ValueLow)

                    Title_1.TextTransparency = 0
                    Tw({
                        v = Title_1,
                        t = 3,
                        s = "Exponential",
                        d = "Out",
                        g = {TextTransparency = 0.5}
                    }):Play()
                end

                local function updateSliderLow(value)
                    value = math.clamp(value, Min, ValueHigh - 1)
                    ValueLow = value
                    Tw({
                        v = SliderValueBar_2,
                        t = 0.15,
                        s = "Exponential",
                        d = "Out",
                        g = {Size = UDim2.new((value - Min) / (Max - Min), 0, 1, 0)}
                    }):Play()
                    ValueBoxLow_1.Text = tostring(value)..Textending
                    ValueBoxLow_1.Size = UDim2.new(0, ValueBoxLow_1.TextBounds.X + 2, 0.5, 0)
                    Callback(ValueHigh, value)

                    Title_1.TextTransparency = 0
                    Tw({
                        v = Title_1,
                        t = 3,
                        s = "Exponential",
                        d = "Out",
                        g = {TextTransparency = 0.5}
                    }):Play()
                end
                
                delay(0,function()
                    updateSliderLow(ValueLow or 0)
                    updateSliderHigh(ValueHigh or 0)
                end)

                ValueBoxHigh_1.FocusLost:Connect(function()
                    local value = tonumber(ValueBoxHigh_1.Text) or Min
                    updateSliderHigh(value)
                end)

                ValueBoxLow_1.FocusLost:Connect(function()
                    local value = tonumber(ValueBoxLow_1.Text) or Min
                    updateSliderLow(value)
                end)
                
                local function moveHigh(input)
                    local sliderBar = SliderBarHigh_1
                    local relativeX = math.clamp((input.Position.X - sliderBar.AbsolutePosition.X) / sliderBar.AbsoluteSize.X, 0, 1)
                    local value = math.floor(relativeX * (Max - Min) + Min)
                    updateSliderHigh(value)
                end

                local function moveLow(input)
                    local sliderBar = SliderBarLow_1
                    local relativeX = math.clamp((input.Position.X - sliderBar.AbsolutePosition.X) / sliderBar.AbsoluteSize.X, 0, 1)
                    local value = math.floor(relativeX * (Max - Min) + Min)
                    updateSliderLow(value)
                end

                local draggingHigh = false
                local draggingLow = false

                Click_1.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                        draggingHigh = true
                        moveHigh(input)
                    end
                end)

                Click_1.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                        draggingHigh = false
                    end
                end)

                Click_2.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                        draggingLow = true
                        moveLow(input)
                    end
                end)

                Click_2.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                        draggingLow = false
                    end
                end)

                game:GetService("UserInputService").InputChanged:Connect(function(input)
                    if draggingHigh then
                        moveHigh(input)
                    elseif draggingLow then
                        moveLow(input)
                    end
                end)
            end

            function Library.Main:CreateButton(info)
                
                local Title = info.Name or info.name or info.Title or info.title or info.Text or info.text or nil
                local Callback = info.Callback or info.callback or info.cb or function() end
                
                local Button = Instance.new("Frame")
                local Title_1 = Instance.new("TextLabel")
                local Click_1 = Instance.new("TextButton")
                local UICorner_1 = Instance.new("UICorner")

                Button.Name = "Button"
                Button.Parent = Section_1
                Button.BackgroundColor3 = Color3.fromRGB(255,255,255)
                Button.BackgroundTransparency = 1
                Button.BorderColor3 = Color3.fromRGB(0,0,0)
                Button.BorderSizePixel = 0
                Button.Size = UDim2.new(0.870000005, 0,0, 30)

                Title_1.Name = "Title"
                Title_1.Parent = Button
                Title_1.AnchorPoint = Vector2.new(0.5, 0.5)
                Title_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
                Title_1.BackgroundTransparency = 1
                Title_1.BorderColor3 = Color3.fromRGB(0,0,0)
                Title_1.BorderSizePixel = 0
                Title_1.Position = UDim2.new(0.5, 0,0.5, 0)
                Title_1.Size = UDim2.new(1, 0,1, 0)
                Title_1.ZIndex = 2
                Title_1.Font = Enum.Font.GothamBold
                Title_1.Text = Title
                Title_1.TextColor3 = Color3.fromRGB(255,255,255)
                Title_1.TextSize = 9
                
                local UIStroke = Instance.new("UIStroke")

                UIStroke.Parent = Title_1
                UIStroke.Color = Color3.fromRGB(44,47,53)
                UIStroke.Thickness = 1

                Click_1.Name = "Click"
                Click_1.Parent = Button
                Click_1.AnchorPoint = Vector2.new(0.5, 0.5)
                Click_1.Active = true
                Click_1.BackgroundColor3 = Color3.fromRGB(255,150,93)
                Click_1.BorderColor3 = Color3.fromRGB(0,0,0)
                Click_1.BorderSizePixel = 0
                Click_1.Size = UDim2.new(1, 0,0, 20)
                Click_1.Font = Enum.Font.SourceSans
                Click_1.Text = ""
                Click_1.TextSize = 14
                Click_1.Position = UDim2.new(0.5, 0,0.5, 0)
                
                table.insert(MainColor, Click_1)

                UICorner_1.Parent = Click_1
                UICorner_1.CornerRadius = UDim.new(0,4)
                
                Click_1.MouseButton1Click:Connect(function()
                    task.spawn(function()
                        local twsizebutton = Tw({
                            v = Click_1,
                            t = 0.1,
                            s = "Back",
                            d = "Out",
                            g = {Size = UDim2.new(.8, 0,0, 15)}
                        })
                        twsizebutton:Play()
                        twsizebutton.Completed:Connect(function()
                            Tw({
                                v = Click_1,
                                t = 0.1,
                                s = "Back",
                                d = "Out",
                                g = {Size = UDim2.new(1, 0,0, 20)}
                            }):Play()
                        end)
                    end)
                    Callback()
                end)
            end

            function Library.Main:CreateDropdown(info)
                
                local Title = info.Name or info.name or info.Title or info.title or info.Text or info.text or nil
                local Callback = info.Callback or info.callback or info.cb or function() end
                local Value = info.Value or info.Defuse or info.value or info.defuse or info.vu or info.df or ""
                local List = info.List or info.list
                local Multi = info.Multi or info.multi or info.MultiDropdown or info.multidropdown or info.Multidropdown or false
                
                local Dropdown = Instance.new("Frame")
                local Title_1 = Instance.new("TextLabel")
                local SliderBar_1 = Instance.new("Frame")
                local UICorner_1 = Instance.new("UICorner")
                local UIStroke_1 = Instance.new("UIStroke")
                local Click_1 = Instance.new("TextButton")
                local IconSelectDD_1 = Instance.new("ImageLabel")
                local TextSelect_1 = Instance.new("TextLabel")
                
                Dropdown.Name = "Dropdown"
                Dropdown.Parent = Section_1
                Dropdown.BackgroundColor3 = Color3.fromRGB(255,255,255)
                Dropdown.BackgroundTransparency = 1
                Dropdown.BorderColor3 = Color3.fromRGB(0,0,0)
                Dropdown.BorderSizePixel = 0
                Dropdown.Size = UDim2.new(0.870000005, 0,0, 50)
                Dropdown.ZIndex = 2

                Title_1.Name = "Title"
                Title_1.Parent = Dropdown
                Title_1.AnchorPoint = Vector2.new(0.5, 0)
                Title_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
                Title_1.BackgroundTransparency = 1
                Title_1.BorderColor3 = Color3.fromRGB(0,0,0)
                Title_1.BorderSizePixel = 0
                Title_1.Position = UDim2.new(0.5, 0,0.0500000007, 0)
                Title_1.Size = UDim2.new(1, 0,0.400000006, 0)
                Title_1.Font = Enum.Font.Gotham
                Title_1.Text = Title
                Title_1.TextColor3 = Color3.fromRGB(255,255,255)
                Title_1.TextSize = 9
                Title_1.TextTransparency = 0.5
                Title_1.TextXAlignment = Enum.TextXAlignment.Left

                SliderBar_1.Name = "SliderBar"
                SliderBar_1.Parent = Dropdown
                SliderBar_1.AnchorPoint = Vector2.new(0.5, 0.5)
                SliderBar_1.BackgroundColor3 = Color3.fromRGB(37,40,46)
                SliderBar_1.BorderColor3 = Color3.fromRGB(0,0,0)
                SliderBar_1.BorderSizePixel = 0
                SliderBar_1.Position = UDim2.new(0.5, 0,0.649999976, 0)
                SliderBar_1.Size = UDim2.new(1, 0,0, 20)

                UICorner_1.Parent = SliderBar_1
                UICorner_1.CornerRadius = UDim.new(0,3)

                UIStroke_1.Parent = SliderBar_1
                UIStroke_1.Color = Color3.fromRGB(44,47,53)
                UIStroke_1.Thickness = 1

                Click_1.Name = "Click"
                Click_1.Parent = SliderBar_1
                Click_1.Active = true
                Click_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
                Click_1.BackgroundTransparency = 1
                Click_1.BorderColor3 = Color3.fromRGB(0,0,0)
                Click_1.BorderSizePixel = 0
                Click_1.Size = UDim2.new(1, 0,1, 0)
                Click_1.Font = Enum.Font.SourceSans
                Click_1.Text = ""
                Click_1.TextSize = 14

                IconSelectDD_1.Name = "IconSelectDD"
                IconSelectDD_1.Parent = SliderBar_1
                IconSelectDD_1.AnchorPoint = Vector2.new(0.5, 0.5)
                IconSelectDD_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
                IconSelectDD_1.BackgroundTransparency = 1
                IconSelectDD_1.BorderColor3 = Color3.fromRGB(0,0,0)
                IconSelectDD_1.BorderSizePixel = 0
                IconSelectDD_1.LayoutOrder = 1
                IconSelectDD_1.Position = UDim2.new(0.899999976, 0,0.5, 0)
                IconSelectDD_1.Size = UDim2.new(0, 15,0, 15)
                IconSelectDD_1.Image = "rbxassetid://2777862738"

                TextSelect_1.Name = "TextSelect"
                TextSelect_1.Parent = SliderBar_1
                TextSelect_1.AnchorPoint = Vector2.new(0.5, 0)
                TextSelect_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
                TextSelect_1.BackgroundTransparency = 1
                TextSelect_1.BorderColor3 = Color3.fromRGB(0,0,0)
                TextSelect_1.BorderSizePixel = 0
                TextSelect_1.Position = UDim2.new(0.5, 0,0, 0)
                TextSelect_1.Size = UDim2.new(0.899999976, 0,1, 0)
                TextSelect_1.Font = Enum.Font.Gotham
                if type(Value) == "table" then
                    TextSelect_1.Text = table.concat(Value, ", ")
                else
                    TextSelect_1.Text = Value
                end
                TextSelect_1.TextColor3 = Color3.fromRGB(255,255,255)
                TextSelect_1.TextSize = 9
                TextSelect_1.TextXAlignment = Enum.TextXAlignment.Left
                
                local DropdownSelect = Instance.new("Frame")
                local UICorner_1 = Instance.new("UICorner")
                local ScrollingFrame_1 = Instance.new("ScrollingFrame")
                local UIListLayout_1 = Instance.new("UIListLayout")
                
                DropdownSelect.Name = "DropdownSelect"
                DropdownSelect.Parent = Section_1
                DropdownSelect.AnchorPoint = Vector2.new(1, 0)
                DropdownSelect.BackgroundColor3 = Color3.fromRGB(37,40,46)
                DropdownSelect.BorderColor3 = Color3.fromRGB(0,0,0)
                DropdownSelect.BorderSizePixel = 0
                DropdownSelect.Position = UDim2.new(1, 0,0.899999976, 0)
                DropdownSelect.Size = UDim2.new(0.870000005, 0,0, 0)

                UICorner_1.Parent = DropdownSelect
                UICorner_1.CornerRadius = UDim.new(0,4)

                ScrollingFrame_1.Name = "ScrollingFrame"
                ScrollingFrame_1.Parent = DropdownSelect
                ScrollingFrame_1.Active = true
                ScrollingFrame_1.AnchorPoint = Vector2.new(0, 0.5)
                ScrollingFrame_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
                ScrollingFrame_1.BackgroundTransparency = 1
                ScrollingFrame_1.BorderColor3 = Color3.fromRGB(0,0,0)
                ScrollingFrame_1.BorderSizePixel = 0
                ScrollingFrame_1.Position = UDim2.new(0, 0,0.5, 0)
                ScrollingFrame_1.Size = UDim2.new(1, 0,0.899999976, 0)
                ScrollingFrame_1.ClipsDescendants = true
                ScrollingFrame_1.AutomaticCanvasSize = Enum.AutomaticSize.None
                ScrollingFrame_1.BottomImage = "rbxasset://textures/ui/Scroll/scroll-bottom.png"
                ScrollingFrame_1.CanvasPosition = Vector2.new(0, 0)
                ScrollingFrame_1.ElasticBehavior = Enum.ElasticBehavior.WhenScrollable
                ScrollingFrame_1.HorizontalScrollBarInset = Enum.ScrollBarInset.None
                ScrollingFrame_1.MidImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
                ScrollingFrame_1.ScrollBarImageColor3 = Color3.fromRGB(255,150,93)
                ScrollingFrame_1.ScrollBarImageTransparency = 0
                ScrollingFrame_1.ScrollBarThickness = 0
                ScrollingFrame_1.ScrollingDirection = Enum.ScrollingDirection.XY
                ScrollingFrame_1.TopImage = "rbxasset://textures/ui/Scroll/scroll-top.png"
                ScrollingFrame_1.VerticalScrollBarInset = Enum.ScrollBarInset.None
                ScrollingFrame_1.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right
                
                table.insert(MainColor, ScrollingFrame_1)

                UIListLayout_1.Parent = ScrollingFrame_1
                UIListLayout_1.Padding = UDim.new(0,3)
                UIListLayout_1.SortOrder = Enum.SortOrder.LayoutOrder
                
                local isOpen = false
                
                Click_1.MouseButton1Click:Connect(function()
                    isOpen = not isOpen
                    if isOpen then
                        if UIListLayout_1.AbsoluteContentSize.Y + 5 < 100 then
                            Tw({
                                v = DropdownSelect,
                                t = 0.15,
                                s = "Exponential",
                                d = "Out",
                                g = {Size = UDim2.new(0.870000005, 0,0, UIListLayout_1.AbsoluteContentSize.Y + 5)}
                            }):Play()
                        else
                            Tw({
                                v = DropdownSelect,
                                t = 0.15,
                                s = "Exponential",
                                d = "Out",
                                g = {Size = UDim2.new(0.870000005, 0,0, 100)}
                            }):Play()
                        end
                    else
                        Tw({
                            v = DropdownSelect,
                            t = 0.15,
                            s = "Exponential",
                            d = "Out",
                            g = {Size = UDim2.new(0.870000005, 0,0, 0)}
                        }):Play()
                    end
                end)
                
                local itemslist = {}
                local selectedItem

                function itemslist:Clear()
                    for _, child in ipairs(ScrollingFrame_1:GetChildren()) do
                        if child:IsA("Frame") then
                            child:Destroy()
                        end
                    end

                    selectedItem = nil
                    TextSelect_1.Text = ""
                end

                local selectedValues = {}
                
                function itemslist:AddList(text)
                    
                    local Item_1 = Instance.new("TextButton")
                    
                    Item_1.Name = "Item"
                    Item_1.Parent = ScrollingFrame_1
                    Item_1.Active = true
                    Item_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
                    Item_1.BackgroundTransparency = 1
                    Item_1.BorderColor3 = Color3.fromRGB(0,0,0)
                    Item_1.BorderSizePixel = 0
                    Item_1.Size = UDim2.new(1, 0,0, 15)
                    Item_1.Font = Enum.Font.Gotham
                    Item_1.Text = text
                    Item_1.TextColor3 = Color3.fromRGB(255,255,255)
                    Item_1.TextSize = 9
                    Item_1.TextTransparency = 0.5
                    
                    Item_1.MouseButton1Click:Connect(function()
                        if Multi then
                            if selectedValues[text] then
                                selectedValues[text] = nil
                                Tw({
                                    v = Item_1,
                                    t = 0.15,
                                    s = "Back",
                                    d = "Out",
                                    g = {TextTransparency = 0.5}
                                }):Play()
                            else
                                selectedValues[text] = true
                                Tw({
                                    v = Item_1,
                                    t = 0.15,
                                    s = "Back",
                                    d = "Out",
                                    g = {TextTransparency = 0}
                                }):Play()
                            end
                            local selectedList = {}
                            for i, v in pairs(selectedValues) do
                                table.insert(selectedList, i)
                            end
                            TextSelect_1.Text = table.concat(selectedList, ", ")
                            Callback(TextSelect_1.Text)
                        else
                            for i,v in pairs(ScrollingFrame_1:GetChildren()) do
                                if v:IsA("TextButton") then
                                    Tw({
                                        v = v,
                                        t = 0.15,
                                        s = "Back",
                                        d = "Out",
                                        g = {TextTransparency = 0.5}
                                    }):Play()
                                end
                            end
                            Tw({
                                v = Item_1,
                                t = 0.15,
                                s = "Back",
                                d = "Out",
                                g = {TextTransparency = 0}
                            }):Play()
                            Tw({
                                v = DropdownSelect,
                                t = 0.15,
                                s = "Exponential",
                                d = "Out",
                                g = {Size = UDim2.new(0.870000005, 0,0, 0)}
                            }):Play()
                            isOpen = false
                            Value = text
                            TextSelect_1.Text = text
                            Callback(TextSelect_1.Text)
                        end
                    end)

                    local function isValueInTable(val, tbl)
                        if type(tbl) ~= "table" then
                            return false
                        end

                        for _, v in pairs(tbl) do
                            if v == val then
                                return true
                            end
                        end
                        return false
                    end
                    
                    delay(0,function()
                        if Multi then
                            if isValueInTable(text, Value) then
                                Tw({
                                    v = Item_1,
                                    t = 0.15,
                                    s = "Back",
                                    d = "Out",
                                    g = {TextTransparency = 0}
                                }):Play()

                                selectedValues[text] = true
                                local selectedList = {}
                                for i, v in pairs(selectedValues) do
                                    table.insert(selectedList, i)
                                end
                                TextSelect_1.Text = table.concat(selectedList, ", ")
                                Callback(TextSelect_1.Text)
                            end
                        else
                            if text == Value then
                                Tw({
                                    v = Item_1,
                                    t = 0.15,
                                    s = "Back",
                                    d = "Out",
                                    g = {TextTransparency = 0}
                                }):Play()

                                Value = text
                                TextSelect_1.Text = text
                                Callback(TextSelect_1.Text)
                            end
                        end
                    end)
                end
                
                for i,v in ipairs(List) do
                    itemslist:AddList(v, i)
                end

                UIListLayout_1:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                    ScrollingFrame_1.CanvasSize = UDim2.new(0, 0, 0, UIListLayout_1.AbsoluteContentSize.Y + 5)
                end)

                return itemslist
            end

            function Library.Main:CreateLabel(info)
                
                local Title = info.Name or info.name or info.Title or info.title or info.Text or info.text or nil
                
                local Label = Instance.new("Frame")
                local LabelBox_1 = Instance.new("Frame")
                local Title_1 = Instance.new("TextLabel")
                local UICorner_1 = Instance.new("UICorner")
                local UIStroke_1 = Instance.new("UIStroke")
                local UIListLayout_1 = Instance.new("UIListLayout")
                
                Label.Name = "Label"
                Label.Parent = Section_1
                Label.BackgroundColor3 = Color3.fromRGB(255,255,255)
                Label.BackgroundTransparency = 1
                Label.BorderColor3 = Color3.fromRGB(0,0,0)
                Label.BorderSizePixel = 0
                Label.Size = UDim2.new(0.870000005, 0,0, 30)

                LabelBox_1.Name = "LabelBox"
                LabelBox_1.Parent = Label
                LabelBox_1.AnchorPoint = Vector2.new(0.5, 0.5)
                LabelBox_1.BackgroundColor3 = Color3.fromRGB(37,40,46)
                LabelBox_1.BorderColor3 = Color3.fromRGB(0,0,0)
                LabelBox_1.BorderSizePixel = 0
                LabelBox_1.Position = UDim2.new(0.5, 0,0.5, 0)
                LabelBox_1.Size = UDim2.new(1, 0,0.699999988, 0)

                Title_1.Name = "Title"
                Title_1.Parent = LabelBox_1
                Title_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
                Title_1.BackgroundTransparency = 1
                Title_1.BorderColor3 = Color3.fromRGB(0,0,0)
                Title_1.BorderSizePixel = 0
                Title_1.Size = UDim2.new(0.899999976, 0,1, 0)
                Title_1.Font = Enum.Font.Gotham
                Title_1.Text = Title
                Title_1.TextColor3 = Color3.fromRGB(255,255,255)
                Title_1.TextSize = 9
                Title_1.TextXAlignment = Enum.TextXAlignment.Left
                Title_1.TextWrapped = true
                Title_1.RichText = true

                UICorner_1.Parent = LabelBox_1
                UICorner_1.CornerRadius = UDim.new(0,3)

                UIStroke_1.Parent = LabelBox_1
                UIStroke_1.Color = Color3.fromRGB(44,47,53)
                UIStroke_1.Thickness = 1

                UIListLayout_1.Parent = LabelBox_1
                UIListLayout_1.HorizontalAlignment = Enum.HorizontalAlignment.Center
                UIListLayout_1.SortOrder = Enum.SortOrder.LayoutOrder
                UIListLayout_1.VerticalAlignment = Enum.VerticalAlignment.Center
                
                Title_1.Size = UDim2.new(0.899999976, 0, 0, Title_1.TextBounds.Y)
                LabelBox_1.Size = UDim2.new(1, 0, 0, Title_1.TextBounds.Y + 10)
                Label.Size = UDim2.new(0.870000005, 0, 0, Title_1.TextBounds.Y + 20)
                
                local NewText = {}

                function NewText:Set(b)
                    Title_1.Text = b
                    Title_1.Size = UDim2.new(0.899999976, 0, 0, Title_1.TextBounds.Y)
                    LabelBox_1.Size = UDim2.new(1, 0, 0, Title_1.TextBounds.Y + 10)
                    Label.Size = UDim2.new(0.870000005, 0, 0, Title_1.TextBounds.Y + 20)
                end
                return NewText
            end

            function Library.Main:CreateImage(info)
                
                local Title = info.Name or info.name or info.Title or info.title or info.Text or info.text or nil
                local Icon = info.Image or info.image or info.IDImage or info.idimage or info.icon or info.Icon
                local ButtonMode = info.Button or info.button or false
                local Callback = info.Callback or info.callback or info.cb or function() end
                
                if not ButtonMode then
                    
                    local Image = Instance.new("Frame")
                    local ImageBox_1 = Instance.new("Frame")
                    local Title_1 = Instance.new("TextLabel")
                    local UICorner_1 = Instance.new("UICorner")
                    local UIStroke_1 = Instance.new("UIStroke")
                    local Image_1 = Instance.new("ImageLabel")
                    local UICorner_2 = Instance.new("UICorner")
                    local UIStroke_2 = Instance.new("UIStroke")

                    Image.Name = "Image"
                    Image.Parent = Section_1
                    Image.BackgroundColor3 = Color3.fromRGB(255,255,255)
                    Image.BackgroundTransparency = 1
                    Image.BorderColor3 = Color3.fromRGB(0,0,0)
                    Image.BorderSizePixel = 0
                    Image.Size = UDim2.new(0.870000005, 0,0, 70)

                    ImageBox_1.Name = "ImageBox"
                    ImageBox_1.Parent = Image
                    ImageBox_1.AnchorPoint = Vector2.new(0.5, 0.5)
                    ImageBox_1.BackgroundColor3 = Color3.fromRGB(37,40,46)
                    ImageBox_1.BorderColor3 = Color3.fromRGB(0,0,0)
                    ImageBox_1.BorderSizePixel = 0
                    ImageBox_1.Position = UDim2.new(0.5, 0,0.5, 0)
                    ImageBox_1.Size = UDim2.new(1, 0,0.800000012, 0)

                    Title_1.Name = "Title"
                    Title_1.Parent = ImageBox_1
                    Title_1.AnchorPoint = Vector2.new(1, 0)
                    Title_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
                    Title_1.BackgroundTransparency = 1
                    Title_1.BorderColor3 = Color3.fromRGB(0,0,0)
                    Title_1.BorderSizePixel = 0
                    Title_1.Position = UDim2.new(1, 0,0, 0)
                    Title_1.Size = UDim2.new(0.600000024, 0,1, 0)
                    Title_1.Font = Enum.Font.Gotham
                    Title_1.RichText = true
                    Title_1.Text = Title
                    Title_1.TextColor3 = Color3.fromRGB(255,255,255)
                    Title_1.TextSize = 9
                    Title_1.TextWrapped = true
                    Title_1.TextXAlignment = Enum.TextXAlignment.Left

                    UICorner_1.Parent = ImageBox_1
                    UICorner_1.CornerRadius = UDim.new(0,3)

                    UIStroke_1.Parent = ImageBox_1
                    UIStroke_1.Color = Color3.fromRGB(44,47,53)
                    UIStroke_1.Thickness = 1

                    Image_1.Name = "Image"
                    Image_1.Parent = ImageBox_1
                    Image_1.AnchorPoint = Vector2.new(0, 0.5)
                    Image_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
                    Image_1.BackgroundTransparency = 1
                    Image_1.BorderColor3 = Color3.fromRGB(0,0,0)
                    Image_1.BorderSizePixel = 0
                    Image_1.Position = UDim2.new(0.0500000007, 0,0.5, 0)
                    Image_1.Size = UDim2.new(0, 40,0, 40)
                    if type(Icon) == 'string' and not Icon:find('rbxassetid://') then
                        Image_1.Image = "rbxassetid://".. Icon
                    elseif type(Icon) == 'number' then
                        Image_1.Image = "rbxassetid://".. Icon
                    else
                        Image_1.Image = Icon
                    end

                    UICorner_2.Parent = Image_1
                    UICorner_2.CornerRadius = UDim.new(0,3)

                    UIStroke_2.Parent = Image_1
                    UIStroke_2.Color = Color3.fromRGB(44,47,53)
                    UIStroke_2.Thickness = 1
                    
                    local NewText = {}

                    function NewText:Set(b)
                        Title_1.Text = b
                    end
                    function NewText:SetImage(b)
                        if type(b) == 'string' and not b:find('rbxassetid://') then
                            Image_1.Image = "rbxassetid://".. b
                        elseif type(b) == 'number' then
                            Image_1.Image = "rbxassetid://".. b
                        else
                            Image_1.Image = b
                        end
                    end
                    return NewText
                elseif ButtonMode then
                    
                    local ImageButton = Instance.new("Frame")
                    local ImageBox_1 = Instance.new("Frame")
                    local UICorner_1 = Instance.new("UICorner")
                    local UIStroke_1 = Instance.new("UIStroke")
                    local Image_1 = Instance.new("ImageLabel")
                    local UICorner_2 = Instance.new("UICorner")
                    local UIStroke_2 = Instance.new("UIStroke")
                    local Button_1 = Instance.new("Frame")
                    local Title_2 = Instance.new("TextLabel")
                    local UIStroke_3 = Instance.new("UIStroke")
                    local Click_1 = Instance.new("TextButton")
                    local UICorner_3 = Instance.new("UICorner")
                    
                    ImageButton.Name = "ImageButton"
                    ImageButton.Parent = Section_1
                    ImageButton.BackgroundColor3 = Color3.fromRGB(255,255,255)
                    ImageButton.BackgroundTransparency = 1
                    ImageButton.BorderColor3 = Color3.fromRGB(0,0,0)
                    ImageButton.BorderSizePixel = 0
                    ImageButton.Size = UDim2.new(0.870000005, 0,0, 100)

                    ImageBox_1.Name = "ImageBox"
                    ImageBox_1.Parent = ImageButton
                    ImageBox_1.AnchorPoint = Vector2.new(0.5, 0.5)
                    ImageBox_1.BackgroundColor3 = Color3.fromRGB(37,40,46)
                    ImageBox_1.BorderColor3 = Color3.fromRGB(0,0,0)
                    ImageBox_1.BorderSizePixel = 0
                    ImageBox_1.Position = UDim2.new(0.5, 0,0.5, 0)
                    ImageBox_1.Size = UDim2.new(1, 0,0.800000012, 0)

                    UICorner_1.Parent = ImageBox_1
                    UICorner_1.CornerRadius = UDim.new(0,3)

                    UIStroke_1.Parent = ImageBox_1
                    UIStroke_1.Color = Color3.fromRGB(44,47,53)
                    UIStroke_1.Thickness = 1

                    Image_1.Name = "Image"
                    Image_1.Parent = ImageBox_1
                    Image_1.AnchorPoint = Vector2.new(0.5, 0.5)
                    Image_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
                    Image_1.BackgroundTransparency = 1
                    Image_1.BorderColor3 = Color3.fromRGB(0,0,0)
                    Image_1.BorderSizePixel = 0
                    Image_1.Position = UDim2.new(0.5, 0,0.300000012, 0)
                    Image_1.Size = UDim2.new(0, 40,0, 40)
                    if type(Icon) == 'string' and not Icon:find('rbxassetid://') then
                        Image_1.Image = "rbxassetid://".. Icon
                    elseif type(Icon) == 'number' then
                        Image_1.Image = "rbxassetid://".. Icon
                    else
                        Image_1.Image = Icon
                    end

                    UICorner_2.Parent = Image_1
                    UICorner_2.CornerRadius = UDim.new(0,3)

                    UIStroke_2.Parent = Image_1
                    UIStroke_2.Color = Color3.fromRGB(44,47,53)
                    UIStroke_2.Thickness = 1

                    Button_1.Name = "Button"
                    Button_1.Parent = ImageBox_1
                    Button_1.AnchorPoint = Vector2.new(0.5, 0.5)
                    Button_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
                    Button_1.BackgroundTransparency = 1
                    Button_1.BorderColor3 = Color3.fromRGB(0,0,0)
                    Button_1.BorderSizePixel = 0
                    Button_1.Position = UDim2.new(0.5, 0,0.8, 0)
                    Button_1.Size = UDim2.new(0.870000005, 0,0, 30)

                    Title_2.Name = "Title"
                    Title_2.Parent = Button_1
                    Title_2.AnchorPoint = Vector2.new(0.5, 0.5)
                    Title_2.BackgroundColor3 = Color3.fromRGB(255,255,255)
                    Title_2.BackgroundTransparency = 1
                    Title_2.BorderColor3 = Color3.fromRGB(0,0,0)
                    Title_2.BorderSizePixel = 0
                    Title_2.Position = UDim2.new(0.5, 0,0.5, 0)
                    Title_2.Size = UDim2.new(1, 0,1, 0)
                    Title_2.ZIndex = 2
                    Title_2.Font = Enum.Font.GothamBold
                    Title_2.Text = Title
                    Title_2.TextColor3 = Color3.fromRGB(255,255,255)
                    Title_2.TextSize = 9

                    UIStroke_3.Parent = Title_2
                    UIStroke_3.Color = Color3.fromRGB(44,47,53)
                    UIStroke_3.Thickness = 1

                    Click_1.Name = "Click"
                    Click_1.Parent = Button_1
                    Click_1.Active = true
                    Click_1.AnchorPoint = Vector2.new(0.5, 0.5)
                    Click_1.BackgroundColor3 = Color3.fromRGB(255,150,93)
                    Click_1.BorderColor3 = Color3.fromRGB(0,0,0)
                    Click_1.BorderSizePixel = 0
                    Click_1.Position = UDim2.new(0.5, 0,0.5, 0)
                    Click_1.Size = UDim2.new(1, 0,0, 20)
                    Click_1.Font = Enum.Font.SourceSans
                    Click_1.Text = ""
                    Click_1.TextSize = 14
                    
                    table.insert(MainColor, Click_1)

                    UICorner_3.Parent = Click_1
                    UICorner_3.CornerRadius = UDim.new(0,4)
                    
                    Click_1.MouseButton1Click:Connect(function()
                        task.spawn(function()
                            local twsizebutton = Tw({
                                v = Click_1,
                                t = 0.1,
                                s = "Back",
                                d = "Out",
                                g = {Size = UDim2.new(.8, 0,0, 15)}
                            })
                            twsizebutton:Play()
                            twsizebutton.Completed:Connect(function()
                                Tw({
                                    v = Click_1,
                                    t = 0.1,
                                    s = "Back",
                                    d = "Out",
                                    g = {Size = UDim2.new(1, 0,0, 20)}
                                }):Play()
                            end)
                        end)
                        Callback()
                    end)
                    
                    local NewText = {}

                    function NewText:Set(b)
                        Title_2.Text = b
                    end
                    function NewText:SetImage(b)
                        if type(b) == 'string' and not b:find('rbxassetid://') then
                            Image_1.Image = "rbxassetid://".. b
                        elseif type(b) == 'number' then
                            Image_1.Image = "rbxassetid://".. b
                        else
                            Image_1.Image = b
                        end
                    end
                    return NewText
                end
            end

            function Library.Main:CreateKeyBind(info)
                
                local Title = info.Name or info.name or info.Title or info.title or info.Text or info.text or nil
                local DefaultKey = info.Value or info.DefaultKey or info.defaultKey or Enum.KeyCode.Q
                local TurnOnToggle = info.Toggle or info.toggle or false
                local ValueToggle = info.ToggleValue or info.togglevalue or false
                local Callback = info.Callback or info.callback or info.cb or function() end

                local KeybindToggle = Instance.new("Frame")
                local Title_1 = Instance.new("TextLabel")
                local Frame_1 = Instance.new("Frame")
                local UIListLayout_1 = Instance.new("UIListLayout")
                local ToggleO_1 = Instance.new("Frame")
                local UICorner_1 = Instance.new("UICorner")
                local UIStroke_1 = Instance.new("UIStroke")
                local O_1 = Instance.new("Frame")
                local UICorner_2 = Instance.new("UICorner")
                local UIStroke_2 = Instance.new("UIStroke")
                local BoxBind_1 = Instance.new("Frame")
                local UICorner_3 = Instance.new("UICorner")
                local UIStroke_3 = Instance.new("UIStroke")
                local Click_1 = Instance.new("TextButton")
                local ValueBind_1 = Instance.new("TextLabel")
                local Click_2 = Instance.new("TextButton")

                local Key = DefaultKey

                KeybindToggle.Name = "KeybindToggle"
                KeybindToggle.Parent = Section_1
                KeybindToggle.BackgroundColor3 = Color3.fromRGB(255,255,255)
                KeybindToggle.BackgroundTransparency = 1
                KeybindToggle.BorderColor3 = Color3.fromRGB(0,0,0)
                KeybindToggle.BorderSizePixel = 0
                KeybindToggle.Size = UDim2.new(0.870000005, 0,0, 20)

                Title_1.Name = "Title"
                Title_1.Parent = KeybindToggle
                Title_1.AnchorPoint = Vector2.new(0.5, 0.5)
                Title_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
                Title_1.BackgroundTransparency = 1
                Title_1.BorderColor3 = Color3.fromRGB(0,0,0)
                Title_1.BorderSizePixel = 0
                Title_1.Position = UDim2.new(0.5, 0,0.5, 0)
                Title_1.Size = UDim2.new(1, 0,1, 0)
                Title_1.Font = Enum.Font.Gotham
                Title_1.Text = Title
                Title_1.TextColor3 = Color3.fromRGB(255,255,255)
                Title_1.TextSize = 9
                Title_1.TextTransparency = 0.5
                Title_1.TextXAlignment = Enum.TextXAlignment.Left

                Frame_1.Parent = KeybindToggle
                Frame_1.AnchorPoint = Vector2.new(1, 0.5)
                Frame_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
                Frame_1.BackgroundTransparency = 1
                Frame_1.BorderColor3 = Color3.fromRGB(0,0,0)
                Frame_1.BorderSizePixel = 0
                Frame_1.Position = UDim2.new(1, 0,0.5, 0)
                Frame_1.Size = UDim2.new(0, 25,0, 10)

                UIListLayout_1.Parent = Frame_1
                UIListLayout_1.Padding = UDim.new(0,5)
                UIListLayout_1.FillDirection = Enum.FillDirection.Horizontal
                UIListLayout_1.HorizontalAlignment = Enum.HorizontalAlignment.Right
                UIListLayout_1.SortOrder = Enum.SortOrder.LayoutOrder
                UIListLayout_1.VerticalAlignment = Enum.VerticalAlignment.Center

                ToggleO_1.Name = "ToggleO"
                ToggleO_1.Parent = Frame_1
                ToggleO_1.AnchorPoint = Vector2.new(0.5, 0.5)
                ToggleO_1.BackgroundColor3 = Color3.fromRGB(37,40,46)
                ToggleO_1.BorderColor3 = Color3.fromRGB(0,0,0)
                ToggleO_1.BorderSizePixel = 0
                ToggleO_1.Position = UDim2.new(0.930000007, 0,0.5, 0)
                ToggleO_1.Size = UDim2.new(0, 25,0, 10)

                UICorner_1.Parent = ToggleO_1
                UICorner_1.CornerRadius = UDim.new(0,3)

                UIStroke_1.Parent = ToggleO_1
                UIStroke_1.Color = Color3.fromRGB(44,47,53)
                UIStroke_1.Thickness = 1

                O_1.Name = "O"
                O_1.Parent = ToggleO_1
                O_1.AnchorPoint = Vector2.new(0.5, 0.5)
                O_1.BackgroundColor3 = Color3.fromRGB(84,90,101)
                O_1.BorderColor3 = Color3.fromRGB(0,0,0)
                O_1.BorderSizePixel = 0
                O_1.Position = UDim2.new(0.25, 0,0.5, 0)
                O_1.Size = UDim2.new(0, 8,0, 8)

                UICorner_2.Parent = O_1
                UICorner_2.CornerRadius = UDim.new(0,2)

                UIStroke_2.Parent = O_1
                UIStroke_2.Color = Color3.fromRGB(44,47,53)
                UIStroke_2.Thickness = 1

                BoxBind_1.Name = "BoxBind"
                BoxBind_1.Parent = Frame_1
                BoxBind_1.AnchorPoint = Vector2.new(1, 0.5)
                BoxBind_1.BackgroundColor3 = Color3.fromRGB(37,40,46)
                BoxBind_1.BorderColor3 = Color3.fromRGB(0,0,0)
                BoxBind_1.BorderSizePixel = 0
                BoxBind_1.Position = UDim2.new(1, 0,0.5, 0)
                BoxBind_1.Size = UDim2.new(0, 25,0, 10)

                UICorner_3.Parent = BoxBind_1
                UICorner_3.CornerRadius = UDim.new(0,3)

                UIStroke_3.Parent = BoxBind_1
                UIStroke_3.Color = Color3.fromRGB(44,47,53)
                UIStroke_3.Thickness = 1

                Click_1.Name = "Click"
                Click_1.Parent = BoxBind_1
                Click_1.Active = true
                Click_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
                Click_1.BackgroundTransparency = 1
                Click_1.BorderColor3 = Color3.fromRGB(0,0,0)
                Click_1.BorderSizePixel = 0
                Click_1.Size = UDim2.new(1, 0,1, 0)
                Click_1.Font = Enum.Font.SourceSans
                Click_1.Text = ""
                Click_1.TextSize = 14
                Click_1.ZIndex = 2

                ValueBind_1.Name = "ValueBind"
                ValueBind_1.Parent = BoxBind_1
                ValueBind_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
                ValueBind_1.BackgroundTransparency = 1
                ValueBind_1.BorderColor3 = Color3.fromRGB(0,0,0)
                ValueBind_1.BorderSizePixel = 0
                ValueBind_1.Size = UDim2.new(1, 0,1, 0)
                ValueBind_1.Font = Enum.Font.Gotham
                ValueBind_1.Text = tostring(Key):gsub("Enum.KeyCode.", "")
                ValueBind_1.TextColor3 = Color3.fromRGB(255,255,255)
                ValueBind_1.TextSize = 8

                Click_2.Name = "Click"
                Click_2.Parent = KeybindToggle
                Click_2.Active = true
                Click_2.BackgroundColor3 = Color3.fromRGB(255,255,255)
                Click_2.BackgroundTransparency = 1
                Click_2.BorderColor3 = Color3.fromRGB(0,0,0)
                Click_2.BorderSizePixel = 0
                Click_2.Size = UDim2.new(1, 0,1, 0)
                Click_2.Font = Enum.Font.SourceSans
                Click_2.Text = ""
                Click_2.TextSize = 14
                
                if not TurnOnToggle then
                    ToggleO_1.Visible = false
                    Click_2.Visible = false
                end

                local function adjustBoxBindSize()
                    local textSize = game:GetService("TextService"):GetTextSize(ValueBind_1.Text, ValueBind_1.TextSize, ValueBind_1.Font, Vector2.new(1000, 1000))
                    BoxBind_1.Size = UDim2.new(0, textSize.X + 10, 0, 10)
                end

                adjustBoxBindSize()

                local function changeKey()
                    ValueBind_1.Text = "..."
                    if not TurnOnToggle then
                        Tw({
                            v = Title_1,
                            t = 0.1,
                            s = "Linear",
                            d = "Out",
                            g = {TextTransparency = 0.5}
                        }):Play()
                    end
                    local inputConnection

                    inputConnection = game:GetService("UserInputService").InputBegan:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.Keyboard then
                            Key = input.KeyCode
                            ValueBind_1.Text = tostring(Key):gsub("Enum.KeyCode.", "")
                            adjustBoxBindSize()
                            inputConnection:Disconnect()
                        end
                    end)
                end

                Click_1.MouseButton1Click:Connect(function()
                    changeKey()
                end)

                game:GetService("UserInputService").InputBegan:Connect(function(input)
                    if input.KeyCode == Key then
                        if not TurnOnToggle then
                            Callback(Key)
                            Tw({
                                v = Title_1,
                                t = 0.1,
                                s = "Linear",
                                d = "Out",
                                g = {TextTransparency = 0}
                            }):Play()
                        end
                    end
                end)
                
                local function ToggleC(Value)
                    if not Value then 
                        Callback(Value)
                        Tw({
                            v = O_1,
                            t = 0.15,
                            s = "Back",
                            d = "Out",
                            g = {Position = UDim2.new(0.25, 0,0.5, 0)}
                        }):Play()
                        Tw({
                            v = Title_1,
                            t = 0.1,
                            s = "Linear",
                            d = "Out",
                            g = {TextTransparency = 0.5}
                        }):Play()
                    elseif Value then 
                        Callback(Value)
                        Tw({
                            v = O_1,
                            t = 0.15,
                            s = "Back",
                            d = "Out",
                            g = {Position = UDim2.new(0.7, 0,0.5, 0)}
                        }):Play()
                        Tw({
                            v = Title_1,
                            t = 0.1,
                            s = "Linear",
                            d = "Out",
                            g = {TextTransparency = 0}
                        }):Play()
                    end
                end
                
                Click_2.MouseButton1Click:Connect(function()
                    ValueToggle = not ValueToggle
                    ToggleC(ValueToggle)
                end)
                
                if TurnOnToggle then
                    game:GetService("UserInputService").InputEnded:Connect(function(input, gameProcessed)
                        if input.KeyCode == Key then
                            ValueToggle = not ValueToggle
                            ToggleC(ValueToggle)
                        end
                    end)
                end
                
                delay(0,function()
                    if ValueBind_1 ~= "..." then
                        if not TurnOnToggle then
                            Callback(Key)
                            Tw({
                                v = Title_1,
                                t = 0.1,
                                s = "Linear",
                                d = "Out",
                                g = {TextTransparency = 0}
                            }):Play()
                        else
                            ToggleC(ValueToggle)
                        end
                    end
                end)
                
                local NewText = {}

                function NewText:Set(b)
                    Title_1.Text = b
                end
                function NewText:SetValue(b)
                    if not TurnOnToggle then Callback(b) end
                    ValueBind_1.Text = b
                    adjustBoxBindSize()
                end
                return NewText
            end

            function Library.Main:CreateTextBox(info)
                
                local Title = info.Name or info.name or info.Title or info.title or info.Text or info.text or nil
                local Placeholder = info.Placeholder or info.placeholder or "Place Your Text"
                local Value = info.Value or info.Defuse or info.value or info.defuse or info.vu or info.df or nil
                local Callback = info.Callback or info.callback or info.cb or function() end
                
                local TextBox = Instance.new("Frame")
                local Title_1 = Instance.new("TextLabel")
                local Box_1 = Instance.new("Frame")
                local UICorner_1 = Instance.new("UICorner")
                local UIStroke_1 = Instance.new("UIStroke")
                local IconTextBoxDD_1 = Instance.new("ImageLabel")
                local TextBox_1 = Instance.new("TextBox")
                
                TextBox.Name = "TextBox"
                TextBox.Parent = Section_1
                TextBox.BackgroundColor3 = Color3.fromRGB(255,255,255)
                TextBox.BackgroundTransparency = 1
                TextBox.BorderColor3 = Color3.fromRGB(0,0,0)
                TextBox.BorderSizePixel = 0
                TextBox.Size = UDim2.new(0.870000005, 0,0, 50)
                TextBox.ZIndex = 2

                Title_1.Name = "Title"
                Title_1.Parent = TextBox
                Title_1.AnchorPoint = Vector2.new(0.5, 0)
                Title_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
                Title_1.BackgroundTransparency = 1
                Title_1.BorderColor3 = Color3.fromRGB(0,0,0)
                Title_1.BorderSizePixel = 0
                Title_1.Position = UDim2.new(0.5, 0,0.0500000007, 0)
                Title_1.Size = UDim2.new(1, 0,0.400000006, 0)
                Title_1.Font = Enum.Font.Gotham
                Title_1.Text = Title
                Title_1.TextColor3 = Color3.fromRGB(255,255,255)
                Title_1.TextSize = 9
                Title_1.TextTransparency = 0.5
                Title_1.TextXAlignment = Enum.TextXAlignment.Left

                Box_1.Name = "Box"
                Box_1.Parent = TextBox
                Box_1.AnchorPoint = Vector2.new(0.5, 0.5)
                Box_1.BackgroundColor3 = Color3.fromRGB(37,40,46)
                Box_1.BorderColor3 = Color3.fromRGB(0,0,0)
                Box_1.BorderSizePixel = 0
                Box_1.Position = UDim2.new(0.5, 0,0.649999976, 0)
                Box_1.Size = UDim2.new(1, 0,0, 20)

                UICorner_1.Parent = Box_1
                UICorner_1.CornerRadius = UDim.new(0,3)

                UIStroke_1.Parent = Box_1
                UIStroke_1.Color = Color3.fromRGB(44,47,53)
                UIStroke_1.Thickness = 1

                IconTextBoxDD_1.Name = "IconTextBoxDD"
                IconTextBoxDD_1.Parent = Box_1
                IconTextBoxDD_1.AnchorPoint = Vector2.new(0.5, 0.5)
                IconTextBoxDD_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
                IconTextBoxDD_1.BackgroundTransparency = 1
                IconTextBoxDD_1.BorderColor3 = Color3.fromRGB(0,0,0)
                IconTextBoxDD_1.BorderSizePixel = 0
                IconTextBoxDD_1.LayoutOrder = 1
                IconTextBoxDD_1.Position = UDim2.new(0.899999976, 0,0.5, 0)
                IconTextBoxDD_1.Size = UDim2.new(0, 10,0, 10)
                IconTextBoxDD_1.Image = "rbxassetid://10734919691"

                TextBox_1.Parent = Box_1
                TextBox_1.Active = true
                TextBox_1.AnchorPoint = Vector2.new(0.5, 0)
                TextBox_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
                TextBox_1.BackgroundTransparency = 1
                TextBox_1.BorderColor3 = Color3.fromRGB(0,0,0)
                TextBox_1.BorderSizePixel = 0
                TextBox_1.Position = UDim2.new(0.5, 0,0, 0)
                TextBox_1.Size = UDim2.new(0.899999976, 0,1, 0)
                TextBox_1.Font = Enum.Font.Gotham
                TextBox_1.PlaceholderColor3 = Color3.fromRGB(178,178,178)
                TextBox_1.PlaceholderText = Placeholder
                TextBox_1.Text = Value
                TextBox_1.TextColor3 = Color3.fromRGB(255,255,255)
                TextBox_1.TextSize = 9
                TextBox_1.TextWrapped = true
                TextBox_1.TextXAlignment = Enum.TextXAlignment.Left
                
                TextBox_1.FocusLost:Connect(function()
                    if Value then
                        if #TextBox_1.Text > 0 then
                            pcall(Callback,TextBox_1.Text)
                        end
                    end
                end)

                delay(0,function()
                    if Value then
                        if #TextBox_1.Text > 0 then
                            pcall(Callback,TextBox_1.Text)
                        end
                    end
                end)
            end

            function Library.Main:CreateColorPicker(info)
                
                local Title = info.Name or info.name or info.Title or info.title or info.Text or info.text or nil
                local preset = info.Color or info.color or Color3.fromRGB(255, 255, 255)
                local Callback = info.Callback or info.callback or info.cb or function() end
                
                local ColorPicker = Instance.new("Frame")
                local Title_1 = Instance.new("TextLabel")
                local Picker_1 = Instance.new("Frame")
                local UICorner_1 = Instance.new("UICorner")
                local UIStroke_1 = Instance.new("UIStroke")
                local Click_1 = Instance.new("TextButton")
                
                ColorPicker.Name = "ColorPicker"
                ColorPicker.Parent = Section_1
                ColorPicker.BackgroundColor3 = Color3.fromRGB(255,255,255)
                ColorPicker.BackgroundTransparency = 1
                ColorPicker.BorderColor3 = Color3.fromRGB(0,0,0)
                ColorPicker.BorderSizePixel = 0
                ColorPicker.Size = UDim2.new(0.870000005, 0,0, 30)
                ColorPicker.ZIndex = 2

                Title_1.Name = "Title"
                Title_1.Parent = ColorPicker
                Title_1.AnchorPoint = Vector2.new(0.5, 0.5)
                Title_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
                Title_1.BackgroundTransparency = 1
                Title_1.BorderColor3 = Color3.fromRGB(0,0,0)
                Title_1.BorderSizePixel = 0
                Title_1.Position = UDim2.new(0.5, 0,0.5, 0)
                Title_1.Size = UDim2.new(1, 0,1, 0)
                Title_1.Font = Enum.Font.Gotham
                Title_1.Text = Title
                Title_1.TextColor3 = Color3.fromRGB(255,255,255)
                Title_1.TextSize = 9
                Title_1.TextTransparency = 0.5
                Title_1.TextXAlignment = Enum.TextXAlignment.Left

                Picker_1.Name = "Picker"
                Picker_1.Parent = ColorPicker
                Picker_1.AnchorPoint = Vector2.new(1, 0.5)
                Picker_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
                Picker_1.BorderColor3 = Color3.fromRGB(0,0,0)
                Picker_1.BorderSizePixel = 0
                Picker_1.Position = UDim2.new(1, 0,0.5, 0)
                Picker_1.Size = UDim2.new(0, 20,0, 15)

                UICorner_1.Parent = Picker_1
                UICorner_1.CornerRadius = UDim.new(0,3)

                UIStroke_1.Parent = Picker_1
                UIStroke_1.Color = Color3.fromRGB(44,47,53)
                UIStroke_1.Thickness = 1

                Click_1.Name = "Click"
                Click_1.Parent = ColorPicker
                Click_1.Active = true
                Click_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
                Click_1.BackgroundTransparency = 1
                Click_1.BorderColor3 = Color3.fromRGB(0,0,0)
                Click_1.BorderSizePixel = 0
                Click_1.Size = UDim2.new(1, 0,1, 0)
                Click_1.Font = Enum.Font.SourceSans
                Click_1.Text = ""
                Click_1.TextSize = 14
                
                local ColorPickerBar = Instance.new("Frame")
                local UICorner_1 = Instance.new("UICorner")
                local Color_1 = Instance.new("ImageButton")
                local ColorCorner_1 = Instance.new("UICorner")
                local ColorSelection_1 = Instance.new("ImageLabel")
                local Hue_1 = Instance.new("ImageButton")
                local HueCorner_1 = Instance.new("UICorner")
                local HueGradient_1 = Instance.new("UIGradient")
                local HueSelection_1 = Instance.new("ImageLabel")
                
                ColorPickerBar.Name = "ColorPickerBar"
                ColorPickerBar.Parent = Section_1
                ColorPickerBar.AnchorPoint = Vector2.new(1, 0)
                ColorPickerBar.BackgroundColor3 = Color3.fromRGB(37,40,46)
                ColorPickerBar.BorderColor3 = Color3.fromRGB(0,0,0)
                ColorPickerBar.BorderSizePixel = 0
                ColorPickerBar.Position = UDim2.new(0.935000002, 0,0.578671873, 0)
                ColorPickerBar.Size = UDim2.new(0.870000005, 0,0, 0)
                ColorPickerBar.ClipsDescendants = true

                UICorner_1.Parent = ColorPickerBar
                UICorner_1.CornerRadius = UDim.new(0,4)

                Color_1.Name = "Color"
                Color_1.Parent = ColorPickerBar
                Color_1.BackgroundColor3 = Color3.fromRGB(39,39,39)
                Color_1.Position = UDim2.new(0, 9,0, 9)
                Color_1.Size = UDim2.new(0, 80,0, 80)
                Color_1.ZIndex = 10
                Color_1.Image = "rbxassetid://4155801252"

                ColorCorner_1.Name = "ColorCorner"
                ColorCorner_1.Parent = Color_1
                ColorCorner_1.CornerRadius = UDim.new(0,3)

                ColorSelection_1.Name = "ColorSelection"
                ColorSelection_1.Parent = Color_1
                ColorSelection_1.AnchorPoint = Vector2.new(0.5, 0.5)
                ColorSelection_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
                ColorSelection_1.BackgroundTransparency = 1
                ColorSelection_1.Position = UDim2.new(preset and select(3, Color3.toHSV(preset)))
                ColorSelection_1.Size = UDim2.new(0, 18,0, 18)
                ColorSelection_1.Image = "http://www.roblox.com/asset/?id=4805639000"
                ColorSelection_1.ScaleType = Enum.ScaleType.Fit
                ColorSelection_1.ZIndex = 11

                Hue_1.Name = "Hue"
                Hue_1.Parent = ColorPickerBar
                Hue_1.AnchorPoint = Vector2.new(1, 0)
                Hue_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
                Hue_1.Position = UDim2.new(0.899999976, 0,0, 9)
                Hue_1.Size = UDim2.new(0, 25,0, 80)

                HueCorner_1.Name = "HueCorner"
                HueCorner_1.Parent = Hue_1
                HueCorner_1.CornerRadius = UDim.new(0,3)

                HueGradient_1.Name = "HueGradient"
                HueGradient_1.Parent = Hue_1
                HueGradient_1.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 4)), ColorSequenceKeypoint.new(0.2, Color3.fromRGB(234, 255, 0)), ColorSequenceKeypoint.new(0.4, Color3.fromRGB(21, 255, 0)), ColorSequenceKeypoint.new(0.6, Color3.fromRGB(0, 255, 255)), ColorSequenceKeypoint.new(0.8, Color3.fromRGB(0, 17, 255)), ColorSequenceKeypoint.new(0.9, Color3.fromRGB(255, 0, 251)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 4))}
                HueGradient_1.Rotation = 270

                HueSelection_1.Name = "HueSelection"
                HueSelection_1.Parent = Hue_1
                HueSelection_1.AnchorPoint = Vector2.new(0.5, 0.5)
                HueSelection_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
                HueSelection_1.BackgroundTransparency = 1
                HueSelection_1.Position = UDim2.new(0.48, 0, 1 - select(1, Color3.toHSV(preset)))
                HueSelection_1.Size = UDim2.new(0, 18,0, 18)
                HueSelection_1.Image = "http://www.roblox.com/asset/?id=4805639000"
                
                local Box_1 = Instance.new("Frame")
                local UICorner_2 = Instance.new("UICorner")
                local UIStroke_1 = Instance.new("UIStroke")
                local HueGradient_2 = Instance.new("UIGradient")
                local IconTextBoxDD_1 = Instance.new("ImageLabel")
                local TextBox_1 = Instance.new("TextBox")
                
                Box_1.Name = "Box"
                Box_1.Parent = ColorPickerBar
                Box_1.AnchorPoint = Vector2.new(0.5, 0.5)
                Box_1.BackgroundColor3 = Color3.fromRGB(37,40,46)
                Box_1.BorderColor3 = Color3.fromRGB(0,0,0)
                Box_1.BorderSizePixel = 0
                Box_1.Position = UDim2.new(0.5, 0,0, 110)
                Box_1.Size = UDim2.new(0.899999976, 0,0, 20)

                UICorner_2.Parent = Box_1
                UICorner_2.CornerRadius = UDim.new(0,3)

                UIStroke_1.Parent = Box_1
                UIStroke_1.Color = Color3.fromRGB(255,255,255)
                UIStroke_1.Thickness = 1

                HueGradient_2.Name = "HueGradient"
                HueGradient_2.Parent = UIStroke_1
                HueGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 4)), ColorSequenceKeypoint.new(0.2, Color3.fromRGB(234, 255, 0)), ColorSequenceKeypoint.new(0.4, Color3.fromRGB(21, 255, 0)), ColorSequenceKeypoint.new(0.6, Color3.fromRGB(0, 255, 255)), ColorSequenceKeypoint.new(0.8, Color3.fromRGB(0, 17, 255)), ColorSequenceKeypoint.new(0.9, Color3.fromRGB(255, 0, 251)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 4))}
                HueGradient_2.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0,0.6), NumberSequenceKeypoint.new(1,0.6)}

                IconTextBoxDD_1.Name = "IconTextBoxDD"
                IconTextBoxDD_1.Parent = Box_1
                IconTextBoxDD_1.AnchorPoint = Vector2.new(0.5, 0.5)
                IconTextBoxDD_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
                IconTextBoxDD_1.BackgroundTransparency = 1
                IconTextBoxDD_1.BorderColor3 = Color3.fromRGB(0,0,0)
                IconTextBoxDD_1.BorderSizePixel = 0
                IconTextBoxDD_1.LayoutOrder = 1
                IconTextBoxDD_1.Position = UDim2.new(0.899999976, 0,0.5, 0)
                IconTextBoxDD_1.Size = UDim2.new(0, 10,0, 10)
                IconTextBoxDD_1.Image = "rbxassetid://10734919691"

                TextBox_1.Parent = Box_1
                TextBox_1.Active = true
                TextBox_1.AnchorPoint = Vector2.new(0.5, 0)
                TextBox_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
                TextBox_1.BackgroundTransparency = 1
                TextBox_1.BorderColor3 = Color3.fromRGB(0,0,0)
                TextBox_1.BorderSizePixel = 0
                TextBox_1.Position = UDim2.new(0.5, 0,0, 0)
                TextBox_1.Size = UDim2.new(0.899999976, 0,1, 0)
                TextBox_1.Font = Enum.Font.Gotham
                TextBox_1.PlaceholderColor3 = Color3.fromRGB(178,178,178)
                TextBox_1.PlaceholderText = "R, G, B"
                TextBox_1.Text = string.format("%d, %d, %d", math.floor(Picker_1.BackgroundColor3.R * 255), math.floor(Picker_1.BackgroundColor3.G * 255), math.floor(Picker_1.BackgroundColor3.B * 255))
                TextBox_1.TextColor3 = Color3.fromRGB(255,255,255)
                TextBox_1.TextSize = 9
                TextBox_1.TextWrapped = true
                TextBox_1.TextXAlignment = Enum.TextXAlignment.Left
                TextBox_1.ClearTextOnFocus = false
                
                local IsOpen = false
                
                local ColorH, ColorS, ColorV = 1, 1, 1
                local ColorInput = nil
                local HueInput = nil
                local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
                local lastColor = nil
                local ColorInput = nil
                local HueInput = nil
                local isTouchDevice = game:GetService("UserInputService").TouchEnabled
                
                Click_1.MouseButton1Click:Connect(function()
                    IsOpen = not IsOpen
                    if IsOpen then
                        Tw({
                            v = ColorPickerBar,
                            t = 0.3,
                            s = "Exponential",
                            d = "Out",
                            g = {Size = UDim2.new(0.870000005, 0,0, 130)}
                        }):Play()
                    else
                        Tw({
                            v = ColorPickerBar,
                            t = 0.3,
                            s = "Exponential",
                            d = "Out",
                            g = {Size = UDim2.new(0.870000005, 0,0, 0)}
                        }):Play()
                    end
                end)
                
                local function UpdateColorPicker(nope)
                    Picker_1.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
                    Color_1.BackgroundColor3 = Color3.fromHSV(ColorH, 1, 1)

                    local r, g, b = Picker_1.BackgroundColor3.R * 255, Picker_1.BackgroundColor3.G * 255, Picker_1.BackgroundColor3.B * 255

                    TextBox_1.Text = string.format("%d, %d, %d", math.floor(r), math.floor(g), math.floor(b))

                    if lastColor ~= Picker_1.BackgroundColor3 then
                        lastColor = Picker_1.BackgroundColor3
                        pcall(Callback, math.floor(r), math.floor(g), math.floor(b))
                    end
                end
                
                ColorH = 1 - (math.clamp(HueSelection_1.AbsolutePosition.Y - Hue_1.AbsolutePosition.Y, 0, Hue_1.AbsoluteSize.Y) / Hue_1.AbsoluteSize.Y)
                ColorS = (math.clamp(ColorSelection_1.AbsolutePosition.X - Color_1.AbsolutePosition.X, 0, Color_1.AbsoluteSize.X) / Color_1.AbsoluteSize.X)
                ColorV = 1 - (math.clamp(ColorSelection_1.AbsolutePosition.Y - Color_1.AbsolutePosition.Y, 0, Color_1.AbsoluteSize.Y) / Color_1.AbsoluteSize.Y)
                
                Picker_1.BackgroundColor3 = preset
                Color_1.BackgroundColor3 = preset
                
                Color_1.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        if ColorInput then
                            ColorInput:Disconnect()
                        end

                        ColorInput = game:GetService("RunService").RenderStepped:Connect(function()
                        local ColorX = (math.clamp(Mouse.X - Color_1.AbsolutePosition.X, 0, Color_1.AbsoluteSize.X) /Color_1.AbsoluteSize.X)
                        local ColorY = (math.clamp(Mouse.Y - Color_1.AbsolutePosition.Y, 0, Color_1.AbsoluteSize.Y) /Color_1.AbsoluteSize.Y)

                            ColorSelection_1.Position = UDim2.new(ColorX, 0, ColorY, 0)
                            ColorS = ColorX
                            ColorV = 1 - ColorY

                            UpdateColorPicker(true)
                        end)
                    end
                end)
                
                Color_1.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        if ColorInput then
                            ColorInput:Disconnect()
                        end
                    end
                end)
                
                Hue_1.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        if HueInput then
                            HueInput:Disconnect()
                        end

                        HueInput = game:GetService("RunService").RenderStepped:Connect(function()
                            local HueY = (math.clamp(Mouse.Y - Hue_1.AbsolutePosition.Y, 0, Hue_1.AbsoluteSize.Y) /Hue_1.AbsoluteSize.Y)

                            HueSelection_1.Position = UDim2.new(0.48, 0, HueY, 0)
                            ColorH = 1 - HueY

                            UpdateColorPicker(true)
                        end)
                    end
                end)

                Hue_1.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        if HueInput then
                            HueInput:Disconnect()
                        end
                    end
                end)
                
                if isTouchDevice then
                    Color_1.InputBegan:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.Touch then
                            if ColorInput then
                                ColorInput:Disconnect()
                            end

                            ColorInput = game:GetService("RunService").RenderStepped:Connect(function()
                                local ColorX = (math.clamp(Mouse.X - Color_1.AbsolutePosition.X, 0, Color_1.AbsoluteSize.X) / Color_1.AbsoluteSize.X)
                                local ColorY = (math.clamp(Mouse.Y - Color_1.AbsolutePosition.Y, 0, Color_1.AbsoluteSize.Y) / Color_1.AbsoluteSize.Y)

                                ColorSelection_1.Position = UDim2.new(ColorX, 0, ColorY, 0)
                                ColorS = ColorX
                                ColorV = 1 - ColorY

                                UpdateColorPicker(true)
                            end)
                        end
                    end)

                    Color_1.InputEnded:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.Touch then
                            if ColorInput then
                                ColorInput:Disconnect()
                            end
                        end
                    end)

                    Hue_1.InputBegan:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.Touch then
                            if HueInput then
                                HueInput:Disconnect()
                            end

                            HueInput = game:GetService("RunService").RenderStepped:Connect(function()
                                local HueY = (math.clamp(Mouse.Y - Hue_1.AbsolutePosition.Y, 0, Hue_1.AbsoluteSize.Y) / Hue_1.AbsoluteSize.Y)

                                HueSelection_1.Position = UDim2.new(0.48, 0, HueY, 0)
                                ColorH = 1 - HueY

                                UpdateColorPicker(true)
                            end)
                        end
                    end)

                    Hue_1.InputEnded:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.Touch then
                            if HueInput then
                                HueInput:Disconnect()
                            end
                        end
                    end)
                end
                
                TextBox_1.FocusLost:Connect(function(enterPressed)
                    if enterPressed then
                        local inputText = TextBox_1.Text
                        local r, g, b = inputText:match("(%d+),%s*(%d+),%s*(%d+)")

                        if r and g and b then
                            r, g, b = tonumber(r), tonumber(g), tonumber(b)
                            if r >= 0 and r <= 255 and g >= 0 and g <= 255 and b >= 0 and b <= 255 then
                                local newColor = Color3.fromRGB(r, g, b)
                                Picker_1.BackgroundColor3 = newColor
                                Color_1.BackgroundColor3 = newColor

                                local h, s, v = Color3.toHSV(newColor)
                                ColorH, ColorS, ColorV = h, s, v

                                ColorSelection_1.Position = UDim2.new(s, 0, 1 - v, 0)
                                HueSelection_1.Position = UDim2.new(0.48, 0, 1 - h, 0)

                                pcall(Callback, r, g, b)
                            else
                                TextBox_1.Text = string.format("%d, %d, %d", math.floor(Picker_1.BackgroundColor3.R * 255), math.floor(Picker_1.BackgroundColor3.G * 255), math.floor(Picker_1.BackgroundColor3.B * 255))
                                Library:Notify({
                                    Title = "Function "..Title,
                                    Desc = "RGB values must be between 0 and 255",
                                    Time = 5,
                                    Type = "Error"
                                })
                            end
                        else
                            TextBox_1.Text = string.format("%d, %d, %d", math.floor(Picker_1.BackgroundColor3.R * 255), math.floor(Picker_1.BackgroundColor3.G * 255), math.floor(Picker_1.BackgroundColor3.B * 255))
                            Library:Notify({
                                Title = "Function "..Title,
                                Desc = "Please enter valid RGB values (e.g., 255, 128, 64)",
                                Time = 5,
                                Type = "Error"
                            })
                        end
                    end
                end)
                
                delay(0,function()
                    local r, g, b = Picker_1.BackgroundColor3.R * 255, Picker_1.BackgroundColor3.G * 255, Picker_1.BackgroundColor3.B * 255
                    TextBox_1.Text = string.format("%d, %d, %d", math.floor(r), math.floor(g), math.floor(b))
                    pcall(Callback, math.floor(r), math.floor(g), math.floor(b))
                end)
                
                local NewColor = {}

                function NewColor:SetColor(colorTable)
                    local r = colorTable.R or Picker_1.BackgroundColor3.R * 255
                    local g = colorTable.G or Picker_1.BackgroundColor3.G * 255
                    local b = colorTable.B or Picker_1.BackgroundColor3.B * 255

                    if r >= 0 and r <= 255 and g >= 0 and g <= 255 and b >= 0 and b <= 255 then
                        local newColor = Color3.fromRGB(r, g, b)

                        Picker_1.BackgroundColor3 = newColor
                        Color_1.BackgroundColor3 = newColor

                        local h, s, v = Color3.toHSV(newColor)
                        ColorH, ColorS, ColorV = h, s, v

                        ColorSelection_1.Position = UDim2.new(s, 0, 1 - v, 0)
                        HueSelection_1.Position = UDim2.new(0.48, 0, 1 - h, 0)
                        
                        TextBox_1.Text = string.format("%d, %d, %d", math.floor(r), math.floor(g), math.floor(b))
                        pcall(Callback, r, g, b)
                    else
                        Library:Notify({
                            Title = "Function "..Title.." SetColor",
                            Desc = "RGB values must be between 0 and 255",
                            Time = 5,
                            Type = "Error"
                        })
                    end
                end

                return NewColor
            end

            UIListLayout_4:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                Section_1.Size = UDim2.new(1, 0, 0, UIListLayout_4.AbsoluteContentSize.Y + 15)
            end)
            
            local function updateCanvasSize()
                local leftSize = UIListLayout_3.AbsoluteContentSize.Y
                local rightSize = UIListLayout_5.AbsoluteContentSize.Y
                ScrollingFrame_2.CanvasSize = UDim2.new(0, 0, 0, math.max(leftSize, rightSize))
            end

            UIListLayout_3:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                PageLeft_1.Size = UDim2.new(0.479999989, 0, 0, UIListLayout_3.AbsoluteContentSize.Y + 15)
                updateCanvasSize()
            end)

            UIListLayout_5:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                PageRight_1.Size = UDim2.new(0.479999989, 0, 0, UIListLayout_5.AbsoluteContentSize.Y + 15)
                updateCanvasSize()
            end)

            updateCanvasSize()

            return Library.Main
        end

        return Library.Section
    end

    UIListLayout_1:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        ScrollingFrame_1.CanvasSize = UDim2.new(0, 0, 0, UIListLayout_1.AbsoluteContentSize.Y + 5)
    end)

    return Library.Tab
end

function Library:Notify(info)
    
    local Title = info.Name or info.name or info.Title or info.title or info.Text or info.text or nil
    local Desc = info.Description or info.description or info.desc or info.Desc or info.Des or info.des or nil
    local Time = info.Time or 5
    local Type = info.Type or "Normal"
    
    local GetColor
    local GetIcon
    local GetSound
    
    if Type == "Normal" then
        GetColor = Color3.fromRGB(255, 255, 255)
        GetIcon = 2790459043
        GetSound = 8486683243
    elseif Type == "Successful" then
        GetColor = Color3.fromRGB(0, 255, 94)
        GetIcon = 10709775704
        GetSound = 9060788686
    elseif Type == "Error" then
        GetColor = Color3.fromRGB(255, 32, 24)
        GetIcon = 2790460444
        GetSound = 2865228021
    end
    
    local notify_1 = Instance.new("Frame")
    local NotifyTemple_1 = Instance.new("Frame")
    local UICorner_1 = Instance.new("UICorner")
    local Title_1 = Instance.new("TextLabel")
    local UIGradient_1 = Instance.new("UIGradient")
    local Desc_1 = Instance.new("TextLabel")
    local Icon_1 = Instance.new("ImageLabel")
    local Time_1 = Instance.new("Frame")
    local TextLabel_1 = Instance.new("TextLabel")
    local Sound_1 = Instance.new("Sound")
    
    notify_1.Name = "notify"
    notify_1.Parent = NotifyList
    notify_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
    notify_1.BackgroundTransparency = 1
    notify_1.BorderColor3 = Color3.fromRGB(0,0,0)
    notify_1.BorderSizePixel = 0
    notify_1.Size = UDim2.new(0, 20,0, 0)

    NotifyTemple_1.Name = "NotifyTemple"
    NotifyTemple_1.Parent = notify_1
    NotifyTemple_1.BackgroundColor3 = Color3.fromRGB(22,22,25)
    NotifyTemple_1.BorderColor3 = Color3.fromRGB(0,0,0)
    NotifyTemple_1.BorderSizePixel = 0
    NotifyTemple_1.Size = UDim2.new(0, 300,0, 50)
    NotifyTemple_1.Position = UDim2.new(-5,0,1,0)

    UICorner_1.Parent = NotifyTemple_1

    Title_1.Name = "Title"
    Title_1.Parent = NotifyTemple_1
    Title_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
    Title_1.BackgroundTransparency = 1
    Title_1.BorderColor3 = Color3.fromRGB(0,0,0)
    Title_1.BorderSizePixel = 0
    Title_1.Position = UDim2.new(0.200000003, 0,0.100000001, 0)
    Title_1.Size = UDim2.new(0, 170,0, 20)
    Title_1.Font = Enum.Font.Gotham
    Title_1.RichText = true
    Title_1.Text = Title
    Title_1.TextColor3 = Color3.fromRGB(255,255,255)
    Title_1.TextSize = 10
    Title_1.TextXAlignment = Enum.TextXAlignment.Left

    UIGradient_1.Parent = Title_1
    UIGradient_1.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, GetColor), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))}

    Desc_1.Name = "Desc"
    Desc_1.Parent = NotifyTemple_1
    Desc_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
    Desc_1.BackgroundTransparency = 1
    Desc_1.BorderColor3 = Color3.fromRGB(0,0,0)
    Desc_1.BorderSizePixel = 0
    Desc_1.Position = UDim2.new(0.200000003, 0,0.300000012, 0)
    Desc_1.Size = UDim2.new(0, 170,0, 35)
    Desc_1.Font = Enum.Font.Gotham
    Desc_1.RichText = true
    Desc_1.Text = Desc
    Desc_1.TextColor3 = Color3.fromRGB(255,255,255)
    Desc_1.TextSize = 9
    Desc_1.TextTransparency = 0.30000001192092896
    Desc_1.TextXAlignment = Enum.TextXAlignment.Left

    Icon_1.Name = "Icon"
    Icon_1.Parent = NotifyTemple_1
    Icon_1.AnchorPoint = Vector2.new(0, 0.5)
    Icon_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
    Icon_1.BackgroundTransparency = 1
    Icon_1.BorderColor3 = Color3.fromRGB(0,0,0)
    Icon_1.BorderSizePixel = 0
    Icon_1.Position = UDim2.new(0.0299999993, 0,0.5, 0)
    Icon_1.Size = UDim2.new(0, 40,0, 40)
    Icon_1.Image = "rbxassetid://"..GetIcon
    Icon_1.ImageColor3 = GetColor

    Time_1.Name = "Time"
    Time_1.Parent = NotifyTemple_1
    Time_1.AnchorPoint = Vector2.new(0, 0.5)
    Time_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
    Time_1.BackgroundTransparency = 1
    Time_1.BorderColor3 = Color3.fromRGB(0,0,0)
    Time_1.BorderSizePixel = 0
    Time_1.Position = UDim2.new(0.850000024, 0,0.5, 0)
    Time_1.Size = UDim2.new(0, 30,0, 30)

    TextLabel_1.Parent = Time_1
    TextLabel_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
    TextLabel_1.BackgroundTransparency = 1
    TextLabel_1.BorderColor3 = Color3.fromRGB(0,0,0)
    TextLabel_1.BorderSizePixel = 0
    TextLabel_1.Size = UDim2.new(1, 0,1, 0)
    TextLabel_1.Font = Enum.Font.Gotham
    TextLabel_1.Text = "10s"
    TextLabel_1.TextColor3 = Color3.fromRGB(255,255,255)
    TextLabel_1.TextSize = 9
    
    Sound_1.Parent = NotifyTemple_1
    Sound_1.Volume = 0.3
    Sound_1.RollOffMode = Enum.RollOffMode.InverseTapered
    Sound_1.SoundId = "rbxassetid://"..tostring(GetSound)

    Sound_1:Play()
    
    Tw({
        v = notify_1,
        t = .3,
        s = "Quint",
        d = "InOut",
        g = {Size = UDim2.new(0, 0,0, 50)}
    }):Play()
    Tw({
        v = NotifyTemple_1,
        t = .3,
        s = "Quint",
        d = "InOut",
        g = {Position = UDim2.new(0,0,0,0)}
    }):Play()
    
    task.spawn(function()
        for i = Time,1,-1 do
            TextLabel_1.Text = i.." s"
            task.wait(1)
        end
        local twclose = Tw({
            v = notify_1,
            t = .3,
            s = "Quint",
            d = "InOut",
            g = {Size = UDim2.new(0, 0,0, 0)}
        })
        twclose:Play()
        twclose.Completed:Connect(function()
            notify_1:Destroy()
        end)
    end)
end
return Library
