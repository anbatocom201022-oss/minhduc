-- ===== FAB (đơn giản, viền trắng) =====
local fabOuter=I("Frame",{Size=UDim2.new(0,64,0,64),Position=UDim2.new(.5,-32,.5,-32),BackgroundTransparency=1,ZIndex=100},sg)
local MB=I("TextButton",{Size=UDim2.new(1,0,1,0),BackgroundColor3=Color3.fromRGB(12,16,24),Text="ESP",TextColor3=AC,TextSize=16,Font=Enum.Font.GothamBlack,BorderSizePixel=0,AutoButtonColor=false,ZIndex=101},fabOuter)
I("UICorner",{CornerRadius=UDim.new(1,0)},MB)
local mbS=I("UIStroke",{Color=Color3.fromRGB(255,255,255),Thickness=1.5,Transparency=.15},MB)
DG(MB,MB)

-- ===== MENU (bé, nền đặc, viền trắng) =====
local MW,MH=240,290
local M=I("Frame",{
Size=UDim2.new(0,MW,0,MH),
BackgroundColor3=BG,
BackgroundTransparency=0,
BorderSizePixel=0,
Visible=false,
Active=true,
ZIndex=200,
},sg)
I("UICorner",{CornerRadius=UDim.new(0,10)},M)
local mS=I("UIStroke",{Color=Color3.fromRGB(255,255,255),Thickness=1.5,Transparency=0},M)

-- Header drag
local HD=I("TextButton",{Size=UDim2.new(1,0,0,44),BackgroundTransparency=1,Text="",BorderSizePixel=0,AutoButtonColor=false,ZIndex=201},M)
local hdr=I("TextLabel",{
Size=UDim2.new(1,-16,0,18),
Position=UDim2.new(0,12,0,10),
BackgroundTransparency=1,
RichText=true,
Text='<i>minhduc///</i>',
TextColor3=AC,
TextSize=17,
Font=Enum.Font.GothamBlack,
TextXAlignment=Enum.TextXAlignment.Left,
ZIndex=202,
},M)
I("TextLabel",{
Size=UDim2.new(1,-16,0,10),
Position=UDim2.new(0,12,0,28),
BackgroundTransparency=1,
Text="PREMIUM PVP SUITE",
TextColor3=Color3.fromRGB(160,170,185),
TextSize=8,
Font=Enum.Font.GothamBold,
TextXAlignment=Enum.TextXAlignment.Left,
ZIndex=202,
},M)

local div=I("Frame",{Size=UDim2.new(1,0,0,1),Position=UDim2.new(0,0,0,44),BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=.6,BorderSizePixel=0,ZIndex=204},M)
DG(M,HD)
MB.MouseButton1Click:Connect(function()
M.Visible=not M.Visible
TS:Create(blur,TweenInfo.new(.15),{Size=M.Visible and 14 or 0}):Play()
if M.Visible then
local ap=MB.AbsolutePosition
local as=MB.AbsoluteSize
M.Position=UDim2.fromOffset(ap.X+as.X/2-MW/2,ap.Y+as.Y+10)
end
end)

-- ===== TOGGLE (gọn, viền trắng khi bật) =====
local function TGL(y,txt,init,cb)
local row=I("TextButton",{
Size=UDim2.new(1,-16,0,34),
Position=UDim2.new(0,8,0,y),
BackgroundColor3=Color3.fromRGB(255,255,255),
BackgroundTransparency=.94,
Text="",
BorderSizePixel=0,
AutoButtonColor=false,
ZIndex=202,
},M)
I("UICorner",{CornerRadius=UDim.new(0,7)},row)
local rs=I("UIStroke",{Color=Color3.fromRGB(255,255,255),Thickness=1,Transparency=.85},row)
local lbl=I("TextLabel",{
Size=UDim2.new(1,-70,1,0),
Position=UDim2.new(0,14,0,0),
BackgroundTransparency=1,
Text=txt,
TextColor3=Color3.fromRGB(235,240,250),
TextSize=12,
Font=Enum.Font.GothamBold,
TextXAlignment=Enum.TextXAlignment.Left,
ZIndex=203,
},row)
local track=I("Frame",{
Size=UDim2.new(0,36,0,18),
Position=UDim2.new(1,-46,.5,-9),
BackgroundColor3=init and AC or Color3.fromRGB(40,48,62),
BorderSizePixel=0,
ZIndex=204,
},row)
I("UICorner",{CornerRadius=UDim.new(1,0)},track)
local trackS=I("UIStroke",{Color=Color3.fromRGB(255,255,255),Thickness=1,Transparency=init and .2 or .7},track)
local knob=I("Frame",{
Size=UDim2.new(0,14,0,14),
Position=init and UDim2.new(1,-16,.5,-7) or UDim2.new(0,2,.5,-7),
BackgroundColor3=Color3.fromRGB(255,255,255),
BorderSizePixel=0,
ZIndex=205,
},track)
I("UICorner",{CornerRadius=UDim.new(1,0)},knob)
row.MouseEnter:Connect(function()
TS:Create(row,TweenInfo.new(.12),{BackgroundTransparency=.86}):Play()
TS:Create(rs,TweenInfo.new(.12),{Transparency=.55}):Play()
end)
row.MouseLeave:Connect(function()
TS:Create(row,TweenInfo.new(.12),{BackgroundTransparency=.94}):Play()
TS:Create(rs,TweenInfo.new(.12),{Transparency=.85}):Play()
end)
local on=init
row.MouseButton1Click:Connect(function()
on=not on
TS:Create(knob,TweenInfo.new(.18,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{
Position=on and UDim2.new(1,-16,.5,-7) or UDim2.new(0,2,.5,-7)
}):Play()
TS:Create(track,TweenInfo.new(.18),{BackgroundColor3=on and AC or Color3.fromRGB(40,48,62)}):Play()
TS:Create(trackS,TweenInfo.new(.18),{Transparency=on and .2 or .7}):Play()
cb(on)
end)
end

TGL(52,"ESP",ON,function(v)ON=v if ON then MB.TextColor3=AC for _,p in ipairs(P:GetPlayers())do CE(p)end else MB.TextColor3=Color3.fromRGB(140,140,150)CA()end end)
TGL(90,"CHAMS",CH,function(v)CH=v RC()end)
TGL(128,"BOX",BX,function(v)BX=v if not BX then for _,d in pairs(D)do d.bx.Visible=false end end end)
TGL(166,"TEAM",TP,function(v)TP=v end)

I("Frame",{Size=UDim2.new(1,0,0,1),Position=UDim2.new(0,0,0,206),BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=.6,BorderSizePixel=0,ZIndex=204},M)
I("TextLabel",{
Size=UDim2.new(1,-16,0,12),
Position=UDim2.new(0,12,0,214),
BackgroundTransparency=1,
Text="THEME",
TextColor3=Color3.fromRGB(200,210,225),
TextSize=9,
Font=Enum.Font.GothamBlack,
TextXAlignment=Enum.TextXAlignment.Left,
ZIndex=202,
},M)

-- ===== THEME (đổi nền + accent) =====
local tBtns={}
local function mkTB(x,idx)
local t=Themes[idx]
local b=I("TextButton",{
Size=UDim2.new(0,28,0,28),
Position=UDim2.new(0,x,0,240),
BackgroundColor3=t.bg,
BorderSizePixel=0,
Text="",
AutoButtonColor=false,
ZIndex=203,
},M)
I("UICorner",{CornerRadius=UDim.new(0,6)},b)
local s=I("UIStroke",{Color=t.ac,Thickness=idx==TI and 2 or 1,Transparency=idx==TI and 0 or .55},b)
local dot=I("Frame",{Size=UDim2.new(0,8,0,8),Position=UDim2.new(.5,-4,.5,-4),BackgroundColor3=t.ac,BorderSizePixel=0,Visible=idx==TI,ZIndex=204},b)
I("UICorner",{CornerRadius=UDim.new(1,0)},dot)

b.MouseButton1Click:Connect(function()
TI=idx
AC=Themes[idx].ac
BG=Themes[idx].bg
M.BackgroundColor3=BG
mS.Color=Color3.fromRGB(255,255,255)
mbS.Color=Color3.fromRGB(255,255,255)
MB.BackgroundColor3=BG
MB.TextColor3=AC
hdr.TextColor3=AC
for _,bb in ipairs(tBtns)do
bb.s.Thickness=1
bb.s.Transparency=.55
bb.dot.Visible=false
end
s.Thickness=2
s.Transparency=0
dot.Visible=true
end)
tBtns[idx]={btn=b,s=s,dot=dot}
end
mkTB(12,1)mkTB(46,2)mkTB(80,3)mkTB(114,4)mkTB(148,5)mkTB(182,6)

print("[ESP] PREMIUM UI v2 LOADED")