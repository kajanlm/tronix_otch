unit BarCodesUnit;

interface

uses
  Windows, SysUtils, Classes, Graphics,Dialogs;

const
  vOdd = True;
  vEven = False;

type
  TBitEANSimbol = string[7];

  TOddEvenSheme = array[1..5] of Boolean;

  function EANNumberToLeftOdd(Value: Char): TBitEANSimbol;
  function EANNumberToLeftEven(Value: Char): TBitEANSimbol;
  function NumberToRight(Value: Char): TBitEANSimbol;
  function StrToEAN13(S: string): string;
  function StrToEAN8(S: string): string;

  
  function NumberToBinary(S: string): string;

  // На данный момент рисуются только EAN8 и EAN13
  procedure DrawBarCode(ABitmap: TBitmap; ARect: TRect; BarCode: string);

const

  BaseCodes: array[0..9] of TBitEANSimbol = (
   '0001101', '0011001', '0010011', '0111101', '0100011', '0110001', '0101111',
   '0111011', '0110111', '0001011');

  // Odd - True, Even - False
  OddEvenShemes: array[0..9] of TOddEvenSheme =
    ((vOdd, vOdd, vOdd, vOdd, vOdd),
     (vOdd, vEven, vOdd, vEven, vEven),
     (vOdd, vEven, vEven, vOdd, vEven),
     (vOdd, vEven, vEven, vEven, vOdd),
     (vEven, vOdd, vOdd, vEven, vEven),
     (vEven, vEven, vOdd, vOdd, vEven),
     (vEven, vEven, vEven, vOdd, vOdd),
     (vEven, vOdd, vEven, vOdd, vEven),
     (vEven, vOdd, vEven, vEven, vOdd),
     (vEven, vEven, vOdd, vEven, vOdd));

implementation




function StrToEAN13(S: string): string;
var
  OddEvenSheme: TOddEvenSheme;
  I: Integer;
begin
  if Length(S) <> 13 then
    raise Exception.Create('Код EAN-13 должен иметь 13 символов!');
  OddEvenSheme := OddEvenShemes[StrToInt(S[1])];
  Result := '101' + EANNumberToLeftOdd(S[2]);
  for I := 1 to 5 do
  begin
    if OddEvenSheme[I] then
      Result := Result + EANNumberToLeftOdd(S[I + 2]) else
        Result := Result + EANNumberToLeftEven(S[I + 2])
  end;
  Result := Result + '01010';

  for I := 8 to 13 do
    Result := Result + NumberToRight(S[I]);

  Result := Result + '101';   //ShowMEssage(Result);
end;

function EANNumberToLeftOdd(Value: Char): TBitEANSimbol;
begin
  Result := BaseCodes[StrToInt(Value)];
end;

function EANNumberToLeftEven(Value: Char): TBitEANSimbol;
var
  S: string;
  I: Integer;
begin
  S := NumberToRight(Value);
  // Переворачиваем разряды
  for I := 1 to 7 do
    Result[8 - I] := S[I];
end;

function NumberToRight(Value: Char): TBitEANSimbol;
var
  I: Integer;
begin
  Result := BaseCodes[StrToInt(Value)];
  // Инвертируем биты
  for I := 1 to 7 do
    if Result[I] = '0' then Result[I] := '1' else Result[I] := '0';
end;

function StrToEAN8(S: string): string;
var
  I: Integer;
begin
  if Length(S) <> 8 then
    raise Exception.Create('Код EAN-8 должен иметь 8 символов!');

  Result := '101';
  for I := 1 to 4 do
    Result := Result + EANNumberToLeftOdd(S[I]);

  Result := Result + '01010';

  for I := 5 to 8 do
    Result := Result + NumberToRight(S[I]);

  Result := Result + '101';
end;

function NumberToBinary(S: string): string;
begin
  if Length(S) = 13 then
    Result := StrToEAN13(S)
  else if Length(S) = 8 then
    Result := StrToEAN8(S)
  else
    raise Exception.Create('Штрих-код не поддерживается!');
end;

procedure DrawBarCode(ABitmap: TBitmap; ARect: TRect; BarCode: string);
var
  Bmp: TBitmap;
  Binary,sing: string;
  I: Integer;
  CurrentHeight,e: Integer;
  counter: array[0..5] of integer;
const
  LineWidth = 3;
  LineHeight = 100;

  LongPos13 = [1..3, 47..49, 93..95];
  LongPos8 = [1..3, 33..35, 65..67];
begin
  // Переводим в двоичный вид
  try
    Binary := NumberToBinary(BarCode);
  except
    Binary := '';
  end;
  e:=0;
  Bmp := TBitmap.Create;
  try
    if Binary = '' then
      Bmp.Width := 50 * LineWidth+20
    else
      Bmp.Width := Length(Binary) * LineWidth+20;
    Bmp.Height := Trunc(LineHeight * 1.2)+20;

    with Bmp.Canvas do
    begin
      Brush.Style := bsSolid;
      Brush.Color := clWhite;
      FillRect(Bmp.Canvas.ClipRect);
      Brush.Color := clBlack;
      Pen.Color := clBlack;
      if Binary = '' then
      begin
        Brush.Style := bsDiagCross;
        Rectangle(Bmp.Canvas.ClipRect);
      end;
      for I := 1 to Length(Binary) do
        if Binary[I] = '1' then
        begin
          if ((Length(BarCode) = 13) and  (I in LongPos13)) or
             ((Length(BarCode) = 8) and (I in LongPos8))
          then  begin
             CurrentHeight := Trunc(LineHeight * 1.2);
              counter[e]:=(I - 1) * LineWidth + LineWidth+10;
               e:=e+1;
             end
          else
             CurrentHeight := LineHeight;

          Rectangle((I - 1) * LineWidth+20, 0,
            (I - 1) * LineWidth + LineWidth+20, CurrentHeight);

        //     ShowMEssage(IntTostr((I-1)*LineWidth)+' 0 '+IntToStr((I - 1) * LineWidth + LineWidth)+','+IntToStr(CurrentHeight));
        end;
                 Brush.Style := bsClear;
          Font.Name := 'Tahoma';
          Font.Size := 18;
          Textout( 0, CurrentHeight-13, BarCode[1]);
          Textout( Counter[1]+15,CurrentHeight-13, BarCode[2]+' '+BarCode[3]+' '+BarCode[4]+' '+BarCode[5]+' '+BarCode[6]+' '+BarCode[7]);
          Textout( Counter[3]+15,CurrentHeight-13 , BarCode[8]+' '+BarCode[9]+' '+BarCode[10]+' '+BarCode[11]+' '+BarCode[12]+' '+BarCode[13]);
    end;

   // Image1.Picture := nil;
   // ABitmap.Width := 400;
   // ABitmap.Height := 200;

     //    ShowMEssage(intTostr(Counter[1])+' '+intTostr(Counter[3]));

    ABitmap.Canvas.CopyRect(ARect, Bmp.Canvas, Bmp.Canvas.ClipRect);

  finally
    Bmp.Free;
  end;

end;

end.

