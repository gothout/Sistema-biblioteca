unit uCadastrarLivros;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Mask,
  Vcl.Buttons, Vcl.AppEvnts, Vcl.ExtCtrls, Vcl.DBCtrls;

type
  TfrmCadastrarLivros = class(TForm)
    pnFim: TPanel;
    Label1: TLabel;
    pnCabecalho: TPanel;
    spVoltar: TSpeedButton;
    pnCorpo: TPanel;
    Label3: TLabel;
    Label2: TLabel;
    spCadastrar: TSpeedButton;
    Label9: TLabel;
    edtNome: TEdit;
    edtAutor: TEdit;
    Label4: TLabel;
    cbGenero: TComboBox;
    Label7: TLabel;
    btnMais: TButton;
    btnMenos: TButton;
    pnQuantia: TPanel;
    param1: TPanel;
    procedure btnMaisClick(Sender: TObject);
    procedure btnMenosClick(Sender: TObject);
    procedure spVoltarClick(Sender: TObject);
    procedure spCadastrarClick(Sender: TObject);
    procedure cbGeneroChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastrarLivros: TfrmCadastrarLivros;
  quant: integer;

implementation

{$R *.dfm}

uses uDM, uMessageCL;

procedure TfrmCadastrarLivros.btnMaisClick(Sender: TObject);
begin
  quant := quant + 1;
  if quant <> 0 then
    begin
      btnMenos.Enabled := True;
      pnQuantia.Caption := FloatToStr(quant);
    end
  else
    btnMenos.Enabled := False;
end;

procedure TfrmCadastrarLivros.btnMenosClick(Sender: TObject);
begin
  if quant = 0 then
    begin
      btnMenos.Enabled := False;
    end
  else
    begin
      quant := quant - 1;
      pnQuantia.Caption := FloatToStr(quant);
    end;
end;

procedure TfrmCadastrarLivros.cbGeneroChange(Sender: TObject);
begin
  if cbGenero.ItemIndex <> -1 then
    begin
      spCadastrar.Enabled := True;
    end
  else
   spCadastrar.Enabled := False;
end;

procedure TfrmCadastrarLivros.spCadastrarClick(Sender: TObject);
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
  dm.qryPrincipal.SQL.Add('INSERT INTO CADASTRARLIVROS (LIVRO_NOME, LIVRO_AUTOR, LIVRO_GENERO, LIVRO_QUANTIDADE) ');
  dm.qryPrincipal.SQL.Add('VALUES ('+ QuotedStr(edtNome.Text) + ',');
  dm.qryPrincipal.SQL.Add(QuotedStr(edtAutor.Text) + ',');
  dm.qryPrincipal.SQL.Add(QuotedStr(cbGenero.Text) + ',');
  dm.qryPrincipal.SQL.Add(QuotedStr(pnQuantia.Caption) + ')');
  dm.qryPrincipal.ExecSQL();
  dm.qryPrincipal.SQL.Clear;
  dm.qryPrincipal.Close;
  /////////////////////////////////////////////////////////////////////////////////////////////////////////
  dm.qryPrincipal.SQL.Clear;
  dm.qryPrincipal.SQL.Add('SELECT LIVRO_CODIGO FROM CADASTRARLIVROS');
  dm.qryPrincipal.SQL.Add('WHERE LIVRO_NOME = '+QuotedStr(edtNome.Text));
  dm.qryPrincipal.Open;
  param1.caption := dm.qryPrincipal.Fields[0].AsString;
  frmMessageCL.pnCorpo.Caption := ('Você cadastrou o livro "' + edtNome.Text +'" com o codigo: ' + param1.Caption);
  frmMessageCL.ShowModal;
end;

procedure TfrmCadastrarLivros.spVoltarClick(Sender: TObject);
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
