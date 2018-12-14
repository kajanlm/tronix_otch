unit Unit8;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, Ora, Grids, DBGridEh, MemDS, StdCtrls, GridsEh;

type
  TForm8 = class(TForm)
    OraQuery1: TOraQuery;
    DBGridEh1: TDBGridEh;
    OraDataSource1: TOraDataSource;
    Label1: TLabel;
    CheckBox1: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation

uses Unit7;

{$R *.dfm}

procedure TForm8.FormShow(Sender: TObject);
begin
 OraQuery1.SQL.Text:='Select  zavn, Name  from Tronix.Project_list order by zavn';
 OraQuery1.ExecSQL;

end;

procedure TForm8.DBGridEh1DblClick(Sender: TObject);
begin
 Label1.Caption:=OraQuery1.FieldByName('zavn').asString;
 Form7.ShowModal();
end;

end.
