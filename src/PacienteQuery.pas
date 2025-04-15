unit PacienteQuery;

interface
  uses
    System.SysUtils, FireDAC.Comp.Client, Pessoa, QueryBase;

type
  TPacienteQuery = class (TBaseQuery)
    Public
      function CarregarPacientes: TFDQuery;
      function BuscarPacientepornome(const Nome: string):TFDQuery;

    end;
implementation

{ TPacoenteQuery }

function TPacienteQuery.BuscarPacientepornome(const Nome: string): TFDQuery;
begin
  GetQuery.SQL.Text := 'SELECT gid, nome, cpf, telefone, datacadastro FROM paciente WHERE nome LIKE :Nome';
  GetQuery.ParamByName('Nome').AsString := '%' + Nome + '%';
  GetQuery.Open;
  Result := GetQuery;  // Retorna o TFDQuery com os dados filtrados
end;

function TPacienteQuery.CarregarPacientes: TFDQuery;
begin
  GetQuery.SQL.Text := 'SELECT GID, NOME, TELEFONE, DATACADASTRO, CPF FROM paciente';
  GetQuery.Open;
  Result := GetQuery;  // Retorna o TFDQuery com os dados carregados
end;

end.
