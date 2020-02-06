unit uCadastrarEntidade;

interface

uses   Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, ExtCtrls, pngimage,
  StdCtrls, Buttons, ComCtrls, Mask, PADRONIZACAO, Vcl.AppEvnts;
type
  TfrmCadastrarEntidade = class(TPADRONIZAÇÃO)
    edtNome: TEdit;
    Label3: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    edtTelefone: TMaskEdit;
    edtWpp: TMaskEdit;
    Label5: TLabel;
    Label7: TLabel;
    dtNasc: TDateTimePicker;
    SpeedButton1: TSpeedButton;
    Label9: TLabel;
    btnTenhoT: TButton;
    btnNaoT: TButton;
    btnNaoW: TButton;
    btnTenhoW: TButton;
    edtEmail: TEdit;
    ApplicationEvents1: TApplicationEvents;
    param1: TPanel;
    procedure spVoltarClick(Sender: TObject);
    procedure btnNaoTClick(Sender: TObject);
    procedure btnTenhoTClick(Sender: TObject);
    procedure btnNaoWClick(Sender: TObject);
    procedure btnTenhoWClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastrarEntidade: TfrmCadastrarEntidade;

implementation

{$R *.dfm}

uses uPrincipal, uDM, uMessageCE;

procedure TfrmCadastrarEntidade.btnNaoWClick(Sender: TObject);
begin
  btnNaoW.Enabled := False;
  btnTenhoW.Enabled := True;
  edtWpp.Text := '(00)0000-00000';
  edtWpp.Enabled := False;
end;

procedure TfrmCadastrarEntidade.btnTenhoTClick(Sender: TObject);
begin
  btnTenhoT.Enabled := False;
  btnNaoT.Enabled := True;
  edtTelefone.Enabled := True;
  edtTelefone.Text := '';
end;

procedure TfrmCadastrarEntidade.btnTenhoWClick(Sender: TObject);
begin
  btnTenhoW.Enabled := False;
  btnNaoW.Enabled := True;
  edtWpp.Enabled := True;
  edtWpp.Text := '';
end;



procedure TfrmCadastrarEntidade.SpeedButton1Click(Sender: TObject);
var
vloc_cont : integer;
Data : String;
PARAMETRO1 : STRING;
PARAMETRO2 : STRING;
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
  Data := DateToStr(dtNasc.Date);
  PARAMETRO1 := StringReplace(edtTelefone.Text, '(', '', [rfIgnoreCase]);
  PARAMETRO1 := StringReplace(PARAMETRO1, ')', '', [rfIgnoreCase]);
  PARAMETRO1 := StringReplace(PARAMETRO1, '-', '', [rfIgnoreCase]);
  PARAMETRO2 := StringReplace(edtWpp.Text, '(', '', [rfIgnoreCase]);
  PARAMETRO2 := StringReplace(PARAMETRO2, ')', '', [rfIgnoreCase]);
  PARAMETRO2 := StringReplace(PARAMETRO2, '-', '', [rfIgnoreCase]);
  Data := StringReplace(Data, '/', '.', [rfIgnoreCase]);
  dm.qryPrincipal.Close;
  dm.qryPrincipal.SQL.Clear;
  dm.qryPrincipal.SQL.Add('INSERT INTO CADASTRADOS (CAD_NOME, CAD_EMAIL, CAD_TELEFONE, CAD_WHATSAPP, CAD_DATANASC) ');
  dm.qryPrincipal.SQL.Add('VALUES ('+ QuotedStr(edtNome.Text) + ',');
  dm.qryPrincipal.SQL.Add(QuotedStr(edtEmail.Text) + ',');
  dm.qryPrincipal.SQL.Add(QuotedStr(PARAMETRO1) + ',');
  dm.qryPrincipal.SQL.Add(QuotedStr(PARAMETRO2) + ',');
  dm.qryPrincipal.SQL.Add(QuotedStr(Data) + ')');
  dm.qryPrincipal.ExecSQL();
  dm.qryPrincipal.SQL.Clear;
  dm.qryPrincipal.Close;
  /////////////////////////////////////////////////////////////////////////////////////////////////////////
  dm.qryPrincipal.SQL.Clear;
  dm.qryPrincipal.SQL.Add('select COD_ALUNO from CADASTRADOS');
  dm.qryPrincipal.SQL.Add('where CAD_NOME = '+QuotedStr(edtNome.Text));
  dm.qryPrincipal.Open;
  param1.caption := dm.qryPrincipal.Fields[0].AsString;
  frmMessageCE.pnCorpo.Caption := ('Você cadastrou ' + edtNome.Text +' com o codigo: ' + param1.Caption);
  frmMessageCE.ShowModal;
end;

procedure TfrmCadastrarEntidade.ApplicationEvents1Exception(Sender: TObject;
  E: Exception);
begin
     if Pos('Invalid input', E.Message) > 0 then
     begin
      Application.MessageBox('Aperte ESC para sair do campo','Aviso',mb_Ok+mb_IconExclamation);
     end;
end;

procedure TfrmCadastrarEntidade.btnNaoTClick(Sender: TObject);
begin
  btnNaoT.Enabled := False;
  btnTenhoT.Enabled := True;
  edtTelefone.Text := '(00)0000-00000';
  edtTelefone.Enabled := False;
end;

procedure TfrmCadastrarEntidade.spVoltarClick(Sender: TObject);
begin
  edtNome.Clear;
  edtEmail.Clear;
  edtTelefone.Clear;
  edtWpp.Clear;
  btnTenhoT.Enabled := False;
  btnNaoT.Enabled := True;
  btnTenhoW.Enabled := False;
  btnNaoW.Enabled := True;
  edtTelefone.Enabled := True;
  dtNasc.Date := StrToDate('10/10/2019');
  edtWpp.Enabled := True;
  Close;
end;

end.
