program Tronix_otch;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  ConnectForm in '..\..\DevArt ODAC_v6.90.0.55_FS\Source\ConnectForm.pas' {ConnectForm},
  Unit2 in 'Unit2.pas' {Form2},
  Unit3 in 'Unit3.pas' {Form3},
  Unit4 in 'Unit4.pas' {Form4},
  Unit5 in 'Unit5.pas' {Form5},
  Unit6 in '..\..\Program Files\Borland\Delphi7\Bin\Unit6.pas' {Form6},
  Unit7 in 'Unit7.pas' {Form7},
  Unit8 in 'Unit8.pas' {Form8},
  Unit9 in 'Unit9.pas' {Form9},
  Unit10 in 'Unit10.pas' {Form10},
  Unit11 in 'Unit11.pas' {Form11},
  Unit12 in 'Unit12.pas' {Form12},
  Unit13 in 'Unit13.pas' {Form13},
  Unit14 in 'Unit14.pas' {Form14},
  Unit15 in 'Unit15.pas' {Form15},
  Unit16 in 'Unit16.pas' {DIF_OTCH_FORM},
  Unit17 in 'Unit17.pas' {Form17},
  Unit18 in 'Unit18.pas' {Form18},
  Unit19 in 'Unit19.pas' {Form19},
  Unit20 in 'Unit20.pas' {Form20},
  Unit21 in 'Unit21.pas' {Form21},
  Unit22 in 'Unit22.pas' {Form22},
  Unit23 in 'Unit23.pas' {Form23},
  Unit24 in 'Unit24.pas' {Form24},
  Unit25 in 'Unit25.pas' {Form25},
  Unit26 in 'Unit26.pas' {Form26},
  Unit27 in 'Unit27.pas' {Form27},
  Unit28 in 'Unit28.pas' {Form28},
  Unit29 in 'Unit29.pas' {Form29},
  Unit30 in 'Unit30.pas' {Form30},
  Unit31 in 'Unit31.pas' {Form31},
  Unit32 in 'Unit32.pas' {Form32},
  Unit33 in 'Unit33.pas' {Form33},
  Unit34 in 'Unit34.pas' {Form34},
  Unit35 in 'Unit35.pas' {Form35},
  Unit36 in 'Unit36.pas' {Form36},
  Unit38 in 'Unit38.pas' {Form38},
  Unit37 in 'Unit37.pas' {Form37},
  Unit39 in 'Unit39.pas' {Form39},
  Unit40 in 'Unit40.pas' {Form40},
  Unit41 in 'Unit41.pas' {Form41},
  Unit42 in 'Unit42.pas' {Form42},
  Unit43 in 'Unit43.pas' {Form43},
  Unit44 in 'Unit44.pas' {Form44},
  Unit45 in 'Unit45.pas' {Form45},
  Unit46 in 'Unit46.pas' {Form46},
  Unit47 in 'Unit47.pas' {Form47},
  Unit48 in 'Unit48.pas' {Form48},
  Unit49 in 'Unit49.pas' {Form49},
  Unit50 in 'Unit50.pas' {Form50},
  Unit51 in 'Unit51.pas' {Form51};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(TForm8, Form8);
  Application.CreateForm(TForm9, Form9);
  Application.CreateForm(TForm10, Form10);
  Application.CreateForm(TForm11, Form11);
  Application.CreateForm(TForm12, Form12);
  Application.CreateForm(TForm13, Form13);
  Application.CreateForm(TForm14, Form14);
  Application.CreateForm(TForm15, Form15);
  Application.CreateForm(TDIF_OTCH_FORM, DIF_OTCH_FORM);
  Application.CreateForm(TForm17, Form17);
  Application.CreateForm(TForm18, Form18);
  Application.CreateForm(TForm19, Form19);
  Application.CreateForm(TForm20, Form20);
  Application.CreateForm(TForm21, Form21);
  Application.CreateForm(TForm22, Form22);
  Application.CreateForm(TForm23, Form23);
  Application.CreateForm(TForm24, Form24);
  Application.CreateForm(TForm25, Form25);
  Application.CreateForm(TForm26, Form26);
  Application.CreateForm(TForm27, Form27);
  Application.CreateForm(TForm28, Form28);
  Application.CreateForm(TForm29, Form29);
  Application.CreateForm(TForm30, Form30);
  Application.CreateForm(TForm31, Form31);
  Application.CreateForm(TForm32, Form32);
  Application.CreateForm(TForm33, Form33);
  Application.CreateForm(TForm34, Form34);
  Application.CreateForm(TForm35, Form35);
  Application.CreateForm(TForm36, Form36);
  Application.CreateForm(TForm38, Form38);
  Application.CreateForm(TForm37, Form37);
  Application.CreateForm(TForm39, Form39);
  Application.CreateForm(TForm40, Form40);
  Application.CreateForm(TForm41, Form41);
  Application.CreateForm(TForm42, Form42);
  Application.CreateForm(TForm43, Form43);
  Application.CreateForm(TForm44, Form44);
  Application.CreateForm(TForm45, Form45);
  Application.CreateForm(TForm46, Form46);
  Application.CreateForm(TForm47, Form47);
  Application.CreateForm(TForm48, Form48);
  Application.Run;
end.
