object FormCadastrodeEspecialidadesMedica: TFormCadastrodeEspecialidadesMedica
  Left = 0
  Top = 0
  Caption = 'Cadastro de Especialidades Medicas'
  ClientHeight = 469
  ClientWidth = 861
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 14
  object lblCodigoEspecialidade: TLabel
    Left = 40
    Top = 51
    Width = 182
    Height = 18
    Caption = 'Codigo Especialidade Medica'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblNomeEspecialidadeMedica: TLabel
    Left = 40
    Top = 123
    Width = 178
    Height = 18
    Caption = 'Nome Especialidade Medica'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object edtcodigoespecialidade: TEdit
    Left = 40
    Top = 75
    Width = 75
    Height = 22
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object gridEspecialidadeMedica: TDBGrid
    Left = 408
    Top = 75
    Width = 393
    Height = 310
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = gridEspecialidadeMedicaDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'gid'
        Title.Caption = 'GID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nomeespecialidade'
        Title.Caption = 'Nome Especialidade'
        Width = 124
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DataCadastro'
        Title.Caption = 'Data Cadastro'
        Width = 86
        Visible = True
      end>
  end
  object btnIncluir: TButton
    Left = 40
    Top = 432
    Width = 75
    Height = 25
    Caption = 'Incluir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnIncluirClick
  end
  object btnEditar: TButton
    Left = 136
    Top = 432
    Width = 75
    Height = 25
    Caption = 'Editar'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btnEditarClick
  end
  object btnSalvar: TButton
    Left = 240
    Top = 432
    Width = 75
    Height = 25
    Caption = 'Salvar'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = btnSalvarClick
  end
  object btnExcluir: TButton
    Left = 608
    Top = 432
    Width = 75
    Height = 25
    Caption = 'Excluir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = btnExcluirClick
  end
  object btnCancelar: TButton
    Left = 726
    Top = 432
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = btnCancelarClick
  end
  object edtNomeEspecialidadeMedica: TEdit
    Left = 40
    Top = 147
    Width = 275
    Height = 22
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
  end
end
