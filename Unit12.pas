unit Unit12;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGridEh, DBAccess, Ora, MemDS, StdCtrls, GridsEh;

type
  TForm12 = class(TForm)
    Label1: TLabel;
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    DBGridEh1: TDBGridEh;
    OraQuery1PROJECT_ID: TIntegerField;
    OraQuery1PROJECT: TStringField;
    OraQuery1NAME: TStringField;
    procedure DBGridEh1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form12: TForm12;

implementation

uses Unit13;

{$R *.dfm}

procedure TForm12.DBGridEh1DblClick(Sender: TObject);
begin
  form13.Caption:='Отчет по проектам в разрезе чертежей. Про проекту '+oraQuery1.FieldByName('Name').asString;
  form13.ShowModal();
end;

end.
