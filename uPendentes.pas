unit uPendentes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons;

type
  TfrmPendentes = class(TForm)
    spEscolha: TSpeedButton;
    spSair: TSpeedButton;
    pnCabecalho: TPanel;
    Label1: TLabel;
    spPesquisar: TSpeedButton;
    spCancelar: TSpeedButton;
    edtCodigo: TEdit;
    refresh: TButton;
    dbListaLivros: TDBGrid;
    dtLista: TDataSource;
    procedure refreshClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure spSairClick(Sender: TObject);
    procedure spCancelarClick(Sender: TObject);
    procedure dbListaLivrosCellClick(Column: TColumn);
    procedure spEscolhaClick(Sender: TObject);
    procedure spPesquisarClick(Sender: TObject);
    procedure edtCodigoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPendentes: TfrmPendentes;

implementation

{$R *.dfm}

uses uDM, uInfPen, uInfo, uPrincipal;

procedure TfrmPendentes.dbListaLivrosCellClick(Column: TColumn);
begin
  IF dbListaLivros.Fields[0].Text = '' then
    begin
      spEscolha.Enabled := False;
    end
  else
    spEscolha.Enabled := True;
end;

procedure TfrmPendentes.edtCodigoChange(Sender: TObject);
begin
  if TRIM(edtCodigo.Text) <> '' then
    begin
      spPesquisar.Enabled := True;
      spCancelar.Enabled := True;
    end
  else
    begin
      spPesquisar.Enabled := False;
      spCancelar.Enabled := False;
    end;
end;

procedure TfrmPendentes.FormActivate(Sender: TObject);
begin
  refreshClick(self);
end;

procedure TfrmPendentes.refreshClick(Sender: TObject);
begin
  dtLista.Dataset.Active := false;
  dtLista.Dataset.Active := true;
end;

procedure TfrmPendentes.spCancelarClick(Sender: TObject);
begin
 DM.dsPENDENTES.CommandText := 'select * from PENDENDENTES';
 refreshClick(self);
 edtCodigo.Clear;
 spPesquisar.Enabled := False;
 spCancelar.Enabled := False;
 end;

procedure TfrmPendentes.spEscolhaClick(Sender: TObject);
var
parametro1, parametro2: string;
begin
  parametro1 := dbListaLivros.Fields[0].AsString;
  parametro2 := dbListaLivros.Fields[3].AsString;
  frmInfo.lbHora.Caption := dbListaLivros.Fields[2].AsString;
  frmInfo.dtLivro.Date := dbListaLivros.Fields[1].AsDateTime;
  frmInfo.parametro1 := parametro1;
  frmInfo.parametro2 := parametro2;
  frmInfo.ShowModal;
end;

procedure TfrmPendentes.spPesquisarClick(Sender: TObject);
begin
  DM.dsPENDENTES.CommandText := 'SELECT PENDENTE_COD_ALUNO, PENDENTE_DIA, PENDENTE_HORA, PENDENTE_LIVRO from PENDENDENTES WHERE PENDENTE_COD_ALUNO = ' + QuotedStr(edtCodigo.Text);
  refreshClick(self);
  dm.qryPrincipal.Close;
  dm.qryPrincipal.SQL.Clear;
  dm.qryPrincipal.SQL.Add('SELECT PENDENTE_COD_ALUNO, PENDENTE_DIA, PENDENTE_HORA, PENDENTE_LIVRO from PENDENDENTES WHERE PENDENTE_COD_ALUNO = ' + QuotedStr(edtCodigo.Text));
  dm.qryPrincipal.Open;
  if dm.qryPrincipal.IsEmpty then
    begin
      Application.MessageBox('Não há livros emprestados para esta entidade.','Aviso',mb_Ok+mb_IconExclamation);;
      spCancelarClick(self);
      exit
    end;
  dm.qryPrincipal.SQL.Clear;
end;

procedure TfrmPendentes.spSairClick(Sender: TObject);
begin
  frmPrincipal.refreshClick(self);
  close;
  if spCancelar.Enabled = True then
    spCancelarClick(self);
end;

end.
