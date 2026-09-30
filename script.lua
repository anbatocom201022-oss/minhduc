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
{ac=Color3.fromRGB(0,220,255),bg=Color3.fromRGB(4,10,16)},
{ac=Color3.fromRGB(255,40,70),bg=Color3.fromRGB(16,4,8)},
{ac=Color3.fromRGB(180,70,255),bg=Color3.fromRGB(12,4,20)},
{ac=Color3.fromRGB(50,255,100),bg=Color3.fromRGB(4,18,8)},
{ac=Color3.fromRGB(255,190,40),bg=Color3.fromRGB(18,12,4)},
{ac=Color3.fromRGB(200,10,30),bg=Color3.fromRGB(14,2,3)},
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
I("TextLabel",{Size=UDim2.new(1,0,0,11),BackgroundTransparency=1,Text=p.Name,TextColor3=Color3.fromRGB(255,255,255),TextSize=11,Font=Enum.Font.GothamBold,TextXAlignment=Enum.TextXAlignment.Center,TextStrokeTransparency=0,TextStrokeColor3=SK},ct)
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
local function DB(bx,ch)
local hr=ch:FindFirstChild("HumanoidRootPart")
if not hr then bx.Visible=false return end
local hu=ch:FindFirstChildOfClass("Humanoid")
if not hu then bx.Visible=false return end
local hh=hu.HipHeight
if hh==0 then hh=2 end
local h=(hh+0.5)*2
local w=2.2
local d=2.2
local mX,MX,mY,MY=math.huge,-math.huge,math.huge,-math.huge
local v=false
for _,sx in ipairs({-1,1})do for _,sy in ipairs({-1,1})do for _,sz in ipairs({-1,1})do
local wp=(hr.CFrame*CFrame.new(sx*w/2,sy*h/2,sz*d/2)).Position
local sp,os=cam:WorldToScreenPoint(wp)
if os and sp.Z>0 then v=true
if sp.X<mX then mX=sp.X end
if sp.X>MX then MX=sp.X end
if sp.Y<mY then mY=sp.Y end
if sp.Y>MY then MY=sp.Y end
end
end end end
if not v then bx.Visible=false return end
bx.Position=UDim2.new(0,mX,0,mY)
bx.Size=UDim2.new(0,MX-mX,0,MY-mY)
bx.Visible=true
end
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
end end end)local SPD,JPW=false,false
local SPD_VAL,JPW_VAL=16,50
-- FAB glass
local fabOuter=I("Frame",{Size=UDim2.new(0,64,0,64),Position=UDim2.new(.5,-32,.5,-32),BackgroundTransparency=1,ZIndex=100},sg)
local fabGlow=I("Frame",{Size=UDim2.new(1,8,1,8),Position=UDim2.new(0,-4,0,-4),BackgroundColor3=AC,BackgroundTransparency=.9,BorderSizePixel=0,ZIndex=99},fabOuter)
I("UICorner",{CornerRadius=UDim.new(1,0)},fabGlow)
local MB=I("TextButton",{Size=UDim2.new(1,0,1,0),BackgroundColor3=BG,BackgroundTransparency=.25,Text="ESP",TextColor3=AC,TextSize=13,Font=Enum.Font.Michroma,BorderSizePixel=0,AutoButtonColor=false,ZIndex=101},fabOuter)
I("UICorner",{CornerRadius=UDim.new(1,0)},MB)
local mbS=I("UIStroke",{Color=Color3.fromRGB(255,255,255),Thickness=1.5,Transparency=.45},MB)
local mbHL=I("Frame",{Size=UDim2.new(1,-16,0,1),Position=UDim2.new(0,8,0,3),BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=.35,BorderSizePixel=0,ZIndex=102},MB)
I("UIGradient",{Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(.5,.3),NumberSequenceKeypoint.new(1,1)})},mbHL)
DG(MB,MB)
-- Menu glass
local MW,MH=520,340
local M=I("Frame",{Size=UDim2.new(0,MW,0,MH),Position=UDim2.new(.5,0,.5,0),AnchorPoint=Vector2.new(.5,.5),BackgroundColor3=BG,BackgroundTransparency=.28,BorderSizePixel=0,Visible=false,Active=true,ZIndex=200},sg)
I("UICorner",{CornerRadius=UDim.new(0,22)},M)
local outerGlow=I("Frame",{Size=UDim2.new(1,22,1,22),Position=UDim2.new(0,-11,0,-11),BackgroundColor3=AC,BackgroundTransparency=.93,BorderSizePixel=0,ZIndex=199},M)
I("UICorner",{CornerRadius=UDim.new(0,28)},outerGlow)
local mS=I("UIStroke",{Color=Color3.fromRGB(255,255,255),Thickness=1.5,Transparency=.5},M)
local topHL=I("Frame",{Size=UDim2.new(1,-24,0,2),Position=UDim2.new(0,12,0,1),BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=.4,BorderSizePixel=0,ZIndex=210},M)
I("UIGradient",{Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(.15,.4),NumberSequenceKeypoint.new(.85,.4),NumberSequenceKeypoint.new(1,1)})},topHL)
local botHL=I("Frame",{Size=UDim2.new(1,-24,0,1),Position=UDim2.new(0,12,1,-1),BackgroundColor3=Color3.fromRGB(0,0,0),BackgroundTransparency=.7,BorderSizePixel=0,ZIndex=210},M)
I("UIGradient",{Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(.5,.7),NumberSequenceKeypoint.new(1,1)})},botHL)
-- Header
local HD=I("TextButton",{Size=UDim2.new(1,0,0,38),BackgroundTransparency=1,Text="",BorderSizePixel=0,AutoButtonColor=false,ZIndex=201},M)
local hdr=I("TextLabel",{Size=UDim2.new(1,-50,1,0),Position=UDim2.new(0,16,0,0),BackgroundTransparency=1,Text='MINHDUC',TextColor3=AC,TextSize=13,Font=Enum.Font.Michroma,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=202},HD)
local closeBtn=I("TextButton",{Size=UDim2.new(0,24,0,24),Position=UDim2.new(1,-36,.5,-12),BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=.85,Text="✕",TextColor3=Color3.fromRGB(255,200,200),TextSize=12,Font=Enum.Font.GothamBold,BorderSizePixel=0,AutoButtonColor=false,ZIndex=203},HD)
I("UICorner",{CornerRadius=UDim.new(1,0)},closeBtn)
local cbS=I("UIStroke",{Color=Color3.fromRGB(255,255,255),Thickness=1,Transparency=.6},closeBtn)
DG(M,HD)
local divTop=I("Frame",{Size=UDim2.new(1,-32,0,1),Position=UDim2.new(0,16,0,38),BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=.82,BorderSizePixel=0,ZIndex=205},M)
-- 2 columns
local CTL=I("Frame",{Size=UDim2.new(0,240,0,280),Position=UDim2.new(0,12,0,46),BackgroundTransparency=1,ZIndex=202},M)
local CTR=I("Frame",{Size=UDim2.new(0,240,0,280),Position=UDim2.new(0,268,0,46),BackgroundTransparency=1,ZIndex=202},M)
local vDiv=I("Frame",{Size=UDim2.new(0,1,0,280),Position=UDim2.new(0,260,0,46),BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=.88,BorderSizePixel=0,ZIndex=205},M)
local FB=Enum.Font.GothamBold
local FM=Enum.Font.Michroma
-- Glass toggle
local function TGL2(parent,y,txt,init,cb)
local row=I("TextButton",{Size=UDim2.new(1,0,0,36),Position=UDim2.new(0,0,0,y),BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=.9,Text="",BorderSizePixel=0,AutoButtonColor=false,ZIndex=203},parent)
I("UICorner",{CornerRadius=UDim.new(0,12)},row)
local rs=I("UIStroke",{Color=Color3.fromRGB(255,255,255),Thickness=1,Transparency=.65},row)
local rHL=I("Frame",{Size=UDim2.new(1,-16,0,1),Position=UDim2.new(0,8,0,1),BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=.55,BorderSizePixel=0,ZIndex=205},row)
I("UIGradient",{Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(.5,.55),NumberSequenceKeypoint.new(1,1)})},rHL)
I("TextLabel",{Size=UDim2.new(1,-72,1,0),Position=UDim2.new(0,14,0,0),BackgroundTransparency=1,Text=txt,TextColor3=Color3.fromRGB(255,255,255),TextSize=10,Font=FM,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=204},row)
local track=I("Frame",{Size=UDim2.new(0,44,0,22),Position=UDim2.new(1,-56,.5,-11),BackgroundColor3=init and AC or Color3.fromRGB(30,36,48),BackgroundTransparency=init and .15 or .45,BorderSizePixel=0,ZIndex=204},row)
I("UICorner",{CornerRadius=UDim.new(1,0)},track)
local trackS=I("UIStroke",{Color=Color3.fromRGB(255,255,255),Thickness=1,Transparency=init and .4 or .65},track)
local knob=I("Frame",{Size=UDim2.new(0,18,0,18),Position=init and UDim2.new(1,-20,.5,-9) or UDim2.new(0,2,.5,-9),BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=.1,BorderSizePixel=0,ZIndex=205},track)
I("UICorner",{CornerRadius=UDim.new(1,0)},knob)
I("UIStroke",{Color=Color3.fromRGB(255,255,255),Thickness=1,Transparency=.2},knob)
I("TextLabel",{Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,Text="💀",TextSize=12,Font=FB,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,ZIndex=206},knob)
row.MouseEnter:Connect(function()TS:Create(row,TweenInfo.new(.12),{BackgroundTransparency=.82}):Play()TS:Create(rs,TweenInfo.new(.12),{Transparency=.5}):Play()end)
row.MouseLeave:Connect(function()TS:Create(row,TweenInfo.new(.12),{BackgroundTransparency=.9}):Play()TS:Create(rs,TweenInfo.new(.12),{Transparency=.65}):Play()end)
local on=init
row.MouseButton1Click:Connect(function()
on=not on
TS:Create(knob,TweenInfo.new(.18,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Position=on and UDim2.new(1,-20,.5,-9) or UDim2.new(0,2,.5,-9)}):Play()
TS:Create(track,TweenInfo.new(.18),{BackgroundColor3=on and AC or Color3.fromRGB(30,36,48),BackgroundTransparency=on and .15 or .45}):Play()
TS:Create(trackS,TweenInfo.new(.18),{Transparency=on and .4 or .65}):Play()
cb(on)
end)
end
-- Glass slider
local function SLIDER(parent,y,label,init,min,max,cb)
I("TextLabel",{Size=UDim2.new(.6,0,0,14),Position=UDim2.new(0,2,0,y),BackgroundTransparency=1,Text=label,TextColor3=Color3.fromRGB(210,220,235),TextSize=9,Font=FB,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=204},parent)
local val=I("TextLabel",{Size=UDim2.new(.4,0,0,14),Position=UDim2.new(.6,0,0,y),BackgroundTransparency=1,Text=tostring(init),TextColor3=AC,TextSize=10,Font=FB,TextXAlignment=Enum.TextXAlignment.Right,ZIndex=204},parent)
local track=I("Frame",{Size=UDim2.new(1,0,0,8),Position=UDim2.new(0,0,0,y+20),BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=.88,BorderSizePixel=0,ZIndex=204},parent)
I("UICorner",{CornerRadius=UDim.new(1,0)},track)
I("UIStroke",{Color=Color3.fromRGB(255,255,255),Thickness=1,Transparency=.7},track)
local p0=(init-min)/(max-min)
local fill=I("Frame",{Size=UDim2.new(p0,0,1,0),BackgroundColor3=AC,BorderSizePixel=0,ZIndex=205},track)
I("UICorner",{CornerRadius=UDim.new(1,0)},fill)
I("UIGradient",{Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,.15),NumberSequenceKeypoint.new(1,.35)})},fill)
local knob=I("Frame",{Size=UDim2.new(0,14,0,14),Position=UDim2.new(p0,0,.5,0),AnchorPoint=Vector2.new(.5,.5),BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=.05,BorderSizePixel=0,ZIndex=206},track)
I("UICorner",{CornerRadius=UDim.new(1,0)},knob)
I("UIStroke",{Color=Color3.fromRGB(255,255,255),Thickness=1,Transparency=.15},knob)
local hit=I("TextButton",{Size=UDim2.new(1,0,0,22),Position=UDim2.new(0,0,0,y+12),BackgroundTransparency=1,Text="",AutoButtonColor=false,ZIndex=207},parent)
local drag=false
local function upd()
local mx=U:GetMouseLocation().X
local ap=track.AbsolutePosition.X
local aw=track.AbsoluteSize.X
if aw<1 then return end
local v=math.clamp((mx-ap)/aw,0,1)
local real=math.floor(min+(max-min)*v+.5)
fill.Size=UDim2.new(v,0,1,0)
knob.Position=UDim2.new(v,0,.5,0)
val.Text=tostring(real)
cb(real)
end
hit.InputBegan:Connect(function(i)if i.UserInputType.Name=="MouseButton1"or i.UserInputType.Name=="Touch"then drag=true upd()end end)
U.InputChanged:Connect(function(i)if drag and(i.UserInputType.Name=="MouseMovement"or i.UserInputType.Name=="Touch")then upd()end end)
U.InputEnded:Connect(function(i)if i.UserInputType.Name=="MouseButton1"or i.UserInputType.Name=="Touch"then drag=false end end)
return val,fill
end
TGL2(CTL,0,"ESP",ON,function(v)ON=v if ON then MB.TextColor3=AC for _,p in ipairs(P:GetPlayers())do CE(p)end else MB.TextColor3=Color3.fromRGB(140,140,150)CA()end end)
TGL2(CTL,42,"CHAMS",CH,function(v)CH=v RC()end)
TGL2(CTL,84,"BOX",BX,function(v)BX=v if not BX then for _,d in pairs(D)do d.bx.Visible=false end end end)
TGL2(CTL,126,"TEAM",TP,function(v)TP=v end)
local divTL=I("Frame",{Size=UDim2.new(1,0,0,1),Position=UDim2.new(0,0,0,174),BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=.85,BorderSizePixel=0,ZIndex=204},CTL)
I("TextLabel",{Size=UDim2.new(1,0,0,12),Position=UDim2.new(0,2,0,180),BackgroundTransparency=1,Text="THEME",TextColor3=Color3.fromRGB(190,200,215),TextSize=9,Font=FB,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=203},CTL)
local tBtns={}
local function mkTB(x,idx)
local t=Themes[idx]
local b=I("TextButton",{Size=UDim2.new(0,32,0,32),Position=UDim2.new(0,x,0,200),BackgroundColor3=t.ac,BackgroundTransparency=.15,BorderSizePixel=0,Text="",AutoButtonColor=false,ZIndex=203},CTL)
I("UICorner",{CornerRadius=UDim.new(0,10)},b)
local s=I("UIStroke",{Color=Color3.fromRGB(255,255,255),Thickness=idx==TI and 2 or 1,Transparency=idx==TI and 0 or .55},b)
local tick=I("TextLabel",{Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,Text="✓",TextColor3=Color3.fromRGB(255,255,255),TextSize=14,Font=FB,Visible=idx==TI,ZIndex=204},b)
b.MouseButton1Click:Connect(function()
TI=idx
AC=Themes[idx].ac
BG=Themes[idx].bg
M.BackgroundColor3=BG
MB.BackgroundColor3=BG
MB.TextColor3=AC
hdr.TextColor3=AC
spdVal.TextColor3=AC
jpwVal.TextColor3=AC
opVal.TextColor3=AC
spdFill.BackgroundColor3=AC
jpwFill.BackgroundColor3=AC
opFill.BackgroundColor3=AC
outerGlow.BackgroundColor3=AC
fabGlow.BackgroundColor3=AC
for _,bb in ipairs(tBtns)do bb.s.Thickness=1 bb.s.Transparency=.55 bb.tick.Visible=false end
s.Thickness=2
s.Transparency=0
tick.Visible=true
end)
tBtns[idx]={btn=b,s=s,tick=tick}
end
mkTB(0,1)mkTB(38,2)mkTB(76,3)mkTB(114,4)mkTB(152,5)mkTB(190,6)
TGL2(CTR,0,"SPEED",SPD,function(v)SPD=v end)
local spdVal,spdFill=SLIDER(CTR,42,"WALK",SPD_VAL,16,300,function(v)SPD_VAL=v end)
TGL2(CTR,84,"JUMP",JPW,function(v)JPW=v end)
local jpwVal,jpwFill=SLIDER(CTR,126,"JUMP",JPW_VAL,50,500,function(v)JPW_VAL=v end)
local divTR=I("Frame",{Size=UDim2.new(1,0,0,1),Position=UDim2.new(0,0,0,174),BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=.85,BorderSizePixel=0,ZIndex=204},CTR)
I("TextLabel",{Size=UDim2.new(1,0,0,12),Position=UDim2.new(0,2,0,180),BackgroundTransparency=1,Text="OPACITY",TextColor3=Color3.fromRGB(190,200,215),TextSize=9,Font=FB,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=203},CTR)
local opVal=I("TextLabel",{Size=UDim2.new(1,0,0,12),Position=UDim2.new(0,2,0,180),BackgroundTransparency=1,Text="100%",TextColor3=AC,TextSize=10,Font=FB,TextXAlignment=Enum.TextXAlignment.Right,ZIndex=203},CTR)
local opTrack=I("Frame",{Size=UDim2.new(1,0,0,8),Position=UDim2.new(0,0,0,200),BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=.88,BorderSizePixel=0,ZIndex=204},CTR)
I("UICorner",{CornerRadius=UDim.new(1,0)},opTrack)
I("UIStroke",{Color=Color3.fromRGB(255,255,255),Thickness=1,Transparency=.7},opTrack)
local opFill=I("Frame",{Size=UDim2.new(1,0,1,0),BackgroundColor3=AC,BorderSizePixel=0,ZIndex=205},opTrack)
I("UICorner",{CornerRadius=UDim.new(1,0)},opFill)
I("UIGradient",{Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,.15),NumberSequenceKeypoint.new(1,.35)})},opFill)
local opKnob=I("Frame",{Size=UDim2.new(0,14,0,14),Position=UDim2.new(1,0,.5,0),AnchorPoint=Vector2.new(.5,.5),BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=.05,BorderSizePixel=0,ZIndex=206},opTrack)
I("UICorner",{CornerRadius=UDim.new(1,0)},opKnob)
I("UIStroke",{Color=Color3.fromRGB(255,255,255),Thickness=1,Transparency=.15},opKnob)
local opHit=I("TextButton",{Size=UDim2.new(1,0,0,22),Position=UDim2.new(0,0,0,192),BackgroundTransparency=1,Text="",AutoButtonColor=false,ZIndex=207},CTR)
local opDrag=false
local function opUpd()
local mx=U:GetMouseLocation().X
local ap=opTrack.AbsolutePosition.X
local aw=opTrack.AbsoluteSize.X
if aw<1 then return end
local v=math.clamp((mx-ap)/aw,0,1)
opFill.Size=UDim2.new(v,0,1,0)
opKnob.Position=UDim2.new(v,0,.5,0)
opVal.Text=math.floor(v*100).."%"
M.BackgroundTransparency=.08+(1-v)*.4
end
opHit.InputBegan:Connect(function(i)if i.UserInputType.Name=="MouseButton1"or i.UserInputType.Name=="Touch"then opDrag=true opUpd()end end)
U.InputChanged:Connect(function(i)if opDrag and(i.UserInputType.Name=="MouseMovement"or i.UserInputType.Name=="Touch")then opUpd()end end)
U.InputEnded:Connect(function(i)if i.UserInputType.Name=="MouseButton1"or i.UserInputType.Name=="Touch"then opDrag=false end end)
local function applyStats()
local ch=pl.Character
if not ch then return end
local hu=ch:FindFirstChildOfClass("Humanoid")
if not hu then return end
if SPD and hu.WalkSpeed~=SPD_VAL then hu.WalkSpeed=SPD_VAL end
if JPW then
if not hu.UseJumpPower then hu.UseJumpPower=true end
if hu.JumpPower~=JPW_VAL then hu.JumpPower=JPW_VAL end
end
end
R.Heartbeat:Connect(applyStats)
local function hookChar(ch)
task.wait(1)
local hu=ch:WaitForChild("Humanoid",5)
if not hu then return end
hu:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
if SPD and hu.WalkSpeed~=SPD_VAL then hu.WalkSpeed=SPD_VAL end
end)
hu:GetPropertyChangedSignal("JumpPower"):Connect(function()
if JPW and hu.JumpPower~=JPW_VAL then hu.JumpPower=JPW_VAL end
end)
hu:GetPropertyChangedSignal("UseJumpPower"):Connect(function()
if JPW and not hu.UseJumpPower then hu.UseJumpPower=true end
end)
end
if pl.Character then hookChar(pl.Character) end
pl.CharacterAdded:Connect(hookChar)
MB.MouseButton1Click:Connect(function()
M.Visible=not M.Visible
TS:Create(blur,TweenInfo.new(.2),{Size=M.Visible and 22 or 0}):Play()
end)
closeBtn.MouseButton1Click:Connect(function()
M.Visible=false
TS:Create(blur,TweenInfo.new(.2),{Size=0}):Play()
end)
print("[ESP] LIQUID GLASS UI LOADED")