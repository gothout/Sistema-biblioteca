unit uAlteraLivro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadastrarLivros, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmAlterarLivro = class(TfrmCadastrarLivros)
    parametro1: TPanel;
    procedure spCadastrarClick(Sender: TObject);
    procedure spVoltarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAlterarLivro: TfrmAlterarLivro;

implementation

{$R *.dfm}

uses uDM, uMessageAL;

procedure TfrmAlterarLivro.FormActivate(Sender: TObject);
begin
  dm.qryPrincipal.SQL.Clear;
  dm.qryPrincipal.SQL.Add('SELECT LIVRO_CODIGO, LIVRO_NOME, LIVRO_AUTOR, LIVRO_GENERO, LIVRO_QUANTIDADE FROM CADASTRARLIVROS WHERE LIVRO_CODIGO = '+QuotedStr(parametro1.Caption));
  dm.qryPrincipal.Open;
  edtNome.text := dm.qryPrincipal.Fields[1].AsString;
  edtAutor.text := dm.qryPrincipal.Fields[2].AsString;
  pnQuantia.caption := dm.qryPrincipal.Fields[4].AsString;
end;

procedure TfrmAlterarLivro.spCadastrarClick(Sender: TObject);
var
vloc_cont : integer;
begin
  for vloc_cont := 0 to ComponentCount -1 do
  begin
    if Components[vloc_Cont] is TEdit then
        begin
          if (Trim(TEdit(Components[vloc_cont]).Text) = '') then
            begin
              if TEdit(Components[vloc_cont]).CanFocus then
                TEdit(Components[vloc_Cont]).SetFocus;
                Application.MessageBox('Existem campos que precisam ser preenchidos','Aviso',mb_Ok+mb_IconExclamation);;
              Exit;
            end;
        end;
  end;
  dm.qryPrincipal.Close;
  dm.qryPrincipal.SQL.Clear;
  dm.qryPrincipal.SQL.Add('UPDATE CADASTRARLIVROS ');
  dm.qryPrincipal.SQL.Add('SET LIVRO_NOME = '+ QuotedStr(edtNome.Text) + ' WHERE LIVRO_CODIGO = ' + QuotedStr(parametro1.Caption));
  dm.qryPrincipal.ExecSQL();
  dm.qryPrincipal.SQL.Clear;
  dm.qryPrincipal.Close;
  /////////////////////
  dm.qryPrincipal.SQL.Clear;
  dm.qryPrincipal.SQL.Add('UPDATE CADASTRARLIVROS ');
  dm.qryPrincipal.SQL.Add('SET LIVRO_AUTOR = '+ QuotedStr(edtAutor.Text) + ' WHERE LIVRO_CODIGO = ' + QuotedStr(parametro1.Caption));
  dm.qryPrincipal.ExecSQL();
  dm.qryPrincipal.SQL.Clear;
  dm.qryPrincipal.Close;
  /////////////////////
  dm.qryPrincipal.SQL.Clear;
  dm.qryPrincipal.SQL.Add('UPDATE CADASTRARLIVROS ');
  dm.qryPrincipal.SQL.Add('SET LIVRO_GENERO = '+ QuotedStr(cbGenero.Text) + ' WHERE LIVRO_CODIGO = ' + QuotedStr(parametro1.Caption));
  dm.qryPrincipal.ExecSQL();
  dm.qryPrincipal.SQL.Clear;
  dm.qryPrincipal.Close;
  /////////////////////
  dm.qryPrincipal.SQL.Clear;
  dm.qryPrincipal.SQL.Add('UPDATE CADASTRARLIVROS ');
  dm.qryPrincipal.SQL.Add('SET LIVRO_QUANTIDADE = '+ QuotedStr(pnQuantia.Caption) + ' WHERE LIVRO_CODIGO = ' + QuotedStr(parametro1.Caption));
  dm.qryPrincipal.ExecSQL();
  dm.qryPrincipal.SQL.Clear;
  dm.qryPrincipal.Close;
  /////////////////////
  dm.qryPrincipal.SQL.Clear;
  dm.qryPrincipal.SQL.Add('SELECT LIVRO_CODIGO FROM CADASTRARLIVROS');
  dm.qryPrincipal.SQL.Add('WHERE LIVRO_NOME = '+QuotedStr(edtNome.Text));
  dm.qryPrincipal.Open;
  param1.caption := dm.qryPrincipal.Fields[0].AsString;
  frmMessageAL.pnCorpo.Caption := ('Você alterou o livro com o codigo: ' + parametro1.Caption);
  frmMessageAL.ShowModal;
end;

procedure TfrmAlterarLivro.spVoltarClick(Sender: TObject);
begin
  edtNome.Clear;
  edtAutor.Clear;
  cbGenero.ClearSelection;
  quant := 0;
  pnQuantia.Caption := FloatToStr(quant);
  spCadastrar.Enabled := False;
  Close;
end;

end.
