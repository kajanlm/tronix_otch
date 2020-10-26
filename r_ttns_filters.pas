unit r_ttns_filters;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls;

type    
  Tdefttns_fltrs = class(TForm)
    zaprosheno: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    vydano: TEdit;
    Label3: TLabel;
    document: TEdit;
    Label4: TLabel;
    SKLAD: TEdit;
    Label5: TLabel;
    CEH: TEdit;
    zchk: TCheckBox;
    vchk: TCheckBox;
    dchk: TCheckBox;
    schk: TCheckBox;
    cchk: TCheckBox;
    Label6: TLabel;
    PUE: TEdit;
    pchk: TCheckBox;
    Label7: TLabel;
    CHERT: TEdit;
    spchk: TCheckBox;
    cancel: TButton;
    apply: TButton;
    Label8: TLabel;
    upe: TEdit;
    upchk: TCheckBox;
    procedure cancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure applyClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure setFiltersNull;
  public
    { Public declarations }
  end;

var
  defttns_fltrs: Tdefttns_fltrs;

implementation

{$R *.dfm}

uses r_ttns;

procedure Tdefttns_fltrs.FormShow(Sender: TObject);
begin
  (* ... *)
end;

procedure Tdefttns_fltrs.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //ModalResult := mrNone;
end;

procedure Tdefttns_fltrs.cancelClick(Sender: TObject);
begin
  setFiltersNull;
  defttns.NEED_UPDATE := true;
  
  self.Close;
end;

procedure Tdefttns_fltrs.setFiltersNull;
begin
  with defttns do
  begin
    fBuffer_KOD := '(1 = 1)';
    fBuffer_VYD := '(1 = 1)';
    fBuffer_DOC := '(1 = 1)';
    fBuffer_CEH := '(1 = 1)';
    fBuffer_SKLAD := '(1 = 1)';
    fBuffer_PUE := '(1 = 1)';
    fBuffer_CHERT := '(1 = 1)';
    fBuffer_UPE := '(1 = 1)';
  end;
end;

procedure Tdefttns_fltrs.applyClick(Sender: TObject);

const
  cTable = 'A_TTNS.';

begin
  if zchk.Checked then
    defttns.fBuffer_KOD := cTable + 'KOD like ' + char(39) + '%' + zaprosheno.Text + '%' + char(39)
  else
    defttns.fBuffer_KOD := '(1 = 1)';

  if vchk.Checked then
    defttns.fBuffer_VYD := cTable + 'VYD like ' + char(39) + '%' + vydano.Text + '%' + char(39)
  else
    defttns.fBuffer_VYD := '(1 = 1)';

  if dchk.Checked then
    defttns.fBuffer_DOC := cTable + 'NOMER like ' + char(39) + '%' + document.Text + '%' + char(39)
  else
    defttns.fBuffer_DOC := '(1 = 1)';

  if schk.Checked then
    defttns.fBuffer_SKLAD := cTable + 'SKLAD like ' + char(39) + '%' + SKLAD.Text + '%' + char(39)
  else
    defttns.fBuffer_SKLAD := '(1 = 1)';

  if cchk.Checked then
    defttns.fBuffer_CEH := cTable + 'CEH like ' + char(39) + '%' + CEH.Text + '%' + char(39)
  else
    defttns.fBuffer_CEH := '(1 = 1)';

  if pchk.Checked then
    defttns.fBuffer_PUE := cTable + 'PUE like ' + char(39) + '%' + pue.Text + '%' + char(39)
  else
    defttns.fBuffer_PUE := '(1 = 1)';

  if spchk.Checked then
    defttns.fBuffer_CHERT := cTable + 'CHERT like ' + char(39) + '%' + chert.Text + '%' + char(39)
  else
    defttns.fBuffer_CHERT := '(1 = 1)';

  if upchk.Checked then
    defttns.fBuffer_UPE := cTable + 'UPE like ' + char(39) + '%' + upe.Text + '%' + char(39)
  else
    defttns.fBuffer_UPE := '(1 = 1)';

  defttns.NEED_UPDATE := true;
  self.Close;
  
end;

end.
