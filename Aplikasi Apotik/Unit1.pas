unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, ADODB, jpeg, ExtCtrls;

type
  Tfobat = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    eid_obat: TEdit;
    enama_obat: TEdit;
    ejenis_obat: TEdit;
    emerek_obat: TEdit;
    eharga_obat: TEdit;
    estok_obat: TEdit;
    esatuan: TEdit;
    DBGrid1: TDBGrid;
    btambah: TButton;
    bsimpan: TButton;
    bedit: TButton;
    bbatal: TButton;
    bhapus: TButton;
    bkeluar: TButton;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    bcetak: TButton;
    procedure kosongkan; //tambahkan beberapa procedure berikut
    procedure bacasaja;
    procedure bacatulis;
    procedure tampilkan;
    procedure simpandata;
    procedure editdata;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btambahClick(Sender: TObject);
    procedure bbatalClick(Sender: TObject);
    procedure bkeluarClick(Sender: TObject);
    procedure bsimpanClick(Sender: TObject);
    procedure bhapusClick(Sender: TObject);
    procedure beditClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure eharga_obatKeyPress(Sender: TObject; var Key: Char);
    procedure estok_obatKeyPress(Sender: TObject; var Key: Char);
    procedure bcetakClick(Sender: TObject);
    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fobat: Tfobat;

implementation
uses Unit2, Unit3;
{$R *.dfm}

procedure tfobat.kosongkan; //berfungsi untuk mengosongkan form agar siap diisi data
begin
eid_obat.Text:='';
enama_obat.Text:='';
ejenis_obat.Text:='';
emerek_obat.Text:='';
eharga_obat.Text:='0';
estok_obat.Text:='0';
esatuan.Text:='';
end;

procedure tfobat.bacasaja; //untuk membuat form tidak bisa diubah
begin
eid_obat.ReadOnly:=true;
enama_obat.ReadOnly:=true;
ejenis_obat.ReadOnly:=true;
emerek_obat.ReadOnly:=true;
eharga_obat.ReadOnly:=true;
estok_obat.ReadOnly:=true;
esatuan.ReadOnly:=true;
end;

procedure tfobat.bacatulis;
begin
eid_obat.ReadOnly:=false;
enama_obat.ReadOnly:=false;
ejenis_obat.ReadOnly:=false;
emerek_obat.ReadOnly:=false;
eharga_obat.ReadOnly:=false;
estok_obat.ReadOnly:=false;
esatuan.ReadOnly:=false;
end;

procedure tfobat.tampilkan; //berfungsi untuk menampilkan database pada form
begin
ADOQuery1.Open;
eid_obat.Text:=ADOQuery1['id_obat'];
enama_obat.Text:=ADOQuery1['nama_obat'];
ejenis_obat.Text:=ADOQuery1['jenis_obat'];
emerek_obat.Text:=ADOQuery1['merk_obat'];
eharga_obat.Text:=ADOQuery1['harga_obat'];
estok_obat.Text:=ADOQuery1['stok_obat'];
esatuan.Text:=ADOQuery1['satuan'];

bacasaja; // memanggil / menjalankan procedure bacasaja
bhapus.Enabled:=true;  // mengaktifkan / menonaktifkan tombol
bkeluar.Enabled:=true;
btambah.Enabled:=true;
bsimpan.Enabled:=false;
bbatal.Enabled:=true;
bedit.Enabled:=true;
end;

procedure tfobat.simpandata; //untuk menyimpan data ke database
begin
ADOQuery1.Append;
ADOQuery1.FieldByName('id_obat').Value:=eid_obat.Text;
ADOQuery1.FieldByName('nama_obat').Value:=enama_obat.Text;
ADOQuery1.FieldByName('jenis_obat').Value:=ejenis_obat.Text;
ADOQuery1.FieldByName('merk_obat').Value:=emerek_obat.Text;
ADOQuery1.FieldByName('harga_obat').Value:=eharga_obat.Text;
ADOQuery1.FieldByName('stok_obat').Value:=estok_obat.Text;
ADOQuery1.FieldByName('satuan').Value:=esatuan.Text;
ADOQuery1.Post;
end;

procedure Tfobat.editdata; //untuk mengubah data pada database
begin
ADOQuery1.Edit;
ADOQuery1.FieldByName('id_obat').Value:=eid_obat.Text;
ADOQuery1.FieldByName('nama_obat').Value:=enama_obat.Text;
ADOQuery1.FieldByName('jenis_obat').Value:=ejenis_obat.Text;
ADOQuery1.FieldByName('merk_obat').Value:=emerek_obat.Text;
ADOQuery1.FieldByName('harga_obat').Value:=eharga_obat.Text;
ADOQuery1.FieldByName('stok_obat').Value:=estok_obat.Text;
ADOQuery1.FieldByName('satuan').Value:=esatuan.Text;
ADOQuery1.Post;
end;

procedure Tfobat.FormCreate(Sender: TObject); // procedure ini akan dijalankan saat procedure muncul
begin
bacasaja; // memanggil/menjalankan procedure bacasaja
btambah.Enabled:=true;
bsimpan.Enabled:=false;
bhapus.Enabled:=false;
bhapus.Enabled:=false;
bedit.Enabled:=false;
bbatal.Enabled:=false;
bkeluar.Enabled:=true;
end;

procedure Tfobat.FormActivate(Sender: TObject); //procedure ini akan dijalankan saat form aktif
begin
ADOQuery1.Active:=True; //berfungsi agar adoquery1 dalam keadaan aktif / terhubung dengan adoconnection
end;

procedure Tfobat.btambahClick(Sender: TObject);
begin
kosongkan; //memanggil procedur kosongkan
bacatulis;  //memanggil procedur bacatulis
eid_obat.Enabled:=True;
eid_obat.SetFocus; // meletakan cursor pada eid_obat
bhapus.Enabled:=false;
bkeluar.Enabled:=false;
btambah.Enabled:=false;
bsimpan.Enabled:=True;
bbatal.Enabled:=true;
bedit.Enabled:=False;
DBGrid1.Enabled:=True;
end;

procedure Tfobat.bbatalClick(Sender: TObject);
begin
bacasaja;
kosongkan;
bhapus.Enabled:=False;
bkeluar.Enabled:=True;
btambah.Enabled:=True;
bsimpan.Enabled:=False;
bbatal.Enabled:=True;
bedit.Enabled:=False;
DBGrid1.Enabled:=True;
end;

procedure Tfobat.bkeluarClick(Sender: TObject);
begin
close;
end;

procedure Tfobat.bsimpanClick(Sender: TObject);
begin
if (eid_obat.Text='') or (enama_obat.Text='') then //memeriksa apakah 2 field ini kosong atau tidak
begin
MessageDlg('Maaf, data tidak boleh ada yang kosong',mtError,[mbOK],0); //memunculkan pesan kesalahan
eid_obat.SetFocus;
end
else
begin
if ADOQuery1.Locate('id_obat',eid_obat.Text,[]) then //memeriksa apakah id obat ada yang sama
begin
editdata;
MessageDlg('Data berhasil diubah',mtInformation,[mbOK],0);
DBGrid1.Enabled:=True;
btambah.Enabled:=True;
bsimpan.Enabled:=False;
bhapus.Enabled:=False;
bedit.Enabled:=False;
bbatal.Enabled:=True;
bkeluar.Enabled:=True;
bacasaja;
end
else
begin
simpandata;
MessageDlg('Data Berhasil Disimpan',mtInformation,[mbOK],0);
DBGrid1.Enabled:=True;
btambah.Enabled:=True;
bsimpan.Enabled:=False;
bhapus.Enabled:=False;
bedit.Enabled:=False;
bbatal.Enabled:=True;
bkeluar.Enabled:=True;
bacasaja;
end;
end;
end;

procedure Tfobat.bhapusClick(Sender: TObject);
begin
DBGrid1.DataSource.DataSet.Delete;
DBGrid1.Enabled:=True;
btambah.Enabled:=True;
bsimpan.Enabled:=False;
bhapus.Enabled:=False;
bedit.Enabled:=False;
bbatal.Enabled:=False;
bkeluar.Enabled:=True;
kosongkan;
MessageDlg('Data Berhasil Dihapus',mtInformation,[mbOK],0);
bacasaja;
end;

procedure Tfobat.beditClick(Sender: TObject);
begin
bacatulis;
eid_obat.Enabled:=True;
enama_obat.SetFocus;
DBGrid1.Enabled:=False;
btambah.Enabled:=False;
bsimpan.Enabled:=True;
bhapus.Enabled:=False;
bedit.Enabled:=False;
bbatal.Enabled:=True;
bkeluar.Enabled:=False;
end;

procedure Tfobat.DBGrid1CellClick(Column: TColumn);
begin
tampilkan;
bacasaja;
btambah.Enabled:=True;
bsimpan.Enabled:=False;
bhapus.Enabled:=True;
bedit.Enabled:=True;
bbatal.Enabled:=True;
bkeluar.Enabled:=True;
end;

procedure Tfobat.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
tampilkan;
bacasaja;
btambah.Enabled:=True;
bsimpan.Enabled:=False;
bhapus.Enabled:=True;
bedit.Enabled:=True;
bbatal.Enabled:=True;
bkeluar.Enabled:=True;
end;

procedure Tfobat.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
tampilkan;
bacasaja;
btambah.Enabled:=True;
bsimpan.Enabled:=False;
bhapus.Enabled:=True;
bedit.Enabled:=True;
bbatal.Enabled:=True;
bkeluar.Enabled:=True;
end;

procedure Tfobat.eharga_obatKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in['0'..'9',#8]) then //agar harga obat hanya bisa diisi dengan angka
Key:=#0;
end;

procedure Tfobat.estok_obatKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in['0'..'9',#8]) then //agar stok obat hanya bisa diisi dengan angka
Key:=#0;
end;

procedure Tfobat.bcetakClick(Sender: TObject);
begin
Flapobat.QRLapobat.Preview;
end;

end.
