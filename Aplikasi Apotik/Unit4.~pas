unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, jpeg, ExtCtrls;

type
  Tflogin = class(TForm)
    ADOQuery1: TADOQuery;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Button2: TButton;
    Button1: TButton;
    ADOConnection1: TADOConnection;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure Edit1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  flogin: Tflogin;

implementation

uses Unit2;

{$R *.dfm}

procedure Tflogin.Edit1Change(Sender: TObject);
begin
with ADOQuery1 do
begin
close;
sql.Clear;
sql.Text:='select * from t_login where username=' +QuotedStr(Edit1.Text);
open;
end;
end;

procedure Tflogin.Button1Click(Sender: TObject);
begin
Edit1.Text:='';
Edit2.Text:='';
end;

procedure Tflogin.Button2Click(Sender: TObject);
Var
  a,b : string;
  Ditemukan: boolean;
begin
    a:=ADOQuery1.fieldByName('username').Value;
    b:=ADOQuery1.fieldByName('password').Value;
Ditemukan:=(Edit1.Text=a)and(Edit2.Text=b);
  if Ditemukan then
  begin
    MessageDlg('Sistem Berhasil Login', mtInformation,[MBOK],0);
    Edit1.Text:='';
    Edit2.Text:='';
    flogin.close;
FMENU.User1.Enabled:=True;
FMENU.InputData1.Enabled:=True;
FMENU.transaksi1.Enabled:=True;
FMENU.Laporan1.Enabled:=True;
FMENU.Login1.Enabled:=False;
FMENU.Logout1.Enabled:=True;
    end
    else if (Edit1.Text='') or (Edit2.Text='') then
    begin
    MessageDlg('Login Gagal'+#13'Username dan Password yang anda masukan salah',mtError,[MBOK],0);
    Edit1.SetFocus;
      end
      else
      MessageDlg('Login Gagal'+#13'Username dan Password yang anda masukan salah',mtError,[MBOK],0);
      Edit1.SetFocus;
end;

end.
