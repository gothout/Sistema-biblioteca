unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.AppEvnts;

type
  TfrmPrincipal = class(TForm)
    pnCabecalho: TPanel;
    pnFim: TPanel;
    pnCorpo: TPanel;
    spSobre: TSpeedButton;
    Sair: TSpeedButton;
    spCadastrarEntidade: TSpeedButton;
    spCadastrarLivro: TSpeedButton;
    edtPesquisarLivro: TEdit;
    spPesquisar: TSpeedButton;
    spCancelar: TSpeedButton;
    edtCodigoLivro: TEdit;
    Label1: TLabel;
    pnLista: TPanel;
    spEmprestarLivro: TSpeedButton;
    spPendentes: TSpeedButton;
    dbListaLivros: TDBGrid;
    dtLista: TDataSource;
    refresh: TButton;
    spAlterar: TSpeedButton;
    spApagar: TSpeedButton;
    spMinimizar: TSpeedButton;
    procedure SairClick(Sender: TObject);
    procedure spCadastrarEntidadeClick(Sender: TObject);
    procedure spCadastrarLivroClick(Sender: TObject);
    procedure refreshClick(Sender: TObject);
    procedure spPesquisarClick(Sender: TObject);
    procedure spCancelarClick(Sender: TObject);
    procedure edtPesquisarLivroChange(Sender: TObject);
    procedure edtCodigoLivroChange(Sender: TObject);
    procedure spAlterarClick(Sender: TObject);
    procedure dbListaLivrosCellClick(Column: TColumn);
    procedure dbListaLivrosColExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure spApagarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spEmprestarLivroClick(Sender: TObject);
    procedure spPendentesClick(Sender: TObject);
    procedure spSobreClick(Sender: TObject);
    procedure spMinimizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uCadastrarEntidade, uCadastrarLivros, uDM, uAlteraLivro, uApagar,
  uEmprestar, uPendentes, uSobre;

procedure TfrmPrincipal.dbListaLivrosCellClick(Column: TColumn);
begin
spAlterar.Enabled := True;
spApagar.Enabled := True;
end;

procedure TfrmPrincipal.dbListaLivrosColExit(Sender: TObject);
begin
  spAlterar.Enabled := False;
end;

procedure TfrmPrincipal.edtCodigoLivroChange(Sender: TObject);
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

procedure TfrmPrincipal.edtPesquisarLivroChange(Sender: TObject);
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

procedure TfrmPrincipal.FormActivate(Sender: TObject);
begin
//  dtLista.Dataset.Active := false;
//  dtLista.Dataset.Active := true;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //
end;

procedure TfrmPrincipal.refreshClick(Sender: TObject);
begin
  dtLista.Dataset.Active := false;
  dtLista.Dataset.Active := true;
end;

procedure TfrmPrincipal.SairClick(Sender: TObject);
begin
  if Application.MessageBox('Você realmente deseja fechar?','Aviso',MB_YESNO+mb_IconInformation) = IDYES then
    Close;
end;

procedure TfrmPrincipal.spAlterarClick(Sender: TObject);
var
parametro1: String;
begin
  parametro1 := dbListaLivros.Fields[0].AsString;
  frmAlterarLivro.parametro1.Caption := parametro1;
  frmAlterarLivro.ShowModal;
end;

procedure TfrmPrincipal.spApagarClick(Sender: TObject);
var
parametro1: String;
begin
  parametro1 := dbListaLivros.Fields[0].AsString;
  frmApagar.pnCorpo.Caption := 'Você realmente deseja apagar o livro com o código: ' + parametro1;
  frmApagar.parametro1 := parametro1;
  frmApagar.ShowModal;
end;

procedure TfrmPrincipal.spCadastrarEntidadeClick(Sender: TObject);
begin
  frmCadastrarEntidade.ShowModal;
end;

procedure TfrmPrincipal.spCadastrarLivroClick(Sender: TObject);
begin
  frmCadastrarLivros.ShowModal;
end;

procedure TfrmPrincipal.spCancelarClick(Sender: TObject);
begin
  DM.dsLIVRO.CommandText := 'SELECT * FROM CADASTRARLIVROS';
  refreshClick(self);
  edtPesquisarLivro.Clear;
  edtCodigoLivro.Clear;
  edtPesquisarLivro.SetFocus;
end;

procedure TfrmPrincipal.spEmprestarLivroClick(Sender: TObject);
begin
  frmEmprestar.ShowModal;
end;

procedure TfrmPrincipal.spMinimizarClick(Sender: TObject);
begin
 Application.Minimize;
 ShowWindow(Application.Handle, SW_HIDE);
end;

procedure TfrmPrincipal.spPendentesClick(Sender: TObject);
begin
  frmPendentes.refreshClick(self);
  frmPendentes.ShowModal;
end;

procedure TfrmPrincipal.spPesquisarClick(Sender: TObject);
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

procedure TfrmPrincipal.spSobreClick(Sender: TObject);
begin
  frmPrincipal.Visible := False;
  frmSobre.ShowModal;
end;

end.
