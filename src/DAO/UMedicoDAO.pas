unit UMedicoDAO;

interface

uses
   System.SysUtils,
   FireDAC.Comp.Client,
   UBaseQuery;

type
  TMedicoQuery = Class(TBaseQuery)
    public
      procedure Salvar(ANome, ACPF, ATelefone, ACRM: string; AGID: Integer);
      procedure Excluir(AGID: Integer);
      procedure Editar(const ANome, ACPF, ATelefone, ACRM);
      procedure Carregar(AGID: Integer);

      function CarregarMedicos: TFDQuery;
      function BuscarMedicoPorNome(const Nome: string):TFDQuery;
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

procedure TMedicoQuery.Carregar(AGID: Integer);
begin

end;

function TMedicoQuery.CarregarMedicos: TFDQuery;
begin
   GetQuery.SQL.Text := 'select gid, nome, cpf, 	telefone, crm, datacadastro from medicos';
   GetQuery.Open;
   Result := GetQuery;
end;

procedure TMedicoQuery.Editar(const ANome, ACPF, ATelefone, ACRM);
begin

end;

procedure TMedicoQuery.Excluir(AGID: Integer);
begin

end;

procedure TMedicoQuery.Salvar(ANome, ACPF, ATelefone, ACRM: string; AGID: Integer);
var
  FDQuery: TFDQuery;
begin
  FDQuery := TFDQuery.Create(nil);

  try
    //Configura a query
    FDQuery.SQL.Text :=  'INSERT INTO medicos (nome, cpf, telefone, crm) VALUES (:Nome, :CPF, :Telefone, :CRM) RETURNING gid';
    FDQuery.ParamByName('CPF').AsString := ACPF;
    FDQuery.ParamByName('Nome').AsString := ANome;
    FDQuery.ParamByName('Telefone').AsString := ATelefone;
    FDQuery.ParamByName('CRM').AsString := ACRM;

    //Execute a query
    FDQuery.Open;

    // Verificar se o campo 'gid' não está vazio
    if not FDQuery.FieldByName('gid').IsNull then
      AGID := FDQuery.FieldByName('gid').AsInteger
    else
      raise Exception.Create('Erro: GID não foi gerado pelo banco de dados.');

  finally
    FDQuery.Free;
  end;

 end;
end.
