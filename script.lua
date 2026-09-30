local P,R,U,TS=game:GetService("Players"),game:GetService("RunService"),game:GetService("UserInputService"),game:GetService("TweenService")
local L=game:GetService("Lighting")
local pl,pg=P.LocalPlayer,P.LocalPlayer:WaitForChild("PlayerGui")
local cam=workspace.CurrentCamera
local function I(c,p,par)local i=Instance.new(c)for k,v in pairs(p)do i[k]=v end i.Parent=par return i end
local function DG(f,h)local d,ds,sp
h.InputBegan:Connect(function(i)if i.UserInputType.Name:find("MouseButton1")or i.UserInputType.Name:find("Touch")then d=true;ds=i.Position;sp=f.Position end end)
U.InputChanged:Connect(function(i)if d and(i.UserInputType.Name:find("MouseMovement")or i.UserInputType.Name:find("Touch"))then local v=i.Position-ds;f.Position=UDim2.new(sp.X.Scale,sp.X.Offset+v.X,sp.Y.Scale,sp.Y.Offset+v.Y)end end)
U.InputEnded:Connect(function(i)if i.UserInputType.Name:find("MouseButton1")or i.UserInputType.Name:find("Touch")then d=false end end)end
for _,g in ipairs(pg:GetChildren())do if g.Name=="ESP_PvP"then g:Destroy()end end
for _,f in ipairs(workspace:GetChildren())do if f.Name=="ESP_PvPFolder"then f:Destroy()end end
for _,b in ipairs(L:GetChildren())do if b:IsA("BlurEffect")and b.Name=="ESPBlur"then b:Destroy()end end
local blur=I("BlurEffect",{Name="ESPBlur",Size=0},L)
local sg=I("ScreenGui",{Name="ESP_PvP",ResetOnSpawn=false,IgnoreGuiInset=false,DisplayOrder=999,ZIndexBehavior=Enum.ZIndexBehavior.Sibling},pg)
local fd=I("Folder",{Name="ESP_PvPFolder"},workspace)
local HR,LR,OFF=1000,1000,25
local H1,H2,H3=Color3.fromRGB(80,230,120),Color3.fromRGB(250,200,70),Color3.fromRGB(240,70,70)
local SK,CP,CM=Color3.fromRGB(0,0,0),Color3.fromRGB(255,40,40),Color3.fromRGB(40,120,255)
local Themes={
{name="CYAN",ac=Color3.fromRGB(0,220,255),bg=Color3.fromRGB(4,10,16)},
{name="CRIMSON",ac=Color3.fromRGB(255,40,70),bg=Color3.fromRGB(16,4,8)},
{name="VIOLET",ac=Color3.fromRGB(180,70,255),bg=Color3.fromRGB(12,4,20)},
{name="TOXIC",ac=Color3.fromRGB(50,255,100),bg=Color3.fromRGB(4,18,8)},
{name="GOLD",ac=Color3.fromRGB(255,190,40),bg=Color3.fromRGB(18,12,4)},
{name="BLOOD",ac=Color3.fromRGB(200,10,30),bg=Color3.fromRGB(14,2,3)},
}
local TI=1
local AC=Themes[TI].ac
local BG=Themes[TI].bg
local ON,CH,BX,TP=true,true,true,true
local D,CC={},{}
local function PN(v)if type(v)=="number"then return v end if type(v)=="string"then return tonumber(v:gsub(",",""))or 0 end return 0 end
local function GL(p)local ls=p:FindFirstChild("leaderstats")
if ls then for _,n in ipairs({"Level","Lvl","Lv","level"})do local v=ls:FindFirstChild(n)if v then return PN(v.Value)end end end
for _,fn in ipairs({"Data","Stats","BloxFruits"})do local f=p:FindFirstChild(fn)if f then for _,n in ipairs({"Level","Lvl","Lv"})do local v=f:FindFirstChild(n)if v then return PN(v.Value)end end end end
return 0 end
local function GT(p)local d=p:FindFirstChild("Data")
if d then local t=d:FindFirstChild("Team")
if t then local v=t.Value
if type(v)=="string"then
if v:lower():find("pirate")then return "pirate" end
if v:lower():find("marine")then return "marine" end
end end end
return "unknown" end
local function GC(id)if CC[id]then return CC[id]end local c=Color3.fromHSV((id*0.618033988749895)%1,.75,1)CC[id]=c return c end
local function AC2(h,c)h.FillColor=c h.OutlineColor=Color3.fromRGB(255,255,255)h.FillTransparency=CH and .25 or .6 h.OutlineTransparency=0 end
local function CE(p)if p==pl or D[p]then return end
local col=GC(p.UserId)
local h=I("Highlight",{FillColor=col,OutlineColor=Color3.fromRGB(255,255,255),FillTransparency=CH and .25 or .6,OutlineTransparency=0,DepthMode=Enum.HighlightDepthMode.AlwaysOnTop,Enabled=false},fd)
local ln=I("Frame",{BackgroundColor3=col,BackgroundTransparency=0,BorderSizePixel=0,AnchorPoint=Vector2.new(.5,.5),Visible=false,ZIndex=5},sg)
I("UICorner",{CornerRadius=UDim.new(1,0)},ln)
local bx=I("Frame",{BackgroundTransparency=1,BorderSizePixel=0,Visible=false,ZIndex=6},sg)
local bst=I("UIStroke",{Color=col,Thickness=1.5,Transparency=0},bx)
local ct=I("Frame",{Size=UDim2.new(0,120,0,32),AnchorPoint=Vector2.new(.5,1),BackgroundTransparency=1,BorderSizePixel=0,Visible=false,ZIndex=10},sg)
local nl=I("TextLabel",{Size=UDim2.new(1,0,0,11),BackgroundTransparency=1,Text=p.Name,TextColor3=Color3.fromRGB(255,255,255),TextSize=11,Font=Enum.Font.GothamBold,TextXAlignment=Enum.TextXAlignment.Center,TextStrokeTransparency=0,TextStrokeColor3=SK},ct)
local lv=I("TextLabel",{Size=UDim2.new(0,60,0,10),Position=UDim2.new(0,0,0,12),BackgroundTransparency=1,Text="",TextColor3=Color3.fromRGB(255,215,100),TextSize=10,Font=Enum.Font.GothamBold,TextXAlignment=Enum.TextXAlignment.Left,TextStrokeTransparency=0,TextStrokeColor3=SK},ct)
local dl=I("TextLabel",{Size=UDim2.new(0,60,0,10),Position=UDim2.new(1,-60,0,12),BackgroundTransparency=1,Text="",TextColor3=Color3.fromRGB(150,200,255),TextSize=10,Font=Enum.Font.GothamBold,TextXAlignment=Enum.TextXAlignment.Right,TextStrokeTransparency=0,TextStrokeColor3=SK},ct)
local hb=I("Frame",{Size=UDim2.new(1,0,0,3),Position=UDim2.new(0,0,0,24),BackgroundColor3=Color3.fromRGB(0,0,0),BackgroundTransparency=.5,BorderSizePixel=0},ct)
I("UICorner",{CornerRadius=UDim.new(1,0)},hb)
local hf=I("Frame",{Size=UDim2.new(1,0,1,0),BackgroundColor3=H1,BorderSizePixel=0},hb)
I("UICorner",{CornerRadius=UDim.new(1,0)},hf)
local hl=I("TextLabel",{Size=UDim2.new(1,0,0,9),Position=UDim2.new(0,0,0,28),BackgroundTransparency=1,Text="",TextColor3=Color3.fromRGB(230,230,240),TextSize=9,Font=Enum.Font.GothamBold,TextXAlignment=Enum.TextXAlignment.Center,TextStrokeTransparency=0,TextStrokeColor3=SK},ct)
D[p]={h=h,ln=ln,bx=bx,bst=bst,ct=ct,hf=hf,lv=lv,dl=dl,hl=hl,c=col,tm=GT(p),l=0,t=0}end
local function RE(p)local d=D[p]if not d then return end d.h:Destroy()d.ln:Destroy()d.bx:Destroy()d.ct:Destroy()D[p]=nil end
local function CA()for p in pairs(D)do RE(p)end end
local function RC()for p,d in pairs(D)do AC2(d.h,d.c)d.bst.Color=d.c end end
for _,p in ipairs(P:GetPlayers())do CE(p)end
P.PlayerAdded:Connect(function(p)if ON then CE(p)end end)
P.PlayerRemoving:Connect(RE)
local FT=0
R.Heartbeat:Connect(function(dt)FT=FT+dt end)
local function DL(f,x1,y1,x2,y2)local dx,dy=x2-x1,y2-y1 local L2=math.sqrt(dx*dx+dy*dy)
if L2<1 then f.Visible=false return end
f.Size=UDim2.new(0,L2,0,2)f.Position=UDim2.new(0,(x1+x2)/2,0,(y1+y2)/2)f.Rotation=math.deg(math.atan2(dy,dx))f.Visible=true end
local function DB(bx,ch)local ok,c,s=pcall(function()return ch:GetBoundingBox()end)
if not ok or not c then bx.Visible=false return end
local mX=math.huge MX=-math.huge mY=math.huge MY=-math.huge v=false
for _,sx in ipairs({-1,1})do for _,sy in ipairs({-1,1})do for _,sz in ipairs({-1,1})do
local wp=(c*CFrame.new(sx*s.X/2,sy*s.Y/2,sz*s.Z/2)).Position
local sp,os=cam:WorldToScreenPoint(wp)
if os and sp.Z>0 then v=true if sp.X<mX then mX=sp.X end if sp.X>MX then MX=sp.X end if sp.Y<mY then mY=sp.Y end if sp.Y>MY then MY=sp.Y end end
end end end
if not v then bx.Visible=false return end
bx.Position=UDim2.new(0,mX,0,mY)bx.Size=UDim2.new(0,MX-mX,0,MY-mY)bx.Visible=true end
R.RenderStepped:Connect(function()
if not ON then return end
if not cam then cam=workspace.CurrentCamera end
if not cam then return end
local mc=pl.Character
local mr=mc and mc:FindFirstChild("HumanoidRootPart")
local og=mr and mr.Position or Vector3.zero
local vp=cam.ViewportSize
local ms=select(1,cam:WorldToScreenPoint(og))
local sx,sy=vp.X/2,vp.Y-80
if ms.Z>0 then sx,sy=ms.X,ms.Y end
for p,d in pairs(D)do
if not p.Parent then RE(p)else
if FT-d.t>1 then d.t=FT d.l=GL(p)d.tm=GT(p)end
local ch=p.Character
local hd=ch and ch:FindFirstChild("Head")
local hr=ch and ch:FindFirstChild("HumanoidRootPart")
local hu=ch and ch:FindFirstChildOfClass("Humanoid")
if ch and hd and hr and hu and hu.Health>0 then
local ds=0
if mr then local v=hr.Position-og ds=math.sqrt(v.X*v.X+v.Y*v.Y+v.Z*v.Z)end
local sp,os=cam:WorldToScreenPoint(hd.Position)
if os and sp.Z>0 then
d.ct.Position=UDim2.new(0,sp.X,0,sp.Y-OFF)
d.ct.Visible=true
local pc=hu.MaxHealth>0 and math.clamp(hu.Health/hu.MaxHealth,0,1)or 0
d.hf.Size=UDim2.new(pc,0,1,0)
if pc>.5 then d.hf.BackgroundColor3=H1 elseif pc>.25 then d.hf.BackgroundColor3=H2 else d.hf.BackgroundColor3=H3 end
d.lv.Text="Lv "..(d.l>0 and tostring(d.l)or "?")
d.dl.Text=math.floor(ds+.5).."m"
d.hl.Text=math.floor(hu.Health+.5).."/"..math.floor(hu.MaxHealth+.5).." HP"
if BX and ds<=HR and ds>3 then
if TP then
if d.tm=="pirate"then d.bst.Color=CP
elseif d.tm=="marine"then d.bst.Color=CM
else d.bst.Color=d.c end
else d.bst.Color=d.c end
DB(d.bx,ch)
else d.bx.Visible=false end
if ds<=LR and ds>3 then
d.ln.BackgroundColor3=d.c
local bp,bs2=cam:WorldToScreenPoint(hr.Position)
if bs2 and bp.Z>0 then DL(d.ln,sx,sy,bp.X,bp.Y)else d.ln.Visible=false end
else d.ln.Visible=false end
else d.ct.Visible=false d.ln.Visible=false d.bx.Visible=false end
if ds<=HR and ds>3 then
if d.h.Adornee~=ch then d.h.Adornee=ch end
d.h.Enabled=true
if TP then
if d.tm=="pirate"then d.h.FillColor=CP d.h.OutlineColor=Color3.fromRGB(255,120,120)
elseif d.tm=="marine"then d.h.FillColor=CM d.h.OutlineColor=Color3.fromRGB(150,200,255)
else d.h.FillColor=d.c d.h.OutlineColor=Color3.fromRGB(255,255,255)end
else d.h.FillColor=d.c d.h.OutlineColor=Color3.fromRGB(255,255,255)end
else d.h.Enabled=false end
else d.ct.Visible=false d.h.Enabled=false d.ln.Visible=false d.bx.Visible=false end
end end end)
local fabOuter=I("Frame",{Size=UDim2.new(0,80,0,80),Position=UDim2.new(.5,-40,.5,-40),BackgroundTransparency=1,ZIndex=100},sg)
local fabShadow=I("Frame",{Size=UDim2.new(0,68,0,68),Position=UDim2.new(.5,-32,.5,-30),BackgroundColor3=Color3.fromRGB(0,0,0),BackgroundTransparency=.65,BorderSizePixel=0,ZIndex=99},fabOuter)
I("UICorner",{CornerRadius=UDim.new(1,0)},fabShadow)
local fabGlow=I("Frame",{Size=UDim2.new(0,68,0,68),Position=UDim2.new(.5,-34,.5,-34),BackgroundColor3=AC,BackgroundTransparency=.85,BorderSizePixel=0,ZIndex=100},fabOuter)
I("UICorner",{CornerRadius=UDim.new(1,0)},fabGlow)
local fabRing=I("Frame",{Size=UDim2.new(0,74,0,74),Position=UDim2.new(.5,-37,.5,-37),BackgroundTransparency=1,ZIndex=100},fabOuter)
I("UICorner",{CornerRadius=UDim.new(1,0)},fabRing)
local fabRingS=I("UIStroke",{Color=AC,Thickness=1.5,Transparency=.4},fabRing)
local fabDot=I("Frame",{Size=UDim2.new(0,5,0,5),Position=UDim2.new(.5,-2.5,0,-2.5),AnchorPoint=Vector2.new(.5,.5),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,ZIndex=101},fabRing)
I("UICorner",{CornerRadius=UDim.new(1,0)},fabDot)
task.spawn(function()while true do for i=0,360,4 do fabRing.Rotation=i task.wait(.016) end end end)
local MB=I("TextButton",{Size=UDim2.new(0,60,0,60),Position=UDim2.new(.5,-30,.5,-30),BackgroundColor3=Color3.fromRGB(10,14,22),BackgroundTransparency=.05,Text="ESP",TextColor3=AC,TextSize=17,Font=Enum.Font.GothamBlack,BorderSizePixel=0,AutoButtonColor=false,ZIndex=102},fabOuter)
I("UICorner",{CornerRadius=UDim.new(1,0)},MB)
local mbS=I("UIStroke",{Color=AC,Thickness=2,Transparency=.15},MB)
DG(MB,MB)
task.spawn(function()while true do
TS:Create(fabGlow,TweenInfo.new(.9,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{Size=UDim2.new(0,86,0,86),Position=UDim2.new(.5,-43,.5,-43),BackgroundTransparency=.94}):Play()
task.wait(.9)
TS:Create(fabGlow,TweenInfo.new(.9,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{Size=UDim2.new(0,68,0,68),Position=UDim2.new(.5,-34,.5,-34),BackgroundTransparency=.8}):Play()
task.wait(.9)
end end)
local MW,MH=300,382
local M=I("Frame",{Size=UDim2.new(0,MW,0,MH),BackgroundColor3=BG,BackgroundTransparency=.06,BorderSizePixel=0,Visible=false,Active=true,ZIndex=200},sg)
I("UICorner",{CornerRadius=UDim.new(0,14)},M)
local mS=I("UIStroke",{Color=AC,Thickness=1.4,Transparency=.2},M)
local glowRing=I("Frame",{Size=UDim2.new(1,14,1,14),Position=UDim2.new(0,-7,0,-7),BackgroundColor3=AC,BackgroundTransparency=.94,BorderSizePixel=0,ZIndex=199},M)
I("UICorner",{CornerRadius=UDim.new(0,18)},glowRing)
local scanLine=I("Frame",{Size=UDim2.new(0,70,0,2),Position=UDim2.new(0,-70,0,0),BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=.15,BorderSizePixel=0,ZIndex=210},M)
I("UICorner",{CornerRadius=UDim.new(1,0)},scanLine)
task.spawn(function()while true do
local w=M.AbsoluteSize.X
scanLine.Position=UDim2.new(0,-70,0,0)
TS:Create(scanLine,TweenInfo.new(1.4,Enum.EasingStyle.Linear),{Position=UDim2.new(0,w,0,0)}):Play()
task.wait(1.4)
end end)
local function bracket(x,y,ax,ay)
local b=I("Frame",{Size=UDim2.new(0,14,0,14),Position=UDim2.new(x,y),AnchorPoint=Vector2.new(ax,ay),BackgroundTransparency=1,ZIndex=205},M)
local h=I("Frame",{Size=UDim2.new(0,14,0,2),BackgroundColor3=AC,BorderSizePixel=0,ZIndex=206},b)
local v=I("Frame",{Size=UDim2.new(0,2,0,14),BackgroundColor3=AC,BorderSizePixel=0,ZIndex=206},b)
I("UICorner",{CornerRadius=UDim.new(0,2)},h)
I("UICorner",{CornerRadius=UDim.new(0,2)},v)
end
bracket(0,0,0,0)bracket(1,0,1,0)bracket(0,1,0,1)bracket(1,1,1,1)
local HD=I("TextButton",{Size=UDim2.new(1,0,0,72),BackgroundTransparency=1,Text="",BorderSizePixel=0,AutoButtonColor=false,ZIndex=201},M)
local logo=I("Frame",{Size=UDim2.new(0,36,0,36),Position=UDim2.new(0,18,0,18),BackgroundColor3=AC,BackgroundTransparency=.15,BorderSizePixel=0,ZIndex=203},M)
I("UICorner",{CornerRadius=UDim.new(0,9)},logo)
local logoS=I("UIStroke",{Color=AC,Thickness=1.5,Transparency=0},logo)
I("TextLabel",{Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,Text="E",TextColor3=Color3.fromRGB(255,255,255),TextSize=18,Font=Enum.Font.GothamBlack,ZIndex=204},logo)
local hdr=I("TextLabel",{Size=UDim2.new(1,-110,0,20),Position=UDim2.new(0,64,0,18),BackgroundTransparency=1,RichText=true,Text='<i>minhduc///</i>',TextColor3=AC,TextSize=20,Font=Enum.Font.GothamBlack,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=202},M)
I("TextLabel",{Size=UDim2.new(1,-110,0,12),Position=UDim2.new(0,64,0,40),BackgroundTransparency=1,Text="PREMIUM PVP SUITE",TextColor3=Color3.fromRGB(130,145,165),TextSize=9,Font=Enum.Font.GothamBold,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=202},M)
local statusDot=I("Frame",{Size=UDim2.new(0,8,0,8),Position=UDim2.new(1,-40,0,24),BackgroundColor3=Color3.fromRGB(80,255,120),BorderSizePixel=0,ZIndex=203},M)
I("UICorner",{CornerRadius=UDim.new(1,0)},statusDot)
task.spawn(function()while true do
TS:Create(statusDot,TweenInfo.new(.55),{BackgroundTransparency=.7}):Play()task.wait(.55)
TS:Create(statusDot,TweenInfo.new(.55),{BackgroundTransparency=0}):Play()task.wait(.55)
end end)
local vTag=I("TextLabel",{Size=UDim2.new(0,42,0,16),Position=UDim2.new(1,-50,0,42),BackgroundColor3=AC,BackgroundTransparency=.25,Text="v2.0",TextColor3=Color3.fromRGB(255,255,255),TextSize=9,Font=Enum.Font.GothamBlack,TextXAlignment=Enum.TextXAlignment.Center,BorderSizePixel=0,ZIndex=203},M)
I("UICorner",{CornerRadius=UDim.new(0,4)},vTag)
I("UIStroke",{Color=AC,Thickness=1,Transparency=.2},vTag)
local div=I("Frame",{Size=UDim2.new(1,-24,0,1),Position=UDim2.new(0,12,0,72),BackgroundColor3=AC,BackgroundTransparency=.5,BorderSizePixel=0,ZIndex=204},M)
DG(M,HD)
MB.MouseButton1Click:Connect(function()
M.Visible=not M.Visible
TS:Create(blur,TweenInfo.new(.2),{Size=M.Visible and 16 or 0}):Play()
if M.Visible then
local ap=MB.AbsolutePosition
local as=MB.AbsoluteSize
M.Position=UDim2.fromOffset(ap.X+as.X/2-MW/2,ap.Y+as.Y+14)
end
end)local function TGL(y,txt,init,cb)
local row=I("TextButton",{Size=UDim2.new(1,-20,0,42),Position=UDim2.new(0,10,0,y),BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=.95,Text="",BorderSizePixel=0,AutoButtonColor=false,ZIndex=202},M)
I("UICorner",{CornerRadius=UDim.new(0,10)},row)
local rs=I("UIStroke",{Color=Color3.fromRGB(60,72,95),Thickness=1,Transparency=.55},row)
local accent=I("Frame",{Size=UDim2.new(0,3,0,20),Position=UDim2.new(0,10,.5,-10),BackgroundColor3=init and AC or Color3.fromRGB(40,50,70),BorderSizePixel=0,ZIndex=203},row)
I("UICorner",{CornerRadius=UDim.new(1,0)},accent)
local lbl=I("TextLabel",{Size=UDim2.new(1,-100,1,0),Position=UDim2.new(0,22,0,0),BackgroundTransparency=1,Text=txt,TextColor3=init and Color3.fromRGB(240,248,255) or Color3.fromRGB(150,160,180),TextSize=13,Font=Enum.Font.GothamBold,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=203},row)
local track=I("Frame",{Size=UDim2.new(0,42,0,22),Position=UDim2.new(1,-54,.5,-11),BackgroundColor3=init and AC or Color3.fromRGB(35,42,58),BorderSizePixel=0,ZIndex=204},row)
I("UICorner",{CornerRadius=UDim.new(1,0)},track)
local trackS=I("UIStroke",{Color=init and AC or Color3.fromRGB(60,72,95),Thickness=1,Transparency=init and 0 or .35},track)
local knob=I("Frame",{Size=UDim2.new(0,18,0,18),Position=init and UDim2.new(1,-20,.5,-9) or UDim2.new(0,2,.5,-9),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,ZIndex=205},track)
I("UICorner",{CornerRadius=UDim.new(1,0)},knob)
I("UIStroke",{Color=Color3.fromRGB(0,0,0),Thickness=1,Transparency=.75},knob)
row.MouseEnter:Connect(function()
TS:Create(row,TweenInfo.new(.15),{BackgroundTransparency=.88}):Play()
TS:Create(rs,TweenInfo.new(.15),{Color=AC,Transparency=.4}):Play()
end)
row.MouseLeave:Connect(function()
TS:Create(row,TweenInfo.new(.15),{BackgroundTransparency=.95}):Play()
TS:Create(rs,TweenInfo.new(.15),{Color=Color3.fromRGB(60,72,95),Transparency=.55}):Play()
end)
local on=init
row.MouseButton1Click:Connect(function()
on=not on
TS:Create(knob,TweenInfo.new(.22,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Position=on and UDim2.new(1,-20,.5,-9) or UDim2.new(0,2,.5,-9)}):Play()
TS:Create(track,TweenInfo.new(.22),{BackgroundColor3=on and AC or Color3.fromRGB(35,42,58)}):Play()
TS:Create(trackS,TweenInfo.new(.22),{Color=on and AC or Color3.fromRGB(60,72,95),Transparency=on and 0 or .35}):Play()
TS:Create(accent,TweenInfo.new(.22),{BackgroundColor3=on and AC or Color3.fromRGB(40,50,70)}):Play()
TS:Create(lbl,TweenInfo.new(.22),{TextColor3=on and Color3.fromRGB(240,248,255) or Color3.fromRGB(150,160,180)}):Play()
cb(on)
end)
end
TGL(82,"ESP",ON,function(v)ON=v if ON then MB.TextColor3=AC for _,p in ipairs(P:GetPlayers())do CE(p)end else MB.TextColor3=Color3.fromRGB(140,140,150)CA()end end)
TGL(130,"CHAMS",CH,function(v)CH=v RC()end)
TGL(178,"BOX",BX,function(v)BX=v if not BX then for _,d in pairs(D)do d.bx.Visible=false end end end)
TGL(226,"TEAM",TP,function(v)TP=v end)
I("Frame",{Size=UDim2.new(1,-24,0,1),Position=UDim2.new(0,12,0,282),BackgroundColor3=AC,BackgroundTransparency=.5,BorderSizePixel=0,ZIndex=204},M)
I("TextLabel",{Size=UDim2.new(1,-24,0,14),Position=UDim2.new(0,20,0,292),BackgroundTransparency=1,Text="▰ THEME ▰",TextColor3=AC,TextSize=10,Font=Enum.Font.GothamBlack,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=202},M)
local tBtns={}
local function mkTB(x,idx)
local t=Themes[idx]
local b=I("TextButton",{Size=UDim2.new(0,34,0,34),Position=UDim2.new(0,x,0,314),BackgroundColor3=t.ac,BorderSizePixel=0,Text="",AutoButtonColor=false,ZIndex=203},M)
I("UICorner",{CornerRadius=UDim.new(1,0)},b)
local ring=I("Frame",{Size=UDim2.new(1,4,1,4),Position=UDim2.new(0,-2,0,-2),BackgroundTransparency=1,ZIndex=202},b)
I("UICorner",{CornerRadius=UDim.new(1,0)},ring)
local ringS=I("UIStroke",{Color=t.ac,Thickness=2,Transparency=idx==TI and 0 or 1},ring)
local glow=I("Frame",{Size=UDim2.new(1,8,1,8),Position=UDim2.new(0,-4,0,-4),BackgroundColor3=t.ac,BackgroundTransparency=idx==TI and .75 or 1,BorderSizePixel=0,ZIndex=201},b)
I("UICorner",{CornerRadius=UDim.new(1,0)},glow)
local tick=I("Frame",{Size=UDim2.new(0,6,0,6),Position=UDim2.new(.5,-3,.5,-3),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,Visible=idx==TI,ZIndex=204},b)
I("UICorner",{CornerRadius=UDim.new(1,0)},tick)
b.MouseEnter:Connect(function()if TI~=idx then TS:Create(ringS,TweenInfo.new(.15),{Transparency=0}):Play()end end)
b.MouseLeave:Connect(function()if TI~=idx then TS:Create(ringS,TweenInfo.new(.15),{Transparency=1}):Play()end end)
b.MouseButton1Click:Connect(function()
TI=idx
AC=Themes[idx].ac
BG=Themes[idx].bg
M.BackgroundColor3=BG
mS.Color=AC
mbS.Color=AC
MB.TextColor3=AC
hdr.TextColor3=AC
div.BackgroundColor3=AC
vTag.BackgroundColor3=AC
fabGlow.BackgroundColor3=AC
scanLine.BackgroundColor3=AC
glowRing.BackgroundColor3=AC
fabRingS.Color=AC
logoS.Color=AC
logo.BackgroundColor3=AC
for _,bb in ipairs(tBtns)do
TS:Create(bb.s,TweenInfo.new(.2),{Transparency=1}):Play()
TS:Create(bb.glow,TweenInfo.new(.2),{BackgroundTransparency=1}):Play()
bb.tick.Visible=false
end
TS:Create(ringS,TweenInfo.new(.2),{Transparency=0}):Play()
TS:Create(glow,TweenInfo.new(.2),{BackgroundTransparency=.75}):Play()
tick.Visible=true
end)
tBtns[idx]={btn=b,s=ringS,tick=tick,glow=glow}
end
mkTB(20,1)mkTB(64,2)mkTB(108,3)mkTB(152,4)mkTB(196,5)mkTB(240,6)
print("[ESP] PREMIUM UI v2 LOADED")