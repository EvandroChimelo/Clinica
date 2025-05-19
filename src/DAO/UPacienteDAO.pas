unit UPacienteDAO;
  {Classe TPacienteQuery
  Responsável pelas operações de CRUD no banco de dados da tabela "paciente".
  Herda de TBaseQuery, utilizando FireDAC para acesso ao banco de dados PostgreSQL.}

interface
  uses
    System.SysUtils,
    FireDAC.Comp.Client,
    UBaseQuery,
    UConnection,
    UPacienteModel;

type
  TPacienteDAO = class (TBaseQuery)
    Public
      function CarregarPacientesPorId(const AGId: Integer): TPacienteModel;
      function BuscarPacientePorNome(const ANome: string): TFDQuery;
      function CarregarListaPaciente: TFDQuery;
      procedure Alterar(const AGid: Integer; const ANome, ATelefone, ACPF: string);
      procedure Excluir(const AGid: Integer);
      function Salvar(APaciente: TPacienteModel): Integer;

      constructor Create; //(AConnection: TFDConnection);
      destructor Destroy; override;
end;

implementation


procedure TPacienteDAO.Alterar(const AGid: Integer; const ANome, ATelefone, ACPF: string);
begin
  with GetQuery do
    begin
      try
        Close;
        SQL.Clear;
        SQL.Text := 'UPDATE paciente SET nome = :Nome, telefone = :Telefone, cpf = :CPF WHERE gid = :Gid';
        ParamByName('Gid').AsInteger := AGid;
        ParamByName('Nome').AsString := ANome;
        ParamByName('Telefone').AsString := ATelefone;
        ParamByName('CPF').AsString := ACPF;
        ExecSQL;

        except
          on e: Exception do
          begin
            raise Exception.Create('Erro ao atualizar paciente' + e.Message);
          end;

      end;
    end;
end;

function TPacienteDAO.BuscarPacientePorNome(const ANome: string): TFDQuery;
begin
  with GetQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'SELECT gid, nome, cpf, telefone, datacadastro FROM paciente WHERE nome LIKE :Nome';
    ParamByName('Nome').AsString := '%' + ANome + '%';
    Open;
  end;

  Result := GetQuery;  // Retorna o TFDQuery com os dados filtrados
end;

function TPacienteDAO.CarregarListaPaciente: TFDQuery;
begin
 with GetQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'SELECT gid, nome, telefone, datacadastro, cpf FROM paciente';
    Open;
  end;
  Result := GetQuery;  // Retorna o TFDQuery com os dados carregados
end;

function TPacienteDAO.CarregarPacientesPorId(const AGId:Integer): TPacienteModel;
var
  LQuery: TFDQuery;
begin
  Result := nil;
  LQuery := GetQuery;
  LQuery.Close;
  LQuery.SQL.Clear;
  LQuery.SQL.Text := 'SELECT GID, NOME, TELEFONE, DATACADASTRO, CPF FROM paciente WHERE GID = :GID';
  LQuery.ParamByName('GID').AsInteger := AGId;
  LQuery.Open;
  if not LQuery.IsEmpty then
  begin
    Result := TPacienteModel.Create;
    Result.Gid := LQuery.FieldByName('gid').AsInteger;
    Result.Nome := LQuery.FieldByName('nome').AsString;
    Result.CPF := LQuery.FieldByName('cpf').AsString;
    Result.Telefone := LQuery.FieldByName('telefone').AsString;
  end;

end;



constructor TPacienteDAO.Create; //(AConnection: TFDConnection);
begin
  inherited Create;
  //AConnection := TConnection.GetInstance.GetConnection;
end;

destructor TPacienteDAO.Destroy;
begin
  inherited;
end;

procedure TPacienteDAO.Excluir(const AGid: Integer);
begin
  with GetQuery do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'DELETE FROM paciente WHERE gid = :Gid';
      ParamByName('Gid').AsInteger := AGid;
      ExecSQL;
      //adiconar mensagem de confirmação de exclusão;
    end;

end;

function TPacienteDAO.Salvar(APaciente: TPacienteModel): Integer;
begin
  with GetQuery do
    begin
      try
      Close;
      SQL.Clear;
      SQL.Text :=  'INSERT INTO paciente (nome, telefone, cpf) VALUES (:Nome, :Telefone, :CPF) RETURNING gid';
      ParamByName('CPF').AsString := APaciente.CPF;
      ParamByName('Nome').AsString := APaciente.Nome;
      ParamByName('Telefone').AsString := APaciente.Telefone;

      Open; // Open para queries que retornam dados (como RETURNING)

      Result := FieldByName('gid').AsInteger;

      except
        on E: exception do
          raise Exception.Create('Erro ao Salvar Paciente: ' + E.Message);
      end;
    end;
end;

end.
