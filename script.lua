local P,R,U,TS=game:GetService("Players"),game:GetService("RunService"),game:GetService("UserInputService"),game:GetService("TweenService")
local L=game:GetService("Lighting")
local pl,pg=P.LocalPlayer,P.LocalPlayer:WaitForChild("PlayerGui")
local cam=workspace.CurrentCamera
for _,g in ipairs(pg:GetChildren())do if g.Name=="ESP_PvP"then g:Destroy()end end
for _,f in ipairs(workspace:GetChildren())do if f.Name=="ESP_PvPFolder"then f:Destroy()end end
for _,b in ipairs(L:GetChildren())do if b:IsA("BlurEffect")and b.Name=="ESPBlur"then b:Destroy()end end
local blur=I("BlurEffect",{Name="ESPBlur",Size=0},L)
local sg=I("ScreenGui",{Name="ESP_PvP",ResetOnSpawn=false,IgnoreGuiInset=false,DisplayOrder=999,ZIndexBehavior=Enum.ZIndexBehavior.Sibling},pg)
local fd=I("Folder",{Name="ESP_PvPFolder"},workspace)
local HR,LR,OFF=1000,1000,25
local H1,H2,H3=Color3.fromRGB(80,230,120),Color3.fromRGB(250,200,70),Color3.fromRGB(240,70,70)
local SK=Color3.fromRGB(0,0,0)
local CP,CM=Color3.fromRGB(255,40,40),Color3.fromRGB(40,120,255)
-- Themes
local Themes={
    {name="Cyan",ac=Color3.fromRGB(0,200,255),bg=Color3.fromRGB(8,14,22)},
    {name="Red",ac=Color3.fromRGB(255,60,80),bg=Color3.fromRGB(22,8,12)},
    {name="Purple",ac=Color3.fromRGB(180,80,255),bg=Color3.fromRGB(16,8,22)},
    {name="Green",ac=Color3.fromRGB(60,230,120),bg=Color3.fromRGB(8,22,14)},
    {name="Gold",ac=Color3.fromRGB(255,200,60),bg=Color3.fromRGB(22,18,8)},
}
local TI=1
local AC=Themes[TI].ac
local BG=Themes[TI].bg
local ON,CH,BX,TP=true,true,true,true
local D,CC={},{}
local function I(c,p,par)local i=Instance.new(c)for k,v in pairs(p)do i[k]=v end i.Parent=par return i end
local function DG(f,h)local d,ds,sp
h.InputBegan:Connect(function(i)if i.UserInputType.Name:find("MouseButton1")or i.UserInputType.Name:find("Touch")then d=true;ds=i.Position;sp=f.Position end end)
U.InputChanged:Connect(function(i)if d and(i.UserInputType.Name:find("MouseMovement")or i.UserInputType.Name:find("Touch"))then local v=i.Position-ds;f.Position=UDim2.new(sp.X.Scale,sp.X.Offset+v.X,sp.Y.Scale,sp.Y.Offset+v.Y)end end)
U.InputEnded:Connect(function(i)if i.UserInputType.Name:find("MouseButton1")or i.UserInputType.Name:find("Touch")then d=false end end)end
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
-- FAB
local MB=I("TextButton",{Size=UDim2.new(0,64,0,64),Position=UDim2.new(.5,-32,.5,-32),BackgroundColor3=Color3.fromRGB(20,25,35),BackgroundTransparency=.15,Text="ESP",TextColor3=AC,TextSize=15,Font=Enum.Font.GothamBlack,BorderSizePixel=0,AutoButtonColor=false},sg)
I("UICorner",{CornerRadius=UDim.new(0,16)},MB)
local mbStroke=I("UIStroke",{Color=AC,Thickness=1.5,Transparency=.3},MB)
DG(MB,MB)
-- Menu
local M=I("Frame",{Size=UDim2.new(0,220,0,250),BackgroundColor3=BG,BackgroundTransparency=.35,BorderSizePixel=0,Visible=false,Active=true},sg)
I("UICorner",{CornerRadius=UDim.new(0,14)},M)
local mStroke=I("UIStroke",{Color=AC,Thickness=1.5,Transparency=.35},M)
-- Top bar accent
local bar=I("Frame",{Size=UDim2.new(1,0,0,2),Position=UDim2.new(0,0,0,0),BackgroundColor3=AC,BorderSizePixel=0},M)
I("UICorner",{CornerRadius=UDim.new(0,14)},bar)
-- Header
local HD=I("TextButton",{Size=UDim2.new(1,0,0,42),BackgroundTransparency=1,Text="",BorderSizePixel=0,AutoButtonColor=false},M)
-- minhduc/// italic
I("TextLabel",{Size=UDim2.new(1,-16,0,18),Position=UDim2.new(0,12,0,6),BackgroundTransparency=1,Text="minhduc///",TextColor3=AC,TextSize=16,Font=Enum.Font.GothamBlack,TextXAlignment=Enum.TextXAlignment.Left,TextStrokeTransparency=.4,TextStrokeColor3=Color3.fromRGB(0,0,0)},"__italic__")
-- Fix: TextLabel không có Italic trực tiếp. Dùng trick: dùng font nghiêng thủ công qua Rotation hoặc dùng RichText <i>
local hdr=I("TextLabel",{Size=UDim2.new(1,-16,0,18),Position=UDim2.new(0,12,0,6),BackgroundTransparency=1,RichText=true,Text='<i>minhduc///</i>',TextColor3=AC,TextSize=16,Font=Enum.Font.GothamBlack,TextXAlignment=Enum.TextXAlignment.Left,TextStrokeTransparency=.4,TextStrokeColor3=Color3.fromRGB(0,0,0)},M)
local sub=I("TextLabel",{Size=UDim2.new(1,-16,0,14),Position=UDim2.new(0,12,0,24),BackgroundTransparency=1,Text="ESP PVP SYSTEM v2.0",TextColor3=Color3.fromRGB(140,150,170),TextSize=9,Font=Enum.Font.GothamBold,TextXAlignment=Enum.TextXAlignment.Left},M)
-- Divider
local div=I("Frame",{Size=UDim2.new(1,-16,0,1),Position=UDim2.new(0,8,0,44),BackgroundColor3=AC,BackgroundTransparency=.7,BorderSizePixel=0},M)
DG(M,HD)
MB.MouseButton1Click:Connect(function()
M.Visible=not M.Visible
TS:Create(blur,TweenInfo.new(.2),{Size=M.Visible and 14 or 0}):Play()
if M.Visible then
local ap=MB.AbsolutePosition
local as=MB.AbsoluteSize
M.Position=UDim2.fromOffset(ap.X+as.X/2-110,ap.Y+as.Y+10)
end
end)
-- Toggle function mới
local function TGL(y,txt,init,cb)
local row=I("TextButton",{Size=UDim2.new(1,-20,0,32),Position=UDim2.new(0,10,0,y),BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=.94,Text="",BorderSizePixel=0,AutoButtonColor=false},M)
I("UICorner",{CornerRadius=UDim.new(0,8)},row)
local rs=I("UIStroke",{Color=AC,Thickness=1,Transparency=.7},row)
local lbl=I("TextLabel",{Size=UDim2.new(1,-70,1,0),Position=UDim2.new(0,12,0,0),BackgroundTransparency=1,Text=txt,TextColor3=Color3.fromRGB(240,245,255),TextSize=12,Font=Enum.Font.GothamBold,TextXAlignment=Enum.TextXAlignment.Left},row)
-- Track
local trk=I("Frame",{Size=UDim2.new(0,46,0,22),Position=UDim2.new(1,-54,.5,-11),BackgroundColor3=init and AC or Color3.fromRGB(45,55,70),BorderSizePixel=0},row)
I("UICorner",{CornerRadius=UDim.new(1,0)},trk)
local trs=I("UIStroke",{Color=init and AC or Color3.fromRGB(70,80,100),Thickness=1,Transparency=.2},trk)
-- Glow khi bật (dùng inner highlight)
local glow=I("Frame",{Size=UDim2.new(0,46,0,22),Position=UDim2.new(0,0,0,0),BackgroundColor3=AC,BackgroundTransparency=init and .7 or 1,BorderSizePixel=0,ZIndex=trk.ZIndex-1},row)
I("UICorner",{CornerRadius=UDim.new(1,0)},glow)
TS:Create(glow,TweenInfo.new(.15),{Size=UDim2.new(0,54,0,30),Position=UDim2.new(1,-58,.5,-15)}):Play()
-- Knob
local knb=I("Frame",{Size=UDim2.new(0,18,0,18),Position=init and UDim2.new(1,-21,.5,-9) or UDim2.new(0,3,.5,-9),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0},trk)
I("UICorner",{CornerRadius=UDim.new(1,0)},knb)
local ksh=I("UIStroke",{Color=Color3.fromRGB(200,210,230),Thickness=1,Transparency=.5},knb)
-- Check icon
local chk=I("TextLabel",{Size=UDim2.new(0,12,0,12),Position=UDim2.new(1,-19,.5,-6),BackgroundTransparency=1,Text="✓",TextColor3=Color3.fromRGB(255,255,255),TextSize=10,Font=Enum.Font.GothamBlack,TextTransparency=init and 0 or 1},trk)
local on=init
row.MouseButton1Click:Connect(function()
on=not on
TS:Create(trk,TweenInfo.new(.15),{BackgroundColor3=on and AC or Color3.fromRGB(45,55,70)}):Play()
TS:Create(trs,TweenInfo.new(.15),{Color=on and AC or Color3.fromRGB(70,80,100)}):Play()
TS:Create(knb,TweenInfo.new(.15),{Position=on and UDim2.new(1,-21,.5,-9) or UDim2.new(0,3,.5,-9)}):Play()
TS:Create(chk,TweenInfo.new(.15),{TextTransparency=on and 0 or 1}):Play()
TS:Create(glow,TweenInfo.new(.15),{BackgroundTransparency=on and .7 or 1}):Play()
cb(on)
end)
end
TGL(52,"ESP",ON,function(v)
ON=v
if ON then MB.TextColor3=AC for _,p in ipairs(P:GetPlayers())do CE(p)end
else MB.TextColor3=Color3.fromRGB(150,150,160)CA()end end)
TGL(88,"Chams",CH,function(v)CH=v RC()end)
TGL(124,"Box",BX,function(v)BX=v if not BX then for _,d in pairs(D)do d.bx.Visible=false end end end)
TGL(160,"Team",TP,function(v)TP=v end)
-- Divider 2
I("Frame",{Size=UDim2.new(1,-16,0,1),Position=UDim2.new(0,8,0,196),BackgroundColor3=AC,BackgroundTransparency=.7,BorderSizePixel=0},M)
-- Theme label
I("TextLabel",{Size=UDim2.new(1,-20,0,14),Position=UDim2.new(0,12,0,200),BackgroundTransparency=1,Text="THEME",TextColor3=AC,TextSize=10,Font=Enum.Font.GothamBold,TextXAlignment=Enum.TextXAlignment.Left},M)
-- Theme buttons
local tBtns={}
local function mkTB(x,idx)
local t=Themes[idx]
local b=I("TextButton",{Size=UDim2.new(0,36,0,24),Position=UDim2.new(0,x,0,216),BackgroundColor3=t.ac,BackgroundTransparency=0,BorderSizePixel=0,Text="",AutoButtonColor=false},M)
I("UICorner",{CornerRadius=UDim.new(0,6)},b)
local s=I("UIStroke",{Color=idx==TI and Color3.fromRGB(255,255,255) or Color3.fromRGB(80,90,110),Thickness=idx==TI and 2 or 1,Transparency=idx==TI and 0 or .5},b)
b.MouseButton1Click:Connect(function()
TI=idx
AC=Themes[idx].ac
BG=Themes[idx].bg
M.BackgroundColor3=BG
mStroke.Color=AC
mbStroke.Color=AC
MB.TextColor3=AC
bar.BackgroundColor3=AC
hdr.TextColor3=AC
div.BackgroundColor3=AC
for _,bb in ipairs(tBtns)do
bb.s.Color=Color3.fromRGB(80,90,110)
bb.s.Thickness=1
bb.s.Transparency=.5
end
s.Color=Color3.fromRGB(255,255,255)
s.Thickness=2
s.Transparency=0
end)
tBtns[idx]={btn=b,s=s}
end
mkTB(12,1)
mkTB(52,2)
mkTB(92,3)
mkTB(132,4)
mkTB(172,5)
print("[ESP] OK - theme + toggle mới")