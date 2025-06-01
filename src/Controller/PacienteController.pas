unit PacienteController;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  FireDAC.Comp.Client, // Para TFDQuery como tipo de retorno para grid
  UPacienteModel,
  UPacienteDAO; // Adicione UConnection se for passar a conexão explicitamente

type
  TPacienteController = class
  private
    FPacienteDAO: TPacienteDAO;
    // FConnection: TFDConnection; // Se você passar a conexão no construtor AINDA A DEFINIR
    function PopularPacienteModel(AQuery: TFDQuery; APaciente: TPacienteModel): Boolean;
  public
    constructor Create;
    destructor Destroy; override;

    function CarregarListaPacienteParaGrid: TFDQuery;
    function BuscarPacientePorNomeParaGrid(const ANome: string): TFDQuery;
    function CarregarPaciente(AGid: Integer): TPacienteModel;
    function SalvarPaciente(APaciente: TPacienteModel): Integer; // Retorna GID salvo/atualizado
    function ExcluirPaciente(AGid: Integer): Boolean;
end;

implementation

{ TPacienteController }

function TPacienteController.BuscarPacientePorNomeParaGrid(const ANome: string): TFDQuery;
begin
  Result := FPacienteDAO.BuscarPacientePorNome(ANome);
end;

function TPacienteController.CarregarListaPacienteParaGrid: TFDQuery;
begin
  Result := FPacienteDAO.CarregarListaPaciente;

end;

function TPacienteController.CarregarPaciente(AGid: Integer): TPacienteModel;
begin
  Result := nil;
  Result := FPacienteDAO.CarregarPacientesPorId(AGid); // DAO retorna a query
end;


constructor TPacienteController.Create;
begin
  FPacienteDAO := TPacienteDAO.Create;
end;

destructor TPacienteController.Destroy;
begin
  FreeAndNil(FPacienteDAO);
  inherited;
end;

function TPacienteController.ExcluirPaciente(AGid: Integer): Boolean;
begin
  try
    FPacienteDAO.Excluir(AGid);
    Result := True;
  except
    on E: Exception do
    begin
      // Logar o erro E.Message
      Result := False;
    end;
  end;
end;

function TPacienteController.PopularPacienteModel(AQuery: TFDQuery;  APaciente: TPacienteModel): Boolean;
begin
  Result := False;
  if not Assigned(APaciente) then Exit; // Sai se o modelo não foi fornecido

  Result := not AQuery.IsEmpty;
  if Result then
  begin
    APaciente.Gid      := AQuery.FieldByName('gid').AsInteger;
    APaciente.Nome     := AQuery.FieldByName('nome').AsString;
    APaciente.CPF      := AQuery.FieldByName('cpf').AsString;
    APaciente.Telefone := AQuery.FieldByName('telefone').AsString;
    // Adicionar outros campos como DataCadastro se estiverem na query e no model
    // APaciente.DataCadastro := AQuery.FieldByName('datacadastro').AsDateTime;
  end;
end;

function TPacienteController.SalvarPaciente(APaciente: TPacienteModel): Integer;
begin
  Result := 0;

  // Validações podem ser feitas aqui ou no Model (se forem lógicas de negócio puras)
  // Ex: if not APaciente.IsValid then Exit;

  if APaciente.Gid = 0 then // Novo Paciente
  begin
    // Poderia definir DataCadastro aqui se não for feito no DAO ou BD
    // APaciente.DataCadastro := Now;
    Result := FPacienteDAO.Salvar(APaciente); // DAO Salvar retorna o novo GID
    APaciente.Gid := Result; // Atualiza o GID no objeto Model
  end
  else // Paciente Existente - Atualizar
  begin
    // O método Alterar no DAO pode receber o Model ou os campos separados
    // FPacienteDAO.Alterar(APaciente.Gid, APaciente.Nome, APaciente.Telefone, APaciente.CPF);
    // Ou, se Alterar aceita o Model:
    FPacienteDAO.Alterar(APaciente.Gid, APaciente.Nome, APaciente.Telefone, APaciente.CPF); // Supondo que você refatore TPacienteDAO.Alterar
    Result := APaciente.Gid; // GID não muda na atualização
  end;
end;

end.
