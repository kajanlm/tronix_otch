unit r_over_tmc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, MemDS, DBAccess, Ora;

type
  Tover_tmc = class(TForm)
    cb_cehs: TComboBox;
    OraQueryS: TOraQuery;
    invi_cb_cehs: TComboBox;
    Button1: TButton;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  over_tmc: Tover_tmc;

implementation

{$R *.dfm}

uses Unit1;

procedure Tover_tmc.FormShow(Sender: TObject);
var
SQL : string;
begin
  SQL := 'select dep_id, nomer from kadry_dep where type_dep_type_dep_id = 2 order by nomer ASC';
  if not form1.execQuery(OraQueryS, SQL, false) then
    exit;

  while not OraQueryS.Eof do
  begin
    cb_cehs.Items.Add(OraQueryS.FieldByName('NOMER').asString);
    invi_cb_cehs.Items.Add(OraQueryS.FieldByName('DEP_ID').asString);

    OraQueryS.Next;
  end;
end;

end.
