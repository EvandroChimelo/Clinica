unit Pessoa;

interface

uses
  System.SysUtils,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys.PG,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  UConexao;

type
  TPessoa = class(TConnection)
    private
      FGID: Integer;
      FCPF: string;
      FNome: string;
      FTelefone: string;

    public
      property Gid: Integer read FGID write FGID;
      property CPF: string read FCPF write FCPF;
      property Nome: string read FNome write FNome;
      property Telefone: string read FTelefone write FTelefone;

      procedure Alterar;
      procedure Save;
      procedure excluir;

      constructor Create; overload;
  end;

implementation



procedure TPessoa.Alterar;
var
  FDQuery: TFDQuery;
begin
  Conectar;
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := GetConnection;
    FDQuery.SQL.Text := 'UPDATE paciente SET nome = :Nome, telefone = :Telefone, cpf = :CPF WHERE gid = :Gid';
    FDQuery.ParamByName('Gid').AsInteger := FGid;
    FDQuery.ParamByName('Nome').AsString := FNome;
    FDQuery.ParamByName('Telefone').AsString := FTelefone;
    FDQuery.ParamByName('CPF').AsString := FCPF;
    FDQuery.ExecSQL;
  finally
    FDQuery.Free;
    Desconectar;
  end;

end;

constructor TPessoa.Create;
begin
   inherited Create;
end;

procedure TPessoa.excluir;
var
  FDQuery: TFDQuery;
begin
  Conectar;
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := GetConnection;
    FDQuery.SQL.Text := 'DELETE FROM paciente WHERE gid = :Gid';
    FDQuery.ParamByName('Gid').AsInteger := FGid;
    FDQuery.ExecSQL;
  finally
    FDQuery.Free;
    Desconectar;
  end;
end;

procedure TPessoa.Save;
var
  FDQuery: TFDQuery;

begin
  Conectar;
  FDQuery := TFDQuery.Create(nil);

  try

    //Configura a query
    FDQuery.Connection := GetConnection;
    FDQuery.SQL.Text :=  'INSERT INTO paciente (nome, telefone, cpf) VALUES (:Nome, :Telefone, :CPF) RETURNING gid';
    FDQuery.ParamByName('CPF').AsString := FCPF;
    FDQuery.ParamByName('Nome').AsString := FNome;
    FDQuery.ParamByName('Telefone').AsString := FTelefone;

    //Execute a query
    FDQuery.Open;

    // Verificar se o campo 'gid' não está vazio
    if not FDQuery.FieldByName('gid').IsNull then
      FGid := FDQuery.FieldByName('gid').AsInteger
    else
      raise Exception.Create('Erro: GID não foi gerado pelo banco de dados.');

  finally
    FDQuery.Free;
    Desconectar;
  end;

end;

end.
