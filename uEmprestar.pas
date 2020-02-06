unit uEmprestar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Mask,
  Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmEmprestar = class(TForm)
    pnCabecalho: TPanel;
    spVoltar: TSpeedButton;
    pnCorpo: TPanel;
    Label3: TLabel;
    Label9: TLabel;
    edtNome: TEdit;
    pnFim: TPanel;
    Label1: TLabel;
    edtEmailE: TEdit;
    Label2: TLabel;
    Label4: TLabel;
    edtTelefoneE: TEdit;
    edtWhatsappE: TEdit;
    Label5: TLabel;
    dtNasc: TDateTimePicker;
    Label7: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    spEscolherLivro: TSpeedButton;
    spEmprestar: TSpeedButton;
    edtCodLivro: TEdit;
    edtNomeLivro: TEdit;
    spVerifica: TSpeedButton;
    Label6: TLabel;
    edtNomeE: TEdit;
    tempo: TTimer;
    lbHora: TLabel;
    dtPARAM: TDateTimePicker;
    edtCalcu: TEdit;
    procedure spEscolherLivroClick(Sender: TObject);
    procedure spVerificaClick(Sender: TObject);
    procedure spVoltarClick(Sender: TObject);
    procedure spEmprestarClick(Sender: TObject);
    procedure tempoTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  quantia_a :string;
  end;

var
  frmEmprestar: TfrmEmprestar;

implementation

{$R *.dfm}

uses uEscolherLivro, uDM, uPrincipal, uEmprestarEPL;

procedure TfrmEmprestar.spEmprestarClick(Sender: TObject);
VAR
para: string;
data : string;
cod : integer;
quant : integer;
begin
  dm.qryPrincipal.Close;
  dm.qryPrincipal.SQL.Clear;
  dm.qryPrincipal.SQL.Add('SELECT COD_ALUNO FROM CADASTRADOS WHERE CAD_NOME = ' + QuotedStr(edtNomeE.Text) + ' AND CAD_EMAIL = '+ QuotedStr(edtEmailE.Text));
  dm.qryPrincipal.Open;
  para := dm.qryPrincipal.Fields[0].AsString;
  dm.qryPrincipal.Close;
  data :=StringReplace(DateToStr(Now), '/', '.', [rfIgnoreCase]);
  data :=StringReplace(data, '/', '.', [rfIgnoreCase]);
  dm.qryPrincipal.SQL.Clear;
  dm.qryPrincipal.SQL.Add('INSERT INTO PENDENDENTES (PENDENTE_COD_ALUNO, PENDENTE_DIA, PENDENTE_HORA, PENDENTE_LIVRO) ');
  dm.qryPrincipal.SQL.Add('VALUES ('+ QuotedStr(para) + ',');
  dm.qryPrincipal.SQL.Add(QuotedStr(data) + ',');
  dm.qryPrincipal.SQL.Add(QuotedStr(lbHora.Caption) + ',');
  dm.qryPrincipal.SQL.Add(QuotedStr(edtCodLivro.Text) + ')');
  dm.qryPrincipal.ExecSQL();
  dm.qryPrincipal.SQL.Clear;
  dm.qryPrincipal.Close;
  dm.qryPrincipal.SQL.Add('SELECT LIVRO_QUANTIDADE FROM CADASTRARLIVROS WHERE LIVRO_CODIGO = ' + QuotedStr(edtCodLivro.Text));
  dm.qryPrincipal.Open;
  cod := dm.qryPrincipal.Fields[0].AsInteger;
  dm.qryPrincipal.SQL.Clear;
  dm.qryPrincipal.Close;
  quant := cod - 1;
  edtCalcu.Text := IntToStr(quant);
  dm.qryPrincipal.SQL.Add('UPDATE CADASTRARLIVROS ');
  dm.qryPrincipal.SQL.Add('SET LIVRO_QUANTIDADE = '+ QuotedStr(edtCalcu.Text) + ' WHERE LIVRO_CODIGO = ' + QuotedStr(edtCodLivro.Text));
  dm.qryPrincipal.ExecSQL();
  dm.qryPrincipal.SQL.Clear;
  dm.qryPrincipal.Close;
  quant := 0;
  frmMessageEPL.pnCorpo.Caption := 'Você emprestou o livro: ' + edtNomeLivro.Text;
  frmMessageEPL.ShowModal;
end;

procedure TfrmEmprestar.spEscolherLivroClick(Sender: TObject);
begin
  frmEscolherLivro.ShowModal;
end;

procedure TfrmEmprestar.spVerificaClick(Sender: TObject);
begin
  dm.qryPrincipal.Close;
  dm.qryPrincipal.SQL.Clear;
  dm.qryPrincipal.SQL.Add('SELECT CAD_NOME, CAD_EMAIL, CAD_TELEFONE, CAD_WHATSAPP, CAD_DATANASC FROM CADASTRADOS WHERE COD_ALUNO = ' + QuotedStr(edtNome.Text));
  dm.qryPrincipal.Open;
  if dm.qryPrincipal.IsEmpty then
    begin
      Application.MessageBox('Não há entidade com esse código.','Aviso',mb_Ok+mb_IconExclamation);;
      spEscolherLivro.Enabled := False;
      spEmprestar.Enabled := False;
      edtCodLivro.Clear;
      edtNomeLivro.Clear;
      edtNome.Clear;
      edtEmailE.Clear;
      edtEmailE.Clear;
      edtTelefoneE.Clear;
      edtWhatsappE.Clear;
      edtNome.SetFocus;
      dtNasc.Date := StrToDate('10/10/2019');
      exit
    end
  else
    begin
      edtNomeE.text := dm.qryPrincipal.Fields[0].AsString;
      edtEmailE.text := dm.qryPrincipal.Fields[1].AsString;
      edtTelefoneE.text := dm.qryPrincipal.Fields[2].AsString;
      edtWhatsappE.text := dm.qryPrincipal.Fields[3].AsString;
      dtNasc.Date := dm.qryPrincipal.Fields[4].AsDateTime;
      spEscolherLivro.Enabled := True;
    end;
  dm.qryPrincipal.SQL.Clear;
end;

procedure TfrmEmprestar.spVoltarClick(Sender: TObject);
begin
  edtNome.Clear;
  edtNomeE.Clear;
  edtEmailE.Clear;
  edtTelefoneE.Clear;
  edtWhatsappE.Clear;
  edtCodLivro.Clear;
  edtNomeLivro.Clear;
  dtNasc.Date := StrToDate('10/10/2019');
  Close;
  frmPrincipal.refreshClick(self);
end;

procedure TfrmEmprestar.tempoTimer(Sender: TObject);
var
tHora:TDateTime;
begin
  tHora:=Time;
  lbHora.Caption:=TimeToStr(tHora);
end;

end.
