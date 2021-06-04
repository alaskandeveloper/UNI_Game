unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, LCLType,CRT;

type

  { TForm1 }

  TForm1 = class(TForm)
    BDraw: TButton;
    BClear: TButton;
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
  Directs = (N,W,E,S);
  Point = record
    X:integer;
    Y:integer;
  end;

  TSnake = record
    Face:Directs;
    Body:array[1..50] of Point;
    CurLength:integer;
    MaxLength:integer;
  end;


var
  SnakeColor: TColor;
  WallColor:integer;
  Map:array [1..20] of string;
  BlockSize:integer;
  i,j:integer;
  MapSize:integer;
  LineSize:integer;
  Snake:TSnake;

function newPoint(X,Y:integer):point;
begin
    newPoint.X:=X;
    newPoint.Y:=Y;
end;

procedure createSnake();
begin
     Snake.Face:= E;
     Snake.MaxLength:=50;
     Snake.CurLength:=3;
     SnakeColor:= RGBToColor(206, 224, 166);
     Snake.Body[1]:=newPoint(7,10);
     Snake.Body[2]:=newPoint(6,10);
     Snake.Body[3]:=newPoint(5,10);
end;

procedure drawSnake();
var
  locationX:integer;
  locationY:integer;
begin
     Form1.Canvas.Brush.Color := SnakeColor;
     for i:= 1 to Snake.CurLength do begin
         locationX:=Snake.Body[i].X*BlockSize;
         locationY:=Snake.Body[i].Y*BlockSize;
         Form1.Canvas.FillRect(locationX,locationY,locationX + BlockSize,locationY + BlockSize);
     end;
     //Form1.Canvas.Brush.Color := RGBToColor(255, 255, 255);
end;

procedure drawMap();
var
   CurOffSetX:integer;
   CurOffSetY:integer;
   Line:String;
begin
    CurOffSetY:=0;
    Form1.Canvas.Clear;
    Form1.Canvas.Refresh;
    Form1.Canvas.Brush.Color := WallColor;
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
procedure drawGame();
begin
    DrawMap();
    DrawSnake();
end;
procedure newGame();
begin
    BlockSize:=20;
    WallColor:=1;
    MapSize:=20;
    LineSize:=36;
    Map[1]:='####################################';
    Map[2]:='#                                  #';
    Map[3]:='#                                  #';
    Map[4]:='#                                  #';
    Map[5]:='#           ###                    #';
    Map[6]:='#            ###                   #';
    Map[7]:='#                                  #';
    Map[8]:='#                                  #';
    Map[9]:='#                                  #';
    Map[10]:='#                                  #';
    Map[11]:='#                                  #';
    Map[12]:='#                                  #';
    Map[13]:='#                                  #';
    Map[14]:='#                                  #';
    Map[15]:='#                                  #';
    Map[16]:='#                                  #';
    Map[17]:='#                                  #';
    Map[18]:='#                                  #';
    Map[19]:='#                                  #';
    Map[20]:='####################################';

    CreateSnake();
end;

procedure snakeMove();
var
  deltaLength:integer;
begin
    deltaLength:=7;
    while Snake.Body[1].X < 34 do begin
      deltaLength:=deltaLength+1;
      Snake.Body[1]:=newPoint(deltaLength,10);
      Snake.Body[2]:=newPoint(deltaLength-1,10);
      Snake.Body[3]:=newPoint(deltaLength-2,10);
      Form1.Canvas.Brush.Color:=RGBToColor(255, 255, 255);
      Form1.Canvas.FillRect(Snake.Body[3].X,Snake.Body[3].Y,Snake.Body[3].X-BlockSize,Snake.Body[3].Y-BlockSize);
      delay(100);
      DrawGame();
    end;
end;

procedure TForm1.BClearClick(Sender: TObject);
begin
    NewGame();
end;

procedure TForm1.BDrawClick(Sender: TObject);
begin
    Form1.Canvas.Brush.Color:=RGBToColor(255, 255, 255);
    Form1.Canvas.FillRect(0,0,1000,1000);
    DrawGame();
    SnakeMove();
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
    Form1.Canvas.Brush.Color:=RGBToColor(255, 255, 255);
    Form1.Canvas.FillRect(0,0,1000,1000);
    NewGame();
end;

procedure TForm1.Image2Click(Sender: TObject);
begin
end;

end.

