object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  ActiveControl = edtPesquisarLivro
  Align = alCustom
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsNone
  Caption = 'Biblioteca'
  ClientHeight = 572
  ClientWidth = 922
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object pnCabecalho: TPanel
    Left = 0
    Top = 0
    Width = 922
    Height = 41
    Align = alTop
    Color = clSkyBlue
    ParentBackground = False
    TabOrder = 0
    object Sair: TSpeedButton
      Left = 860
      Top = 3
      Width = 49
      Height = 35
      Caption = 'Sair'
      OnClick = SairClick
    end
    object spMinimizar: TSpeedButton
      Left = 800
      Top = 3
      Width = 57
      Height = 35
      Caption = 'Minimizar'
      OnClick = spMinimizarClick
    end
    object refresh: TButton
      Left = -64
      Top = -16
      Width = 75
      Height = 25
      Caption = 'REFRESH'
      TabOrder = 0
      Visible = False
      OnClick = refreshClick
    end
  end
  object pnFim: TPanel
    Left = 0
    Top = 531
    Width = 922
    Height = 41
    Align = alBottom
    Color = clSkyBlue
    ParentBackground = False
    TabOrder = 1
    object spSobre: TSpeedButton
      Left = 860
      Top = 6
      Width = 49
      Height = 27
      Caption = 'Sobre'
      OnClick = spSobreClick
    end
  end
  object pnCorpo: TPanel
    Left = 0
    Top = 41
    Width = 922
    Height = 490
    Align = alClient
    Color = clGradientInactiveCaption
    ParentBackground = False
    TabOrder = 2
    object spCadastrarEntidade: TSpeedButton
      Left = 15
      Top = 448
      Width = 173
      Height = 33
      Caption = 'Cadastrar entidade'
      OnClick = spCadastrarEntidadeClick
    end
    object spCadastrarLivro: TSpeedButton
      Left = 194
      Top = 448
      Width = 173
      Height = 33
      Caption = 'Cadastrar livro'
      OnClick = spCadastrarLivroClick
    end
    object spPesquisar: TSpeedButton
      Left = 524
      Top = 33
      Width = 189
      Height = 21
      Caption = 'Pesquisar livro'
      Enabled = False
      OnClick = spPesquisarClick
    end
    object spCancelar: TSpeedButton
      Left = 727
      Top = 33
      Width = 182
      Height = 21
      Caption = 'Cancelar'
      Enabled = False
      OnClick = spCancelarClick
    end
    object Label1: TLabel
      Left = 16
      Top = 10
      Width = 198
      Height = 13
      Caption = 'Pesquise o livro pelo c'#243'digo ou pelo nome'
    end
    object spEmprestarLivro: TSpeedButton
      Left = 736
      Top = 448
      Width = 173
      Height = 33
      Caption = 'Emprestar livro'
      OnClick = spEmprestarLivroClick
    end
    object spPendentes: TSpeedButton
      Left = 557
      Top = 448
      Width = 173
      Height = 33
      Caption = 'Entidades pendentes'
      OnClick = spPendentesClick
    end
    object edtPesquisarLivro: TEdit
      Left = 16
      Top = 33
      Width = 233
      Height = 21
      TabOrder = 0
      TextHint = 'Digite o nome do livro'
      OnChange = edtPesquisarLivroChange
    end
    object edtCodigoLivro: TEdit
      Left = 255
      Top = 33
      Width = 263
      Height = 21
      NumbersOnly = True
      TabOrder = 1
      TextHint = 'Digite o c'#243'digo do livro'
      OnChange = edtCodigoLivroChange
    end
    object pnLista: TPanel
      Left = 16
      Top = 66
      Width = 893
      Height = 370
      Color = clWhite
      ParentBackground = False
      TabOrder = 2
      object spAlterar: TSpeedButton
        Left = 1
        Top = 348
        Width = 891
        Height = 21
        Align = alBottom
        Caption = 'Alterar registro'
        Enabled = False
        OnClick = spAlterarClick
        ExplicitTop = 354
      end
      object spApagar: TSpeedButton
        Left = 1
        Top = 327
        Width = 891
        Height = 21
        Align = alBottom
        Caption = 'Apagar registro'
        Enabled = False
        OnClick = spApagarClick
        ExplicitTop = 321
      end
      object dbListaLivros: TDBGrid
        Left = 1
        Top = 1
        Width = 891
        Height = 326
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
        OnColExit = dbListaLivrosColExit
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
    end
  end
  object dtLista: TDataSource
    AutoEdit = False
    DataSet = DM.cdsLIVRO
    Left = 856
    Top = 120
  end
end
