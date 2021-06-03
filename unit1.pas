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
  Directs = (N,W,E,S);
  Point = record
    X:integer;
    Y:integer;
  end;

  TSnake = record
    Face:Directs;
    Body:array[1..50] of array [1..50] of Point;
  end;


var
  SnakeColor: TColor;
  Map:array [1..20] of string;
  BlockSize:integer;
  i,j:integer;
  MapSize:integer;
  Snake:TSnake;
  LineSize:integer;



 procedure SnakeMove();
 begin

 end;


procedure DrawSnake();
begin
     Form1.Canvas.Brush.Color := SnakeColor;
     for i:= 1 to 50 do begin
         for j:= 1 to 50 do begin
                Form1.Canvas.FillRect(100,100,200,100);
         end;
     end;
end;

procedure DrawMap();
var
   CurOffSetX:integer;
   CurOffSetY:integer;
   Line:String;
begin
    CurOffSetY:=0;
    Form1.Canvas.Clear;
    Form1.Canvas.Brush.Color := 1;
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
    MapSize:=14;
    LineSize:=21;
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
    BlockSize:=20;
    SnakeColor := RGBToColor(206, 224, 166);


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

