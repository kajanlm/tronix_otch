unit r_calendar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Calendar, ComCtrls, StdCtrls;

type
  Tf_calendar = class(TForm)
    calendar: TMonthCalendar;
    ok: TButton;
    procedure okClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    result_month,
    result_year : string;
  end;

var
  f_calendar: Tf_calendar;

implementation

{$R *.dfm}

procedure Tf_calendar.okClick(Sender: TObject);
var
y, m, d : word;
begin
  DecodeDate(calendar.Date, y, m, d);
  result_month := inttostr(m);
  result_year := inttostr(y);

  if length(result_month) = 1 then
    result_month := '0' + result_month;

  self.Close;
end;

procedure Tf_calendar.FormShow(Sender: TObject);
begin
  result_month := '';
  result_year := '';
  calendar.Date := now;
end;

end.
