object frmInfPen: TfrmInfPen
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'frmInfPen'
  ClientHeight = 561
  ClientWidth = 389
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object pnFim: TPanel
    Left = 0
    Top = 520
    Width = 389
    Height = 41
    Align = alBottom
    Color = clSkyBlue
    ParentBackground = False
    TabOrder = 0
    ExplicitTop = 508
    ExplicitWidth = 434
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
    object Label8: TLabel
      Left = 190
      Top = 14
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
  object pnCorpo: TPanel
    Left = 0
    Top = 41
    Width = 389
    Height = 479
    Align = alClient
    Color = clGradientInactiveCaption
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 44
    ExplicitWidth = 411
    ExplicitHeight = 595
    object Label3: TLabel
      Left = 24
      Top = 82
      Width = 31
      Height = 13
      Caption = 'Nome:'
    end
    object Label9: TLabel
      Left = 26
      Top = 25
      Width = 157
      Height = 34
      Caption = 'Informa'#231#245'es'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -27
      Font.Name = 'Franklin Gothic Medium'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 24
      Top = 109
      Width = 37
      Height = 13
      Caption = 'C'#243'digo:'
    end
    object Label4: TLabel
      Left = 24
      Top = 136
      Width = 28
      Height = 13
      Caption = 'Email:'
    end
    object Label5: TLabel
      Left = 24
      Top = 163
      Width = 54
      Height = 13
      Caption = 'WhatsApp:'
    end
    object Label6: TLabel
      Left = 26
      Top = 190
      Width = 46
      Height = 13
      Caption = 'Telefone:'
    end
    object Label7: TLabel
      Left = 26
      Top = 219
      Width = 99
      Height = 13
      Caption = 'Data de nascimento:'
    end
    object Label10: TLabel
      Left = 16
      Top = 268
      Width = 69
      Height = 13
      Caption = 'Nome do livro:'
    end
    object Label11: TLabel
      Left = 16
      Top = 295
      Width = 77
      Height = 13
      Caption = 'C'#243'digo do livro:'
    end
    object Label12: TLabel
      Left = 16
      Top = 324
      Width = 123
      Height = 13
      Caption = 'Data que foi emprestado:'
    end
    object Label13: TLabel
      Left = 244
      Top = 324
      Width = 39
      Height = 13
      Caption = 'Horario:'
    end
    object lbHora: TLabel
      Left = 289
      Top = 322
      Width = 4
      Height = 16
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object spDevolver: TSpeedButton
      Left = 8
      Top = 360
      Width = 369
      Height = 33
      Caption = 'Devolver a biblioteca'
    end
    object spEmail: TSpeedButton
      Left = 8
      Top = 399
      Width = 369
      Height = 33
      Caption = 'Contactar pelo email a devolu'#231#227'o do livro'
    end
    object spWhat: TSpeedButton
      Left = 8
      Top = 438
      Width = 369
      Height = 33
      Caption = 'Contactar pelo WhatsApp a devolu'#231#227'o do livro'
    end
    object edtNome: TEdit
      Left = 99
      Top = 79
      Width = 278
      Height = 21
      Enabled = False
      TabOrder = 0
      TextHint = 'Digite o nome da entidade'
    end
    object dtNasc: TDateTimePicker
      Left = 131
      Top = 214
      Width = 246
      Height = 21
      Date = 43748.784444918980000000
      Time = 43748.784444918980000000
      TabOrder = 1
    end
    object edtCod: TEdit
      Left = 99
      Top = 106
      Width = 278
      Height = 21
      Enabled = False
      TabOrder = 2
      TextHint = 'Digite o nome da entidade'
    end
    object edtEmail: TEdit
      Left = 99
      Top = 133
      Width = 278
      Height = 21
      Enabled = False
      TabOrder = 3
      TextHint = 'Digite o nome da entidade'
    end
    object edtWpp: TEdit
      Left = 99
      Top = 160
      Width = 278
      Height = 21
      Enabled = False
      TabOrder = 4
      TextHint = 'Digite o nome da entidade'
    end
    object edtTelefone: TEdit
      Left = 99
      Top = 187
      Width = 278
      Height = 21
      Enabled = False
      TabOrder = 5
      TextHint = 'Digite o nome da entidade'
    end
    object Panel1: TPanel
      Left = -7
      Top = 241
      Width = 434
      Height = 18
      TabOrder = 6
    end
    object edtNomeL: TEdit
      Left = 91
      Top = 265
      Width = 278
      Height = 21
      TabOrder = 7
      TextHint = 'Digite o nome da entidade'
    end
    object edtCodL: TEdit
      Left = 91
      Top = 292
      Width = 278
      Height = 21
      TabOrder = 8
      TextHint = 'Digite o nome da entidade'
    end
    object dtLivro: TDateTimePicker
      Left = 145
      Top = 319
      Width = 93
      Height = 21
      Date = 43748.784444918980000000
      Time = 43748.784444918980000000
      TabOrder = 9
    end
  end
  object pnCabecalho: TPanel
    Left = 0
    Top = 0
    Width = 389
    Height = 41
    Align = alTop
    Color = clSkyBlue
    ParentBackground = False
    TabOrder = 2
    ExplicitWidth = 434
    object spVoltar: TSpeedButton
      Left = 8
      Top = 3
      Width = 49
      Height = 35
      Caption = '<----'
    end
  end
end
