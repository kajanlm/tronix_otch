unit r_dcspcn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, MemDS, DBAccess, Ora, GridsEh, DBGridEh, ExtCtrls;

type
  TdocSpCnt = class(TForm)
    Query: TOraQuery;
    grid: TDBGridEh;
    dataSource: TOraDataSource;
    projectSearch: TEdit;
    projectFind: TButton;
    treeSearch: TEdit;
    treeFind: TButton;
    treeType: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    project: TLabel;
    gridTree: TDBGridEh;
    dataSourceTree: TOraDataSource;
    QueryTree: TOraQuery;
    create: TButton;
    blockMask: TPanel;
    procedure FormShow(Sender: TObject);
    procedure treeTypeChange(Sender: TObject);
    procedure projectFindClick(Sender: TObject);
    procedure gridDblClick(Sender: TObject);
    procedure treeFindClick(Sender: TObject);
    procedure createClick(Sender: TObject);
    procedure treeSearchChange(Sender: TObject);
  private
    { Private declarations }
    PROJECT_ID : string;
    procedure selectProjects;
    procedure ChangeTypeALock;
  public
    { Public declarations }
  end;

var
  docSpCnt: TdocSpCnt;

implementation

{$R *.dfm}

uses Unit1, t_utils;

procedure TdocSpCnt.ChangeTypeALock;
begin
  if treeType.ItemIndex = 0 then
    treeFind.Caption := 'Показать спецификации'
  else
    treeFind.Caption := 'Показать ПУЕ';

  QueryTree.Close;
  gridTree.Enabled := false;
  Create.Enabled := false;

  blockMask.Visible := true;
end;

procedure TdocSpCnt.selectProjects;
var SQL : string;
begin
  ChangeTypeALock;
  
  SQL := 'SELECT PROJECT_ID as ID, ZAVN as PROJECT, NAME FROM TRONIX.PROJECT_LIST WHERE DATE_END is null and ZAVN is not null ';

  if length(projectSearch.Text) > 0 then
  begin
    SQL := SQL + 'and ZAVN like ' + char(39) + '%' + AnsiUpperCase(projectSearch.Text) + '%' + char(39) + ' ';
  end;

  SQL := SQL + 'ORDER BY PROJECT ASC';
  form1.execQuery(Query, SQL, false);

end;

procedure TdocSpCnt.FormShow(Sender: TObject);
begin
  PROJECT_ID := '-1';
  PROJECT.Caption := 'ПРОЕКТ: не выбран';
  selectProjects;
end;

procedure TdocSpCnt.treeTypeChange(Sender: TObject);
begin
  ChangeTypeALock;
end;

procedure TdocSpCnt.projectFindClick(Sender: TObject);
begin
  selectProjects;
end;

procedure TdocSpCnt.gridDblClick(Sender: TObject);
begin
  PROJECT_ID := Query.FieldByName('ID').asString;
  PROJECT.Caption := 'ПРОЕКТ: ' + Query.FieldByName('PROJECT').AsString;

  ChangeTypeALock;
end;

procedure TdocSpCnt.treeFindClick(Sender: TObject);
var SQL : string;
begin
  if PROJECT_ID = '-1' then
  begin
    showMessage('Выберите проект!');
    exit;
  end;

  SQL := '';
  if treeType.ItemIndex = 0 then
    SQL := 'select * from (select DOCUMENT_ID as ID, IDENT as NAME, NAME as SRC from tronix.document WHERE ID_PROJECT = ' + PROJECT_ID + ') '
  else
    SQL := 'select * from (select TEXKOMPL_ID as ID, NOMER as NAME, NAME as SRC from tx_texkompl where PROJECT_PROJECT_ID = ' + PROJECT_ID + ') ';

  if length(treeSearch.Text) > 0 then
    SQL := SQL + 'WHERE name like ' + char(39) + '%' + AnsiUpperCase(treeSearch.Text) + '%' + char(39);

  SQL := SQL + ' ORDER BY NAME ASC';

  form1.execQuery(QueryTree, SQL, false);

  gridTree.Enabled := true;
  Create.Enabled := true;
  blockMask.Visible := false;
end;

procedure TdocSpCnt.createClick(Sender: TObject);
var ID : string;
begin
  ID := QueryTree.FieldByName('ID').asString;
  if ID <> '' then
  begin
    SP_DetailsTree(ID, (treeType.ItemIndex = 1));
    //self.Close;
  end
  else
    showMessage('Ошибка!');

end;

procedure TdocSpCnt.treeSearchChange(Sender: TObject);
begin
  ChangeTypeALock;
end;

end.
