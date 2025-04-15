unit Paciente;

interface

uses
  Pessoa,
  UConexao,
  PacienteQuery,
  FireDAC.Comp.Client,
  System.SysUtils;

type
  TPaciente = class(TPessoa)
    private
      // Aqui podemos adicionar propriedades específicas para pacientes

    public
    procedure Carregar; override;
    procedure Save; override;
    procedure Alterar; override;
    procedure Excluir; override;

end;

implementation

{ TPaciente }

procedure TPaciente.Alterar;
var
  FDQuery: TFDQuery;
begin
  Conectar;
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := GetConnection;
    FDQuery.SQL.Text := 'UPDATE paciente SET nome = :Nome, telefone = :Telefone, cpf = :CPF WHERE gid = :Gid';
    FDQuery.ParamByName('Gid').AsInteger := Gid;
    FDQuery.ParamByName('Nome').AsString := Nome;
    FDQuery.ParamByName('Telefone').AsString := Telefone;
    FDQuery.ParamByName('CPF').AsString := CPF;
    FDQuery.ExecSQL;
  except
      on e: Exception do
      begin
        raise Exception.Create('Erro ao atualizar paciente' + e.Message);
      end;

  end;

end;
procedure TPaciente.Carregar;
var
  FDQuery: TFDQuery;
begin
  inherited;
  Conectar;
end;

procedure TPaciente.Excluir;
var
  FDQuery: TFDQuery;
begin
  Conectar;
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := GetConnection;
    FDQuery.SQL.Text := 'DELETE FROM paciente WHERE gid = :Gid';
    FDQuery.ParamByName('Gid').AsInteger := Gid;
    FDQuery.ExecSQL;
  finally
    FDQuery.Free;
    Desconectar;
  end;
end;

procedure TPaciente.Save;
var
  FDQuery: TFDQuery;

begin
  Conectar;
  FDQuery := TFDQuery.Create(nil);

  try

    //Configura a query
    FDQuery.Connection := GetConnection;
    FDQuery.SQL.Text :=  'INSERT INTO paciente (nome, telefone, cpf) VALUES (:Nome, :Telefone, :CPF) RETURNING gid';
    FDQuery.ParamByName('CPF').AsString := CPF;
    FDQuery.ParamByName('Nome').AsString := Nome;
    FDQuery.ParamByName('Telefone').AsString := Telefone;

    //Execute a query
    FDQuery.Open;

    // Verificar se o campo 'gid' não está vazio
    if not FDQuery.FieldByName('gid').IsNull then
      Gid := FDQuery.FieldByName('gid').AsInteger
    else
      raise Exception.Create('Erro: GID não foi gerado pelo banco de dados.');

  finally
    FDQuery.Free;
    Desconectar;
  end;

end;

end.
