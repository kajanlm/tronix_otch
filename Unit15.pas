unit Unit15;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,DateUtils, DB, MemDS, DBAccess, Ora, ComCtrls;

type
  TForm15 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    OraQuery1: TOraQuery;
    Label3: TLabel;
    OraQuery2: TOraQuery;
    Edit2: TEdit;
    Edit3: TEdit;
    MonthCalendar1: TMonthCalendar;
    Edit5: TEdit;
    Button1: TButton;
    ComboBox1: TComboBox;
    Label4: TLabel;
    Label5: TLabel;
    CheckBox1: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure Edit2DblClick(Sender: TObject);
    procedure Edit1DblClick(Sender: TObject);
    procedure MonthCalendar1DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form15: TForm15;

implementation

uses Unit10, Unit16;

{$R *.dfm}

procedure TForm15.FormShow(Sender: TObject);
begin
Form15.Caption:='������� �� ������������';
Edit3.Text:=DateTimeToStr(StartOfTheMonth(now));
Edit1.Text:=DateToStr(ENDOfTheMonth(now));
ComboBox1.Items.Add('���������');
ComboBox1.Items.Add('������������');
ComboBox1.Items.Add('���');

end;

procedure TForm15.Edit2DblClick(Sender: TObject);
begin
      Form10.Caption:='������� �� ������������';
    Form10.ShowModal();
end;



procedure TForm15.Edit1DblClick(Sender: TObject);
begin
MonthCalendar1.Visible:=true;
end;

procedure TForm15.MonthCalendar1DblClick(Sender: TObject);
begin
Edit1.Text:=DateToStr(MonthCalendar1.Date);

MonthCalendar1.Visible:=false;
end;

procedure TForm15.Button1Click(Sender: TObject);
begin
  DIF_OTCH_FORM.ShowModal();
end;

procedure TForm15.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  edit5.Text:='15';
  Edit3.Text:='';
  Edit2.Text:='������ �� ��� ������';
   ComboBox1.Clear;
   ComboBox1.Text:='�� ����';
end;

end.
