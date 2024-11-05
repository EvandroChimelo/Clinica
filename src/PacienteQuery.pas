unit PacienteQuery;

interface
  uses
    System.SysUtils, System.Classes, FireDAC.Comp.Client, Data.DB, UConexao, Pessoa;

type
  TPacienteQuery = class
    private
      FQuery: TFDQuery;
      FConnection: TConnection;

    Public
      constructor Create (AConnection: TConnection);
      Destructor Destroy; override;
      function CarregarPacientes: TFDQuery;
      function BuscarPacientepornome(const Nome: string):TFDQuery;

    end;
implementation

{ TPacoenteQuery }

function TPacienteQuery.BuscarPacientepornome(const Nome: string): TFDQuery;
begin
  FQuery.SQL.Text := 'SELECT gid, nome, cpf, telefone, datacadastro FROM paciente WHERE nome LIKE :Nome';
  FQuery.ParamByName('Nome').AsString := '%' + Nome + '%';
  FQuery.Open;
  Result := FQuery;  // Retorna o TFDQuery com os dados filtrados
end;

function TPacienteQuery.CarregarPacientes: TFDQuery;
begin
  FQuery.SQL.Text := 'SELECT gid, nome, cpf, telefone, datacadastro FROM paciente';
  FQuery.Open;
  Result := FQuery;  // Retorna o TFDQuery com os dados carregados
end;

constructor TPacienteQuery.Create(AConnection: TConnection);
begin
  inherited Create;
  FConnection := AConnection;
  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := FConnection.GetConnection;
end;

destructor TPacienteQuery.Destroy;
begin
  FQuery.Free;
  inherited;
end;

end.
