unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, Menus;

type
  TFMENU = class(TForm)
    MainMenu1: TMainMenu;
    User1: TMenuItem;
    Login1: TMenuItem;
    Logout1: TMenuItem;
    Exit1: TMenuItem;
    InputData1: TMenuItem;
    DataObat1: TMenuItem;
    transaksi1: TMenuItem;
    PenjualanObat1: TMenuItem;
    Laporan1: TMenuItem;
    LaporanDataObat1: TMenuItem;
    LaporanDataPenjualanObat1: TMenuItem;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    procedure DataObat1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure LaporanDataObat1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Login1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Logout1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMENU: TFMENU;

implementation
USES Unit1, Unit3, Unit4;
{$R *.dfm}

procedure TFMENU.DataObat1Click(Sender: TObject);
begin
fobat.ShowModal;  //memanggil form
end;

procedure TFMENU.Exit1Click(Sender: TObject);
begin
application.Terminate;  //menghentikan aplikasi
end;

procedure TFMENU.LaporanDataObat1Click(Sender: TObject);
begin
Flapobat.QRLapobat.Preview;
end;

procedure TFMENU.FormActivate(Sender: TObject);
begin
fobat.ADOQuery1.Active:=True;
end;

procedure TFMENU.Login1Click(Sender: TObject);
begin
flogin.showmodal;
end;

procedure TFMENU.FormCreate(Sender: TObject);
begin
Label1.Caption:=#13+#13+'APOTEK MUNN';
Label2.Caption:=#13+#13+#13+'MENU UTAMA';
User1.Enabled:=True;
Login1.Enabled:=True;
InputData1.Enabled:=False;
transaksi1.Enabled:=False;
Laporan1.Enabled:=False;
Logout1.Enabled:=False;
end;

procedure TFMENU.Logout1Click(Sender: TObject);
begin
User1.Enabled:=True;
Login1.Enabled:=True;
InputData1.Enabled:=False;
transaksi1.Enabled:=False;
Laporan1.Enabled:=False;
Logout1.Enabled:=False;
end;

end.
