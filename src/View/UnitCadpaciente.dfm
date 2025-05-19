object FormCadPaciente: TFormCadPaciente
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Pacientes'
  ClientHeight = 663
  ClientWidth = 1050
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  TextHeight = 13
  object lbCodPaciente: TLabel
    Left = 24
    Top = 173
    Width = 123
    Height = 18
    Caption = 'Codigo do Paciente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbCPFPaciente: TLabel
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
  object Label6: TLabel
    Left = 586
    Top = 119
    Width = 250
    Height = 28
    Caption = 'Buscador de Paciente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1050
    Height = 105
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 222
      Height = 25
      Caption = 'Cadastro de Paciente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object gridcadastropaciente: TDBGrid
    Left = 416
    Top = 192
    Width = 593
    Height = 385
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = gridcadastropacienteDblClick
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
    Left = 416
    Top = 165
    Width = 593
    Height = 21
    TabOrder = 4
    OnChange = TxtBuscaChange
  end
  object BtnSalvar: TButton
    Left = 289
    Top = 616
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 6
    OnClick = BtnSalvarClick
  end
  object BtnEditar: TButton
    Left = 152
    Top = 616
    Width = 75
    Height = 25
    Caption = 'Editar'
    TabOrder = 7
    OnClick = BtnEditarClick
  end
  object BtnIncluir: TButton
    Left = 33
    Top = 616
    Width = 75
    Height = 25
    Caption = 'Incluir'
    TabOrder = 8
    OnClick = BtnIncluirClick
  end
  object BtnExcluir: TButton
    Left = 761
    Top = 616
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 9
    OnClick = BtnExcluirClick
  end
  object BtnCancelar: TButton
    Left = 895
    Top = 616
    Width = 86
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 10
    OnClick = BtnCancelarClick
  end
  object EdtNome: TEdit
    Left = 24
    Top = 248
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 2
  end
  object edtGid: TEdit
    Left = 24
    Top = 197
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 11
  end
  object EdtCPF: TEdit
    Left = 192
    Top = 197
    Width = 121
    Height = 21
    Enabled = False
    MaxLength = 11
    TabOrder = 1
  end
  object EdtTelefone: TEdit
    Left = 24
    Top = 312
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 3
  end
  object EdtDataCadastro: TEdit
    Left = 176
    Top = 312
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 12
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 104
    Top = 416
  end
end
