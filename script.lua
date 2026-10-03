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
local sg=I("ScreenGui",{Name="ESP_PvP",ResetOnSpawn=false,IgnoreGuiInset=false,DisplayOrder=999,ZIndexBehavior=Enum.ZIndexBehavior.Sibling},pg)
local fd=I("Folder",{Name="ESP_PvPFolder"},workspace)
local HR,LR,OFF=1000,1000,30
local H1,H2,H3=Color3.fromRGB(80,230,120),Color3.fromRGB(250,200,70),Color3.fromRGB(240,70,70)
local SK,CP,CM=Color3.fromRGB(0,0,0),Color3.fromRGB(255,40,40),Color3.fromRGB(40,120,255)
local ON,HL,CH,BX,TP,SKEL,RAINBOW=true,true,true,true,true,false,true
local D,CC={},{}
local SKEL_BONES={
{"Head","UpperTorso"},
{"UpperTorso","LowerTorso"},
{"UpperTorso","LeftUpperArm"},
{"LeftUpperArm","LeftLowerArm"},
{"LeftLowerArm","LeftHand"},
{"UpperTorso","RightUpperArm"},
{"RightUpperArm","RightLowerArm"},
{"RightLowerArm","RightHand"},
{"LowerTorso","LeftUpperLeg"},
{"LeftUpperLeg","LeftLowerLeg"},
{"LeftLowerLeg","LeftFoot"},
{"LowerTorso","RightUpperLeg"},
{"RightUpperLeg","RightLowerLeg"},
{"RightLowerLeg","RightFoot"},
}
local SKEL_BONES_R6={
{"Head","Torso"},
{"Torso","Left Arm"},
{"Torso","Right Arm"},
{"Torso","Left Leg"},
{"Torso","Right Leg"},
}
local function PN(v)if type(v)=="number"then return v end if type(v)=="string"then return tonumber(v:gsub(",",""))or 0 end return 0 end
local function GL(p)local ls=p:FindFirstChild("leaderstats")
if ls then for _,n in ipairs({"Level","Lvl","Lv","level"})do local v=ls:FindFirstChild(n)if v then return PN(v.Value)end end end
for _,fn in ipairs({"Data","Stats","BloxFruits"})do local f=p:FindFirstChild(fn)if f then for _,n in ipairs({"Level","Lvl","Lv"})do local v=f:FindFirstChild(n)if v then return PN(v.Value)end end end end
return 0 end
local function GT(p)
local d=p:FindFirstChild("Data")
if d then
for _,key in ipairs({"Team","team","Faction","faction","Side","side"})do
local t=d:FindFirstChild(key)
if t and type(t.Value)=="string"then
local v=t.Value:lower()
if v:find("pirate")then return "pirate" end
if v:find("marine")then return "marine" end
end
end
end
local pt=p.Team
if pt then
local n=pt.Name:lower()
if n:find("pirate")then return "pirate" end
if n:find("marine")then return "marine" end
end
for _,key in ipairs({"Team","team","Faction"})do
local a=p:GetAttribute(key)
if type(a)=="string"then
local v=a:lower()
if v:find("pirate")then return "pirate" end
if v:find("marine")then return "marine" end
end
end
return "unknown"
end
local function GC(id)if CC[id]then return CC[id]end local c=Color3.fromHSV((id*0.618033988749895)%1,.75,1)CC[id]=c return c end
local function AC2(h,c)h.FillColor=c h.OutlineColor=Color3.fromRGB(255,255,255)h.FillTransparency=CH and .1 or .45 h.OutlineTransparency=0 end
local function CE(p)if p==pl or D[p]then return end
local col=GC(p.UserId)
local h=I("Highlight",{FillColor=col,OutlineColor=Color3.fromRGB(255,255,255),FillTransparency=CH and .1 or .45,OutlineTransparency=0,DepthMode=Enum.HighlightDepthMode.AlwaysOnTop,Enabled=false},fd)
local ln=I("Frame",{BackgroundColor3=col,BackgroundTransparency=0,BorderSizePixel=0,AnchorPoint=Vector2.new(.5,.5),Visible=false,ZIndex=5},sg)
I("UICorner",{CornerRadius=UDim.new(1,0)},ln)
local bx=I("Frame",{BackgroundTransparency=1,BorderSizePixel=0,Visible=false,ZIndex=6},sg)
local bst=I("UIStroke",{Color=col,Thickness=1.5,Transparency=0},bx)
local ct=I("Frame",{Size=UDim2.new(0,140,0,44),AnchorPoint=Vector2.new(.5,1),BackgroundTransparency=1,BorderSizePixel=0,Visible=false,ZIndex=10},sg)
I("TextLabel",{Size=UDim2.new(1,0,0,11),BackgroundTransparency=1,Text=p.Name,TextColor3=Color3.fromRGB(255,255,255),TextSize=11,Font=Enum.Font.GothamBold,TextXAlignment=Enum.TextXAlignment.Center,TextStrokeTransparency=0,TextStrokeColor3=SK},ct)
local tm=I("TextLabel",{Size=UDim2.new(1,0,0,10),Position=UDim2.new(0,0,0,11),BackgroundTransparency=1,Text="",TextColor3=Color3.fromRGB(180,180,190),TextSize=9,Font=Enum.Font.GothamBold,TextXAlignment=Enum.TextXAlignment.Center,TextStrokeTransparency=0,TextStrokeColor3=SK},ct)
local lv=I("TextLabel",{Size=UDim2.new(0,70,0,10),Position=UDim2.new(0,0,0,22),BackgroundTransparency=1,Text="",TextColor3=Color3.fromRGB(255,215,100),TextSize=10,Font=Enum.Font.GothamBold,TextXAlignment=Enum.TextXAlignment.Left,TextStrokeTransparency=0,TextStrokeColor3=SK},ct)
local dl=I("TextLabel",{Size=UDim2.new(0,70,0,10),Position=UDim2.new(1,-70,0,22),BackgroundTransparency=1,Text="",TextColor3=Color3.fromRGB(150,200,255),TextSize=10,Font=Enum.Font.GothamBold,TextXAlignment=Enum.TextXAlignment.Right,TextStrokeTransparency=0,TextStrokeColor3=SK},ct)
local hb=I("Frame",{Size=UDim2.new(1,0,0,3),Position=UDim2.new(0,0,0,33),BackgroundColor3=Color3.fromRGB(0,0,0),BackgroundTransparency=.5,BorderSizePixel=0},ct)
I("UICorner",{CornerRadius=UDim.new(1,0)},hb)
local hf=I("Frame",{Size=UDim2.new(1,0,1,0),BackgroundColor3=H1,BorderSizePixel=0},hb)
I("UICorner",{CornerRadius=UDim.new(1,0)},hf)
local hl=I("TextLabel",{Size=UDim2.new(1,0,0,9),Position=UDim2.new(0,0,0,36),BackgroundTransparency=1,Text="",TextColor3=Color3.fromRGB(230,230,240),TextSize=9,Font=Enum.Font.GothamBold,TextXAlignment=Enum.TextXAlignment.Center,TextStrokeTransparency=0,TextStrokeColor3=SK},ct)
local sk={}
for i=1,14 do
local glow=I("Frame",{BackgroundColor3=col,BackgroundTransparency=.7,BorderSizePixel=0,AnchorPoint=Vector2.new(.5,.5),Visible=false,ZIndex=7},sg)
I("UICorner",{CornerRadius=UDim.new(1,0)},glow)
local f=I("Frame",{BackgroundColor3=col,BackgroundTransparency=0,BorderSizePixel=0,AnchorPoint=Vector2.new(.5,.5),Visible=false,ZIndex=8},sg)
I("UICorner",{CornerRadius=UDim.new(1,0)},f)
sk[i]={f=f,g=glow}
end
D[p]={h=h,ln=ln,bx=bx,bst=bst,ct=ct,hf=hf,lv=lv,dl=dl,hl=hl,tm=tm,sk=sk,c=col,t=GT(p),l=0,ts=0}end
local function RE(p)local d=D[p]if not d then return end d.h:Destroy()d.ln:Destroy()d.bx:Destroy()d.ct:Destroy()for _,o in ipairs(d.sk)do o.f:Destroy()o.g:Destroy()end D[p]=nil end
local function CA()for p in pairs(D)do RE(p)end end
local function RC()for p,d in pairs(D)do AC2(d.h,d.c)d.bst.Color=d.c end end
for _,p in ipairs(P:GetPlayers())do CE(p)end
P.PlayerAdded:Connect(function(p)if ON then CE(p)end end)
P.PlayerRemoving:Connect(RE)
local FT=0
R.Heartbeat:Connect(function(dt)FT=FT+dt end)
local function DL(f,x1,y1,x2,y2)local dx,dy=x2-x1,y2-y1 local L2=math.sqrt(dx*dx+dy*dy)
if L2<1 then f.Visible=false return end
f.Size=UDim2.new(0,L2,0,1)f.Position=UDim2.new(0,(x1+x2)/2,0,(y1+y2)/2)f.Rotation=math.deg(math.atan2(dy,dx))f.Visible=true end
local function drawBone(bone,p1,p2,color)
local s1,o1=cam:WorldToScreenPoint(p1)
local s2,o2=cam:WorldToScreenPoint(p2)
if not o1 or not o2 or s1.Z<=0 or s2.Z<=0 then
bone.f.Visible=false
bone.g.Visible=false
return
end
local dx=s2.X-s1.X
local dy=s2.Y-s1.Y
local len=math.sqrt(dx*dx+dy*dy)
if len<1 then
bone.f.Visible=false
bone.g.Visible=false
return
end
local rot=math.deg(math.atan2(dy,dx))
local cx=(s1.X+s2.X)/2
local cy=(s1.Y+s2.Y)/2
bone.f.Size=UDim2.new(0,len,0,1)
bone.f.Position=UDim2.new(0,cx,0,cy)
bone.f.Rotation=rot
bone.f.BackgroundColor3=color
bone.f.Visible=true
bone.g.Size=UDim2.new(0,len+2,0,5)
bone.g.Position=UDim2.new(0,cx,0,cy)
bone.g.Rotation=rot
bone.g.BackgroundColor3=color
bone.g.Visible=true
end
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
local T=tick()
local mc=pl.Character
local mr=mc and mc:FindFirstChild("HumanoidRootPart")
local og=mr and mr.Position or Vector3.zero
local vp=cam.ViewportSize
local ms=select(1,cam:WorldToScreenPoint(og))
local sx,sy=vp.X/2,vp.Y-80
if ms.Z>0 then sx,sy=ms.X,ms.Y end
for p,d in pairs(D)do
if not p.Parent then RE(p)else
if FT-d.ts>1 then d.ts=FT d.l=GL(p)d.t=GT(p)end
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
if d.t=="pirate"then d.tm.Text="HẢI TẶC" d.tm.TextColor3=Color3.fromRGB(255,120,120)
elseif d.t=="marine"then d.tm.Text="HẢI QUÂN" d.tm.TextColor3=Color3.fromRGB(150,200,255)
else d.tm.Text="" end
local pc=hu.MaxHealth>0 and math.clamp(hu.Health/hu.MaxHealth,0,1)or 0
d.hf.Size=UDim2.new(pc,0,1,0)
if pc>.5 then d.hf.BackgroundColor3=H1 elseif pc>.25 then d.hf.BackgroundColor3=H2 else d.hf.BackgroundColor3=H3 end
d.lv.Text="Lv "..(d.l>0 and tostring(d.l)or "?")
d.dl.Text=math.floor(ds+.5).."m"
d.hl.Text=math.floor(hu.Health+.5).."/"..math.floor(hu.MaxHealth+.5).." HP"
if SKEL and ds<=HR then
local boneList
if ch:FindFirstChild("UpperTorso")then boneList=SKEL_BONES else boneList=SKEL_BONES_R6 end
for i=1,14 do
if i<=#boneList then
local b=boneList[i]
local p1=ch:FindFirstChild(b[1])
local p2=ch:FindFirstChild(b[2])
if p1 and p2 then
local bc
if RAINBOW then
local hue=((T*0.35)+(i*0.06)+p.UserId*0.0001)%1
bc=Color3.fromHSV(hue,1,1)
else
if TP then
if d.t=="pirate"then bc=CP
elseif d.t=="marine"then bc=CM
else bc=d.c end
else bc=d.c end
end
drawBone(d.sk[i],p1.Position,p2.Position,bc)
else
d.sk[i].f.Visible=false
d.sk[i].g.Visible=false
end
else
d.sk[i].f.Visible=false
d.sk[i].g.Visible=false
end
end
else
for i=1,14 do d.sk[i].f.Visible=false d.sk[i].g.Visible=false end
end
if BX and ds<=HR and ds>3 then
if TP then
if d.t=="pirate"then d.bst.Color=CP
elseif d.t=="marine"then d.bst.Color=CM
else d.bst.Color=d.c end
else d.bst.Color=d.c end
DB(d.bx,ch)
else d.bx.Visible=false end
if ds<=LR and ds>3 then
if TP then
if d.t=="pirate"then d.ln.BackgroundColor3=CP
elseif d.t=="marine"then d.ln.BackgroundColor3=CM
else d.ln.BackgroundColor3=d.c end
else d.ln.BackgroundColor3=d.c end
local bp,bs2=cam:WorldToScreenPoint(hr.Position)
if bs2 and bp.Z>0 then DL(d.ln,sx,sy,bp.X,bp.Y)else d.ln.Visible=false end
else d.ln.Visible=false end
else
d.ct.Visible=false d.ln.Visible=false d.bx.Visible=false
for i=1,14 do d.sk[i].f.Visible=false d.sk[i].g.Visible=false end
end
if HL and ds<=HR and ds>3 then
if d.h.Adornee~=ch then d.h.Adornee=ch end
d.h.Enabled=true
if TP then
if d.t=="pirate"then d.h.FillColor=CP d.h.OutlineColor=Color3.fromRGB(255,120,120)
elseif d.t=="marine"then d.h.FillColor=CM d.h.OutlineColor=Color3.fromRGB(150,200,255)
else d.h.FillColor=d.c d.h.OutlineColor=Color3.fromRGB(255,255,255)end
else d.h.FillColor=d.c d.h.OutlineColor=Color3.fromRGB(255,255,255)end
else d.h.Enabled=false end
else
d.ct.Visible=false d.h.Enabled=false d.ln.Visible=false d.bx.Visible=false
for i=1,14 do d.sk[i].f.Visible=false d.sk[i].g.Visible=false end
end
end end end)local SPD,JPW=false,false
local SPD_VAL,JPW_VAL=16,50
local fabOuter=I("Frame",{Size=UDim2.new(0,56,0,56),Position=UDim2.new(.5,-28,.5,-28),BackgroundTransparency=1,ZIndex=100},sg)
local MB=I("TextButton",{Size=UDim2.new(1,0,1,0),BackgroundColor3=Color3.fromRGB(0,0,0),Text="ESP",TextColor3=Color3.fromRGB(255,255,255),TextSize=13,Font=Enum.Font.GothamBold,BorderSizePixel=2,ZIndex=101},fabOuter)
MB.BorderColor3=Color3.fromRGB(255,255,255)
DG(MB,MB)
local MW,MH=440,420
local M=I("CanvasGroup",{Size=UDim2.new(0,MW,0,MH),Position=UDim2.new(.5,0,.5,0),AnchorPoint=Vector2.new(.5,.5),BackgroundColor3=Color3.fromRGB(0,0,0),GroupTransparency=1,BorderSizePixel=2,Visible=false,Active=true,ZIndex=200},sg)
M.BorderColor3=Color3.fromRGB(255,255,255)
local MENU_OPEN=false
local function openMenu()
if MENU_OPEN then return end
MENU_OPEN=true
M.Visible=true
M.Size=UDim2.new(0,MW*0.7,0,MH*0.7)
M.GroupTransparency=1
TS:Create(M,TweenInfo.new(.22,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Size=UDim2.new(0,MW,0,MH),GroupTransparency=0}):Play()
end
local function closeMenu()
if not MENU_OPEN then return end
MENU_OPEN=false
TS:Create(M,TweenInfo.new(.15,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{Size=UDim2.new(0,MW*0.7,0,MH*0.7),GroupTransparency=1}):Play()
task.wait(.15)
M.Visible=false
end
local HD=I("TextButton",{Size=UDim2.new(1,0,0,36),BackgroundColor3=Color3.fromRGB(20,20,20),Text="",BorderSizePixel=0,AutoButtonColor=false,ZIndex=201},M)
local hdr=I("TextLabel",{Size=UDim2.new(1,-50,1,0),Position=UDim2.new(0,12,0,0),BackgroundTransparency=1,Text="ESP MENU",TextColor3=Color3.fromRGB(255,255,255),TextSize=13,Font=Enum.Font.GothamBold,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=202},HD)
local closeBtn=I("TextButton",{Size=UDim2.new(0,26,0,26),Position=UDim2.new(1,-32,.5,-13),BackgroundColor3=Color3.fromRGB(40,0,0),Text="X",TextColor3=Color3.fromRGB(255,255,255),TextSize=13,Font=Enum.Font.GothamBold,BorderSizePixel=1,AutoButtonColor=false,ZIndex=203},HD)
closeBtn.BorderColor3=Color3.fromRGB(255,255,255)
DG(M,HD)
local CTL=I("Frame",{Size=UDim2.new(0,200,0,360),Position=UDim2.new(0,12,0,48),BackgroundTransparency=1,ZIndex=202},M)
local CTR=I("Frame",{Size=UDim2.new(0,200,0,360),Position=UDim2.new(0,226,0,48),BackgroundTransparency=1,ZIndex=202},M)
I("Frame",{Size=UDim2.new(0,1,0,360),Position=UDim2.new(0,218,0,48),BackgroundColor3=Color3.fromRGB(80,80,80),BorderSizePixel=0,ZIndex=205},M)
local FB=Enum.Font.GothamBold
local function TGL2(parent,y,txt,init,cb)
local row=I("TextButton",{Size=UDim2.new(1,0,0,34),Position=UDim2.new(0,0,0,y),BackgroundColor3=Color3.fromRGB(20,20,20),Text="",BorderSizePixel=1,AutoButtonColor=false,ZIndex=203},parent)
row.BorderColor3=Color3.fromRGB(80,80,80)
I("TextLabel",{Size=UDim2.new(1,-50,1,0),Position=UDim2.new(0,10,0,0),BackgroundTransparency=1,Text=txt,TextColor3=Color3.fromRGB(255,255,255),TextSize=12,Font=FB,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=204},row)
local state=I("TextLabel",{Size=UDim2.new(0,38,1,0),Position=UDim2.new(1,-42,0,0),BackgroundTransparency=1,Text=init and "ON" or "OFF",TextColor3=Color3.fromRGB(255,255,255),TextSize=12,Font=FB,TextXAlignment=Enum.TextXAlignment.Center,ZIndex=204},row)
local on=init
row.MouseButton1Click:Connect(function()
on=not on
state.Text=on and "ON" or "OFF"
row.BackgroundColor3=on and Color3.fromRGB(40,40,40) or Color3.fromRGB(20,20,20)
cb(on)
end)
end
local function SLIDER(parent,y,label,init,min,max,cb)
local lr=I("Frame",{Size=UDim2.new(1,0,0,14),Position=UDim2.new(0,0,0,y),BackgroundTransparency=1,ZIndex=204},parent)
I("TextLabel",{Size=UDim2.new(.6,0,1,0),BackgroundTransparency=1,Text=label,TextColor3=Color3.fromRGB(200,200,200),TextSize=11,Font=FB,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=204},lr)
local val=I("TextLabel",{Size=UDim2.new(.4,0,1,0),Position=UDim2.new(.6,0,0,0),BackgroundTransparency=1,Text=tostring(init),TextColor3=Color3.fromRGB(255,255,255),TextSize=11,Font=FB,TextXAlignment=Enum.TextXAlignment.Right,ZIndex=204},lr)
local track=I("Frame",{Size=UDim2.new(1,0,0,4),Position=UDim2.new(0,0,0,y+20),BackgroundColor3=Color3.fromRGB(50,50,50),BorderSizePixel=0,ZIndex=204},parent)
local p0=(init-min)/(max-min)
local fill=I("Frame",{Size=UDim2.new(p0,0,1,0),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,ZIndex=205},track)
local knob=I("Frame",{Size=UDim2.new(0,10,0,14),Position=UDim2.new(p0,0,.5,0),AnchorPoint=Vector2.new(.5,.5),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=1,ZIndex=206},track)
knob.BorderColor3=Color3.fromRGB(0,0,0)
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
-- CỘT TRÁI: ESP + VISUAL
TGL2(CTL,0,"ESP",ON,function(v)ON=v if ON then for _,p in ipairs(P:GetPlayers())do CE(p)end else CA()end end)
TGL2(CTL,42,"HIGHLIGHT",HL,function(v)HL=v if not HL then for _,d in pairs(D)do d.h.Enabled=false end end end)
TGL2(CTL,84,"CHAMS",CH,function(v)CH=v RC()end)
TGL2(CTL,126,"BOX",BX,function(v)BX=v if not BX then for _,d in pairs(D)do d.bx.Visible=false end end end)
TGL2(CTL,168,"TEAM",TP,function(v)TP=v end)
TGL2(CTL,210,"SKELETON",SKEL,function(v)SKEL=v if not SKEL then for _,d in pairs(D)do for _,o in ipairs(d.sk)do o.f.Visible=false o.g.Visible=false end end end end)
TGL2(CTL,252,"RAINBOW",RAINBOW,function(v)RAINBOW=v end)
TGL2(CTL,294,"TIA",LR>0,function(v)LR=v and 1000 or 0 if not v then for _,d in pairs(D)do d.ln.Visible=false end end end)
-- CỘT PHẢI: MOVEMENT
TGL2(CTR,0,"SPEED",SPD,function(v)SPD=v end)
local spdVal,spdFill=SLIDER(CTR,42,"WALK",SPD_VAL,16,300,function(v)SPD_VAL=v end)
TGL2(CTR,84,"JUMP",JPW,function(v)JPW=v end)
local jpwVal,jpwFill=SLIDER(CTR,126,"JUMP",JPW_VAL,50,500,function(v)JPW_VAL=v end)
I("Frame",{Size=UDim2.new(1,0,0,1),Position=UDim2.new(0,0,0,170),BackgroundColor3=Color3.fromRGB(80,80,80),BorderSizePixel=0,ZIndex=204},CTR)
I("TextLabel",{Size=UDim2.new(1,0,0,14),Position=UDim2.new(0,0,0,176),BackgroundTransparency=1,Text="OPACITY",TextColor3=Color3.fromRGB(200,200,200),TextSize=11,Font=FB,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=204},CTR)
local opVal=I("TextLabel",{Size=UDim2.new(1,0,0,14),Position=UDim2.new(0,0,0,176),BackgroundTransparency=1,Text="100%",TextColor3=Color3.fromRGB(255,255,255),TextSize=11,Font=FB,TextXAlignment=Enum.TextXAlignment.Right,ZIndex=204},CTR)
local opTrack=I("Frame",{Size=UDim2.new(1,0,0,4),Position=UDim2.new(0,0,0,196),BackgroundColor3=Color3.fromRGB(50,50,50),BorderSizePixel=0,ZIndex=204},CTR)
local opFill=I("Frame",{Size=UDim2.new(1,0,1,0),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,ZIndex=205},opTrack)
local opKnob=I("Frame",{Size=UDim2.new(0,10,0,14),Position=UDim2.new(1,0,.5,0),AnchorPoint=Vector2.new(.5,.5),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=1,ZIndex=206},opTrack)
opKnob.BorderColor3=Color3.fromRGB(0,0,0)
local opHit=I("TextButton",{Size=UDim2.new(1,0,0,22),Position=UDim2.new(0,0,0,188),BackgroundTransparency=1,Text="",AutoButtonColor=false,ZIndex=207},CTR)
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
M.BackgroundTransparency=.05+(1-v)*.5
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
hu:GetPropertyChangedSignal("WalkSpeed"):Connect(function()if SPD and hu.WalkSpeed~=SPD_VAL then hu.WalkSpeed=SPD_VAL end end)
hu:GetPropertyChangedSignal("JumpPower"):Connect(function()if JPW and hu.JumpPower~=JPW_VAL then hu.JumpPower=JPW_VAL end end)
hu:GetPropertyChangedSignal("UseJumpPower"):Connect(function()if JPW and not hu.UseJumpPower then hu.UseJumpPower=true end end)
end
if pl.Character then hookChar(pl.Character) end
pl.CharacterAdded:Connect(hookChar)
MB.MouseButton1Click:Connect(function()
if MENU_OPEN then closeMenu() else openMenu() end
end)
closeBtn.MouseButton1Click:Connect(closeMenu)
print("[ESP] v2 LOADED")