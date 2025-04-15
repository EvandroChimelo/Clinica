unit CadEspecialidade;

interface

uses
  System.SysUtils, UConexao, QueryBase, FireDAC.Comp.Client;


type
  TCadastroEspecialidade = Class(TConnection)
  private
    FGID : integer;
    FNomeEspecialidade: string;

  Public
    property GIDEspecialidade:Integer read FGID write FGID;
    property NomeEspecialidade:string Read FNomeEspecialidade write FNomeEspecialidade;

    procedure SalvarEspecialidade;
  End;

implementation

{ TCadastroEspecialidade }

procedure TCadastroEspecialidade.SalvarEspecialidade;
var
  LQuery: TFDQuery;
begin
  Conectar;
  LQuery := TFDQuery.Create(nil);

  try
    LQuery.Connection := GetConnection;
    LQuery.SQL.Text := 'INSERT INTO especialidade (nomeespecialidade) VALUES(:nomeespecialidade) RETURNING gid;';
    LQuery.FieldByName('nomeespecialidade').AsString := NomeEspecialidade;

    LQuery.Open;


  finally
    FreeAndNil(LQuery);
  end;

end;

end.
