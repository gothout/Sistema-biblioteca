unit uInfPen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Mask,
  Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmInfPen = class(TForm)
    pnFim: TPanel;
    Label1: TLabel;
    Label8: TLabel;
    pnCorpo: TPanel;
    Label3: TLabel;
    Label9: TLabel;
    edtNome: TEdit;
    dtNasc: TDateTimePicker;
    pnCabecalho: TPanel;
    spVoltar: TSpeedButton;
    Label2: TLabel;
    edtCod: TEdit;
    edtEmail: TEdit;
    Label4: TLabel;
    edtWpp: TEdit;
    Label5: TLabel;
    edtTelefone: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Panel1: TPanel;
    edtNomeL: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    edtCodL: TEdit;
    dtLivro: TDateTimePicker;
    Label12: TLabel;
    Label13: TLabel;
    lbHora: TLabel;
    spDevolver: TSpeedButton;
    spEmail: TSpeedButton;
    spWhat: TSpeedButton;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    parametro1, parametro2 : string;
  end;

var
  frmInfPen: TfrmInfPen;

implementation

{$R *.dfm}

uses uDM;

procedure TfrmInfPen.FormActivate(Sender: TObject);
begin
  {dm.qryPrincipal.Close;
  dm.qryPrincipal.SQL.Clear;
  dm.qryPrincipal.SQL.Add('SELECT CAD_NOME, CAD_EMAIL, CAD_TELEFONE, CAD_WHATSAPP, CAD_DATANASC FROM CADASTRADOS WHERE COD_ALUNO = ' + QuotedStr(parametro1));
  dm.qryPrincipal.Open;
  edtNome.text := dm.qryPrincipal.Fields[0].AsString;
  edtCod.Text := parametro1;
  edtEmail.text := dm.qryPrincipal.Fields[1].AsString;
  if dm.qryPrincipal.Fields[2].AsString = '0000000000' then
    begin
      edtTelefone.text := 'Telefone não especificado.'
    end
  else
    begin
      edtTelefone.text := dm.qryPrincipal.Fields[2].AsString;
    end;
  if dm.qryPrincipal.Fields[3].AsString = '0000000000' then
    begin
    edtWpp.text := 'WhatsApp não especificado.'
    end
  else
    begin
      edtWpp.text := dm.qryPrincipal.Fields[3].AsString;
    end;
  dtNasc.Date := dm.qryPrincipal.Fields[4].AsDateTime;}

end;

end.
