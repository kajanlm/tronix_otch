unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, DB, DBAccess, Ora, MemDS, GridsEh;

type
  TForm3 = class(TForm)
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    DBGridEh1: TDBGridEh;
    OraQuery2: TOraQuery;
    DBGridEh2: TDBGridEh;
    OraDataSource2: TOraDataSource;
    OraQuery3: TOraQuery;
    OraDataSource3: TOraDataSource;
    OraQuery3NN: TIntegerField;
    OraQuery3TEXT: TStringField;
    OraQuery3ID_RABOT: TIntegerField;
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1CellClick(Column: TColumnEh);
    procedure DBGridEh2DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses Unit2;

{$R *.dfm}

procedure TForm3.FormShow(Sender: TObject);
begin
 OraQuery1.SQL.Text:='Select project_id, Name, Proekt, zavn from Tronix.Project_list order by zavn';
 OraQuery1.ExecSQL;



 end;

procedure TForm3.DBGridEh1CellClick(Column: TColumnEh);
begin
      OraQuery3.SQL.Text:='Select zak.nn ID_RABOT,zak.zak,zak.id_project,zak.name,FB.NN nn, FB.TEXT ZAK from Tronix.zakaz zak';
   OraQuery3.SQL.Add( 'LEFT JOIN   Tronix.FEB_NAME FB on FB.NN=zak.name');
   OraQuery3.SQL.Add(' where zak.ID_project='+#39+OraQuery1.FieldByName('project_id').asstring+#39);
  OraQuery3.ExecSQL;
 // ShowMessage('NN'+' '+OraQuery3.FieldByName('nn').asstring+' tx '+OraQuery3.FieldByName('zak').asstring);
end;

procedure TForm3.DBGridEh2DblClick(Sender: TObject);
begin
   Form2.Edit1.Text:=OraQuery1.FieldByName('NAme').AsString;
   Form2.Edit2.Text:=OraQuery3.FieldByName('ZAK').AsString;
   //Texkompl_id
   OraQuery2.SQL.Text:='Select NT.Texkompl_id as tex_id,nt1.Texkompl_id, NT.project_project_id, NT.texkompl_texkompl_id, NT.nomer, NT.name,NT.uch_uch_id,nt1.project_project_id from Nordsy.Texkompl nt1';
   OraQuery2.SQL.Add(' Right Join Nordsy.Texkompl NT2 on NT1.Texkompl_id=NT2.texkompl_texkompl_id ');
   OraQuery2.SQL.Add(' Right Join Nordsy.Texkompl NT on NT2.Texkompl_id=NT.texkompl_texkompl_id ');
   OraQuery2.SQL.Add('where NT1.project_project_id='+#39+OraQuery1.FieldByName('project_id').asstring+#39+' and NT1.uzak_uzak_id='+#39+OraQuery3.FieldByName('ID_RABOT').asstring+#39);

   OraQuery2.SQL.Add('order by NT.NOMER');
  
   OraQuery2.ExecSQL;
   Form2.Edit3.Text:=OraQuery2.FieldByName('Texkompl_id').asstring;
   Form2.up_level:=OraQuery2.FieldByName('Texkompl_id').asstring;

   //ShowMessage(IntToStr(OraQuery2.RecordCount));
   While NOT OraQuery2.EOF do begin
        Form2.Combobox1.Items.Add(OraQuery2.FieldByName('Nomer').AsString);
        OraQuery2.Next;
     end;
   Form3.Close;
end;

end.
