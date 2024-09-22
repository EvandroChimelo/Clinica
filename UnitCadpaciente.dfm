object FormCadPaciente: TFormCadPaciente
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Pacientes'
  ClientHeight = 520
  ClientWidth = 753
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 13
  object Label2: TLabel
    Left = 24
    Top = 173
    Width = 18
    Height = 13
    Caption = 'GID'
  end
  object Label3: TLabel
    Left = 192
    Top = 173
    Width = 19
    Height = 13
    Caption = 'CPF'
  end
  object Label4: TLabel
    Left = 24
    Top = 229
    Width = 75
    Height = 13
    Caption = 'Nome Completo'
  end
  object Label5: TLabel
    Left = 24
    Top = 277
    Width = 42
    Height = 13
    Caption = 'Telefone'
  end
  object Label7: TLabel
    Left = 176
    Top = 275
    Width = 85
    Height = 13
    Caption = 'Data de Cadastro'
  end
  object Label6: TLabel
    Left = 448
    Top = 121
    Width = 175
    Height = 19
    Caption = 'Buscador de Paciente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 753
    Height = 105
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 749
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
  object DBGrid1: TDBGrid
    Left = 392
    Top = 173
    Width = 320
    Height = 284
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
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
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'telefone'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'datacadastro'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cpf'
        Visible = True
      end>
  end
  object TxtBusca: TEdit
    Left = 392
    Top = 146
    Width = 320
    Height = 21
    TabOrder = 4
    OnChange = TxtBuscaChange
  end
  object BtnSalvar: TButton
    Left = 192
    Top = 472
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 6
    OnClick = BtnSalvarClick
  end
  object BtnEditar: TButton
    Left = 99
    Top = 472
    Width = 75
    Height = 25
    Caption = 'Editar'
    TabOrder = 7
    OnClick = BtnEditarClick
  end
  object BtnIncluir: TButton
    Left = 8
    Top = 472
    Width = 75
    Height = 25
    Caption = 'Incluir'
    TabOrder = 8
    OnClick = BtnIncluirClick
  end
  object BtnExcluir: TButton
    Left = 288
    Top = 472
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 9
    OnClick = BtnExcluirClick
  end
  object BtnCancelar: TButton
    Left = 408
    Top = 472
    Width = 75
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
  object EdtGid: TEdit
    Left = 24
    Top = 192
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 11
  end
  object EdtCPF: TEdit
    Left = 192
    Top = 192
    Width = 121
    Height = 21
    Enabled = False
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
end
