unit t_error;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TerrorForm = class(TForm)
    body: TLabel;
    ok: TButton;
    backup: TBitBtn;
    procedure backupClick(Sender: TObject);
    procedure okClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  errorForm: TerrorForm;

implementation

uses Unit1;

{$R *.dfm}

procedure TerrorForm.backupClick(Sender: TObject);
var backupPass, takepw : string;
begin
  if not Form1.SCAlive then
  begin
    showmessage('Сервер недоступен! Откат не возможен.');
    exit;
  end;

  backupPass := Form1.ServerRequest('[PASS]BACKUP_ERROR');

  //remake password-answer for function (copy_contracts, dates, here etc.).
  takepw := InputBox('ДОСТУП', 'Введите пароль для отката состояния:', '');
  if takepw = '' then
  begin
    showmessage('ПОЛЕ НЕ ЗАПОЛНЕНО. Введите пароль!');
    exit;
  end;

  if takepw = backupPass then
  begin
    Form1.errorStatusReturn := true;

    ModalResult := mrNone;
    self.close;
  end
  else
    showmessage('Неверный пароль!');

end;

procedure TerrorForm.okClick(Sender: TObject);
begin
  ModalResult := mrNone;
  self.Close;
end;

end.
