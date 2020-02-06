object frmCadastrarLivros: TfrmCadastrarLivros
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 456
  ClientWidth = 388
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
  object pnFim: TPanel
    Left = 0
    Top = 415
    Width = 388
    Height = 41
    Align = alBottom
    Color = clSkyBlue
    ParentBackground = False
    TabOrder = 0
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
  object pnCabecalho: TPanel
    Left = 0
    Top = 0
    Width = 388
    Height = 41
    Align = alTop
    Color = clSkyBlue
    ParentBackground = False
    TabOrder = 1
    object spVoltar: TSpeedButton
      Left = 8
      Top = 3
      Width = 49
      Height = 35
      Caption = '<----'
      OnClick = spVoltarClick
    end
  end
  object pnCorpo: TPanel
    Left = 0
    Top = 41
    Width = 388
    Height = 374
    Align = alClient
    Color = clGradientInactiveCaption
    ParentBackground = False
    TabOrder = 2
    object Label3: TLabel
      Left = 26
      Top = 122
      Width = 107
      Height = 13
      Caption = 'Digite o nome do livro:'
    end
    object Label2: TLabel
      Left = 26
      Top = 170
      Width = 113
      Height = 13
      Caption = 'Digite o nome do autor:'
    end
    object spCadastrar: TSpeedButton
      Left = 26
      Top = 318
      Width = 335
      Height = 43
      Caption = 'Cadastrar'
      Enabled = False
      OnClick = spCadastrarClick
    end
    object Label9: TLabel
      Left = 42
      Top = 49
      Width = 309
      Height = 34
      Caption = 'Cadastramento de livros'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -27
      Font.Name = 'Franklin Gothic Medium'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 26
      Top = 222
      Width = 120
      Height = 13
      Caption = 'Escolha o g'#234'nero do livro'
    end
    object Label7: TLabel
      Left = 26
      Top = 268
      Width = 109
      Height = 13
      Caption = 'Coloque a quantidade:'
    end
    object edtNome: TEdit
      Left = 26
      Top = 141
      Width = 335
      Height = 21
      TabOrder = 0
      TextHint = 'Digite o nome do livro'
    end
    object edtAutor: TEdit
      Left = 26
      Top = 191
      Width = 335
      Height = 21
      TabOrder = 1
      TextHint = 'Digite o nome do autor'
    end
    object cbGenero: TComboBox
      Left = 26
      Top = 241
      Width = 335
      Height = 21
      Style = csDropDownList
      TabOrder = 2
      TextHint = 'Escolha o g'#234'nero do livro'
      OnChange = cbGeneroChange
      Items.Strings = (
        'Autobiografia'
        'Biografia'
        'Fantasia e Fantasia Cient'#237'fica'
        'Fic'#231#227'o Cient'#237'fica'
        'Folhetim'
        'Horror'
        'Literatura Brutalista'
        'Literatura Fant'#225'stica'
        'Literatura Infanto-Juvenil'
        'Literatura YA '#8211' Young Adult '#8211' Jovem Adulto'
        'Metafic'#231#227'o'
        'Neocr'#237'tica'
        'Par'#243'dia'
        'Suspense'
        'Literatura G'#243'tica'
        'Literatura Esot'#233'rica'
        'Romances'
        'Literatura de Auto-Ajuda'
        'Literatura de Neg'#243'cios'
        'Literatura Steampunk'
        'Literatura Cyberpunk'
        'Literatura Espiritualista'
        'Literatura de Aventura'
        'Literatura de Guerra'
        'Outros')
    end
    object param1: TPanel
      Left = 396
      Top = 0
      Width = 6
      Height = 41
      TabOrder = 3
      Visible = False
    end
  end
  object btnMais: TButton
    Left = 129
    Top = 328
    Width = 24
    Height = 25
    Caption = '+'
    TabOrder = 3
    OnClick = btnMaisClick
  end
  object btnMenos: TButton
    Left = 159
    Top = 328
    Width = 24
    Height = 25
    Caption = '-'
    Enabled = False
    TabOrder = 4
    OnClick = btnMenosClick
  end
  object pnQuantia: TPanel
    Left = 26
    Top = 328
    Width = 97
    Height = 25
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
end
