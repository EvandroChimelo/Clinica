object formCadMedicos: TformCadMedicos
  Left = 0
  Top = 0
  Caption = 'Cadastro Medicos'
  ClientHeight = 667
  ClientWidth = 1014
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Label2: TLabel
    Left = 24
    Top = 173
    Width = 114
    Height = 18
    Caption = 'Codigo do Medico'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 192
    Top = 173
    Width = 25
    Height = 18
    Caption = 'CPF'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 24
    Top = 229
    Width = 105
    Height = 18
    Caption = 'Nome Completo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 24
    Top = 288
    Width = 57
    Height = 18
    Caption = 'Telefone'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 176
    Top = 292
    Width = 115
    Height = 18
    Caption = 'Data de Cadastro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblCadastroMedico: TLabel
    Left = 586
    Top = 119
    Width = 243
    Height = 28
    Caption = 'Buscador de M'#233'dicos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbCRM: TLabel
    Left = 24
    Top = 357
    Width = 30
    Height = 18
    Caption = 'CRM'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1014
    Height = 105
    Align = alTop
    TabOrder = 0
    object lbCadastroMedico: TLabel
      Left = 24
      Top = 24
      Width = 217
      Height = 25
      Caption = 'Cadastro de Medicos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object gridcadastropaciente: TDBGrid
    Left = 375
    Top = 192
    Width = 593
    Height = 385
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'gid'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Width = 141
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cpf'
        Width = 109
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'telefone'
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'datacadastro'
        Width = 94
        Visible = True
      end>
  end
  object TxtBusca: TEdit
    Left = 375
    Top = 165
    Width = 593
    Height = 23
    TabOrder = 2
  end
  object BtnSalvar: TButton
    Left = 289
    Top = 616
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 3
    OnClick = BtnSalvarClick
  end
  object BtnEditar: TButton
    Left = 152
    Top = 616
    Width = 75
    Height = 25
    Caption = 'Editar'
    TabOrder = 4
  end
  object BtnIncluir: TButton
    Left = 33
    Top = 616
    Width = 75
    Height = 25
    Caption = 'Incluir'
    TabOrder = 5
    OnClick = BtnIncluirClick
  end
  object BtnExcluir: TButton
    Left = 761
    Top = 616
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 6
  end
  object BtnCancelar: TButton
    Left = 882
    Top = 616
    Width = 86
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 7
  end
  object edtNome: TEdit
    Left = 24
    Top = 248
    Width = 121
    Height = 23
    Enabled = False
    TabOrder = 8
  end
  object edtGidMedico: TEdit
    Left = 24
    Top = 197
    Width = 121
    Height = 23
    Enabled = False
    TabOrder = 9
  end
  object edtCPF: TEdit
    Left = 192
    Top = 192
    Width = 121
    Height = 23
    Enabled = False
    MaxLength = 11
    TabOrder = 10
  end
  object edtTelefone: TEdit
    Left = 24
    Top = 312
    Width = 121
    Height = 23
    Enabled = False
    TabOrder = 11
  end
  object edtDataCadastro: TEdit
    Left = 176
    Top = 312
    Width = 121
    Height = 23
    Enabled = False
    TabOrder = 12
  end
  object edtCRM: TEdit
    Left = 24
    Top = 381
    Width = 121
    Height = 23
    Enabled = False
    MaxLength = 11
    TabOrder = 13
  end
end
