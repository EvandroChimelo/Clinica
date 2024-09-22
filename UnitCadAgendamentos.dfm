object FormCadAgendamentos: TFormCadAgendamentos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Agendamento'
  ClientHeight = 494
  ClientWidth = 758
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
    Width = 11
    Height = 13
    Caption = 'ID'
  end
  object Label4: TLabel
    Left = 80
    Top = 133
    Width = 71
    Height = 13
    Caption = 'Nome Paciente'
  end
  object Label3: TLabel
    Left = 24
    Top = 181
    Width = 23
    Height = 13
    Caption = 'Data'
  end
  object Label5: TLabel
    Left = 136
    Top = 181
    Width = 23
    Height = 13
    Caption = 'Hora'
  end
  object Label6: TLabel
    Left = 24
    Top = 237
    Width = 64
    Height = 13
    Caption = 'Especialidade'
  end
  object Label7: TLabel
    Left = 24
    Top = 293
    Width = 78
    Height = 13
    Caption = 'Nome do M'#233'dico'
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 758
    Height = 105
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 754
    object Label1: TLabel
      Left = 40
      Top = 36
      Width = 188
      Height = 33
      Caption = 'Agendamento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBNavigator1: TDBNavigator
      Left = 368
      Top = 10
      Width = 290
      Height = 61
      TabOrder = 0
    end
  end
  object txtid: TDBEdit
    Left = 24
    Top = 152
    Width = 78
    Height = 21
    TabOrder = 1
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 128
    Top = 154
    Width = 222
    Height = 21
    ListField = 'nome'
    ListSource = DM.dspaciente
    TabOrder = 2
  end
  object DBEdit1: TDBEdit
    Left = 24
    Top = 200
    Width = 77
    Height = 21
    MaxLength = 10
    TabOrder = 3
  end
  object DBEdit2: TDBEdit
    Left = 136
    Top = 200
    Width = 92
    Height = 21
    DataField = 'hora'
    MaxLength = 5
    TabOrder = 4
  end
  object DBComboBox1: TDBComboBox
    Left = 24
    Top = 256
    Width = 113
    Height = 21
    Items.Strings = (
      'Cadiologista'
      'Nutricionista'
      'Ortopedista')
    TabOrder = 5
  end
  object DBEdit3: TDBEdit
    Left = 24
    Top = 312
    Width = 113
    Height = 21
    TabOrder = 6
  end
  object DBGrid1: TDBGrid
    Left = 392
    Top = 181
    Width = 358
    Height = 284
    TabOrder = 7
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
        Visible = True
      end>
  end
end
