unit uLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage;

type
  TfrmLogin = class(TForm)
    pnCorpo: TPanel;
    Label3: TLabel;
    Label2: TLabel;
    lbHora: TLabel;
    edtUser: TEdit;
    edtSenha: TEdit;
    pnCabecalho: TPanel;
    pnFim: TPanel;
    Label1: TLabel;
    btnEntrar: TButton;
    btnSair: TButton;
    Image1: TImage;
    procedure btnSairClick(Sender: TObject);
    procedure btnEntrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

uses uDM, uPrincipal;

procedure TfrmLogin.btnEntrarClick(Sender: TObject);
var
vloc_cont : integer;
PARAMETRO1 : INTEGER;
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
    //////////////////////////////////////////////////////////
    dm.qryPrincipal.Close;
    dm.qryPrincipal.SQL.Clear;
    dm.qryPrincipal.SQL.Add('select usuario, senha, tipo from logins');
    dm.qryPrincipal.SQL.Add('where usuario = '+QuotedStr(edtUser.Text));
    dm.qryPrincipal.SQL.Add('and senha = '+QuotedStr(edtSenha.Text));
    dm.qryPrincipal.Open;
    if dm.qryPrincipal.IsEmpty then
      begin
        Application.MessageBox('Falha na autenticação','Atenção!',MB_ICONWARNING);
      end
    else
      begin
        PARAMETRO1 := dm.qryPrincipal.Fields[2].AsInteger;
        if PARAMETRO1 = 1 then
          begin
            frmPrincipal.spCadastrarLivro.Visible := True;
            frmPrincipal.spAlterar.Visible := True;
            frmPrincipal.spApagar.Visible := True;
            frmPrincipal.refreshClick(self);
            frmPrincipal.ShowModal;
          end
        else
            begin
              frmPrincipal.spCadastrarLivro.Visible := False;
              frmPrincipal.spAlterar.Visible := False;
              frmPrincipal.spApagar.Visible := False;
              frmPrincipal.ShowModal;
            end;
      end;
end;

procedure TfrmLogin.btnSairClick(Sender: TObject);
begin
  close;
end;

end.
