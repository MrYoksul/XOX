var
 Anasayfa,oynfrm:TclGameForm;
 GameImg : TClProImage;
 PnlBody:TCLPanel;
 VSB:TCLVertScrollBox;
 TopLyt,BottomLyt,HorizontalLyt1,HorizontalLyt2,HorizontalLyt3 : TclLayout;
 Player1Edt,Player2Edt : TClProEdit;
 bslklbl,NotLbl,siralbl,LblPlayer1,LblPlayer2: TClProLabel;
 GoGamebtn,BackBtnAnasayfa,BackBtnGame,btn1,btn2,btn3,btn4,btn5,btn6,btn7,btn8,btn9: TClProButton;
 kazanmases:Single;
 Player1Puan,Player2Puan Integer;
 XorY : Boolean;
 
procedure BackPage
begin
TclProButton(Anasayfa.clFindComponent('BtnGoBack')).Click;
Anasayfa.ClHide;
end; 

Procedure kazanmasesprcdr
begin
oynfrm.PlayGameSound(kazanmases);
end;
 
procedure basadn
begin
btn1.Text:='';
btn2.Text:='';
btn3.Text:='';
btn4.Text:='';
btn5.Text:='';
btn6.Text:='';
btn7.Text:='';
btn8.Text:='';
btn9.Text:='';
btn1.Enabled:=True;
btn2.Enabled:=True;
btn3.Enabled:=True;
btn4.Enabled:=True;
btn5.Enabled:=True;
btn6.Enabled:=True;
btn7.Enabled:=True;
btn8.Enabled:=True;
btn9.Enabled:=True;
end;

procedure MainPage
begin 
Anasayfa := TclGameForm.Create(Self);
Anasayfa.SetFormColor('#bdbab9','',clGNone);

GameImg := Anasayfa.AddNewProImage(Anasayfa,'GameImg');
clComponent.SetupComponent(GameImg,'{"Align":"Center","Width":150,"Height":150,"ImgUrl":"https://i.hizliresim.com/58w37q8.jpg","ImgFit":"yes","MarginBottom":270}');

bslklbl := Anasayfa.AddNewProLabel(Anasayfa,'bslklbl','X O X');
clComponent.SetupComponent(bslklbl,'{"Align":"center","BackgroundColor":"#FFF5EE","TextColor":"#008080",
"Width":200,"Height":50,"MarginBottom":500,"TextSize":50,"TextBold":"yes","RoundHeight":10,"RoundWidth":10,
"BorderColor":"#008080","BorderWidth":3,"TextVerticalAlign":"center","TextHorizontalAlign":"center"}');

Player1Edt := Anasayfa.AddNewProEdit(Anasayfa,'Player1Edt','Player 1 Name');
clComponent.SetupComponent(Player1Edt,'{"Align":"Center","BackgroundColor":"#FFF5EE","TextColor":"#008080",
"Width":200,"Height":50,"MarginBottom":50,"RoundHeight":10,"RoundWidth":10,"BorderColor":"#008080",
"BorderWidth":3,"TextVerticalAlign":"center","TextHorizontalAlign":"center"}');
Player1Edt.MaxLength:=20;

Player2Edt := Anasayfa.AddNewProEdit(Anasayfa,'Player2Edt','Player 2 Name');
clComponent.SetupComponent(Player2Edt,'{"Align":"Center","BackgroundColor":"#FFF5EE","TextColor":"#008080",
"Width":200,"Height":50,"MarginTop":80,"RoundHeight":10,"RoundWidth":10,"BorderColor":"#008080",
"BorderWidth":3,"TextVerticalAlign":"center","TextHorizontalAlign":"center"}');
Player2Edt.MaxLength:=20;

GoGamebtn := Anasayfa.AddNewProButton(Anasayfa,'GoGamebtn','Oyuna Geç');
clComponent.SetupComponent(GoGamebtn,'{"Align":"center","BackgroundColor":"#FFF5EE","TextColor":"#008080",
"Width":200,"Height":50,"MarginTop":200,"TextSize":30,"TextBold":"yes","RoundHeight":10,"RoundWidth":10,
"BorderColor":"#008080","BorderWidth":3,"TextVerticalAlign":"center","TextHorizontalAlign":"center"}');
Anasayfa.AddNewEvent(GoGamebtn,tbeOnClick,'gcskntrl');

BackBtnAnasayfa := Anasayfa.AddNewProButton(Anasayfa,'BackBtn','');
clComponent.SetupComponent(BackBtnAnasayfa,'{"Align":"None","Width":70,"Height":70,"ImgUrl":"https://img.icons8.com/fluency/48/circled-left.png"}');
BackBtnAnasayfa.Position.X:=1;
BackBtnAnasayfa.Position.Y:=1;
Anasayfa.AddNewEvent(BackBtnAnasayfa,tbeOnClick,'BackPage');

Anasayfa.Run;
end;

procedure GoGame
begin
oynfrm := TclGameForm.Create(Self);
Player1Puan:=0;
Player2Puan:=0;

oynfrm.AddNewEvent(oynfrm,tbeOnFormCloseQuery,'closeQuery');

oynfrm.AddGameAssetFromUrl('https://clomosy.com/demos/win.wav');
kazanmases:= oynfrm.RegisterSound('win.wav');
oynfrm.SoundIsActive:=True;

PnlBody := oynfrm.AddNewProPanel(oynfrm,'PnlBody');
clComponent.SetupComponent(PnlBody,'{"Align":"Client",
"BackgroundColor":"#E6E6FA"}');

VSB := oynfrm.AddNewVertScrollBox(PnlBody,'VSB');
VSB.Align := alClient;

TopLyt := oynfrm.AddNewLayout(VSB,'TopLyt');
TopLyt.Align:=alMostTop;
TopLyt.Height := TForm(oynfrm).ClientHeight/2;

BottomLyt := oynfrm.AddNewLayout(VSB,'BottomLyt');
BottomLyt.Align:=alTop;
BottomLyt.Height := (TForm(oynfrm).ClientHeight/2)-20;
BottomLyt.Width:=VSB.Width-20;
BottomLyt.Margins.Left:= 10;
BottomLyt.Margins.Right:= 10;
BottomLyt.Margins.Top:= 10;
BottomLyt.Margins.Bottom:= 10;
  HorizontalLyt1 := oynfrm.AddNewLayout(BottomLyt,'HorizontalLyt1');
  HorizontalLyt1.Align:=alMostLeft;
  HorizontalLyt1.Width := BottomLyt.Width/3;
  HorizontalLyt2:= oynfrm.AddNewLayout(BottomLyt,'HorizontalLyt2');
  HorizontalLyt2.Align:=alMostLeft;
  HorizontalLyt2.Width := BottomLyt.Width/3;
  HorizontalLyt3 := oynfrm.AddNewLayout(BottomLyt,'HorizontalLyt3');
  HorizontalLyt3.Align:=alLeft;
  HorizontalLyt3.Width := BottomLyt.Width/3;

NotLbl := oynfrm.AddNewProLabel(TopLyt,'NotLbl','Puanı 10 veya üzeri olan oyunu kazanır');
clComponent.SetupComponent(NotLbl,'{"Align" : "MostTop","BackgroundColor":"#a80b00","TextColor":"#FFFFFF",
"Height":28,"TextSize":15,"TextBold":"yes","RoundHeight":10,"RoundWidth":10,"MarginTop":100,"MarginLeft":10,"MarginRight":10,
"TextVerticalAlign":"center","TextHorizontalAlign":"center"}');

LblPlayer1 := oynfrm.AddNewProLabel(TopLyt,'LblPlayer1','  '+Player1Edt.Text+' : 0');
clComponent.SetupComponent(LblPlayer1,'{"Align" : "MostTop","BackgroundColor":"#FFF5EE","TextColor":"#008080",
"Width":300,"Height":50,"MarginTop":10,"TextSize":25,"TextBold":"yes","RoundHeight":10,"RoundWidth":10,
"BorderColor":"#008080","BorderWidth":3,"TextVerticalAlign":"center","TextHorizontalAlign":"Left","MarginLeft":10,"MarginRight":10}');

LblPlayer2 := oynfrm.AddNewProLabel(TopLyt,'LblPlayer2','  '+Player2Edt.Text+' : 0');
clComponent.SetupComponent(LblPlayer2,'{"Align" : "MostTop","BackgroundColor":"#FFF5EE","TextColor":"#008080",
"Width":300,"Height":50,"MarginTop":10,"TextSize":25,"TextBold":"yes","RoundHeight":10,"RoundWidth":10,
"BorderColor":"#008080","BorderWidth":3,"TextVerticalAlign":"center","TextHorizontalAlign":"Left","MarginLeft":10,"MarginRight":10}');

siralbl := oynfrm.AddNewProLabel(TopLyt,'siralbl',' SIRA : '+Player1Edt.Text+' "X"');
clComponent.SetupComponent(siralbl,'{"Align" : "Top","BackgroundColor":"#FFF5EE","TextColor":"#008080",
"Width":200,"Height":28,"MarginTop":10,"TextSize":20,"TextBold":"yes","RoundHeight":10,"RoundWidth":10,
"BorderColor":"#008080","BorderWidth":3,"TextVerticalAlign":"center","TextHorizontalAlign":"center","MarginLeft":10,"MarginRight":10}');

btn1 := oynfrm.AddNewProButton(HorizontalLyt1,'btn1','');
clComponent.SetupComponent(btn1,'{"Align" : "MostTop","Width":'+IntToStr(BottomLyt.Width/3)+',"Height":'+IntToStr(BottomLyt.Height/3)+', 
"BackgroundColor":"#FFFFFF", "RoundHeight":3,"RoundWidth":3,"BorderColor":"#000000","BorderWidth":2,"TextSize":50}');
oynfrm.AddNewEvent(btn1,tbeOnClick,'btnsOnClick');

btn2 := oynfrm.AddNewProButton(HorizontalLyt2,'btn2','');
clComponent.SetupComponent(btn2,'{"Align" : "MostTop","Width":'+IntToStr(BottomLyt.Width/3)+',"Height":'+IntToStr(BottomLyt.Height/3)+', 
"BackgroundColor":"#FFFFFF", "RoundHeight":3,"RoundWidth":3,"BorderColor":"#000000","BorderWidth":2,"TextSize":50}');
oynfrm.AddNewEvent(btn2,tbeOnClick,'btnsOnClick');

btn3 := oynfrm.AddNewProButton(HorizontalLyt3,'btn3','');
clComponent.SetupComponent(btn3,'{"Align" : "MostTop","Width":'+IntToStr(BottomLyt.Width/3)+',"Height":'+IntToStr(BottomLyt.Height/3)+', 
"BackgroundColor":"#FFFFFF", "RoundHeight":3,"RoundWidth":3,"BorderColor":"#000000","BorderWidth":2,"TextSize":50}');
oynfrm.AddNewEvent(btn3,tbeOnClick,'btnsOnClick');

btn4 := oynfrm.AddNewProButton(HorizontalLyt1,'btn4','');
clComponent.SetupComponent(btn4,'{"Align" : "MostTop","Width":'+IntToStr(BottomLyt.Width/3)+',"Height":'+IntToStr(BottomLyt.Height/3)+', 
"BackgroundColor":"#FFFFFF", "RoundHeight":3,"RoundWidth":3,"BorderColor":"#000000","BorderWidth":2,"TextSize":50}');
oynfrm.AddNewEvent(btn4,tbeOnClick,'btnsOnClick');

btn5 := oynfrm.AddNewProButton(HorizontalLyt2,'btn5','');
clComponent.SetupComponent(btn5,'{"Align" : "MostTop","Width":'+IntToStr(BottomLyt.Width/3)+',"Height":'+IntToStr(BottomLyt.Height/3)+', 
"BackgroundColor":"#FFFFFF", "RoundHeight":3,"RoundWidth":3,"BorderColor":"#000000","BorderWidth":2,"TextSize":50}');
oynfrm.AddNewEvent(btn5,tbeOnClick,'btnsOnClick');

btn6 := oynfrm.AddNewProButton(HorizontalLyt3,'btn6','');
clComponent.SetupComponent(btn6,'{"Align" : "MostTop","Width":'+IntToStr(BottomLyt.Width/3)+',"Height":'+IntToStr(BottomLyt.Height/3)+', 
"BackgroundColor":"#FFFFFF", "RoundHeight":3,"RoundWidth":3,"BorderColor":"#000000","BorderWidth":2,"TextSize":50}');
oynfrm.AddNewEvent(btn6,tbeOnClick,'btnsOnClick');

btn7 := oynfrm.AddNewProButton(HorizontalLyt1,'btn7','');
clComponent.SetupComponent(btn7,'{"Align" : "Top","Width":'+IntToStr(BottomLyt.Width/3)+',"Height":'+IntToStr(BottomLyt.Height/3)+', 
"BackgroundColor":"#FFFFFF", "RoundHeight":3,"RoundWidth":3,"BorderColor":"#000000","BorderWidth":2,"TextSize":50}');
oynfrm.AddNewEvent(btn7,tbeOnClick,'btnsOnClick');

btn8 := oynfrm.AddNewProButton(HorizontalLyt2,'btn8','');
clComponent.SetupComponent(btn8,'{"Align" : "Top","Width":'+IntToStr(BottomLyt.Width/3)+',"Height":'+IntToStr(BottomLyt.Height/3)+', 
"BackgroundColor":"#FFFFFF", "RoundHeight":3,"RoundWidth":3,"BorderColor":"#000000","BorderWidth":2,"TextSize":50}');
oynfrm.AddNewEvent(btn8,tbeOnClick,'btnsOnClick');

btn9 := oynfrm.AddNewProButton(HorizontalLyt3,'btn9','');
clComponent.SetupComponent(btn9,'{"Align" : "Top","Width":'+IntToStr(BottomLyt.Width/3)+',"Height":'+IntToStr(BottomLyt.Height/3)+', 
"BackgroundColor":"#FFFFFF", "RoundHeight":3,"RoundWidth":3,"BorderColor":"#000000","BorderWidth":2,"TextSize":50}');
oynfrm.AddNewEvent(btn9,tbeOnClick,'btnsOnClick');

BackBtnGame := oynfrm.AddNewProButton(oynfrm,'BackBtnGame','');
clComponent.SetupComponent(BackBtnGame,'{"Align":"None","Width":70,"Height":70,"ImgUrl":"https://img.icons8.com/fluency/48/circled-left.png"}');
BackBtnGame.Position.X:=1;
BackBtnGame.Position.Y:=1;
oynfrm.AddNewEvent(BackBtnGame,tbeOnClick,'Hide');

oynfrm.Run;
end;

procedure RoundWinnerX
begin
 ShowMessage('SETİ KAZANAN : '+Player1Edt.Text);
end;

procedure RoundWinnerY
begin
 ShowMessage('SETİ KAZANAN : '+Player2Edt.Text);
end;

procedure RoundDraw
begin
 ShowMessage('SET BERABERE BİTTİ');
end;

procedure btnsOnClick;
begin
  if XorY = True then  // X Kazandıysa
  begin
    if siralbl.Text=' SIRA : '+Player1Edt.Text+' "X"' then
    begin
     TClProButton(oynfrm.clSender).Text :='X';
     TClProButton(oynfrm.clSender).Enabled:=False;
     siralbl.Text:=' SIRA : '+Player2Edt.Text+' "O"';
    end;
    
    else 
    begin
     TClProButton(oynfrm.clSender).Text :='O';
     TClProButton(oynfrm.clSender).Enabled:=False;
     siralbl.Text:=' SIRA : '+Player1Edt.Text+' "X"';
    end;
  end;
  
  else if XorY = False then  // Y Kazandıysa
  begin
    if siralbl.Text=' SIRA : '+Player2Edt.Text+' "O"' then
    begin
     TClProButton(oynfrm.clSender).Text :='O';
     TClProButton(oynfrm.clSender).Enabled:=False;
     siralbl.Text:=' SIRA : '+Player1Edt.Text+' "X"';
    end;
     
    else 
    begin
     TClProButton(oynfrm.clSender).Text :='X';
     TClProButton(oynfrm.clSender).Enabled:=False;
     siralbl.Text:=' SIRA : '+Player2Edt.Text+' "O"';
    end;
  end;
   
  if (btn1.Text='X')and(btn2.Text='X')and(btn3.Text='X') then
   begin
     if Player1Puan < 9 then 
     begin
      RoundWinnerX;
     end;
     basadn;
     siralbl.Text:=' SIRA : '+Player1Edt.Text+' "X"';
     kazanmasesprcdr;
     Player1Puan:=Player1Puan+3;
     LblPlayer1.Text:='  '+Player1Edt.Text+' : '+IntToStr(Player1Puan);
     XorY:=True;
   end;
  if (btn4.Text='X')and(btn5.Text='X')and(btn6.Text='X') then
   begin
     if Player1Puan < 9 then 
     begin
      RoundWinnerX;
     end;
     basadn;
     siralbl.Text:=' SIRA : '+Player1Edt.Text+' "X"';
     kazanmasesprcdr;
     Player1Puan:=Player1Puan+3;
     LblPlayer1.Text:='  '+Player1Edt.Text+' : '+IntToStr(Player1Puan);
     XorY:=True;
   end;
  if (btn7.Text='X')and(btn8.Text='X')and(btn9.Text='X') then
   begin
     if Player1Puan < 9 then 
     begin
      RoundWinnerX;
     end;
     basadn;
     siralbl.Text:=' SIRA : '+Player1Edt.Text+' "X"';
     kazanmasesprcdr;
     Player1Puan:=Player1Puan+3;
     LblPlayer1.Text:='  '+Player1Edt.Text+' : '+IntToStr(Player1Puan);
     XorY:=True;
   end;
  if (btn1.Text='X')and(btn4.Text='X')and(btn7.Text='X') then
   begin
     if Player1Puan < 9 then 
     begin
      RoundWinnerX;
     end;
     basadn;
     siralbl.Text:=' SIRA : '+Player1Edt.Text+' "X"';
     kazanmasesprcdr;
     Player1Puan:=Player1Puan+3;
     LblPlayer1.Text:='  '+Player1Edt.Text+' : '+IntToStr(Player1Puan);
     XorY:=True;
   end;
  if (btn2.Text='X')and(btn5.Text='X')and(btn8.Text='X') then
   begin
     if Player1Puan < 9 then 
     begin
      RoundWinnerX;
     end;
     basadn;
     siralbl.Text:=' SIRA : '+Player1Edt.Text+' "X"';
     kazanmasesprcdr;
     Player1Puan:=Player1Puan+3;
     LblPlayer1.Text:='  '+Player1Edt.Text+' : '+IntToStr(Player1Puan);
     XorY:=True;
   end;
  if (btn3.Text='X')and(btn6.Text='X')and(btn9.Text='X') then
   begin
     if Player1Puan < 9 then 
     begin
      RoundWinnerX;
     end;
     basadn;
     siralbl.Text:=' SIRA : '+Player1Edt.Text+' "X"';
     kazanmasesprcdr;
     Player1Puan:=Player1Puan+3;
     LblPlayer1.Text:='  '+Player1Edt.Text+' : '+IntToStr(Player1Puan);
     XorY:=True;
   end;
  if (btn1.Text='X')and(btn5.Text='X')and(btn9.Text='X') then
   begin
     if Player1Puan < 9 then 
     begin
      RoundWinnerX;
     end;
     basadn;
     siralbl.Text:=' SIRA : '+Player1Edt.Text+' "X"';
     kazanmasesprcdr;
     Player1Puan:=Player1Puan+3;
     LblPlayer1.Text:='  '+Player1Edt.Text+' : '+IntToStr(Player1Puan);
     XorY:=True;
   end;
  if (btn3.Text='X')and(btn5.Text='X')and(btn7.Text='X') then
   begin
     if Player1Puan < 9 then 
     begin
      RoundWinnerX;
     end;
     basadn;
     siralbl.Text:=' SIRA : '+Player1Edt.Text+' "X"';
     kazanmasesprcdr;
     Player1Puan:=Player1Puan+3;
     LblPlayer1.Text:='  '+Player1Edt.Text+' : '+IntToStr(Player1Puan);
     XorY:=True;
   end; 
   
  if (btn1.Text='O')and(btn2.Text='O')and(btn3.Text='O') then
   begin
     if Player2Puan < 9 then 
     begin
      RoundWinnerY;
     end;
     basadn;
     siralbl.Text:=' SIRA : '+Player2Edt.Text+' "O"';
     kazanmasesprcdr;
     Player2Puan:=Player2Puan+3;
     LblPlayer2.Text:='  '+Player2Edt.Text+' : '+IntToStr(Player2Puan);
     XorY:=False;
   end;
  if (btn4.Text='O')and(btn5.Text='O')and(btn6.Text='O') then
   begin
     if Player2Puan < 9 then 
     begin
      RoundWinnerY;
     end;
     basadn;
     siralbl.Text:=' SIRA : '+Player2Edt.Text+' "O"';
     kazanmasesprcdr;
     Player2Puan:=Player2Puan+3;
     LblPlayer2.Text:='  '+Player2Edt.Text+' : '+IntToStr(Player2Puan);
     XorY:=False;
   end;
  if (btn7.Text='O')and(btn8.Text='O')and(btn9.Text='O') then
   begin
     if Player2Puan < 9 then 
     begin
      RoundWinnerY;
     end;
     basadn;
     siralbl.Text:=' SIRA : '+Player2Edt.Text+' "O"';
     kazanmasesprcdr;
     Player2Puan:=Player2Puan+3;
     LblPlayer2.Text:='  '+Player2Edt.Text+' : '+IntToStr(Player2Puan);
     XorY:=False;
   end;
  if (btn1.Text='O')and(btn4.Text='O')and(btn7.Text='O') then
   begin
     if Player2Puan < 9 then 
     begin
      RoundWinnerY;
     end;
     basadn;
     siralbl.Text:=' SIRA : '+Player2Edt.Text+' "O"';
     kazanmasesprcdr;
     Player2Puan:=Player2Puan+3;
     LblPlayer2.Text:='  '+Player2Edt.Text+' : '+IntToStr(Player2Puan);
     XorY:=False;
   end;
  if (btn2.Text='O')and(btn5.Text='O')and(btn8.Text='O') then
   begin
     if Player2Puan < 9 then 
     begin
      RoundWinnerY;
     end;
     basadn;
     siralbl.Text:=' SIRA : '+Player2Edt.Text+' "O"';
     kazanmasesprcdr;
     Player2Puan:=Player2Puan+3;
     LblPlayer2.Text:='  '+Player2Edt.Text+' : '+IntToStr(Player2Puan);
     XorY:=False;
   end;
  if (btn3.Text='O')and(btn6.Text='O')and(btn9.Text='O') then
   begin
     if Player2Puan < 9 then 
     begin
      RoundWinnerY;
     end;
     basadn;
     siralbl.Text:=' SIRA : '+Player2Edt.Text+' "O"';
     kazanmasesprcdr;
     Player2Puan:=Player2Puan+3;
     LblPlayer2.Text:='  '+Player2Edt.Text+' : '+IntToStr(Player2Puan);
     XorY:=False;
   end;
  if (btn1.Text='O')and(btn5.Text='O')and(btn9.Text='O') then
   begin
     if Player2Puan < 9 then 
     begin
      RoundWinnerY;
     end;
     basadn;
     siralbl.Text:=' SIRA : '+Player2Edt.Text+' "O"';
     kazanmasesprcdr;
     Player2Puan:=Player2Puan+3;
     LblPlayer2.Text:='  '+Player2Edt.Text+' : '+IntToStr(Player2Puan);
     XorY:=False;
   end;
  if (btn3.Text='O')and(btn5.Text='O')and(btn7.Text='O') then
   begin
     if Player2Puan < 9 then 
     begin
      RoundWinnerY;
     end;
     basadn;
     siralbl.Text:=' SIRA : '+Player2Edt.Text+' "O"';
     kazanmasesprcdr;
     Player2Puan:=Player2Puan+3;
     LblPlayer2.Text:='  '+Player2Edt.Text+' : '+IntToStr(Player2Puan);
     XorY:=False;
   end;
  
  if (btn1.Text <>'')and(btn2.Text <>'')and(btn3.Text <>'')and(btn4.Text <>'')and(btn5.Text <>'')and(btn6.Text <>'')and(btn7.Text <>'')and(btn8.Text <>'')and(btn9.Text <>'')then
   begin
     if (Player1Puan < 9) and (Player2Puan < 9) then 
     begin
      RoundDraw;
     end;
     basadn;
     Player1Puan:=Player1Puan+1;
     Player2Puan:=Player2Puan+1;
     LblPlayer1.Text:='  '+Player1Edt.Text+' : '+IntToStr(Player1Puan);
     LblPlayer2.Text:='  '+Player2Edt.Text+' : '+IntToStr(Player2Puan);
     
     if XorY = True then
     siralbl.Text:=' SIRA : '+Player1Edt.Text+' "X"';
     else
     siralbl.Text:=' SIRA : '+Player2Edt.Text+' "O"';
   end;
   
  if (Player1Puan >=10) and  (Player2Puan >=10) then
   begin 
     ShowMessage('Kazanan Yok')
     Player1Puan:=0;
     Player2Puan:=0;
     LblPlayer1.Text:='  '+Player1Edt.Text+' : '+IntToStr(Player1Puan);
     LblPlayer2.Text:='  '+Player2Edt.Text+' : '+IntToStr(Player2Puan);
     MainPage;
     oynfrm.ClHide;
   end;   
  else if Player1Puan >= 10 then
   begin
     ShowMessage('Oyunu Kazanan : '+Player1Edt.Text);
     Player1Puan:=0;
     Player2Puan:=0;
     LblPlayer1.Text:='  '+Player1Edt.Text+' : '+IntToStr(Player1Puan);
     LblPlayer2.Text:='  '+Player2Edt.Text+' : '+IntToStr(Player2Puan);
     MainPage;
     oynfrm.ClHide;
   end;
  else if Player2Puan >= 10 then
   begin
     ShowMessage('Oyunu Kazanan : '+Player2Edt.Text);
     Player1Puan:=0;
     Player2Puan:=0;
     LblPlayer1.Text:='  '+Player1Edt.Text+' : '+IntToStr(Player1Puan);
     LblPlayer2.Text:='  '+Player2Edt.Text+' : '+IntToStr(Player2Puan);
     MainPage;
     oynfrm.ClHide;
    end;
end;

procedure gcskntrl
begin
if (Player1Edt.Text = '') or (Player2Edt.Text = '') then
 begin
  ShowMessage('Kutucukları Doldurunuz');
 end;
else if Player1Edt.Text = Player2Edt.Text then
 begin
  ShowMessage('Aynı İsim kullanılamaz');
 end
else
 begin
  GoGame;
  Anasayfa.ClHide;
 end;
end;

procedure ProcYesOnClick
begin
MainPage;
oynfrm.ClHide;
end;

procedure Hide
begin
  clomosy.AskAndCall('Oyundan Çıkmak İstiyormusunuz ? ','ProcYesOnClick','');
end;

procedure closeQuery
begin
oynfrm.clCanClose := false;
Hide;
end;

begin
MainPage;
XorY:=True;
end;

 