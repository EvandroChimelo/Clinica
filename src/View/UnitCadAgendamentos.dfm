object FormCadAgendamentos: TFormCadAgendamentos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Agendamento'
  ClientHeight = 607
  ClientWidth = 997
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
    Top = 133
    Width = 139
    Height = 18
    Caption = 'Codigo Agendamento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 24
    Top = 181
    Width = 98
    Height = 18
    Caption = 'Nome Paciente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 24
    Top = 269
    Width = 68
    Height = 13
    Caption = 'Data Consulta'
  end
  object Label5: TLabel
    Left = 146
    Top = 269
    Width = 68
    Height = 13
    Caption = 'Hora Consulta'
  end
  object Label6: TLabel
    Left = 24
    Top = 309
    Width = 100
    Height = 13
    Caption = 'Especialidade M'#233'dica'
  end
  object Label7: TLabel
    Left = 24
    Top = 357
    Width = 78
    Height = 13
    Caption = 'Nome do M'#233'dico'
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 997
    Height = 105
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 993
    object Label1: TLabel
      Left = 40
      Top = 36
      Width = 355
      Height = 33
      Caption = 'Agendamento de Consulta'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object DBComboBox1: TDBComboBox
    Left = 24
    Top = 328
    Width = 113
    Height = 21
    Items.Strings = (
      'Cadiologista'
      'Nutricionista'
      'Ortopedista')
    TabOrder = 1
  end
  object DBGrid1: TDBGrid
    Left = 416
    Top = 150
    Width = 553
    Height = 395
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'data'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'hora'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'especialidade'
        Width = 86
        Visible = True
      end>
  end
  object BtnInlcuir: TButton
    Left = 8
    Top = 560
    Width = 75
    Height = 25
    Caption = 'Inlcuir'
    TabOrder = 3
  end
  object BtnAlterar: TButton
    Left = 89
    Top = 560
    Width = 75
    Height = 25
    Caption = 'Alterar'
    TabOrder = 4
  end
  object BtnSalvar: TButton
    Left = 170
    Top = 560
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 5
  end
  object BtnExcluir: TButton
    Left = 747
    Top = 560
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 6
  end
  object BtnCancelar: TButton
    Left = 848
    Top = 560
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 7
  end
  object EdtGID: TEdit
    Left = 24
    Top = 154
    Width = 51
    Height = 21
    TabOrder = 8
  end
  object TEdit
    Left = 24
    Top = 288
    Width = 100
    Height = 21
    TabOrder = 9
  end
  object TEdit
    Left = 146
    Top = 288
    Width = 121
    Height = 21
    TabOrder = 10
  end
  object TEdit
    Left = 24
    Top = 392
    Width = 121
    Height = 21
    TabOrder = 11
  end
end
