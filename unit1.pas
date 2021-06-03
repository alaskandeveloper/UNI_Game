unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, LCLType;

type

  { TForm1 }

  TForm1 = class(TForm)
    BDraw: TButton;
    BClear: TButton;
    Image2: TImage;
    procedure BClearClick(Sender: TObject);
    procedure BDrawClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image2Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }
type

  SnakeParts = record
    HeadX:integer;
    HeadY:integer;
    BodyX:integer;
    BodyY:integer;
    TailX:integer;
    TailY:integer;

  end;


var
  stdColor: TColor;
  Map:array [1..20] of string;
  Line:string;
  BlockSize:integer;
  CurOffSetX:integer;
  CurOffSetY:integer;
  i,j:integer;
  MapSize,LineSize:integer;



  Snake: array [1..50] of array [1..50] of SnakeParts;




procedure DrawSnake();
begin


     Form1.Canvas.Brush.Color := stdColor;
     for i:= 1 to 50 do begin
         for j:= 1 to 50 do begin

             if (j = 1) and (i =1) then
                Form1.Canvas.FillRect(Snake[i,j].HeadX,Snake[i,j].HeadY,Snake[i,j].TailX,Snake[i,j].TailY+BlockSize);
         end;

     end;
end;

procedure DrawMap();
begin
    Map[1]:='#####################';
    Map[2]:='#                   #';
    Map[3]:='#                   #';
    Map[4]:='#     ###           #';
    Map[5]:='#      ###          #';
    Map[6]:='#                   #';
    Map[7]:='#                   #';
    Map[8]:='#                   #';
    Map[9]:='#                   #';
    Map[10]:='#                   #';
    Map[11]:='#                   #';
    Map[12]:='#                   #';
    Map[13]:='#                   #';
    Map[14]:='#####################';
     Form1.Canvas.Clear;
    Form1.Canvas.Brush.Color := 1;
    CurOffSetY:=0;
    for i:= 1 to MapSize do begin
        CurOffSetX:=0;
        Line:=Map[i];
        for j:= 1 to LineSize do  begin
            if Line[j] = '#' then
               Form1.Canvas.FillRect(CurOffSetX,CurOffSetY,CurOffSetX+BlockSize,CurOffSetY+BlockSize);

            CurOffSetX:=CurOffSetX+BlockSize;
        end;
        CurOffSetY:=CurOffSetY+BlockSize;
    end;

end;

procedure NewGame();


begin
    Snake[1,1].HeadX:=100;
    Snake[1,1].HeadY:=100;
    Snake[1,1].BodyX :=100;
    Snake[1,1].BodyY :=100;
    Snake[1,1].TailX :=200;
    Snake[1,1].TailY :=100;



     CurOffSetX:=0;
    CurOffSetY:=0;
    BlockSize:=20;
    MapSize:=14;
    LineSize:=21;
    stdColor := RGBToColor(206, 224, 166);


end;

procedure Graphics();
begin
    DrawMap();
    DrawSnake();


end;

procedure TForm1.BClearClick(Sender: TObject);
begin

end;

procedure TForm1.BDrawClick(Sender: TObject);
begin
    Graphics();
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
     NewGame();


end;





procedure TForm1.Image2Click(Sender: TObject);
begin

end;


end.

