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
    Width = 81
    Height = 13
    Caption = 'ID Agendamento'
  end
  object Label4: TLabel
    Left = 128
    Top = 133
    Width = 71
    Height = 13
    Caption = 'Nome Paciente'
  end
  object Label3: TLabel
    Left = 24
    Top = 181
    Width = 68
    Height = 13
    Caption = 'Data Consulta'
  end
  object Label5: TLabel
    Left = 131
    Top = 181
    Width = 68
    Height = 13
    Caption = 'Hora Consulta'
  end
  object Label6: TLabel
    Left = 24
    Top = 237
    Width = 100
    Height = 13
    Caption = 'Especialidade M'#233'dica'
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
    Top = 256
    Width = 113
    Height = 21
    Items.Strings = (
      'Cadiologista'
      'Nutricionista'
      'Ortopedista')
    TabOrder = 1
  end
  object DBGrid1: TDBGrid
    Left = 392
    Top = 141
    Width = 358
    Height = 284
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
    Left = 0
    Top = 440
    Width = 75
    Height = 25
    Caption = 'Inlcuir'
    TabOrder = 3
  end
  object BtnAlterar: TButton
    Left = 81
    Top = 440
    Width = 75
    Height = 25
    Caption = 'Alterar'
    TabOrder = 4
  end
  object BtnSalvar: TButton
    Left = 162
    Top = 440
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 5
  end
  object BtnExcluir: TButton
    Left = 243
    Top = 440
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 6
  end
  object BtnCancelar: TButton
    Left = 648
    Top = 440
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
    Top = 200
    Width = 100
    Height = 21
    TabOrder = 9
  end
  object TEdit
    Left = 130
    Top = 200
    Width = 121
    Height = 21
    TabOrder = 10
  end
  object TEdit
    Left = 24
    Top = 320
    Width = 121
    Height = 21
    TabOrder = 11
  end
end
