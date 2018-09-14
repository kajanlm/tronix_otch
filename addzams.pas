unit addzams;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, MemDS, DBAccess, Ora, GridsEh, DBGridEh,
  ExtCtrls, StdCtrls;

type
  Tzams = class(TForm)
    OraDataSource: TOraDataSource;
    OraQuery: TOraQuery;
    DBGridEh1: TDBGridEh;
    OraQueryMTR_NAME_ZAM: TStringField;
    OraQueryZAM: TFloatField;
    OraQueryZAM_UCHET: TFloatField;
    OraQueryPOTR: TFloatField;
    OraQueryPOTR_UCHET: TFloatField;
    OraQueryKOD_ZAM: TStringField;
    LOCK_BOX_ZAM: TPanel;
    DBGridEh2: TDBGridEh;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    OraDataSourceZams: TOraDataSource;
    OraQueryZams: TOraQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    LOCK_BOX_ZAMS: TPanel;
    Label3: TLabel;
    Panel3: TPanel;
    Label4: TLabel;
    Panel4: TPanel;
    OraDataSourceTX: TOraDataSource;
    OraQueryTX: TOraQuery;
    DBGridEh3: TDBGridEh;
    OraQueryTXTX_NOMER: TStringField;
    OraQueryTXTX_NAME: TStringField;
    OraQueryTXPOTR: TFloatField;
    LOCK_BOX_TX: TPanel;
    OraQueryTXFPOZ: TStringField;
    OraQueryTXRPOZ: TStringField;
    OraQueryTXfIDENT: TStringField;
    OraQueryTXrIDENT: TStringField;
    Panel5: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    procedure FormShow(Sender: TObject);
    procedure OraQueryTXAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    ZAM_FLAG : string;
  end;

var
  zams: Tzams;

implementation

{$R *.dfm}

procedure Tzams.FormShow(Sender: TObject);
begin

oraquerytx.Open;
if OraQuerytx.RecordCount > 0 then
  LOCK_BOX_TX.Visible := false
else
  oraquerytx.Close;

oraqueryzams.Open;
if OraQueryZams.RecordCount > 0 then
  LOCK_BOX_ZAMS.Visible := false
else
  oraqueryzams.Close;

if ZAM_FLAG = 'Y' then
  OraQuery.Open
else
  exit;

LOCK_BOX_ZAM.Visible := false;

end;

procedure Tzams.OraQueryTXAfterScroll(DataSet: TDataSet);

const
seNull = 'N/A';
seSpec = '—œ≈÷»‘» ¿÷»ﬂ';
sePoz = 'œŒ«»÷»ﬂ';

var

fIDENT,
rIDENT,
fPOZ,
rPOZ
: string;

begin

fIDENT := seSpec + ': ' + seNull;
rIDENT := seSpec + ': ' + seNull;

fPOZ := sePoz + ': ' + seNull;
rPOZ := sePoz + ': ' + seNull;

if dbgrideh3.DataSource.DataSet.FieldByName('fIDENT').asString <> '' then
  fIDENT := seSpec + ': ' + dbgrideh3.DataSource.DataSet.FieldByName('fIDENT').asString;

if dbgrideh3.DataSource.DataSet.FieldByName('rIDENT').asString <> '' then
  rIDENT := seSpec + ': ' + dbgrideh3.DataSource.DataSet.FieldByName('rIDENT').asString;

if dbgrideh3.DataSource.DataSet.FieldByName('fPOZ').asString <> '' then
  fPOZ := sePoz + ': ' + dbgrideh3.DataSource.DataSet.FieldByName('fPOZ').asString;

if dbgrideh3.DataSource.DataSet.FieldByName('rPOZ').asString <> '' then
  rPOZ := sePoz + ': ' + dbgrideh3.DataSource.DataSet.FieldByName('rPOZ').asString;

label13.Caption := rIDENT;
label15.Caption := rPOZ;

label14.Caption := fIDENT;
label16.Caption := fPOZ;

//Õ¿«¬¿Õ»≈ “≈’  ŒÃœÀ≈ “Œ¬ Õ≈ œŒÃ≈Ÿ¿≈“—ﬂ - »—œ–¿¬»“‹ (MB WITHOUT CENTOVKA)

end;

end.
