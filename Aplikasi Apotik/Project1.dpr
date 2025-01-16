program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {fobat},
  Unit2 in 'Unit2.pas' {FMENU},
  Unit3 in 'Unit3.pas' {Flapobat},
  Unit4 in 'Unit4.pas' {flogin};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFMENU, FMENU);
  Application.CreateForm(Tfobat, fobat);
  Application.CreateForm(TFlapobat, Flapobat);
  Application.CreateForm(Tflogin, flogin);
  Application.Run;
end.
