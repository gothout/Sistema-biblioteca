unit uInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls;

type
  TfrmInfo = class(TForm)
    pnCabecalho: TPanel;
    spVoltar: TSpeedButton;
    pnCorpo: TPanel;
    Label3: TLabel;
    Label9: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    lbHora: TLabel;
    spDevolver: TSpeedButton;
    spEmail: TSpeedButton;
    spWhat: TSpeedButton;
    edtNome: TEdit;
    dtNasc: TDateTimePicker;
    edtCod: TEdit;
    edtEmail: TEdit;
    edtWpp: TEdit;
    edtTelefone: TEdit;
    Panel1: TPanel;
    edtNomeL: TEdit;
    edtCodL: TEdit;
    dtLivro: TDateTimePicker;
    pnFim: TPanel;
    Label1: TLabel;
    Label8: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure spVoltarClick(Sender: TObject);
    procedure spDevolverClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    parametro1, parametro2 : string;
    quant : integer;
  end;

var
  frmInfo: TfrmInfo;

implementation

{$R *.dfm}

uses uDM, uPendentes, uMessageInfo;

procedure TfrmInfo.FormActivate(Sender: TObject);
begin
  dm.qryPrincipal.Close;
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
  dtNasc.Date := dm.qryPrincipal.Fields[4].AsDateTime;
  /////////////////////////////////////////////////////////////////////////
  dm.qryPrincipal.Close;
  dm.qryPrincipal.SQL.Clear;
  dm.qryPrincipal.SQL.Add('SELECT LIVRO_CODIGO, LIVRO_NOME, LIVRO_QUANTIDADE FROM CADASTRARLIVROS WHERE LIVRO_CODIGO = '+QuotedStr(parametro2));
  dm.qryPrincipal.Open;
  edtCodL.Text := dm.qryPrincipal.Fields[0].AsString;
  edtNomeL.Text := dm.qryPrincipal.Fields[1].AsString;
  quant := dm.qryPrincipal.Fields[2].AsInteger;
  dm.qryPrincipal.Close;
  dm.qryPrincipal.SQL.Clear;
  end;

procedure TfrmInfo.spDevolverClick(Sender: TObject);
begin
  dm.qryPrincipal.Close;
  dm.qryPrincipal.SQL.Clear;
  quant := quant + 1;
  edtEmail.Text := IntToStr(quant);
  dm.qryPrincipal.SQL.Add('UPDATE CADASTRARLIVROS ');
  dm.qryPrincipal.SQL.Add('SET LIVRO_QUANTIDADE = '+ QuotedStr(edtEmail.Text) + ' WHERE LIVRO_CODIGO = ' + QuotedStr(edtCodL.Text));
  dm.qryPrincipal.ExecSQL();
  dm.qryPrincipal.SQL.Clear;
  dm.qryPrincipal.Close;
  dm.qryPrincipal.Close;
  dm.qryPrincipal.SQL.Clear;
  dm.qryPrincipal.SQL.Add('DELETE FROM PENDENDENTES');
  dm.qryPrincipal.SQL.Add(' WHERE PENDENTE_LIVRO = ' + QuotedStr(parametro2));
  dm.qryPrincipal.ExecSQL();
  frmMessageInfo.pnCorpo.Caption := edtEmail.text + ' devolveu o livro: '+ edtNomeL.Text;
  frmMessageInfo.ShowModal;
end;

procedure TfrmInfo.spVoltarClick(Sender: TObject);
begin
  edtNome.Clear;
  edtCod.Clear;
  edtEmail.Clear;
  edtWpp.Clear;
  edtTelefone.Clear;
  edtNomeL.Clear;
  edtCodL.Clear;
  frmPendentes.refreshClick(self);
  close;
end;

end.
