unit cnctbody;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MemDS, DBAccess, Ora, GridsEh, DBGridEh, StdCtrls;

type
  Ts_contract = class(TForm)
    DBGridEh1: TDBGridEh;
    DataSource: TOraDataSource;
    Query: TOraQuery;
    QueryKOL: TFloatField;
    QueryCENA: TFloatField;
    QueryKOL_UCHET: TFloatField;
    QueryCENA_UCHET: TFloatField;
    QueryNDS: TFloatField;
    QueryNAME: TStringField;
    QueryKOD: TStringField;
    QueryED: TStringField;
    QueryED_UCHET: TStringField;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FIRM_NAME,
    SELECTED_FIRM,
    GLOBAL_ID : string;
  end;

var
  s_contract: Ts_contract;

implementation

uses cnctinfo;

{$R *.dfm}

procedure Ts_contract.Button1Click(Sender: TObject);
begin
  Application.CreateForm(Tcntinfo, cntinfo);
  
  cntinfo.ShowModal();
  cntinfo.Free;

  modalResult := mrOk;
  self.close;
end;

end.
