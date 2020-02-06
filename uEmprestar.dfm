object frmEmprestar: TfrmEmprestar
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 611
  ClientWidth = 428
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnCabecalho: TPanel
    Left = 0
    Top = 0
    Width = 428
    Height = 41
    Align = alTop
    Color = clSkyBlue
    ParentBackground = False
    TabOrder = 0
    object spVoltar: TSpeedButton
      Left = 5
      Top = 4
      Width = 49
      Height = 35
      Caption = '<----'
      OnClick = spVoltarClick
    end
    object lbHora: TLabel
      Left = 160
      Top = 0
      Width = 3
      Height = 13
      Visible = False
    end
  end
  object pnCorpo: TPanel
    Left = 0
    Top = 41
    Width = 428
    Height = 529
    Align = alClient
    Color = clGradientInactiveCaption
    ParentBackground = False
    TabOrder = 1
    object Label3: TLabel
      Left = 26
      Top = 74
      Width = 134
      Height = 13
      Caption = 'Digite o c'#243'digo da entidade:'
    end
    object Label9: TLabel
      Left = 26
      Top = 34
      Width = 192
      Height = 34
      Caption = 'Emprestar livro'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -27
      Font.Name = 'Franklin Gothic Medium'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 26
      Top = 194
      Width = 28
      Height = 13
      Caption = 'Email:'
    end
    object Label4: TLabel
      Left = 26
      Top = 242
      Width = 46
      Height = 13
      Caption = 'Telefone:'
    end
    object Label5: TLabel
      Left = 207
      Top = 242
      Width = 54
      Height = 13
      Caption = 'WhatsApp:'
    end
    object Label7: TLabel
      Left = 26
      Top = 288
      Width = 99
      Height = 13
      Caption = 'Data de nascimento:'
    end
    object spEscolherLivro: TSpeedButton
      Left = 26
      Top = 358
      Width = 375
      Height = 49
      Caption = 'Escolha o livro'
      Enabled = False
      OnClick = spEscolherLivroClick
    end
    object spEmprestar: TSpeedButton
      Left = 26
      Top = 470
      Width = 375
      Height = 49
      Caption = 'Emprestar livro'
      Enabled = False
      OnClick = spEmprestarClick
    end
    object spVerifica: TSpeedButton
      Left = 327
      Top = 94
      Width = 74
      Height = 22
      Caption = 'Verificar'
      OnClick = spVerificaClick
    end
    object Label6: TLabel
      Left = 26
      Top = 148
      Width = 31
      Height = 13
      Caption = 'Nome:'
    end
    object edtNome: TEdit
      Left = 26
      Top = 95
      Width = 295
      Height = 21
      TabOrder = 0
      TextHint = 'Digite o c'#243'digo da entidade'
    end
    object edtEmailE: TEdit
      Left = 26
      Top = 213
      Width = 375
      Height = 21
      Enabled = False
      TabOrder = 1
      TextHint = 'Digite o nome da entidade'
    end
    object edtTelefoneE: TEdit
      Left = 26
      Top = 263
      Width = 175
      Height = 21
      Enabled = False
      TabOrder = 2
      TextHint = 'Digite o nome da entidade'
    end
    object edtWhatsappE: TEdit
      Left = 207
      Top = 263
      Width = 194
      Height = 21
      Enabled = False
      TabOrder = 3
      TextHint = 'Digite o nome da entidade'
    end
    object dtNasc: TDateTimePicker
      Left = 26
      Top = 307
      Width = 375
      Height = 21
      Date = 43748.784444918980000000
      Time = 43748.784444918980000000
      Enabled = False
      TabOrder = 4
    end
    object Panel1: TPanel
      Left = 0
      Top = 122
      Width = 434
      Height = 18
      TabOrder = 5
    end
    object Panel2: TPanel
      Left = 0
      Top = 334
      Width = 434
      Height = 18
      TabOrder = 6
    end
    object edtCodLivro: TEdit
      Left = 26
      Top = 443
      Width = 375
      Height = 21
      Enabled = False
      TabOrder = 7
      Text = 'Escolha um livro'
    end
    object edtNomeLivro: TEdit
      Left = 26
      Top = 416
      Width = 375
      Height = 21
      Enabled = False
      TabOrder = 8
      Text = 'Escolha um livro'
    end
    object edtNomeE: TEdit
      Left = 26
      Top = 167
      Width = 375
      Height = 21
      Enabled = False
      TabOrder = 9
      TextHint = 'Digite o nome da entidade'
    end
    object dtPARAM: TDateTimePicker
      Left = 26
      Top = 7
      Width = 375
      Height = 21
      Date = 43748.784444918980000000
      Time = 43748.784444918980000000
      Enabled = False
      TabOrder = 10
      Visible = False
    end
    object edtCalcu: TEdit
      Left = 400
      Top = 34
      Width = 1
      Height = 21
      TabOrder = 11
      Text = 'edtCalcu'
      Visible = False
    end
  end
  object pnFim: TPanel
    Left = 0
    Top = 570
    Width = 428
    Height = 41
    Align = alBottom
    Color = clSkyBlue
    ParentBackground = False
    TabOrder = 2
    object Label1: TLabel
      Left = 408
      Top = -12
      Width = 187
      Height = 13
      Align = alCustom
      Caption = 'Desenvolvido por Lucas Daniel Chaves'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = [fsItalic]
      ParentFont = False
    end
  end
  object tempo: TTimer
    OnTimer = tempoTimer
    Left = 372
    Top = 10
  end
end
