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
    OraQueryTXFSP: TFloatField;
    OraQueryTXRSP: TFloatField;
    procedure FormShow(Sender: TObject);
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
  oraquery.Open
else
  exit;

LOCK_BOX_ZAM.Visible := false;

end;

end.
