unit UPacienteModel;

interface

uses
  System.SysUtils,
  UPessoaModel;

type
  TPacienteModel = class(TPessoa)
    private
      // Aqui podemos adicionar propriedades espec�ficas para pacientes

    public


    constructor create;
end;

implementation

{ TPaciente }


{ TPacienteModel }

constructor TPacienteModel.create;
begin
 inherited;
end;

end.
