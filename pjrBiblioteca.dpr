program pjrBiblioteca;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  PADRONIZACAO in 'PADRONIZACAO.pas' {PADRONIZAÇÃO},
  uCadastrarEntidade in 'uCadastrarEntidade.pas' {frmCadastrarEntidade},
  uDM in 'uDM.pas' {DM},
  uMessageCE in 'uMessageCE.pas' {frmMessageCE},
  uCadastrarLivros in 'uCadastrarLivros.pas' {frmCadastrarLivros},
  uMessageCL in 'uMessageCL.pas' {frmMessageCL},
  uApagar in 'uApagar.pas' {frmApagar},
  uAlteraLivro in 'uAlteraLivro.pas' {frmAlterarLivro},
  uMessageAL in 'uMessageAL.pas' {frmMessageAL},
  uEmprestar in 'uEmprestar.pas' {frmEmprestar},
  uEscolherLivro in 'uEscolherLivro.pas' {frmEscolherLivro},
  uEmprestarEPL in 'uEmprestarEPL.pas' {frmMessageEPL},
  uPendentes in 'uPendentes.pas' {frmPendentes},
  uInfo in 'uInfo.pas' {frmInfo},
  uMessageInfo in 'uMessageInfo.pas' {frmMessageInfo},
  uSobre in 'uSobre.pas' {frmSobre},
  uLogin in 'uLogin.pas' {frmLogin};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Biblioteca';
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TPADRONIZAÇÃO, PADRONIZAÇÃO);
  Application.CreateForm(TfrmCadastrarEntidade, frmCadastrarEntidade);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmMessageCE, frmMessageCE);
  Application.CreateForm(TfrmCadastrarLivros, frmCadastrarLivros);
  Application.CreateForm(TfrmMessageCL, frmMessageCL);
  Application.CreateForm(TfrmApagar, frmApagar);
  Application.CreateForm(TfrmAlterarLivro, frmAlterarLivro);
  Application.CreateForm(TfrmMessageAL, frmMessageAL);
  Application.CreateForm(TfrmEmprestar, frmEmprestar);
  Application.CreateForm(TfrmEscolherLivro, frmEscolherLivro);
  Application.CreateForm(TfrmMessageEPL, frmMessageEPL);
  Application.CreateForm(TfrmPendentes, frmPendentes);
  Application.CreateForm(TfrmInfo, frmInfo);
  Application.CreateForm(TfrmMessageInfo, frmMessageInfo);
  Application.CreateForm(TfrmSobre, frmSobre);
  Application.Run;
end.
