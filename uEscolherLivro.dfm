object frmEscolherLivro: TfrmEscolherLivro
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'frmEscolherLivro'
  ClientHeight = 419
  ClientWidth = 904
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
  object spEscolha: TSpeedButton
    Left = 0
    Top = 368
    Width = 904
    Height = 24
    Align = alBottom
    Caption = 'Este livro!'
    Enabled = False
    OnClick = spEscolhaClick
    ExplicitTop = 376
  end
  object spSair: TSpeedButton
    Left = 0
    Top = 392
    Width = 904
    Height = 27
    Align = alBottom
    Caption = 'Sair'
    OnClick = spSairClick
    ExplicitTop = 398
  end
  object dbListaLivros: TDBGrid
    Left = 0
    Top = 65
    Width = 904
    Height = 303
    Align = alClient
    DataSource = dtLista
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = dbListaLivrosCellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'LIVRO_CODIGO'
        PickList.Strings = (
          '')
        Title.Caption = 'Codigo do Livro'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LIVRO_NOME'
        Title.Caption = 'Nome do Livro'
        Width = 215
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LIVRO_AUTOR'
        Title.Caption = 'Nome do Autor'
        Width = 267
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LIVRO_GENERO'
        Title.Caption = 'Genero do Livro'
        Width = 221
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LIVRO_QUANTIDADE'
        Title.Caption = 'Quantidade'
        Visible = True
      end>
  end
  object pnCabecalho: TPanel
    Left = 0
    Top = 0
    Width = 904
    Height = 65
    Align = alTop
    Color = clSkyBlue
    ParentBackground = False
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 10
      Width = 198
      Height = 13
      Caption = 'Pesquise o livro pelo c'#243'digo ou pelo nome'
    end
    object spPesquisar: TSpeedButton
      Left = 524
      Top = 29
      Width = 189
      Height = 21
      Caption = 'Pesquisar livro'
      Enabled = False
      OnClick = spPesquisarClick
    end
    object spCancelar: TSpeedButton
      Left = 719
      Top = 29
      Width = 182
      Height = 21
      Caption = 'Cancelar'
      Enabled = False
      OnClick = spCancelarClick
    end
    object edtPesquisarLivro: TEdit
      Left = 16
      Top = 29
      Width = 233
      Height = 21
      TabOrder = 0
      TextHint = 'Digite o nome do livro'
      OnChange = edtPesquisarLivroChange
    end
    object edtCodigoLivro: TEdit
      Left = 255
      Top = 29
      Width = 263
      Height = 21
      NumbersOnly = True
      TabOrder = 1
      TextHint = 'Digite o c'#243'digo do livro'
      OnChange = edtCodigoLivroChange
    end
    object refresh: TButton
      Left = -64
      Top = -16
      Width = 75
      Height = 25
      Caption = 'REFRESH'
      TabOrder = 2
      Visible = False
      OnClick = refreshClick
    end
  end
  object dtLista: TDataSource
    AutoEdit = False
    DataSet = DM.cdsLIVRO
    Left = 832
    Top = 128
  end
end
