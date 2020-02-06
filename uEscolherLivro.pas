unit uEscolherLivro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls;

type
  TfrmEscolherLivro = class(TForm)
    dbListaLivros: TDBGrid;
    pnCabecalho: TPanel;
    dtLista: TDataSource;
    Label1: TLabel;
    edtPesquisarLivro: TEdit;
    edtCodigoLivro: TEdit;
    spPesquisar: TSpeedButton;
    spCancelar: TSpeedButton;
    refresh: TButton;
    spEscolha: TSpeedButton;
    spSair: TSpeedButton;
    procedure spPesquisarClick(Sender: TObject);
    procedure refreshClick(Sender: TObject);
    procedure spCancelarClick(Sender: TObject);
    procedure edtPesquisarLivroChange(Sender: TObject);
    procedure edtCodigoLivroChange(Sender: TObject);
    procedure spSairClick(Sender: TObject);
    procedure spEscolhaClick(Sender: TObject);
    procedure dbListaLivrosCellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEscolherLivro: TfrmEscolherLivro;

implementation

{$R *.dfm}

uses uDM, uEmprestar;

procedure TfrmEscolherLivro.dbListaLivrosCellClick(Column: TColumn);
var
parametro1, parametro2 : string;
begin
  parametro1 := dbListaLivros.Fields[0].AsString;
  dm.qryPrincipal.SQL.Clear;
  dm.qryPrincipal.SQL.Add('SELECT LIVRO_CODIGO, LIVRO_NOME, LIVRO_QUANTIDADE FROM CADASTRARLIVROS WHERE LIVRO_CODIGO = '+QuotedStr(parametro1));
  dm.qryPrincipal.Open;
  parametro2 := dm.qryPrincipal.Fields[2].AsString;
  if parametro2 = '0' then
    begin
      spEscolha.Enabled := False;
    end
  else
    begin
      spEscolha.Enabled := True;
    end;
end;

procedure TfrmEscolherLivro.edtCodigoLivroChange(Sender: TObject);
begin
    if TRIM(edtCodigoLivro.Text) <> '' then
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

procedure TfrmEscolherLivro.edtPesquisarLivroChange(Sender: TObject);
begin
  if TRIM(edtPesquisarLivro.Text) <> '' then
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

procedure TfrmEscolherLivro.refreshClick(Sender: TObject);
begin
  dtLista.Dataset.Active := false;
  dtLista.Dataset.Active := true;
end;

procedure TfrmEscolherLivro.spCancelarClick(Sender: TObject);
begin
  DM.dsLIVRO.CommandText := 'SELECT * FROM CADASTRARLIVROS';
  refreshClick(self);
  edtPesquisarLivro.Clear;
  edtCodigoLivro.Clear;
  edtPesquisarLivro.SetFocus;
end;

procedure TfrmEscolherLivro.spEscolhaClick(Sender: TObject);
var
parametro1 : string;
begin
  parametro1 := dbListaLivros.Fields[0].AsString;
  dm.qryPrincipal.SQL.Clear;
  dm.qryPrincipal.SQL.Add('SELECT LIVRO_CODIGO, LIVRO_NOME, LIVRO_QUANTIDADE FROM CADASTRARLIVROS WHERE LIVRO_CODIGO = '+QuotedStr(parametro1));
  dm.qryPrincipal.Open;
  frmEmprestar.edtCodLivro.text := dm.qryPrincipal.Fields[0].AsString;
  frmEmprestar.edtNomeLivro.text := dm.qryPrincipal.Fields[1].AsString;
  frmEmprestar.quantia_a := dm.qryPrincipal.Fields[2].AsString;
  dm.qryPrincipal.Close;
  dm.qryPrincipal.SQL.Clear;
  if spCancelar.Enabled = True then
    spCancelarClick(self);
  frmEmprestar.spEmprestar.Enabled := True;
  close;
end;

procedure TfrmEscolherLivro.spPesquisarClick(Sender: TObject);
begin
if (edtPesquisarLivro.Text <> '') and (edtCodigoLivro.Text <> '') then
    begin
      DM.dsLIVRO.CommandText := 'SELECT LIVRO_CODIGO, LIVRO_NOME, LIVRO_AUTOR, LIVRO_GENERO, LIVRO_QUANTIDADE FROM CADASTRARLIVROS WHERE LIVRO_NOME = ' + QuotedStr(edtPesquisarLivro.Text) + ' AND LIVRO_CODIGO = ' + QuotedStr(edtCodigoLivro.Text);
      refreshClick(self);
      dm.qryPrincipal.Close;
      dm.qryPrincipal.SQL.Clear;
      dm.qryPrincipal.SQL.Add('SELECT LIVRO_CODIGO, LIVRO_NOME, LIVRO_AUTOR, LIVRO_GENERO, LIVRO_QUANTIDADE FROM CADASTRARLIVROS WHERE LIVRO_NOME = ' + QuotedStr(edtPesquisarLivro.Text) + ' AND LIVRO_CODIGO = ' + QuotedStr(edtCodigoLivro.Text));
      dm.qryPrincipal.Open;
      if dm.qryPrincipal.IsEmpty then
        begin
          Application.MessageBox('Não há livro com esse nome e código.','Aviso',mb_Ok+mb_IconExclamation);;
          spCancelarClick(self);
          exit
        end;
      dm.qryPrincipal.SQL.Clear;
    end;
  if edtPesquisarLivro.Text <> ''  then
  begin
    DM.dsLIVRO.CommandText := 'SELECT LIVRO_CODIGO, LIVRO_NOME, LIVRO_AUTOR, LIVRO_GENERO, LIVRO_QUANTIDADE FROM CADASTRARLIVROS WHERE LIVRO_NOME = '+QuotedStr(edtPesquisarLivro.Text);
    refreshClick(self);
    dm.qryPrincipal.Close;
    dm.qryPrincipal.SQL.Clear;
    dm.qryPrincipal.SQL.Add('SELECT LIVRO_CODIGO, LIVRO_NOME, LIVRO_AUTOR, LIVRO_GENERO, LIVRO_QUANTIDADE FROM CADASTRARLIVROS WHERE LIVRO_NOME = '+QuotedStr(edtPesquisarLivro.Text));
    dm.qryPrincipal.Open;
    if dm.qryPrincipal.IsEmpty then
      begin
        Application.MessageBox('Não há livro com esse nome.','Aviso',mb_Ok+mb_IconExclamation);;
        spCancelarClick(self);
      end;
    dm.qryPrincipal.SQL.Clear;
  end;
  if edtCodigoLivro.Text <> ''  then
  begin
    DM.dsLIVRO.CommandText := 'SELECT LIVRO_CODIGO, LIVRO_NOME, LIVRO_AUTOR, LIVRO_GENERO, LIVRO_QUANTIDADE FROM CADASTRARLIVROS WHERE LIVRO_CODIGO = '+QuotedStr(edtCodigoLivro.Text);
    refreshClick(self);
    dm.qryPrincipal.Close;
    dm.qryPrincipal.SQL.Clear;
    dm.qryPrincipal.SQL.Add('SELECT LIVRO_CODIGO, LIVRO_NOME, LIVRO_AUTOR, LIVRO_GENERO, LIVRO_QUANTIDADE FROM CADASTRARLIVROS WHERE LIVRO_CODIGO = '+QuotedStr(edtCodigoLivro.Text));
    dm.qryPrincipal.Open;
    if dm.qryPrincipal.IsEmpty then
      begin
        Application.MessageBox('Não há livro com esse código.','Aviso',mb_Ok+mb_IconExclamation);;
        spCancelarClick(self);
      end;
    dm.qryPrincipal.SQL.Clear;
  end;
end;

procedure TfrmEscolherLivro.spSairClick(Sender: TObject);
begin
  DM.dsLIVRO.CommandText := 'SELECT * FROM CADASTRARLIVROS';
  refreshClick(self);
  edtPesquisarLivro.Clear;
  edtCodigoLivro.Clear;
  edtPesquisarLivro.SetFocus;
  Close;
end;

end.
