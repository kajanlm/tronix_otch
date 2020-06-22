unit r_dcspcn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, MemDS, DBAccess, Ora;

type
  TdocSpCnt = class(TForm)
    Query: TOraQuery;
    projects: TComboBox;
    invi_projects: TComboBox;
    documents: TComboBox;
    invi_documents: TComboBox;
    search: TEdit;
    find: TButton;
    create: TButton;
    procedure FormShow(Sender: TObject);
    procedure projectsChange(Sender: TObject);
    procedure findClick(Sender: TObject);
    procedure createClick(Sender: TObject);
  private
    { Private declarations }
    procedure documentsList;
  public
    { Public declarations }
  end;

var
  docSpCnt: TdocSpCnt;

implementation

{$R *.dfm}

uses Unit1, t_utils;

procedure TdocSpCnt.FormShow(Sender: TObject);
var
SQL : string;
begin
  SQL := 'SELECT * FROM TRONIX.PROJECT_LIST ORDER BY PROJECT';
  form1.execQuery(Query, SQL, false);

  projects.Clear;
  invi_projects.Clear;

  documents.Clear;
  invi_documents.Clear;

  while not Query.Eof do
  begin
    projects.Items.Add(Query.FieldByName('name').asString);
    invi_projects.Items.Add(Query.FieldByName('PROJECT_ID').asString);

    Query.Next;
  end;

  projects.ItemIndex := -1;
end;

procedure TdocSpCnt.projectsChange(Sender: TObject);
begin
  documentsList;
end;

procedure TdocSpCnt.findClick(Sender: TObject);
begin
  documentsList;
end;

procedure TdocSpCnt.documentsList;
var
SQL : string;
begin
  if (projects.ItemIndex = -1) then
    exit;

  documents.Clear;
  invi_documents.Clear;

  SQL := 'select * from tronix.document where id_project = ' + invi_projects.Items[projects.ItemIndex];
  if (search.Text <> '') and (length(search.text) > 2) then
    SQL := SQL + ' and ident like ' + char(39) + '%' + search.text + '%' + char(39);

  form1.execQuery(Query, SQL, false);

  while not Query.Eof do
  begin
    documents.Items.Add(Query.FieldByName('IDENT').asString);
    invi_documents.Items.Add(Query.FieldByName('DOCUMENT_ID').asString);

    Query.Next;
  end;

  documents.ItemIndex := -1;
  documents.Enabled := true;
end;

procedure TdocSpCnt.createClick(Sender: TObject);
begin
  if documents.ItemIndex = -1 then
    exit;
  
  test(invi_documents.Items[documents.ItemIndex]);
  
  self.close;
end;

end.
