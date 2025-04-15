unit MedicoQuery;

interface

uses
   System.SysUtils, FireDAC.Comp.Client,
   Pessoa,
   QueryBase,
   UConexao;

type
  TMedicoQuery = Class(TBaseQuery)
    private
      FConexao: TConnection;
    public
      procedure Salvar(ANome, ACPF, ATelefone, ACRM: string; AGID: Integer);
      procedure Excluir(AGID: Integer); override;
      procedure Editar(AMedico: TMedicos); override;
      procedure Carregar(AGID: Integer; AMedico: TMedicos);

      function CarregarMedicos: TFDQuery;
      function BuscarMedicoPorNome(const Nome: string):TFDQuery;

      constructor Create; overload;
      destructor Destroy; override;
  End;

implementation

{ TMedicoQuery }

function TMedicoQuery.BuscarMedicoPorNome(const Nome: string): TFDQuery;
begin
  GetQuery.SQL.Text := 'select gid, nome, cpf, 	telefone, crm, datacadastro from medicos WHERE nome LIKE :Nome';
  GetQuery.ParamByName('nome').AsString := '%' + Nome + '%';
  GetQuery.Open;
  Result := GetQuery;
end;

function TMedicoQuery.CarregarMedicos: TFDQuery;
begin
   GetQuery.SQL.Text := 'select gid, nome, cpf, 	telefone, crm, datacadastro from medicos';
   GetQuery.Open;
   Result := GetQuery;
end;

procedure TMedicoQuery.Editar(AGID: Integer);
begin

end;

procedure TMedicoQuery.Excluir(AGID: Integer);
begin

end;

procedure TMedicoQuery.Salvar(ANome, ACPF, ATelefone, ACRM: string; AGID: Integer);
var
  FDQuery: TFDQuery;
  Conexao: TConnection;
  Pessoa: TPessoa;
begin
  Conexao.Conectar;
  FDQuery := TFDQuery.Create(nil);

  try

    //Configura a query
    FDQuery.Connection := Conexao.GetConnection;
    FDQuery.SQL.Text :=  'INSERT INTO medicos (nome, cpf, telefone, crm) VALUES (:Nome, :CPF, :Telefone, :CRM) RETURNING gid';
    FDQuery.ParamByName('CPF').AsString := Pessoa.CPF;
    FDQuery.ParamByName('Nome').AsString := Pessoa.Nome;
    FDQuery.ParamByName('Telefone').AsString := Pessoa.Telefone;

    //Execute a query
    FDQuery.Open;

    // Verificar se o campo 'gid' não está vazio
    if not FDQuery.FieldByName('gid').IsNull then
      Pessoa.Gid := FDQuery.FieldByName('gid').AsInteger
    else
      raise Exception.Create('Erro: GID não foi gerado pelo banco de dados.');

  finally
    FDQuery.Free;
    Conexao.Desconectar;
  end;

 end;
end.
