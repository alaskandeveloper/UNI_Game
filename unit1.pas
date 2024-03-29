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
  end;


var
  SnakeColor: TColor;
  WallColor:integer;
  Map:array [1..20] of string;
  BlockSize:integer;
  i,j:integer;
  MapSize:integer;
  Snake:TSnake;
  LengthSnake:integer;
  LineSize:integer;





procedure DrawSnake();
begin
     Form1.Canvas.Brush.Color := SnakeColor;
     for i:= 1 to 50 do begin
         if Snake.Body[i].X <> 0 then
         Form1.Canvas.FillRect(Snake.Body[i].X,Snake.Body[i].Y,Snake.Body[i].X+BlockSize,Snake.Body[i].Y+BlockSize);
     end;
     Form1.Canvas.Brush.Color := RGBToColor(255, 255, 255);
end;

procedure DrawMap();
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
procedure DrawGame();
begin
    DrawMap();
    DrawSnake();

end;
procedure NewGame();
begin
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

    BlockSize:=20;
    SnakeColor:= RGBToColor(206, 224, 166);
    WallColor:=1;
    //Form1.Canvas.Brush.Color:=RGBToColor(255, 255, 255);
    //Form1.Canvas.FillRect(0,0,1000,1000);


     Snake.Body[1].X:=140;
     Snake.Body[1].Y:=200;
     Snake.Body[2].X:=140-((2-1)*BlockSize);
     Snake.Body[2].Y:=200;
     Snake.Body[3].X:=140-((3-1)*BlockSize);
     Snake.Body[3].Y:=200;

end;


procedure SnakeMove();
var
  deltaLength:integer;
begin
    deltaLength:=140;
    while Snake.Body[1].X < 680 do begin
      deltaLength:=deltaLength+20;
      Snake.Body[1].X:=deltaLength;
      Snake.Body[1].Y:=200;
      Snake.Body[2].X:=deltaLength-((2-1)*BlockSize);
      Snake.Body[2].Y:=200;
      Snake.Body[3].X:=deltaLength-((3-1)*BlockSize);
      Snake.Body[3].Y:=200;

      Form1.Canvas.Brush.Color:=RGBToColor(255, 255, 255);
      Form1.Canvas.FillRect(Snake.Body[3].X,Snake.Body[3].Y,Snake.Body[3].X-BlockSize,Snake.Body[3].Y-BlockSize);

      delay(100);
      DrawGame();



    end;
end;


procedure TForm1.BClearClick(Sender: TObject);
begin

   Form1.Canvas.Brush.Color:=RGBToColor(255, 255, 255);
   Form1.Canvas.FillRect(20,20,700,360);


     Snake.Body[1].X:=140;
     Snake.Body[1].Y:=200;
     Snake.Body[2].X:=140-((2-1)*BlockSize);
     Snake.Body[2].Y:=200;
     Snake.Body[3].X:=140-((3-1)*BlockSize);
     Snake.Body[3].Y:=200;
end;

procedure TForm1.BDrawClick(Sender: TObject);
begin
    DrawGame();
    SnakeMove();

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
     NewGame();

end;

procedure TForm1.Image2Click(Sender: TObject);
begin

end;


end.

