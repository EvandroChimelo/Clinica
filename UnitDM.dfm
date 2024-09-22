object DM: TDM
  Height = 534
  Width = 743
  object tbagendamento: TFDTable
    IndexFieldNames = 'id'
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    UpdateOptions.UpdateTableName = 'Clinica.agendamento'
    TableName = 'Clinica.agendamento'
    Left = 272
    Top = 32
    object tbagendamentoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      Required = True
    end
    object tbagendamentoid_paciente: TIntegerField
      FieldName = 'id_paciente'
      Origin = 'id_paciente'
      Required = True
    end
    object tbagendamentodata: TDateField
      FieldName = 'data'
      Origin = 'data'
      Required = True
      EditMask = '##/##/####;1;_'
    end
    object tbagendamentohora: TStringField
      FieldName = 'hora'
      Origin = 'hora'
      Required = True
      EditMask = '##:##;1;_'
      Size = 8
    end
    object tbagendamentoespecialidade: TStringField
      FieldName = 'especialidade'
      Origin = 'especialidade'
      Required = True
      Size = 25
    end
    object tbagendamentomedico: TStringField
      FieldName = 'medico'
      Origin = 'medico'
      Required = True
      Size = 30
    end
  end
  object dsagendamento: TDataSource
    AutoEdit = False
    DataSet = tbagendamento
    Left = 272
    Top = 112
  end
end
