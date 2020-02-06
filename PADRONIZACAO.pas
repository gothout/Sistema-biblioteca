unit PADRONIZACAO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TPADRONIZAÇÃO = class(TForm)
    pnCabecalho: TPanel;
    pnCorpo: TPanel;
    pnFim: TPanel;
    spVoltar: TSpeedButton;
    Label1: TLabel;
    Label6: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PADRONIZAÇÃO: TPADRONIZAÇÃO;

implementation

{$R *.dfm}

end.
