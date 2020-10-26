unit Unit44;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, MemTableDataEh, Db, GridsEh, DBGridEh, MemTableEh,
  DataDriverEh, DBAccess, Ora, MemDS, Mask, DBCtrlsEh, DBLookupEh, EhLibMTE;

type
  TForm44 = class(TForm)
    Label1: TLabel;
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    DataSetDriverEh1: TDataSetDriverEh;
    MemTableEh1: TMemTableEh;
    DBGridEh1: TDBGridEh;
    OraQuery2: TOraQuery;
    OraQuery3: TOraQuery;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    DBLookupComboboxEh2: TDBLookupComboboxEh;
    OraQuery4: TOraQuery;
    OraDataSource2: TOraDataSource;
    OraQuery5: TOraQuery;
    OraDataSource3: TOraDataSource;
    CheckBox1: TCheckBox;
    Button1: TButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure OraQuery1AfterPost(DataSet: TDataSet);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
   FUNCTION Checker(d: String):String ;
   FUNCTION Checker_down(d: String):String ;
    procedure DBLookupComboboxEh1Change(Sender: TObject);
    procedure DBLookupComboboxEh2Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
   death:integer;
  public
    { Public declarations }
  end;

var
  Form44: TForm44;

implementation

uses Unit1;

{$R *.dfm}

function  TForm44.Checker_down(d:String):string;
 var texk:string;
begin
   texk:=DBGridEH1.SelectedField.FieldName;
Delete(texk, 1, 1);


OraQuery2.SQL.Text:='Select ''есть  позиция  ''||(Select ident from tronix.document where document_id=nnn)||'' поз ''||';
OraQuery2.SQL.Add(' poz as result');
OraQuery2.SQL.Add(' from ');
OraQuery2.SQL.Add(' ( ');
OraQuery2.SQL.Add(' Select tex_texkompl_id,sp_sp_id, (Select nnn from tronix.sp where nn=sp_sp_id) nnn, ');
OraQuery2.SQL.Add(' (Select poz||'' ''||podpoz from tronix.sp where nn=sp_sp_id) poz  ');
OraQuery2.SQL.Add(' from nordsy.tx_mat ');
OraQuery2.SQL.Add(' where tex_texkompl_id='+texk);
OraQuery2.SQL.Add(' and sp_sp_id in ( ');
OraQuery2.SQL.Add(' Select nn from tronix.sp  ');
OraQuery2.SQL.Add(' connect by prior nn=up_nn ');
OraQuery2.SQL.Add(' start with nn='+DBGridEH1.datasource.DataSet.FieldByName('nn').Asstring+') ');
OraQuery2.SQL.Add(' )');
OraQuery2.SQL.Add(' where sp_sp_id <>' +DBGridEH1.datasource.DataSet.FieldByName('nn').Asstring);
OraQuery2.ExecSQL;
if  OraQuery2.RecordCount>0 then
  begin
      OraQuery2.First;
      while OraQuery2.Eof=false do begin
      result:=result+' '+OraQuery2.FieldByName('result').AsString;
      OraQuery2.Next;
      end;
   ShowMessage('Не могу произвести изменения!!! '+result);
    exit;
  end;
end;

function  TForm44.Checker(d:String):string;
 var texk:string;
begin

texk:=DBGridEH1.SelectedField.FieldName;
Delete(texk, 1, 1);


OraQuery2.SQL.Text:='Select ''Эта позиция привязана группой ''||(Select ident from tronix.document where document_id=nnn)||'' поз ''||';
OraQuery2.SQL.Add(' poz as result');
OraQuery2.SQL.Add(' from ');
OraQuery2.SQL.Add(' ( ');
OraQuery2.SQL.Add(' Select tex_texkompl_id,sp_sp_id, (Select nnn from tronix.sp where nn=sp_sp_id) nnn, ');
OraQuery2.SQL.Add(' (Select poz||'' ''||podpoz from tronix.sp where nn=sp_sp_id) poz  ');
OraQuery2.SQL.Add(' from nordsy.tx_mat ');
OraQuery2.SQL.Add(' where tex_texkompl_id='+texk);
OraQuery2.SQL.Add(' and sp_sp_id in ( ');
OraQuery2.SQL.Add(' Select nn from tronix.sp  ');
OraQuery2.SQL.Add(' connect by prior up_nn=nn ');
OraQuery2.SQL.Add(' start with nn='+DBGridEH1.datasource.DataSet.FieldByName('nn').Asstring+') ');
OraQuery2.SQL.Add(' )');
OraQuery2.SQL.Add(' where sp_sp_id <>' +DBGridEH1.datasource.DataSet.FieldByName('nn').Asstring);

OraQuery2.ExecSQL;
if  OraQuery2.RecordCount>0 then
  begin
      OraQuery2.First;
      if Copy(OraQuery2.FieldByName('result').AsString,1,29)='Эта позиция привязана группой' then  ShowMessage(OraQuery2.FieldByName('result').AsString);
     Result:= OraQuery2.FieldByName('result').AsString;
     end;

 end;

procedure TForm44.FormShow(Sender: TObject);
var tx1,tx,dec,dec0,sum,inu,tx2:string;
name_kol: array[1..100] of string;
i,e,l,l1:integer;
begin
 // MEMTableEh1.ReadOnly:=true;
 // OraQuery1.ReadOnly:=true;
 death:=0;
 tx1:='';
 CheckBox1.Checked:=false;
if  (Form1.OraSession1.Username='36048') or (Form1.OraSession1.Username='36086') or (Form1.OraSession1.Username='36039')
or (Form1.OraSession1.Username='36052') or (Form1.OraSession1.Username='36100') then
 begin
  showMessage('Добро пожаловать!');
  OraQuery1.ReadOnly:=false;
    MEMTableEh1.ReadOnly:=false;
 end;
//if Form1.OraSession1.Username='84013'then
// button1.Visible:=true;

 With TStringField.Create(DBGridEH1) do
   begin
    FieldName := 'doc';
    Size := 45  ;
      DataSet:=MemTableEH1;
    FieldKind:=fkDAta;

  end;

 With TStringField.Create(DBGridEH1) do
   begin
    FieldName := 'poz';
    Size := 10  ;
      DataSet:=MemTableEH1;
    FieldKind:=fkDAta;
  end;

   With TStringField.Create(DBGridEH1) do
   begin
    FieldName := 'name';
    Size := 60  ;
      DataSet:=MemTableEH1;
    FieldKind:=fkDAta;
  end;
     With TFloatField.Create(DBGridEH1) do
   begin
    FieldName := 'nn';
      DataSet:=MemTableEH1;
    FieldKind:=fkDAta;
    Visible:=false;
  end;
 //   OraQuery1.ReadOnly:=false;
//    MEMTableEh1.ReadOnly:=false;
 ////////////////////////////////////////////////////////////////////////////
if Form1.OraSession1.Username='84013'then
  begin
    With TStringField.Create(DBGridEH1) do
  begin
    FieldName := 'kart';
    Size := 45  ;
    FieldKind:=fkData;
    DataSet:=MemTableEH1;
   //fkCalculated;
  //   ReadOnly:=true;
  Button1.Visible:=true;
  Button2.Visible:=true;
 end;

   end;

tx:=' Select texkompl_id, nomer  from tx_texkompl where texkompl_texkompl_id='+Label1.Caption+' order by nomer';
OraQuery1.SQL.Text:=tx;
OraQuery1.ExecSQL;
OraQuery1.First;  I:=1;
While not OraQuery1.Eof Do begin
     With TFloatField.Create(DBGridEH1) do
   begin
    FieldName := 't'+OraQuery1.FieldByName('texkompl_id').AsString;
      DataSet:=MemTableEH1;
    FieldKind:=fkDAta;
  end;
  dec:=dec+',decode( tex_texkompl_id ,'+OraQuery1.FieldByName('texkompl_id').AsString+',1,0) t'+ OraQuery1.FieldByName('texkompl_id').AsString;
  dec0:= dec0+',0 t'+OraQuery1.FieldByName('texkompl_id').AsString;
  sum:=sum+', sum( t'+OraQuery1.FieldByName('texkompl_id').AsString+') t'+ OraQuery1.FieldByName('texkompl_id').AsString;
  inu:=inu+','+OraQuery1.FieldByName('texkompl_id').AsString;
   name_kol[i]:=OraQuery1.FieldByName('nomer').asString;
   inc(i);
 OraQuery1.Next;
end;
Delete(inu, 1, 1);
   tx1:=' Select ''Все'' ident, null document_id from dual ';
   tx1:=tx1+' union all ';
   tx1:=tx1+' Select  distinct ident, document_id  from tronix.document ';
   tx1:=tx1+' where document_id in ( ';
   tx1:=tx1+' Select nnn from tronix.sp where ';
   tx1:=tx1+'  nn in( ';
   tx1:=tx1+' Select sp_sp_id from nordsy.tx_mat ';
   tx1:=tx1+' where tex_texkompl_id in ';
   tx1:=tx1+' (Select texkompl_id from tx_texkompl ';
   tx1:=tx1+' connect by prior texkompl_id=texkompl_texkompl_id ';
   tx1:=tx1+' start with texkompl_id='+Label1.Caption+')))';
   tx1:=tx1+' order by ident';
   OraQuery4.SQL.Text:=tx1;
   OraQuery4.ExecSQL;


tx:=' Select nn, up_nn,(Select ident from tronix.document where document_id=nnn)  doc, ';
tx:=tx+' poz, ';
tx:=tx+' name'+sum+', ''                      '' as kart' ;
tx:=tx+' from ( ';
tx:=tx+' Select nn, up_nn,name,nnn,poz ';
tx:=tx+ dec;
tx:=tx+' from ';
tx:=tx+'    ( ';
tx:=tx+' Select nn, up_nn, tex_texkompl_id,name,nnn,poz from ';
tx:=tx+' (Select sp.nn nn, sp.up_nn up_nn, sp.name, sp.nnn, sp.poz||'' ''||sp.podpoz poz ';
tx:=tx+' from tronix.sp ';
tx:=tx+' connect by prior sp.nn=sp.up_nn ';
tx:=tx+' start with sp.nn in ( ';
tx:=tx+' Select  sp_sp_id from nordsy.tx_mat ';
tx:=tx+'  where tex_texkompl_id in ('+inu+') ';
tx:=tx+' and type_relation_type_relation_id in (3,19)) ';
tx:=tx+' group by sp.nn, sp.up_nn , sp.name, sp.nnn, sp.poz||'' ''||sp.podpoz ), ';
tx:=tx+' nordsy.tx_mat ';
tx:=tx+' where nn=sp_sp_id ';
tx:=tx+' and tex_texkompl_id in ('+inu+') ';
tx:=tx+' ) ';
tx:=tx+' union all ';
tx:=tx+' Select nn, up_nn,name,nnn,poz ';
tx:=tx+ dec0;
tx:=tx+' from ';
tx:=tx+'    ( ';
tx:=tx+' Select sp.nn , sp.up_nn up_nn, sp.name, sp.nnn, sp.poz||'' ''||sp.podpoz poz ';
tx:=tx+' from tronix.sp, ';
tx:=tx+' (Select sp.nn ';
tx:=tx+' from tronix.sp ';
tx:=tx+' connect by prior sp.up_nn=sp.nn ';
tx:=tx+' start with sp.nn in ( ';
tx:=tx+' Select  sp_sp_id from nordsy.tx_mat ';
tx:=tx+'  where tex_texkompl_id in ('+inu+') ';
tx:=tx+' and type_relation_type_relation_id in (3,19)) ';
tx:=tx+' group by  sp.nn)  nn ';
tx:=tx+' where sp.nn=nn.nn ';
tx:=tx+' and type_str is not null ';
tx:=tx+' ) ';
///////////////////****************************************
tx:=tx+' union all ';
tx:=tx+'  Select sp.nn , sp.up_nn up_nn, sp.name, sp.nnn, sp.poz||'' ''||sp.podpoz poz ';
tx:=tx+ dec0;
tx:=tx+' from tronix.sp, ';
tx:=tx+' (Select sp.nn ';
tx:=tx+' from tronix.sp ';
tx:=tx+' connect by prior sp.nn=sp.up_nn ';
tx:=tx+' start with sp.nn in ( ';
tx:=tx+' Select  sp_sp_id from nordsy.tx_mat ';
tx:=tx+'  where tex_texkompl_id in ('+inu+') ';
tx:=tx+' and type_relation_type_relation_id in (3,19)) ';
tx:=tx+' group by  sp.nn)  nn ';
tx:=tx+' where sp.nn=nn.nn ';

///********************************************************
tx:=tx+' ) group by nn, up_nn,name, nnn, poz order by doc,poz';
 // ShowMessage(tx);
 // memo1.Text:=tx;
 OraQuery1.SQL.Text:=tx;   e:=1;
OraQuery1.ExecSQL;
MemTableEh1.TreeList.Active := True;
 MemTableEh1.Open;
    DBGridEh1.Columns[0].Title.Caption :='Чертеж';
   DBGridEh1.Columns[1].Title.Caption :='Позиция';
   DBGridEh1.Columns[2].Title.Caption :='Наименование';
 if Form1.OraSession1.Username='84013'then
  begin
  DBGridEh1.Columns[3].Title.Caption :='Карта';
  l:=3;l1:=2;
  end
 else
 begin
 l:=2; l1:=1;
 end;
    While (e+l)<=(i+l1) do begin
         DBGridEh1.Columns[e+l].Title.Caption :=name_kol[e];
         inc(e);
    end;
   if Form1.OraSession1.Username='84013'then
  begin

  // While Not OraQuery6.Eof  Do Begin
  // DBGridEh1.Columns[3].PickList.Add(OraQuery6.FieldByName('Nomer').AsString);
  // DBGridEh1.Columns[3].PickList.Add('387_50В9');
 // ShowMessage(OraQuery6.FieldByName('Nomer').AsString);
   // OraQuery6.Next;
  // end;
  end;
end;

procedure TForm44.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   ShowMessage('Теперь необходимо проверить и поправить маршруты позиций!');
 MEMTableEh1.ReadOnly:=true;
 OraQuery1.ReadOnly:=true;
 DBGridEH1.DataSource.DataSet.Filtered := False;
    OraQuery4.Close;
   OraQuery5.Close;
   OraQuery1.Close;
   DBGridEh1.DataSource.DataSet:=nil;
MemTableEh1.Close;
DBGridEh1.DataSource.DataSet:=MemTableEh1;
   OraQuery1.Fields.Clear;
  MemTableEh1.Fields.Clear;
   OraQuery2.Close;


end;

procedure TForm44.DBGridEh1DblClick(Sender: TObject);
var tx:string;
begin
//  ShowMEssage(IntTostr(DbgridEH1.SelectedField.FieldNo));
  if Form1.OraSession1.Username<>'84013'then
begin
 if (DbgridEH1.SelectedField.FieldNo=3) or (DbgridEH1.SelectedField.FieldNo=4)then
 exit;

 if DBGridEH1.datasource.DataSet.FieldByName(DBGridEH1.SelectedField.FieldName).AsString='1' then
 begin

          if length(Checker_down('f'))>0 then  exit;

                  if death=1 then
                   begin
                       death:=0;exit;
                  end;

   tx:='Select tx_mat_id from nordsy.tx_mat where  tex_texkompl_id='+Copy(DBGridEH1.SelectedField.FieldName,2,Length(DBGridEH1.SelectedField.FieldName));
   tx:=tx+' and  sp_sp_id='+DBGridEH1.datasource.DataSet.FieldByName('nn').Asstring;
   tx:=tx+ 'and type_relation_type_relation_id=3 ';
    OraQuery2.SQL.Text:=tx;
     OraQuery2.ExecSQL;
   if  (OraQuery2.RecordCount=0) or (OraQuery2.RecordCount>1) then
       begin
         ShowMessage('Не могу удалить запись из базы!!! Позиция имеет признак отличный от -- доработать');
            exit;
       end;


    DBGridEH1.DataSource.DataSet.edit;
    DBGridEH1.datasource.DataSet.FieldByName(DBGridEH1.SelectedField.FieldName).Value:='0';
     DBGridEH1.DataSource.DataSet.post;


      end
  else if DBGridEH1.datasource.DataSet.FieldByName(DBGridEH1.SelectedField.FieldName).AsString='0' then
 begin
        if Copy(Checker('f'),1,29)='Эта позиция привязана группой' then
            exit;
          if length(Checker_down('f'))>0 then  exit;
         if death=1 then begin
      death:=0;Exit;
       end;
    DBGridEH1.DataSource.DataSet.edit;
    DBGridEH1.datasource.DataSet.FieldByName(DBGridEH1.SelectedField.FieldName).Value:='1';
   DBGridEH1.DataSource.DataSet.post;

  end;
     end;
 end;
procedure TForm44.OraQuery1AfterPost(DataSet: TDataSet);
var tx,tx1:string;
begin
//if   Form1.OraSession1.Username='84013'then
//  begin
//    if DBGridEH1.SelectedField.FieldName='kart'  then
//     begin
//       DBGridEH1.datasource.DataSet.FieldByName('kart').value:=DBGridEH1.datasource.DataSet.FieldByName('kart').value;
//       ShowMEssage('');
//    end
//  end;
if   Form1.OraSession1.Username<>'84013'then
  begin
tx:='';
if  DBGridEH1.datasource.DataSet.FieldByName(DBGridEH1.SelectedField.FieldName).Asstring='1' then
  begin
    tx:='insert into nordsy.tx_mat (tx_mat_id,tex_texkompl_id,sp_sp_id, type_relation_type_relation_id)';
    tx:=tx+' VALUES (nordsy.tx_mat_seq.nextval,'+Copy(DBGridEH1.SelectedField.FieldName,2,Length(DBGridEH1.SelectedField.FieldName));
    tx:=tx+', '+DBGridEH1.datasource.DataSet.FieldByName('nn').Asstring;
    tx:=tx+', 3)';


  Form1.OraSession1.StartTransaction ;
 try
   try
     OraQuery2.SQL.Text:=tx;
      OraQuery2.Execute;
     Form1.OraSession1.Commit ;
   finally
      OraQuery2.Close;
     end;
  except
   On e : EDatabaseError do
   begin
   Form1.OraSession1.Rollback;
     death:=1; messageDlg(e.message, mtError,[mbOK],0);
    end;
end;
  end;

  if  DBGridEH1.datasource.DataSet.FieldByName(DBGridEH1.SelectedField.FieldName).Asstring='0' then
  begin
   tx:='Delete from nordsy.tx_mat where tex_texkompl_id='+Copy(DBGridEH1.SelectedField.FieldName,2,Length(DBGridEH1.SelectedField.FieldName));
   tx:=tx+' and sp_sp_id='+DBGridEH1.datasource.DataSet.FieldByName('nn').Asstring;
   tx:=tx+' and type_relation_type_relation_id=3 ' ;
  Form1.OraSession1.StartTransaction ;
 try
   try
     OraQuery2.SQL.Text:=tx; // ShowMessage(tx);
      OraQuery2.Execute;
     Form1.OraSession1.Commit ;

   finally
      OraQuery2.Close;
     end;
  except
   On e : EDatabaseError do
   begin
   Form1.OraSession1.Rollback;
     death:=1; messageDlg(e.message, mtError,[mbOK],0);
    end
end;
  end;

     end;
end;

procedure TForm44.DBGridEh1KeyPress(Sender: TObject; var Key: Char);
begin
     Key:=#0;

  end;

procedure TForm44.DBLookupComboboxEh1Change(Sender: TObject);
var tx:string;
begin
 with DBGRIDEH1 do
   begin
    DataSource.DataSet.Filtered := False;

    if OraQuery4.FieldValues['ident']=null then exit;
   DataSource.DataSet.Filter := 'doc = '+chr(39)+String(OraQuery4.FieldValues['ident']+chr(39));
  DataSource.DataSet.Filtered := true;
   end;


 if  OraQuery4.FieldValues['document_id']=null then
   begin
    DBGRIDEH1.DataSource.DataSet.Filtered := false;
    OraQuery5.Close;
    exit;
   end;

  OraQuery5.Close;
tx:= 'Select null nn,  ''Все'' poz1 from dual  ';
tx:=tx+' union all ';
tx:=tx+' Select nn, poz1 from ( ';
tx:=tx+'   Select nn, poz||'' ''||podpoz poz1  from ( ';
tx:=tx+' Select nn, poz,podpoz  from tronix.sp where ';
tx:=tx+' nn in( ';
tx:=tx+' Select sp_sp_id from nordsy.tx_mat ';
tx:=tx+' where tex_texkompl_id in ';
tx:=tx+' (Select texkompl_id from tx_texkompl ';
tx:=tx+' connect by prior texkompl_id=texkompl_texkompl_id ';
tx:=tx+' start with texkompl_id='+Label1.Caption+'))';
tx:=tx+' and nnn='+String(OraQuery4.FieldValues['document_id'])+') ';
tx:=tx+' order by decode(translate(poz, ''_0123456789'', ''_''), null, to_number(poz)), poz )';
 OraQuery5.SQL.Text:=tx;
OraQuery5.ExecSQL;OraQuery5.first; DBLookupComboboxEh2.KeyValue:=OraQuery5.FieldValues['poz1'];
DBLookupComboboxEh2Change(nil);

end;

procedure TForm44.DBLookupComboboxEh2Change(Sender: TObject);
begin
  with DBGRIDEH1 do
   begin
    DataSource.DataSet.Filtered := False;
     if OraQuery5.FieldValues['poz1']=null then exit; //ShowMessage(String(OraQuery5.FieldValues['poz1']));
      if OraQuery5.FieldValues['poz1']='Все' then
       begin
       DataSource.DataSet.Filter := 'doc = '+chr(39)+String(OraQuery4.FieldValues['ident']+chr(39));
       DataSource.DataSet.Filtered := true;
       exit;
       end;
   DataSource.DataSet.Filter := 'doc = '+chr(39)+String(OraQuery4.FieldValues['ident']+chr(39))+'and poz = '+chr(39)+String(OraQuery5.FieldValues['poz1']+chr(39));
    DataSource.DataSet.Filtered := true;
    //ShowMessage('doc = '+chr(39)+String(OraQuery4.FieldValues['ident']+chr(39))+'and poz = '+chr(39)+String(OraQuery5.FieldValues['poz1']+chr(39)));
end;
 end;

 procedure TForm44.CheckBox1Click(Sender: TObject);
begin
   if CheckBox1.Checked=true then
    MemTableEh1.TreeList.Active:=false
Else
MemTableEh1.TreeList.Active:=true;
end;

procedure TForm44.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
if Rect.Top=DBGridEh1.CellRect(DBGridEh1.Col,DBGridEh1.Row).Top then
begin
DBGridEh1.Canvas.Brush.Color:=clGray;
DBGridEh1.Canvas.Font.Color:=clWhite;
end;
DBGridEh1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;



procedure TForm44.Button1Click(Sender: TObject);
var f:textfile;
buf: string[80];
begin

if OpenDialog1.Execute then
begin
AssignFile(F, OpenDialog1.FileName);
Reset(F);
DBGridEh1.Columns[3].PickList.Clear;
while not EOF(f) do
  begin
    readln(f, buf);
     DBGridEh1.Columns[3].PickList.Add(buf);
  end;

  CloseFile(f);
end;
 end;

procedure TForm44.Button2Click(Sender: TObject);
var f:textfile;
i:integer;
to_file:string;
begin
 SaveDialog1.DefaultExt:='*.c_lst';
 if SaveDialog1.Execute then
      begin
       AssignFile(f, SAveDialog1.FileName);
      Rewrite(F);
  DBGridEh1.DataSource.DataSet.Filtered:=false;
  for i:= 0 to MemTableEh1.RecordsView.MemTableData.RecordsList.Count-1 do
  begin
 // if NOT
  if NOT VarIsNull(trim(MemTableEh1.RecordsView.MemTableData.RecordsList[i].
     DataValues['kart', dvvValueEh])) then
        begin
           to_file:=MemTableEh1.RecordsView.MemTableData.RecordsList[i].
      DataValues['kart', dvvValueEh];
           to_file:=Trim(to_file);
         if     to_file<>'' then
           begin
            to_file:=to_file+';'+trim(MemTableEh1.RecordsView.MemTableData.RecordsList[i].
      DataValues['doc', dvvValueEh])+';'+
            trim(MemTableEh1.RecordsView.MemTableData.RecordsList[i].
      DataValues['poz', dvvValueEh]);
          writeLn(f,to_file);
          end;
          end;
          end;
           CloseFile(f);
     end;

end;

procedure TForm44.Button3Click(Sender: TObject);
var
fl,st,kart_no,chertezh,poz:string;
TextF:textFile;
kart_leght, chertezh_leght:integer;
SearchOptions: TLocateOptions;
begin


             SearchOptions := [loPartialKey];



         if openDialog1.Execute
              then
                begin
             AssignFile(TextF, openDialog1.FileName);
               reset(TextF);
               {$I-}
                  if IOResult<>0 then
                         begin
                           ShowMessage('Ошибка открытия файла ');
                           Exit;
                         end;

                          MemTableEh1.TreeList.FullExpand;
                  While not EOF(TextF) do
                   begin
                      ReadLn(TextF,st);
                     kart_no:=Copy(st,1,Pos(';',st)-1);
                     kart_leght:=Length(kart_no);
                      chertezh:=copy(st,kart_leght+2,Pos(';',copy(st,kart_leght+2,Length(st)-1))-1);//,1,Pos(';',st)-1);
                     chertezh_leght:=Length(chertezh);
                      poz:=copy(st,kart_leght+chertezh_leght+3,Length(st));

              //        ShowmEssage(chertezh+' '+poz);
              //  if MemTableEh1.TreeList.Locate('poz',poz, SearchOptions)= true then
                    if MemTableEh1.Locate('doc;poz',VarArrayOf([chertezh,poz]), SearchOptions)= true then
                      begin
                     DBGridEH1.DataSource.DataSet.edit;
                     MemTableEh1.FieldByName('kart').Value:=kart_no;
                     DBGridEH1.DataSource.DataSet.post;
                     end
                 else
                 ShowMEssage('Не могу найти  '+chertezh+' поз'+poz);
               end;
               CloseFile(TextF);


 end;
end;

procedure TForm44.Button4Click(Sender: TObject);
var i,pravka,faska,skruglenie,gibka:integer;

begin



//Изготовление деталей запуска    Техкомплект     З001
//Предварительная обработка       Бригадокомплект З801
//Резка деталей на МТР    Бригадокомплект З802
//Резка деталей по ручной разметке        Бригадокомплект З804
////Ф- З805
///////////////////////П- З806
///С-З807
//Правка деталей, вырезаемых по ручной разметке   Бригадокомплект З808
///Разметка и резка деталей из профиля     Бригадокомплект З809
///Г- З810
//Горячая гибка деталей   Бригадокомплект З811
//Зачистка деталей от грата       Бригадокомплект З813
//Комплектация деталей с МТР      Бригадокомплект З812


   with DBGRIDEH1 do
   begin
  OptionsEh:=DBGrideh1.Optionseh+[dghMultiSortMarking];
///*************************ПРАВКА
  for i:=0 to Columns.Count-1 do   begin
     if copy(trim(Columns[i].Title.Caption),5,4) = copy('100-З806-001',5,4) then   pravka:=i;//правка
     if copy(trim(Columns[i].Title.Caption),5,4) = copy('100-З805-001',5,4) then   faska:=i;//фаска
     if copy(trim(Columns[i].Title.Caption),5,4) = copy('100-З807-001',5,4) then   skruglenie:=i;//Скругление
     if copy(trim(Columns[i].Title.Caption),5,4) = copy('100-З810-001',5,4) then   gibka:=i;//Гибка
 end;
/////////////////////////////////////////////

//ShowMEssage(IntTostr(pravka)+' f '+IntTostr(faska)+' s '+IntTostr(skruglenie)+' g '+IntTostr(gibka));


//   Columns[1].Title.SortIndex := 2;
  Columns[0].Title.SortMarker:= smUpEh;
    Columns[1].Title.SortMarker:= smDownEh;
   Columns[3].Title.SortMarker:= smupEh;
 Columns[0].Title.SortIndex := 2;
  Columns[1].Title.SortIndex := 3;
 Columns[3].Title.SortIndex := 1;
 Columns[pravka].Title.SortIndex := 4;
 Columns[faska].Title.SortIndex := 5;
 Columns[skruglenie].Title.SortIndex := 6;
 Columns[gibka].Title.SortIndex := 7;
  DBGridEh1.SortLocal:=true;
        DefaultApplySorting;
     //     ApplyFilter;
   end;
end;

end.
