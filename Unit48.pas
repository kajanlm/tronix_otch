unit Unit48;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, GridsEh, DBGridEh, DB, DBAccess, Ora, MemDS;

type
  TForm48 = class(TForm)
    TabControl1: TTabControl;
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    DBGridEh1: TDBGridEh;
    OraQuery1nomer: TStringField;
    OraQuery1dep: TStringField;
    OraQuery1date_dok: TStringField;
    OraQuery1data_vvoda: TStringField;
    OraQuery1data_otchet: TStringField;
    OraQuery1anul: TStringField;
    OraQuery1isp: TStringField;
    OraQuery1trudoem: TFloatField;
    procedure TabControl1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
  tex:string;
    { Public declarations }
  end;

var
  Form48: TForm48;

implementation

{$R *.dfm}

procedure TForm48.TabControl1Change(Sender: TObject);
var tx:string;
begin
//ShowMessage(IntTostr(TabControl1.TabIndex)+' '+tex);


tx:=' Select nomer, ';
tx:=tx+' (Select nomer from nordsy.dep where dep_id=dep_dep_id_to) dep, ';
tx:=tx+' to_char( date_dok,''DD.MM.YYYY'') date_dok, ';
tx:=tx+' to_char(date_ins,''DD.MM.YYYY'') data_vvoda, ';
tx:=tx+' to_char(user_date2,''DD.MM.YYYY'') data_otchet, ';
tx:=tx+' to_char(date_anul_nar,''DD.MM.YYYY'') anul, ';
tx:=tx+' decode(cadry_cadry_id_nar,null,(Select ident from tronix.firm where firm_id=post_post_id_nar),(Select fullname from nordsy.name where cadry_cadry_id=cadry_cadry_id_nar)) isp, ';
tx:=tx+' (Select trudoem from tronix.ttn_mat where ttn_ttn_id=ttn_id) trudoem ';
tx:=tx+' from tronix.ttn ';
tx:=tx+' where ';
tx:=tx+' texkompl_texkompl_id_nar in ';
tx:=tx+' (Select texkompl_id from ';
tx:=tx+' tx_texkompl ';
tx:=tx+' connect by prior texkompl_id=texkompl_texkompl_id ';
tx:=tx+' start with texkompl_id='+tex +')';
if TabControl1.TabIndex=1 then
tx:=tx+' and  user_date2 is not null';
if TabControl1.TabIndex=2 then
tx:=tx+' and  (date_ins is not null and user_date2 is  null)';
if TabControl1.TabIndex=3 then
tx:=tx+' and  (date_dok is not null and user_date2 is  null and date_ins is null)';
tx:=tx+' order by dep,nomer ';

     OraQuery1.SQL.Text:=tx;
  OraQuery1.ExecSQL;

end;

procedure TForm48.FormShow(Sender: TObject);
begin
  TabControl1Change(nil);
end;

procedure TForm48.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  OraQuery1.Close;
end;

end.
