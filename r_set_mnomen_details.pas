unit r_set_mnomen_details;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, math;

type
  Tset_mnomen_details = class(TForm)
    Label1: TLabel;
    edizm: TComboBox;
    Label2: TLabel;
    def: TLabel;
    need: TEdit;
    Label4: TLabel;
    Button1: TButton;
    invi_edizm: TComboBox;
    invi_need: TComboBox;
    invi_deficit: TComboBox;
    invi_zapas: TComboBox;
    invi_main_zapas: TComboBox;
    left_label: TLabel;
    left: TEdit;
    procedure edizmChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    RETURN_DATA : string;
    procedure Calc;
  end;

var
  set_mnomen_details: Tset_mnomen_details;

implementation

{$R *.dfm}

procedure Tset_mnomen_details.Calc;
begin
  def.Caption := invi_deficit.Items[edizm.ItemIndex];
  if not Button1.Visible then
  begin
    need.Text := invi_need.Items[edizm.ItemIndex];
    left.Text := floatToStr(strToFloat(invi_need.Items[edizm.ItemIndex]) - (strToFloat(invi_zapas.Items[edizm.ItemIndex]) - strToFloat(invi_main_zapas.Items[edizm.ItemIndex])));
    if (strtofloat(left.Text) < 0) then
      left.Text := '0';
  end
  else
    need.Text := invi_deficit.Items[edizm.ItemIndex]
end;

procedure Tset_mnomen_details.edizmChange(Sender: TObject);
begin
  Calc;
end;

procedure Tset_mnomen_details.Button1Click(Sender: TObject);
var
  need_value : double;
const
  ROUND_LEVEL = -5;
begin

  RETURN_DATA := '';

  need.text := StringReplace(need.text, '.', ',', [rfReplaceAll, rfIgnoreCase]);
  if not TryStrToFloat(need.Text, need_value) then
  begin
    showmessage('¬ведите корректное число!');
    exit;
  end;

  if need_value = 0 then
  begin
    showmessage('„исло должно быть больше 0!');
    exit;
  end;

  need_value := SimpleRoundTo(need_value, ROUND_LEVEL);
  if SimpleRoundTo((need_value - strtoFloat(invi_deficit.Items[edizm.ItemIndex])), ROUND_LEVEL) > 0 then
  begin
    showmessage('„исло должно быть не больше чем дефицит!');
    exit;
  end;

  if MessageDlg('Ѕ”ƒ№“≈ ¬Ќ»ћј“≈Ћ№Ќџ!' + #10#13 + '¬нести указанную номенклатуру как основную в размере: ' + floatToStr(need_value)
   + ' ' + edizm.Items[edizm.ItemIndex] + '?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    exit;

  RETURN_DATA := StringReplace(invi_zapas.Items[edizm.ItemIndex], ',', '.', [rfReplaceAll, rfIgnoreCase]) + ', ' + StringReplace(floattostr(need_value), ',', '.', [rfReplaceAll, rfIgnoreCase]) + ', ' + invi_edizm.Items[edizm.ItemIndex];

  ModalResult := mrOK;
  Self.Close;
end;

end.
